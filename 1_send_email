#!/bin/bash

recipient="idealab2022@163.com"
subject="test sending email"
message="Good evening, this is a test email sent from a Bash script with an attachment. Sorry for my late."

echo -e "Subject: $subject\n\n $message" | msmtp --from=default -t $recipient
