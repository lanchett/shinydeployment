# Deployment of Shiny dashboard with Docker and Shiny Server
Do you wonder how to share your ShinyApp with friends, colleagues or other users? 
Shiny Server is made for this task, and it comes in both an open source (free) and Pro version. 
The Shiny Server works great on Virtual Machines (VM) and in Docker containers.
See this [link]("https://github.com/rstudio/shiny-server") for an explanation on setting up a Shiny Server on your desired VM.


I'll now show how to build a Docker Image containing a Shiny Server, and host an application I've made.

The application is an example I've made for a party I went to, where I was bartending for my friends. 
My Shiny app is quite simple, and has two different pages. On the first you can see pictures of different drinks, and in the second you can send and retrieve orders.
The second page is also connected to a [Mongo database](https://www.mongodb.com/), where I save and retrive the orders. 
This functionality is turned off in the Shiny App, but you can easily turn it back on if you add your own connection URL in line 3 of [my server-script](https://github.com/lanchett/shinydeployment/blob/master/app/server.R). However, the app will work without it, and you can still learn all the steps for deploying your Shiny app. 

Furthermore, into the Docker container I'm also adding the app found in the folder **simple_app**, which is a standard Shiny template. This will allow you to start developing directly by cloning/forking this repository, and then changing that app as desired. 

<img src="img/Shiny.png" alt="Shiny" title="Shiny" width="200" height="120" > <img src="img/docker-cover.png" alt="Docker" title="Docker" width="200" height="120" />
	
# Docker image
The Docker image builds on top of base R, and adds necessary Ubuntu libraries and R packages for this project. 
It's based on the official [Shiny-Docker image](https://hub.docker.com/r/rocker/shiny/).
Since I'm using the packages **mongolite** and **shinydashboard**, they're also installed, along with the driver **libsasl2-dev**. 

## Build and run Docker image 

```
# Install Docker (if necessary).
sudo snap install docker

# Clone project
git clone https://github.com/lanchett/shinydeployment.git

# Step into folder with Dockerfile (if not, the remaning commands will not run AS-IS and you must reference the 
# Dockerfile directly)
cd /shinydeployment

# Build image
docker build -t shinydeployment . 

# Run image
docker run --rm --name shinycontainer -p 80:3838 shinydeployment 

```
**Note**: you might have to use Sudo-rights to write these commands.


If running Docker locally, the applications should now be available at:

* http://localhost:80/app
* http://localhost:80/simple_app

There are several options for cloud hosting, but I've used a VM this time. I'll build the image there, and use the VM to host my container.
In an enterprise setting you would probably use other container services and orchestration tools, but a VM is lightweight and easy to work with
in my opinion. 

My VM is running Ubuntu Server 18.04 LTS, and is hosted on Azure. Other Linux distributions should also work, but have not been tested. 
I've used SSH to connect to the VM, and then built the application there by running the commands above. 

The application will then be available at:

- http://{machineIP}:80/app 
- http://{machineIP}:80/simple_app 

**Note**: Ensure that port 80 is open for inbound traffic.

## Mounting a volume - add apps directly
Another smart thing to do is adding a volume from the VM to the container. 
In this way, you can add and remove apps directly into the container while it's running.

```
# Run  container and mount volumes
docker run --rm -p 80:3838     -v /home/shiny/shinyapps/:/srv/shiny-server/     -v /home/shiny/shinylog/:/var/log/shiny-server/     shinydeployment
```
At the endpoint http://{machineIP}:80 you'll now see all available Shiny Apps. 
Remember to add the apps to the app-folder (**/home/shiny/shinyapps/** in this case).
E.g., if you add the **simple_app** to that folder, you'll see the following image at http://{machineIP}:80 :
<img src="img/ServerWithVolume.PNG" alt="Server" title="Shiny Server with volume" width="200" height="120" />

Otherwise you'll only see the text *Index of/*.


# Contact
Reach out if you have any questions, suggested improvements or if you've used this an want to share!

<lanchett@gmail.com>
