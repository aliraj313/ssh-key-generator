#!/bin/bash

# Check if SSH key already exists
SSH_KEY="$HOME/.ssh/id_rsa"


if [ -f "$SSH_KEY" ]; then
    echo "SSH key already exists at $SSH_KEY"
else
    # Generate a new SSH key with no passphrase
    echo "Generating a new SSH key..."
    ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY"

    # Ensure ssh-agent is running
    eval "$(ssh-agent -s)"

    # Add the SSH key to ssh-agent
    ssh-add "$SSH_KEY"

    echo "SSH key successfully generated."
fi

# Show the SSH public key
echo "Here is your SSH public key:"

echo "\n *** YOUR SSH KEY *** \n"

cat "${SSH_KEY}.pub"

echo "\n  *** YOUR SSH KEY ***"
