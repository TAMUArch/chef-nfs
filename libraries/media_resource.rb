require 'chef/resource'

class Chef
  class Resource
    class NFSMedia < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @resource_name = nfs_media
        @provider = Chef::Provider::NFSMedia
        @action = :mount
        @allowd_actions = [:mount, :unmount]
        @options
      end

      def nfs_share(arg=nil)
        set_or_return(:nfs_share, arg, :kind_of => String, :required => true)
      end

      def local_directory(arg=nil)
        set_or_return(:local_directory, arg, :kind_of => String, :required => true)
      end

      def options(arg=nil)
        set_or_return(:options, arg, :kind_of => [Hash], :default => {})
      end
    end
  end
end
