if [[ -d ~/.ssh/pems ]]; then
  # ssh-add ~/.ssh/pems/*.pem > /dev/null 2>&1
fi
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
