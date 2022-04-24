Supported Device
Mostly every device i think, but i debug with (emulator) Google Pixel 3 XL

Supported Feature
1. Search based on artist name
2. Pop up bottom player if song selected
3. Next, Previous and Pause song
4. Song still playing when do another search
5. "This Song", "Previous Song", "Next Song" retained even after do another search.
   Example: Search Justin Bieber, Play song then search Jason Derulo, if no Jason Derulo
   song played, next song still Justin's
6. Automatically play next song in list
7. Indicator at currently played song
8. Song progress indicator

Requirement to build app
1. I used flutter 1.22.6 (1 version before flutter 2 or non null-safety), so to build app
   smoothly i recommend to use flutter 1.22.6

Instructions to build and deploy the app
1. If you using flutter above version 1.22.6, go to your "Flutter" directory then perform
   this command "git checkout 1.22.6" to downgrade your flutter, wait few minutes and restart
   VS code
2. Perform "flutter pub get" to download required package
3. Run on emulator or your selected device
