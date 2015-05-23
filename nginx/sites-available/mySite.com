
server {


    server_name mySite.com   www.mySite.com;


    access_log /var/log/nginx/mySite.com.access.log rt_cache;
    error_log /var/log/nginx/mySite.com.error.log;


    root /var/www/mySite.com/htdocs;
    
    

    index index.php index.html index.htm;


    include common/wpfc-hhvm.conf;   #use wpfc.conf to use php-fpm instead of hhvm
    include common/wpcommon.conf;
    include common/locations.conf;
    include /var/www/mySite.com/conf/nginx/*.conf;
}
