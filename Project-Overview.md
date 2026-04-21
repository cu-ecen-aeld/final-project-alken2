# Overview
The goal of this project is to build a cohesive video game console with a LCD screen, audio, and optionally a GPIO gamepad leveraging the [TIC-80](https://github.com/nesbox/TIC-80) fantasy computer software.

The motivation behind this project revolves around my interest in small, digital games designed for resource-constrained environments, especially for old hardware and/or embedded systems. There is various fantasy computer software available where this criteria applies, but TIC-80 was chosen due to being completely open-source and having some community following.

The main hardware and software components utilized are the following:
- Raspberry Pi 3 B+ (as the hardware platform)
- TIC-80 Bare-Metal Installation
- ST7789 1.14" 240x135 TN LCD Screen
- ALSA Audio Library
- As a stretch goal, a custom GPIO driver that maps gamepad buttons to keyboard keys

![AESD Final Project Block Diagram](AESD_Final_Project_Block_Diagram.png)

# Target Build System
Buildroot is selected as the target build system.

# Hardware Platform
The Raspberry Pi 3 Model B+ is selected as the hardware platform, which I have currently in my possession.

# Open Source Projects Used
- [TIC-80 Fantasy Computer](https://github.com/nesbox/TIC-80)
- [Custom ST7789 Library for Raspberry Pi](https://github.com/gavinlyonsrepo/ST7789_TFT_RPI) *Note: this library may serve as an inspiration for a personalized ST7789 library instead of the end result*
- [ALSA Audio Library](https://github.com/alsa-project/alsa-lib)

# Previously Discussed Content
This project will involve creating buildroot packages with drivers and APIs that will be included as part of the build system for the project. Also, there may be content surrounding file I/O introduced as the fantasy computer will interact with the storage device to load applications and games.

# New Content
The new content will involve the inclusion of embedded hardware concepts such as SPI and GPIO interfacing for user interaction with the system.

# Source Code Organization
Buildroot will be hosted on this repository

Drivers and APIs will be hosted on the following repository: https://github.com/alken2/AESD-Final-Project-Drivers

It may not be necessary, but there is also a personal fork of TIC-80 in case changes may be needed to the bare metal implementation: https://github.com/alken2/TIC-80-AESD-Final-Project/tree/v1.1.2837

# Contributions
Solo project by Kenneth Alcineus - [@alken2](https://github.com/alken2)

# Schedule Page
(See Projects Dashboard)[https://github.com/cu-ecen-aeld/final-project-alken2/projects]