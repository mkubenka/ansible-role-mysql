describe package('mysql-community-server') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('mysql -e "SELECT CURRENT_TIME()"') do
  its('exit_status') { should eq 0 }
end
