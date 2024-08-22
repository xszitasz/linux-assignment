# Script Assignment

This assignment involves exercises with users and group management. Also it is a exercise for adding users to groups and assigning permisions to them.

## Instructions

1. **Create and fill files with data:**
    - Create files `groups.txt` and `user.txt`
    - File `groups.txt` will have data: group-1; group-2; group-3
    - File `users.txt` will have data: user-1; user-2; user-3

2. **Create main script:**
    - Create a script `main.sh`
    - The script will create folder `/tmp/script-2/test` and inside the folder it will create files: `test-1.txt; test-2.txt and test-3.sh`

3. **User and group creation:**
    - The script will get the users and groups from .txt files and create them

    ```bash
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
    ```
    
4. **User, group permison management:**
    - The finall step is to set permissions to user, groups and add execute permission to main.sh file

    ```bash
        # Assign file permissions
        sudo chown user-1:group-1 /tmp/script-2/test/test-1.txt
        sudo chmod 640 /tmp/script-2/test/test-1.txt
        
        sudo chown user-2:group-2 /tmp/script-2/test/test-2.txt
        sudo chmod 644 /tmp/script-2/test/test-2.txt
        
        sudo chown user-3:group-3 /tmp/script-2/test/test-3.sh
        sudo chmod 644 /tmp/script-2/test/test-3.sh
        
        # Add execute permission
        sudo chmod +x /tmp/script-2/test/test-3.sh
    ```