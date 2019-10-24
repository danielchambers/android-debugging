# android-debugging
Notes and tools to debug Android APK files

# Tools  
`brew cask install android-platform-tools`  
`brew install apktool`  
`brew install dex2jar`  
`brew install cfr-decompiler`  
`brew install procyon-decompiler`  

# Android Tools  
### Sign APK  
Create key  
`keytool -genkey -v -keystore foo-key.keystore -alias foo -keyalg RSA -keysize 2048 -validity 10000`  
Sign APK  
`jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore foo-key.keystore new-foo.apk foo`  

### ADB Download APK  
List all connected USB devices  
`adb devices -l`  
Find a app's package name  
`adb shell pm list packages | grep "foo"`  
Find an app's path  
`adb shell pm path com.foo.bar`  
Copy APK to computer  
`adb pull /data/app/com.foo.bar/base.apk`  
### ADB Install APK  
Install APK to Android device  
`adb install foo.apk`  

# Building Tools
### APKTool (Produce APK)  
`apktool b bar -o new_bar.apk`  

# Decompiling Tools
### APKTool (Produce Smali Source)  
Extract Smali from APK to a folder  
`apktool d bar.apk`  
Extract Smali from JAR to a folder  
`apktool d foo.jar`  
Extract Smali from APK/JAR to a specific folder  
`apktool d bar.apk -o ./source/smali/`  

### Dex2Jar (Produce JAR file)  
Extract a JAR from the APK  
`d2j-dex2jar -f -o foo.jar foo.apk`  

### CFR-Decompiler (Produce Java Source)  
Extract Java source from APK to a folder  
`cfr-decompiler foo.jar --outputdir ./source/java/`  
