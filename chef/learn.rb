package 'apache' do
	package_name 'httpd'
end

service 'httpd' do
	action [:enable, :start]
end

file '/var/www/html/index.html' do
	content 'Hello world'
	owner 'root'
	mode '0755'
	group 'apache'
end

file '/etc/motd' do 
	content 'welcome to the server'
end

execute 'command-test' do
	command 'echo blah >>/etc/motd'
	only_if 'test -r /etc/motd'
#	only_if { ::File.exists?('/etc/motd')}
end
