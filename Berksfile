cookbook 'apt'
cookbook 'nfs', git: 'https://github.com/TAMUArch/chef-nfs.git'

group :integration do
  cookbook "nfs", :path => "."
  cookbook "test_nfs", :path => "./test/cookbooks/test_nfs"
end
