require 'chef/resource'
require 'chef/resource/mount'

class Chef
  class Resource
    class NFSMedia < Chef::Resource::Mount

      def initialize(name, run_context=nil)
        super
        @resource_name = :nfs_media
        @provider = Chef::Provider::NFSMedia
        @action = :create
        @allowd_actions = [:create, :remove]
      end
    end
  end
end
