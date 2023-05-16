sudo -i
sudo apt update
adduser hassan
addgroup devops
usermod -aG sudo hassan 
usermod -aG devops hassan
mkdir /devopsDIR
chown hassan:devops /devopsDIR
chmod 770 /devopsDIR

echo "set number
inoremap jj <Esc>" > ~/.vimrc


for user in /home/*
do
echo "set number
inoremap jj <Esc>" > "$user/.vimrc"
done


sudo apt install nginx -y

