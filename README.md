# Chuck Norris App 2.0

Extremely elegant app for getting fresh Chuck jokes \
Now, this app have some new pretty features 😄

## Getting Started

This project looks like Tinder \
If you want to get new joke just swipe!\
Save favourite jokes by one tap! \
Even if you don't know English, you can navigate through app with Russian Localization 🇷🇺 \
Application use Firebase services: Firestore to keep favourite joke and Crashlytics to save info about unhandled exceptions \
Apparently, this is my first Flutter app 

### Link to the .apk file : [here](app-release.apk)
___

## How does it works?

### First page is a home page with two buttons:
- Start Dating
- Floating action menu

<p align="center">
  <img src="screenshots\screen_1.png" width="350" title="home_screen">
</p>

### "Dating" page
Here you can get any jokes of the Chuck in two different ways:
1) User can push the buttons under the card for like or dislike. However, nobody can dislike Chuck, therefore user will be seeing some floating window in such case

2) User can swipe right for like and left for dislike. It is possible with the use of GestureDetector in Flutter

3) User can press "Heart" button to save joke

<p align="center">
  <img src="screenshots\screen_2.png" width="350" title="dating_screen">
  <img src="screenshots\screen_3.png" width="350" title="floating_window">
</p>

### Floating action button functionality
Floating action button hides several actions:
1) Change language 
2) Open “Favourite” screen 
3) Open “About” screen

<p align="center">
  <img src="screenshots\screen_5.png" width="350" title="fab">
</p>

### Change language 

This functionality was implemented with the help of “Easy_localisation” library. [link](https://pub.dev/packages/easy_localization) \
App have two .json files in -/asset/localisation folder that are responsible for saving strings in Russian and English variant.

### "Favourite" page
Here user can see list of the liked jokes \
Each field can be easily deleted by a swipe \
Jokes saved in Firestore database

<p align="center">
  <img src="screenshots\screen_6.png" width="350" title="favourite_screen">
</p>

### "About" page
Here user can know more about developer, with some animation and one easter egg )

<p align="center">
  <img src="screenshots\screen_4.png" width="350" title="about_screen">
</p>

# I hope you will like this simple app 🧡