 #!/bin/bash
 #install httpd (Linux 2 version)
 yum update -y
 yum install -y httpd
 systemctl start httpd
 systemctl enable httpd
 echo "<h1>Ernest Hello World from $(hostname -f)</h1>">/var/www/html/index.html


