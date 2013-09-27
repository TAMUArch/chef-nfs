action :setup do

  mount_exists = false
  current_share = ''

  node[:filesystem].each do |fs, val|
    if val[:mount] == new_resource.local_directory
      mount_exists = true
      current_share = fs
    end
  end

  if mount_exists
    unless nfs_share_changed?
      mount new_resource.local_directory do
        action :unmount, :disable
        device new_resource.nfs_share
        fstype 'nfs'
        new_resource.updated_by_last_action true
      end
    end
  else
    directory new_resource.local_directory do
      action :create
      not_if { ::Dir.exists? new_resource.local_directory }
    end
  end

  mount new_resource.local_directory do
    action [:mount, :enable]
    fstype 'nfs'
    device new_resource.nfs_share
    options new_resource.options
  end
end

action :destroy do
  mount new_resource.local_directory do
    action [:unmount, :disable]
    fstype 'nfs'
    device new_resource.nfs_share
  end

  directory new_resource.local_directory do
    action :remove
  end
end

def nfs_share_changed?(old_share, new_share)
  if old_share == new_share
    false
  else
    true
  end
end
