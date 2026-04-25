# ==============================================
# CORE SYSTEM MAINTENANCE & PACKAGE MANAGEMENT
# ==============================================

# Shortcut for installing packages: 'ins package_name'
alias ins='apt-get install $1'

# Removes unused or orphaned dependencies (e.g., old kernel versions)
alias autoremove='sudo apt-get autoremove'

# Clears the local repository cache and removes unnecessary files
alias clean='sudo apt-get clean; sudo apt-get autoclean'

# Fixes dependency issues or broken packages: 'fix'
alias fix='sudo apt-get -f install'

# Removes a package entirely, including configuration files: 'purge package_name'
alias purge='sudo apt-get purge $1'

# Removes a package but keeps its configuration files for potential restoration: 'remove package_name'
alias remove='sudo apt-get remove $1'

# Searches for packages by name or keyword: 'search keyword'
alias search='apt-cache search $1'

# Performs the standard update and full upgrade of all installed packages.
alias update='sudo apt-get update && sudo apt-get dist-upgrade'

# Removes package lock files if system update stalls (Use with caution!)
alias rmlock='rm -f /var/lib/dpkg/lock /var/cache/apt/archives/lock /var/lib/apt/lists/lock'


# ==============================================
# SYSTEM MONITORING & DIAGNOSTICS
# ==============================================

# Real-time monitoring of the authentication log (useful for tracking logins/attacks)
alias attacks='tail -f -n 2000 /var/log/auth.log'

# Counts lines in the authentication log (Note: Needs specific arguments)
alias attackcount='cat /var/log/auth.log | wc -l'

# Real-time monitoring of the main system log (useful for general debugging)
alias syslog='tail -f -n 1000 /var/log/syslog'

# Searches the package database for specific files or keywords: 'research keyword'
alias research='apt-cache search -f $1'

# Monitors all tcp an udp listening ports and programs using netstat 
alias ports='netstat -tulanp'


# ==============================================
# NETWORK & FIREWALL (IPTABLES) MANAGEMENT
# ==============================================

# Wrapper function to execute iptables with sudo privileges. 
# Usage: ipt <command>
alias ipt='sudo /sbin/iptables' 

# Displays ALL firewall rules in a detailed, numerical format.
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers' 

# Displays ONLY the INPUT chain rules (traffic coming into the system).
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers' 

# Displays ONLY the OUTPUT chain rules (traffic leaving the system).
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers' 

# Displays ONLY the FORWARD chain rules (traffic passing through the system, e.g., a router).
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers' 

# Blocks incoming traffic from a specific IP address. (Usage: ban <IP_ADDRESS>)
alias ban='sudo iptables -I INPUT -j DROP -s $1'

# Removes an existing "ban" rule for an IP address. (Usage: unban)
alias unban='sudo iptables -D INPUT -j DROP -s $1'


# ==============================================
# FILE SYSTEM & ARCHIVE UTILITIES
# ==============================================

# Lists all files and directories, including hidden ones (.): 'l.'
alias l.='ls -d .* --color=auto'

# Lists installed packages matching a specific keyword: 'list keyword'
alias list='dpkg -l | grep $1'

# Shows files sorted by size, largest first (human readable format): 'lsbig'
alias lsbig='ls -gtSrh'

# Shows all files (including hidden), including sizes and full timestamps ('aht'): 'lsnew'
alias lsnew='ls -lhat'

# Shows files in reverse chronological order (oldest last, human readable): 'lssold'
alias lsold='ls -lhatr'

# Creates directories recursively if they do not exist: 'mkdir dir_name/subdir'
alias mkdir='mkdir -pv'

# Formats the output of the `mount` command into a clean columnar format.
alias mnt='mount | column -t'

# Filters out comments (#) and blank lines from grep results.
alias nocomment='grep -Ev '\''^(#|$)'\'''


# ==============================================
# APPLICATION & WEB MONITORING ALIASES
# ==============================================

# Monitors Apache web traffic specifically looking for POST requests to /administrator 
# (Filtering out activity from local network IP 192.168.1.125)
alias webattack="tail -f -n 20000 /var/log/apache2/other_vhosts_access.log | grep 'POST /administrator' | grep -v 192.168.1.125"

# Counts lines in the specific web attack log file.
alias webattackcount='cat /var/log/apache2/other_vhosts_access.log | wc -l'

# Monitors general suspicious web traffic on the access log (excluding local IPs).
alias webtraffic='tail -f -n 2000 /var/log/apache2/other_vhosts_access.log | grep -v 192.168.1.125'


# ==============================================
# SYSTEM POWER MANAGEMENT
# ==============================================

# Forces a system shutdown: 'poweroff'
alias poweroff='sudo /sbin/poweroff'

# Forces a system reboot: 'reboot'
alias reboot='sudo /sbin/reboot'
