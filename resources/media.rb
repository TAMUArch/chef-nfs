actions :setup, :destroy
default_action :setup

attribute :directory, :kind_of => String, :name_attribute => true
attribute :nfs_share, :kind_of => String, :required => true
attribute :options, :kind_of => Hash, :default => {}
