# Score
Sample Score application test using simpliefed POM. 
Video of tests running: https://youtu.be/kvOPIh3LioY 


Basic instructions to run the tests on a mac
1. If not already installed
    1. Install brew: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    1. Install Git: brew install git
    1. Install Python: brew install python@2
    1. Install Java: 
        1. brew tap caskroom/versions
        1. brew cask install java8
    1. Android SDK install: https://www.androidcentral.com/installing-android-sdk-windows-mac-and-linux-tutorial
    1. Install node: curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    1. Install appium: npm install -g grunt grunt-cli appium@1.10.1 --verbose
1. Clone repo: git clone https://github.com/wonkas-factory/Score.git
1. Go to new project: cd Score
1. Install required libraries: pip install --user -r requirements.txt
1. Update config/test_data.robot file with valid info
    1. UDID: connected device from adb devices
    1. FIRST_NAME: First name of a Score account
    1. LAST_NAME=: Last name of a Score account
    1. SCORE_USERNAME: username of a Score account
    1. SCORE_EMAIL: email of a Score account
    1. SCORE_PASSWORD: password of a Score account
    1. Other fields should be fine with default and optional changing
1. Run tests: robot android/tests/
