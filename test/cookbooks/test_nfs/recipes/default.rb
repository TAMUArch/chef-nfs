package 'nfs-kernel-server'

%w( /tmp/test_nfs /tmp/test_nfs2 ).each do |dir|
  directory dir
end

file '/etc/exports' do
  action :create
  content("/tmp/test_nfs *(rw,sync,no_root_squash)\n
          /tmp/test_nfs2 *(rw,sync,no_root_squash)")
  notifies :restart, 'service[nfs-kernel-server]', :immediately
end

service 'nfs-kernel-server' do
  action :start
end

nfs_media 'localhost:/tmp/test_nfs' do
  action :setup
  local_directory '/mnt/test'
end

ohai 'reload' do
  action :reload
end

nfs_media 'localhost:/tmp/test_nfs2' do
  action :setup
  local_directory '/mnt/test'
end
