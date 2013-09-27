actions :setup, :destroy
default_action :setup

attribute :nfs_share, :kind_of => String, :name_attribute => true
attribute :local_directory, :kind_of => String, :required => true
attribute :options, :kind_of => Array, :default => []
