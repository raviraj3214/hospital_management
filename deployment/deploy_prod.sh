#!/bin/sh

# ssh root@178.16.137.56 <<EOF
  cd hospital_management
  git pull 
  source env/bin/activate
  pip install -r requirement.txt
  python manage.py makemigrations
  python manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF