---
layout: default
---

I'm Patrik Eriksson. I make films, and I build open-source tools for the things
I need while making them. Two of those are below — both are free to use, fork
and take apart.

## CineMate

[Repository](https://github.com/Tiramisioux/cinemate) &middot; [Documentation](https://tiramisioux.github.io/cinemate/)
{: .links}

An open-source boilerplate for building your own digital cinema camera on a
Raspberry Pi 4 or 5. It records CinemaDNG raw video from off-the-shelf parts —
a Pi, an official HQ or GS camera module, an SSD — and leaves the camera body
to you. Buttons, switches, rotary encoders, potentiometers and an OLED are
mapped in a single settings file; a web GUI served from the camera's own hotspot
drives it from a phone, and a web API lets you build wireless controllers and
tally lights. It runs on a fork of
[cinepi-raw](https://github.com/Tiramisioux/cinepi-raw), the raw recorder by
Csaba Nagy.

## HackThePiano

[Play it](https://tiramisioux.github.io/hackthepiano/) &middot; [Repository](https://github.com/Tiramisioux/hackthepiano)
{: .links}

Learn to read notes on the fly: play the note you see, as fast as you can. This
is a fork of
[Wojciech Małota-Wójcik's trainer](https://github.com/wojciechmalota/hackthepiano)
— the app and the music logic that makes it work are his. The fork adds an
on-screen piano so you can practise without an instrument attached, C/F/G
landmark markings to navigate the staff by, a free-practice mode, and a module
framework for new exercises. It runs in a browser; a MIDI keyboard is optional.
