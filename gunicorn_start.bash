#!/bin/sh
NAME="webform"                                 # Name of the application 
DJANGODIR=/home/alisha/Documents/djangoweb/webform            # Django project directory 
SOCKFILE=/home/alisha/Documents/djangoweb/webform/.env/run/gunicorn.sock # we will communicte using this unix socket 
USER=alisha                                       # the user to run as 
GROUP=alisha                                    # the group to run as 
NUM_WORKERS=3                                    # how many worker processes should Gunicorn spawn 
DJANGO_SETTINGS_MODULE=webform.settings            # which settings file should Django use 
DJANGO_WSGI_MODULE=webform.wsgi                    # WSGI module name 
  
echo "Starting $NAME as 'pappu'" 
  
# Activate the virtual environment 
cd $DJANGODIR 
# Source ../.env/bin/activate 
. /home/alisha/Documents/djangoweb/webform/.env/bin/activate 
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE 
export PYTHONPATH=$DJANGODIR:$PYTHONPATH 
  
# Create the run directory if it doesn't exist 
RUNDIR=$(dirname $SOCKFILE) 
test -d $RUNDIR || mkdir -p $RUNDIR 
  
# Start your Django Unicorn 
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon) 
exec /home/alisha/Documents/djangoweb/webform/.env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \ 
 --name $NAME \ 
 --workers $NUM_WORKERS \ 
 --user=$USER --group=$GROUP \ 
 --bind=$SOCKFILE \ 
 --log-level=debug \ 
 --log-file=- 
 
 # #!/bin/bash

# NAME="webform"                                    # Name of the application
# DJANGODIR=/home/alisha/Documents/djangoweb/webform  # Django project directory
# SOCKFILE=/home/alisha/Documents/djangoweb/webform/.env/run/gunicorn.sock  # we will communicte using this unix socket
# # SOCKFILE=localhost:8000  # we will communicte using this unix socket
# PYTHONDJANGODIR=/home/alisha/Documents/djangoweb/webform/.env/bin/python3
# USER=alisha                                         # the user to run as
# GROUP=alisha                                        # the group to run as
# NUM_WORKERS=3                                       # how many worker processes should Gunicorn spawn
# DJANGO_SETTINGS_MODULE=webform.settings      # which settings file should Django use
# DJANGO_WSGI_MODULE=webform.wsgi              # WSGI module name
# echo "Starting $NAME as 'Pappu'"

# # Activate the virtual environment

# cd $DJANGODIR
# Source ../venv/bin/activate 
# export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE 
# export PYTHONPATH=$DJANGODIR:$PYTHONPATH 

# RUNDIR=$(dirname $SOCKFILE)
# test -d $RUNDIR || mkdir -p $RUNDIR

# # Start your Django Unicorn
# # Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)

# exec /home/alisha/Documents/djangoweb/webform/.env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
#   --name $NAME \
#   --workers $NUM_WORKERS \
#   --user=$USER --group=$GROUP \
#   --bind=unix:$SOCKFILE \
#   --log-level=debug \
#   --log-file=-