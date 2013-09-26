require 'chef/provider/directory'
require 'chef/resource/directory'
require 'chef/provider/mount'
require 'chef/resource/mount'

class Chef
  class Provider
    class NFSMedia < Chef::Provider

      def load_current_resource
        @current_resource ||= Chef::Resource::NFSMedia.new(new_resource.name)
        @current_resource
      end

      def initialize(*args)
        super
      end

      def action_mount

      end

      def mount_exists?

      end
    end
  end
end
