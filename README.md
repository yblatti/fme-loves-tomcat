# FME loves tomcat ! ⚙️🔵🔴+🐱=❤️
 
Proof on concept for FME Form (Desktop) running in a container, using a FLEXlm License server.  
Here this is done in a Tomcat container as this could elp us run https://github.com/asit-asso/extract in a container.

To run the tomcat-fme container you need two env variables :
```sh
FME_LIC_SERVER=IP|hostname[:port] # example: 192.168.1.1
FME_LIC_TYPE=FmeEditionCode # examples: professional, oracle, database, smallworld...
```
