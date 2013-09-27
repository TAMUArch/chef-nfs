require 'chef/provider/directory'
require 'chef/resource/directory'
require 'chef/provider/mount'
require 'chef/resource/mount'
require 'ohai'

class Chef
  class Provider
    class NFSMedia < Chef::Provider::Mount::Mount

      def initialize(*args)
        super
        @system = Ohai::System.new
        @mount_dir = Chef::Resource::Directory.new(
          @new_resource.mount_point,
          run_context)
      end

      def load_current_resource
        @current_resource ||= Chef::Resource::NFSMedia.new(new_resource.name)
        @current_resource
      end

      def action_create
        if mount_exists?
          unless nfs_share_changed?
            self.remove_old_share
          end
        else
          create_mount_directory
        end
        @new_resource.action :enable
        @new_resource.action :mount
      end

      def action_remove
        @new_resource.action :disable
        @new_resource.action :unmount
        @mount_dir.run_action :delete
      end

      def create_mount_directory
        unless ::Dir.exists? @new_resource.mount_point
          @mount_dir.run_action :create
        end
      end

      def unmount_old
        old_mount = Chef::Resource::Mount(@current_nfs_share, run_context)
        old_mount.run_action :unmount
        old_mount.run_action :disable
      end

      def mount_exists?
        ret = false
        @system[:filesystem].each do |fs, val|
          if val['mount'] = @new_resource.local_directory
            ret = true
            @current_nfs_share = fs
          end
        end
        ret
      end

      def nfs_share_changed?
        if @current_resource.nfs_share == @current_nfs_share
          false
        else
          true
        end
      end
    end
  end
end
