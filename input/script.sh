#!/bin/bash

# Interactive Login Script
# This script demonstrates basic user input and conditional statements

# Prompt user for email address
echo -e "\nYour email is:"
read EMAIL  # Read email input from user

# Prompt user for password (hidden input)
echo -e "\nYour password is:"
read -s PASSWORD  # -s flag hides the password input for security

# Check if credentials match the expected values
# Using double brackets [[ ]] for enhanced conditional testing
# && operator ensures both conditions must be true
if [[ "$EMAIL" == "salman@gmail.com" && "$PASSWORD" == "12345" ]]; then
    echo "Login succesfully"  # Display success message
else
    echo "Login failed"  # Display failure message for incorrect credentials
fi
