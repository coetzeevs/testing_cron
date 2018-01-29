#! /bin/bash    
cd /home/coetzeevs/testing_cron
echo "in first testing_cron folder"

source bin/activate
echo "started virtualenv"

cd /home/coetzeevs/testing_cron/testing_cron
echo "in second testing_cron folder"

# virtualenv is now active, which means your PATH has been modified.
# Don't try to run python from /usr/bin/python, just run "python" and
# let the PATH figure out which version to run (based on what your
# virtualenv has configured).

echo "running script"
python main.py