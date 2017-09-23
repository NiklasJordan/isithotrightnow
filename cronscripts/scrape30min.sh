#!/bin/bash
# This is a script run every half hour to scrape current observations
# It is run through crontab, editable with:
# sudo crontab -u shiny -e

# download latest observations 
curl -o /srv/isithotrightnow/data/IDN60901.94768.axf http://www.bom.gov.au/fwo/IDN60901/IDN60901.94768.axf
curl -o /srv/isithotrightnow/data/IDN60901.94768.json http://www.bom.gov.au/fwo/IDN60901/IDN60901.94768.json

# grep last 30min obs (line starting with '0,') into data/hist_ file
grep -o '^0,.*' /srv/isithotrightnow/data/IDN60901.94768.axf >> /srv/isithotrightnow/data/hist_IDN60901.94768.csv

echo "latest observations have been scraped"
exit