# Bolt Dash (C++)

A dashboard for an electric superbike, written in C++, Qt6, and QML

## Description

This project is build specifically for BOLT VS at Virginia Tech, and is
designed to use all of our specific parameters. This program is intended to be run on a Raspberry Pi with CAN and Qt6 already installed and set up. The dashboard will read from a CAN bus to see a multitude of information about the bike, and display most of it on a GUI for a rider to easily see what is happening.

## Visuals

Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation

To install CAN on a Rasbperry Pi, we use an off the shelf CAN HAT for Raspberry Pi's. Then, we followed the manufacturers instructions for getting it set up in Linux.

Then, we install Qt by running `sudo apt install qt6-base-dev`

### ^^^ Check this to make sure it's correct ^^^

## Usage

To run this, open [QT Creator](https://www.qt.io/download-qt-installer-oss?utm_referrer=https%3A%2F%2Fwww.qt.io%2F). Click on file->Open File or Project and select the top-level CMakeLists.txt in the Bolt_Dash folder. If a screen comes up asking what you want to do, select configure project at the bottom right. Then, press the run button on the bottom right and the application should run.

## Roadmap

If you have ideas for releases in the future, it is a good idea to list them in the README.

## Authors and acknowledgment

Code written by

-   Mason DiGiorgio
-   Molly Shear
-   Julia Gardiner
-   Rumi Khamidov

## Project status

Ongoing, still in active development
