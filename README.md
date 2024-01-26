![Screenshot 2024-01-26 213803](https://github.com/Hemanth5603/Laser-Slides/assets/108444612/e61a0a37-e6fb-4464-9ed0-b3c8e6ac4dd6)# laser_slides
Laser Slides Application	

Introduction:
Laser Slides is a simple yet powerful cross-platform application which works with OSC(Open Sound Control), and allows users to manipulate the laser slides in the BEYOND software from a tablet device.

Getting Started:
The application is compatible with all the latest android versions of android starting from v4.4.
The laser slides application can be best viewed in Tablet devices with a minimum screen size of 8” inches.

Instructions:
Firstly, in order to use the laser slides application the system should have BEYOND software installed in the system.
On the BEYOND application we must go to the “setting” -> “OSC” -> “OSC settings” and then look up for the IP address such as “192.168.29.219” .
Once we know the IP address, start the laser slides application on a tablet device. We should configure the settings to control the slides in BEYOND software.
Now go to settings in the application enter the IP address and PORT as “8000”, After entering the values in the fields click on the “Save” button, if you see a popup with message “Connection Successful” you are good to go!!.
Now that we have made a successful connection with BEYOND, Go to the “Home” section in the app. Here you can control the slides with various buttons and customize with your desired functionality as well.
The Slides are generally manipulated using OSC commands, which you can assign to each button on “double tapping” on any button.
You can see a popup on your screen by double tapping on any button. The popup has various fields, Here enter the desired button name, and the OSC command such as “0 1” or “0 3” etc. once entered click on save button and the settings will be saved.
The initial digit in the OSC command represents the row number and the second number represents the cell number in that row.
All the OSC commands can be found at : OSC command

![Screenshot 2024-01-26 213803](https://github.com/Hemanth5603/Laser-Slides/assets/108444612/5996055a-8d6a-4809-9448-b36fd8a857a7)
![Screenshot 2024-01-26 214146](https://github.com/Hemanth5603/Laser-Slides/assets/108444612/330c48c6-15e8-4a0c-9028-4c2a9682cf70)
![Screenshot 2024-01-26 214242](https://github.com/Hemanth5603/Laser-Slides/assets/108444612/06f220ce-f99c-4f29-b860-d9d85c8def89)



UI UX:
On the start up of the laser slides application we could see an on-boading page with a quick introduction of the application.
In the home page we could see 3 navigation buttons, “Home” directing to the buttons page, “About”button directing to the instructions page and “settings” page which will lead to opening of a bottom sheet to configure the settings of the application.
The home page has buttons to manipulate the slides, the buttons are designed to showcase a 3d button press animation. On double tapping on any button it leads to opening of a popup with HERO animation enabling the user to edit the button.

