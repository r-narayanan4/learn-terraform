#!/usr/bin/env bash
sudo yum update -y 
sudo yum install wget -y 
  
sudo amazon-linux-extras install java-openjdk11 -y
#sudo yum install fontconfig java-11-openjdk -y 

    
#Cmd to install tomcat on your host. 
#Variables
req_tom_ver=9.0.73
tom_m_ver=9
url="https://dlcdn.apache.org/tomcat/tomcat-${tom_m_ver}/v${req_tom_ver}/bin/apache-tomcat-${req_tom_ver}.tar.gz"

#Create tomcat directory
sudo wget $url 
sudo tar -xvzf apache-tomcat-${req_tom_ver}.tar.gz
sudo mv apache-tomcat-${req_tom_ver} tomcat${tom_m_ver} 
sudo rm -rf apache-tomcat-${req_tom_ver}.tar.gz

#create link files for tomcat startup.sh and shutdown.sh
sudo ln -s ./tomcat${tom_m_ver}/bin/startup.sh /usr/local/bin/tomcatup
sudo ln -s ./tomcat${tom_m_ver}/bin/shutdown.sh /usr/local/bin/tomcatdown


#-----------------------------------------TomCat-Files-Configuration----------------------------------------------------

#To change the port number  8080 to 8089 (access tomcat application from browser on prot 8090)
sudo sed -i '69s/8080/8089/'  ./tomcat${tom_m_ver}/conf/server.xml

#To modify this restriction you'll need to edit the Manager's context.xml file. (under webapps dir)
#We need to  find context.xml and  comment () Valve ClassName under host-manager and manager.

sudo sed -i '21s/^/<!-- /' ./tomcat${tom_m_ver}/webapps/host-manager/META-INF/context.xml
sudo sed -i '22s/$/ -->/'  ./tomcat${tom_m_ver}/webapps/host-manager/META-INF/context.xml
sudo sed -i '21s/^/<!-- /'  ./tomcat${tom_m_ver}/webapps/manager/META-INF/context.xml
sudo sed -i '22s/$/ -->/'  ./tomcat${tom_m_ver}/webapps/manager/META-INF/context.xml

#We need to update the user information in users.xml in /conf
line_number=48  # Replace with the line number where you want to add the content
file_path=./tomcat${tom_m_ver}/conf/tomcat-users.xml  

#Use sed to insert the content after the specified line number
sudo sed -i "${line_number}a\\
<role rolename=\"manager-gui\"/>\\
<role rolename=\"manager-script\"/>\\
<role rolename=\"manager-jmx\"/>\\
<role rolename=\"manager-status\"/>\\
<user username=\"admin\" password=\"admin\" roles=\"manager-gui, manager-script, manager-jmx, manager-status\"/>\\
<user username=\"deployer\" password=\"deployer\" roles=\"manager-script\"/>\\
<user username=\"tomcat\" password=\"s3cret\" roles=\"manager-gui\"/>" "${file_path}"

sudo chmod u+x ./tomcat${tom_m_ver}/bin/startup.sh
sudo chmod u+x ./tomcat${tom_m_ver}/bin/shutdown.sh

 
./tomcat${tom_m_ver}/bin/startup.sh
