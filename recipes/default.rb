include_recipe 'vim'
include_recipe 'ruby_build'

ruby_build_ruby node['bluepill_devel']['ruby']['version'] do
  action :install
end

execute "update-alternatives --install /usr/bin/gem gem /usr/local/ruby/#{node['bluepill_devel']['ruby']['version']}/bin/gem 50" do
  not_if "update-alternatives --display gem | grep /usr/local/ruby/#{node['bluepill_devel']['ruby']['version']}/bin/gem"
end

ruby_install_cmd = "update-alternatives --install /usr/bin/ruby ruby /usr/local/ruby/#{node['bluepill_devel']['ruby']['version']}/bin/ruby 50"
node['bluepill_devel']['ruby']['slave_binaries'].each do |bin|
  bin_path = ::File.join("/usr/local/ruby/#{node['bluepill_devel']['ruby']['version']}/bin",bin)
  ruby_install_cmd << " --slave /usr/bin/#{bin} #{bin} #{bin_path}"
end

execute ruby_install_cmd do
  not_if "update-alternatives --display ruby | grep /usr/local/ruby/#{node['bluepill_devel']['ruby']['version']}/bin/ruby"
end
