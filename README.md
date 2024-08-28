## phonesploit.py

An all-in-one hacking tool written in `Python` to remotely exploit Android devices using `ADB` (Android Debug Bridge) and `Metasploit-Framework`.

### script

```
git clone https://github.com/sudo-self/phonesploit.git
cd phonesploit
python3 phonesploit.py
```

### run the script & build executable & create dmg

```
sudo chmod +x setpup.sh
./setup.sh
```

### executable

```
pyinstaller --onefile --icon="icon.icns" phonesploit.py
```
### create .dmg

```
cd dist
create-dmg phonesploit.dmg icon.icns phonesploit.dmg
```
<img width="976" alt="Screenshot 2024-08-28 at 11 01 36 AM" src="https://github.com/user-attachments/assets/ac194b78-5f62-49c5-b3a8-c182b201f8a8">

