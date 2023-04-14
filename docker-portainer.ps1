wsl sudo service docker start

wsl docker pull portainer/portainer

wsl docker run -d -p 9000:9000 --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer