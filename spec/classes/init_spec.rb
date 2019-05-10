require 'spec_helper' 

describe 'webserver' do
	let(:title) {'webservice'}
	let(:node) {'webserver.mindef.com'}	
	context 'RedHat' do
		let(:facts) { {
	    		:operatingsystem		=>'RedHat',
			:operatingsystemrelease 		=> '7.6', 
		} }
		it {is_expected.to compile}
		it {is_expected.to contain_package('httpd').with(ensure: 'present') }
		it {is_expected.to contain_file('/etc/webserver/').with(ensure: 'directory') }
     		it {is_expected.to contain_file('/var/www/index.html')
			.with(
				:ensure => 'file',
				:require => 'Package[httpd]',
			)
		}
		it {is_expected.to contain_service('httpd')
			.with(
				:ensure => 'running',
				:enable => true,
			)
		}
	end


	context 'Ubuntu' do
		let(:facts) { {
	    		:operatingsystem		=>'Ubuntu',
			:operatingsystemrelease 		=> '18.04', 
		} }
	
		it {is_expected.to compile}
		it {is_expected.to contain_package('apache2').with(ensure: 'present') }
		it {is_expected.to contain_file('/etc/webserver/').with(ensure: 'directory') }
     		it {is_expected.to contain_file('/var/www/index.html')
			.with(
				:ensure => 'file',
				:require => 'Package[apache2]',
			)
		}
		it {is_expected.to contain_service('apache2')
			.with(
				:ensure => 'running',
				:enable => true,
			)
		}

	end

end
