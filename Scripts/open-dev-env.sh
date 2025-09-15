#!/bin/bash

count=1 # Attempt to mount iterator
limit=5 # Limit on amount of attempts to mount

firstTimeFlag=0 # Whether or not an attempt to mount was made

# Notify about an attempt to mount
function notifyAttempt {
    if [ $firstTimeFlag = 0 ]; then
        notify-send -i terminal -a "Open Dev Env" -c device.error --hint=int:transient:1 "Attempting to mount NAS..."
    else
        notify-send -i terminal -a "Open Dev Env" -c device.error --hint=int:transient:1 "Attempting to mount NAS..." "Mounting failed. Is the server on?"
    fi

    firstTimeFlag=1
}


# Attempt to mount
sudo mount -a
findmnt /mnt/NAS/

# Attempt mounting X number of times
while [[ $count -le $limit && $? != 0 ]]; do
    ((count++))

    # Notify on 3 to not overwhelm the notify queue since gnome ignores timeout option with notify-send
    if [ $count = 3 ]; then
        notifyAttempt
    fi

    sudo mount -a
    findmnt /mnt/NAS/
done

# Abort early if could not mount NAS
if [ $? != 0 ]; then
    notify-send -t 100 -i error -u critical "NAS could not be mounted." "The process was aborted."
    exit 1
fi


# If needed to attempt mounting, notify it was successful
if [ $firstTimeFlag != 0 ]; then
    notify-send "NAS mounted."
fi

# Create TMUX session
tmux new-session -d -s Development -n 'time-tracker' 'time-tracker ; bash -i'
tmux new-window -t Development:1 -n 'Directory' 'cd /mnt/NAS/1-Project-Related/Project-Source-Directories/; bash -i'
tmux new-window -t Development:2 -n 'nvim' '/opt/nvim-linux-x86_64/bin/nvim /mnt/NAS/1-Project-Related/Project-Source-Directories/ ; bash -i' 
tmux attach-session -t Development 

