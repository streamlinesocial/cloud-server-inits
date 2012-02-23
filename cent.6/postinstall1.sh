date > /etc/vagrant_box_build_time

yum -y install gcc make gcc-c++ ruby kernel-devel zlib-devel openssl-devel readline-devel sqlite-devel perl

cat > /etc/yum.repos.d/puppetlabs.repo << EOM
[puppetlabs]
name=puppetlabs
baseurl=http://yum.puppetlabs.com/el/6/products/\$basearch
enabled=1
gpgcheck=0
EOM

cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=1
gpgcheck=0
EOM

yum -y install puppet facter ruby-devel rubygems

rm /etc/yum.repos.d/{puppetlabs,epel}.repo

gem install --no-ri --no-rdoc chef