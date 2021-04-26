# Swifty-Proteins

SwiftyProteins is a 3D visualizer for protein models according to standardized representation from the PDB <br> ([Protein Data Bank](https://www.rcsb.org/)) using SceneKit.

The app allows to register an acc and log in using Touch ID or Face ID. Then you’ll see a table with ligands. Search in the table and click on a ligand to see it in 3D and interact with it. Use the sharing option to save or send the ligand image from the scene.

<img src="https://raw.githubusercontent.com/mmatiush/Swifty-Proteins/master/ui.gif" width="300">
Project from Unit Factory (School 42).

#### Login ViewController:
• A user must be able to login with Touch ID using a button <br>
• If login fails you must display a popup warning authentication failed <br>
• If the iPhone is not compatible the Touch ID login button should be hidden <br>
• The LoginViewController should ALWAYS be displayed when launching the app meaning <br>
&nbsp;&nbsp; if you press the Home button and relaunch the app whitout quitting it, <br>
&nbsp;&nbsp; it should show the LoginViewController ! <br>
#### Protein List ViewController:
• You must list all the ligands provided in ligands.txt (see resources) <br>
• You should be able to search a ligand through the list <br>
• If you cannot load the ligand through the website display a warning popup <br>
• When loading the ligand you should display the spinning wheel of the activity monitor <br>
#### Protein ViewController:
• Display the ligand model in 3D <br>
• You must use CPK coloring <br>
• You should at least represent the ligand using Balls and Sticks model <br>
• When clicking on an atom display the atom type (C, H, O, etc.) <br>
• Share your modelisation through a ‘Share‘ button <br>
• You should be able to ‘play‘ (zoom, rotate...) with the ligand in Scene Kit <br>
