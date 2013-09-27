include_recipe 'nfs'

package 'nfs-kernel-server'

directory '/tmp/test_nfs' do
  action :create
end

file '/etc/exports' do
  action :create
  content('/tmp/test_nfs *(rw,sync,no_root_squash)')
  notifies :restart, 'service[nfs-kernel-server]', :immediately
end

service 'nfs-kernel-server' do
  action :start
end

nfs_media '/mnt' do
  action :create
  device 'localhost:/tmp/test_nfs'
end
