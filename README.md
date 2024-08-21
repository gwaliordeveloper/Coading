# Coading

https://developers.google.com/identity/sign-in/web/server-side-flow

```html
import 'package:ubiattendance/feature/home/view/widgets/custom_float_btn.dart';

restrict alohabets and char in html
---------------------------------------------------------------------------------------------------
<input type="tel" name="phone" class="form-control" placeholder="123 456 78 90" maxlength="10" 
       aria-label="<?php echo site_phrase('phone'); ?>" aria-describedby="<?php echo site_phrase('phone'); ?>" 
       id="registration-phone" required oninput="this.value=this.value.replace(/[^0-9]/g,'');">

       -------------------------------------------------------------------------------------------
## make github webhook  linux
# First
we need to need to download wget https://github.com/adnanh/webhook/releases/download/2.8.1/webhook-linux-amd64.tar.gz linux

# unzip tar -xzvf webhook-linux-amd64.tar.gz
then its move to 
# sudo mv webhook-linux-amd64/webhook /usr/local/bin/webhook
 # make hooks.js file

[
    {
      "id": "ubiattendance_app_api",
      "execute-command": "/path/your/webhook/redeploy.sh",
      "command-working-directory": "/var/www/html/application",
      "response-message": "Deployed...",
      "trigger-rule": {
        "and": [
          {
            "match": {
              "type": "payload-hmac-sha256",
              "secret": "{***###}",
              "parameter": {
                "source": "header",
                "name": "X-Hub-Signature-256"
              }
            }
          },
          {
            "match": {
              "type": "value",
              "value": "refs/heads/main",
              "parameter": {
                "source": "payload",
                "name": "ref"
              }
            }
          }
        ]
      }
    }
]

# create redeploye.sh file
#!/bin/bash

# Print a message to the terminal
echo "Webhook triggered successfully!"

# Example: Pull the latest changes from a Git repository
cd /var/www/html/appAdonisApi
git pull origin -f Development_Aug_2024

# Example: Restart a service
#sudo systemctl restart your-service

# Example: Write a log entry
echo "$(date): Webhook triggered" >> /var/www/html/logfile_adonisAPI.log


# make a excuteble file redeploye.sh
chmod +x redeployweb.sh

# finally run this commnd with port
   webhook -hooks hooksappapi.json -hotreload -verbose -http-methods post -port 4000

## Configure Webhook as a System Service (Optional)
# To run webhook as a service, you can create a systemd service file:
 sudo nano /etc/systemd/system/webhook.service
# Add the following content:
[Unit]
Description=Webhook Service
After=network.target

[Service]
ExecStart=/usr/local/bin/webhook -hooks /path/to/hooks.json -verbose
Restart=always
User="nobodyName"
Group="groupName"

[Install]
WantedBy=multi-user.target

#Enable and start the service:
sudo systemctl enable webhook
sudo systemctl start webhook

# reload webhook
sudo systemctl daemon-reload
# webhook check status
sudo systemctl status webhook







