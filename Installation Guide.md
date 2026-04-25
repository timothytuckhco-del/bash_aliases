🚀 Section 3: Installation Guide for Debian-Based OS
To make these aliases persistent across your sessions, you must add them to your shell startup
file (usually ~/.bashrc) and then "source" the file. 
This ensures that when you open a new terminal window, the shortcuts are available immediately.

Step 1: Save the File
Save the content from bash_aliases into a file named bash_aliases.sh in your home directory (~/).

Step 2: Add Source Command to .bashrc
Use a text editor (like nano or vi) or the following command to append the source call to your 
main bash configuration file.

echo "source ~/bash_aliases.sh" >> ~/.bashrc
Step 3: Apply Changes
For the aliases to take effect immediately in your current terminal session, you must run the 
source command on your .bashrc.

source ~/.bashrc
You are now ready! All the shortcuts defined in bash_aliases.sh will be active for every new 
bash terminal session.
