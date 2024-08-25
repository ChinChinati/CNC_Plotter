# CNC Plotter - Image Drawing Project
This GitHub repository contains the code and resources for building a CNC Plotter that can draw any image on a piece of paper. The project is built using an Arduino board and stepper motors for controlling the movement of the plotter.

## How was the Project Made
### Hardware Components
The CNC plotter was built using the following hardware components:

+ Arduino Uno board
+ 2 x DVD's Stepper Motors
+ 1 x Servo Motor
+ 5V Power Supply
+ L joints
+ 2 x L293N Motor Driver
+ Pen Holder
+ Aluminium Composite Sheets

The CNC shield was connected to the Arduino board, and the stepper motors and servo motor were connected to the motor drivers. The pen holder was also attached to the servo motor.

The main body was made from Aluminium Composite Sheets. A hard cardboard sheet was used as the drawing surface, and it was attached to the stepper motor at the base. 
The other stepper motor was placed vertically with its frame using L joints. The servo motor along with pen holder was attached with the second stepper motor.



<p align="center">
  <img src="https://user-images.githubusercontent.com/106835636/226588322-96e2c492-e696-4327-9701-a99947e11419.jpg" alt="Image 1" width="45%" />
  <img src="https://user-images.githubusercontent.com/106835636/226593747-b6b5d087-dc4f-4c46-9549-20367dba6ef1.jpg" alt="Image 2" width="45%" />
</p>


### Software Components
The software components used in this project include:

+ Arduino IDE
+ Processing3
+ Inkscape: G-code converter

The Arduino IDE was used to write the code for the CNC plotter. The code controls the movement of the stepper motors and servo motor.

The Arduino CNC firmware was flashed onto the Arduino board to enable the G-code interpreter. The firmware is responsible for interpreting the G-code commands and converting them into stepper motor movements.

The processing code was used to send the G-code commands to the CNC plotter.

### Project Design

The images is exported as a DXF file and imported into Inkscape. Inkscape was used to convert the DXF file into G-code commands. The G-code commands were saved as a text file.

The G-code text file was loaded into the Processing3 file, and the CNC plotter was then started. The plotter moved the pen holder to draw the image on paper.

### Conclusion
This project demonstrates how an Arduino-based CNC plotter can be used to draw any image on paper. The use of open-source software and hardware components makes it an accessible and cost-effective solution for anyone interested in CNC projects. The code and resources for this project are available on this GitHub repository for anyone to use.
