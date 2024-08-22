#!/bin/bash
# Create the directory structure
mkdir -p /tmp/script-2/test

# Create the files
touch /tmp/script-2/test/test-1.txt
touch /tmp/script-2/test/test-2.txt
touch /tmp/script-2/test/test-3.sh

# Read groups and create them
groups=$(cat groups.txt)
for group in $groups; do
  sudo groupadd $group
done

# Read users and create them, then assign to corresponding groups
users=$(cat users.txt)
i=1
for user in $users; do
  sudo useradd -m $user -g group-$i
  i=$((i+1))
done

# Assign file permissions
sudo chown user-1:group-1 /tmp/script-2/test/test-1.txt
sudo chmod 640 /tmp/script-2/test/test-1.txt

sudo chown user-2:group-2 /tmp/script-2/test/test-2.txt
sudo chmod 644 /tmp/script-2/test/test-2.txt

sudo chown user-3:group-3 /tmp/script-2/test/test-3.sh
sudo chmod 644 /tmp/script-2/test/test-3.sh

# Add execute permission
sudo chmod +x /tmp/script-2/test/test-3.sh