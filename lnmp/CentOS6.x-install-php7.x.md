# add epel
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

#

yum install mod_php71w php71w-opcache

yum install php71w-fpm php71w-opcache

#

yum install yum-plugin-replace

yum replace php-common --replace-with=php71w-common


# add Remi's RPM

yum -y install http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sed -i -e "s/\]$/\]\npriority=10/g" /etc/yum.repos.d/remi-safe.repo
sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/remi-safe.repo

yum --enablerepo=remi-safe install [Package]  #

##

yum --enablerepo=remi-safe -y install php71
