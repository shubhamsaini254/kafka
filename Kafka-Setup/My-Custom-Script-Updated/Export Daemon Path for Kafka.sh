# Export Daemon path for kafka at home on terminal. This will help us to execute scripts of kafka at home of terminal.

sudo nano .bash_profile

# Add entry in .bash_profile below the line - # User specific environment and startup programs

DAEMON_PATH=/home/ec2-user/kafka/bin
export PATH=$PATH:$DAEMON_PATH
export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"

# Save changes and re-login for take effect