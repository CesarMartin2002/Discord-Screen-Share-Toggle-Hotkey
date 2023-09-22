# Discord Screen Share Toggle Hotkey (AutoHotKey)

![GPL-3.0 License](https://img.shields.io/badge/license-GPL--3.0-blue)

## Table of Contents

- [Discord Screen Share Toggle Hotkey (AutoHotKey)](#discord-screen-share-toggle-hotkey-autohotkey)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Features](#features)
  - [Usage](#usage)
  - [How It Works](#how-it-works)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Future Plans and Improvements](#future-plans-and-improvements)
  - [Contributing](#contributing)
  - [License](#license)

## Description

Discord Screen Share Toggle Hotkey is an AutoHotKey script that allows you to seamlessly toggle your Discord Screen Share on and off with a customizable hotkey. With a double press (to avoid accidental presses) of a key or key combination that you specify, the script starts your Discord Screen Share. A single press of the same hotkey ends the Screen Share. This project simplifies the process of managing your Discord Screen Shares, making it more efficient and user-friendly.

Discord does not provide a hotkey to start Screen Sharing. This script aims to solve that problem by providing a simple solution.

## Features

- **Easy Toggle**: Use a double-press of a specified hotkey to start your Discord Screen Share and a single press to stop it.
- **Safe Toggle**: The script uses a double-press to avoid accidental presses and to ensure that the Screen Share is only started when you want it to.
- **Customizable Hotkey**: You can easily configure the hotkey to suit your preferences.
- **Automatic Handling**: The script automatically checks if a Screen Share is already running to avoid unnecessary actions.
- **Intuitive Configuration**: The README provides clear instructions on how to configure and use the script.

## Usage

1. [Download the script](#installation).
2. [Configure the hotkey](#configuration) to your preferred key combination.
3. Run the script, and use the hotkey to start and stop Screen Sharing.

## How It Works
The script works by detecting your specified hotkey presses. A double press starts the stream, while a single press stops it. The script handles Discord interactions and checks if a stream is already running to avoid unnecessary actions.

Here's a brief overview of how the script works:

+ It activates Discord and checks for the availability of the Screen Share button.
+ If a stream is not already running, it opens the Screen Share menu and starts the stream.
+ If a stream is running, it exits the script to prevent any interruption.

## Installation

1. [Download AutoHotKey](https://www.autohotkey.com/download/) if you don't already have it installed.
2. Clone this repository or download the script directly.
3. Double-click the script file to run it.

## Configuration

+ Configuting the Hotkey:
   
    You can configure the hotkey by modifying the `F14::` section in the script. Replace `F14` with your desired hotkey. For example, to use `F12` as the hotkey:

```autohotkey
F12:: 
```
+ Configuring the Coordinates where the mouse will click:
    
    The script is dependant on two relative coordinates of the Discord window. Sadly there is no way to get the coordinates automatically, so you will have to find them manually. This is why it is recomended to not resize your Discord window, as it can force you to reconfigure the coordinates.
    
    To configure them, follow these steps:

    - Open the AutoHotKey Window Spy by right-clicking the AutoHotKey icon in the system tray and selecting `Window Spy`.
    - Make sure Discord is the currently active window and your mouse over the Screen Share button at the bottom left corner of the Discord window. Replace the coordinates in the script with the coordinates shown in the Window Spy at lines 51 and 62.
    - Click the Screen Share button to open the Screen Share menu and move your mouse over the `Screen` option. Make sure that in Window Spy, the `Color` value is `BCB7B2`. Replace the coordinates in the script with the coordinates shown in the Window Spy at lines 70 and 76.
  
Make sure to save the script after making changes.

## Future Plans and Improvements
- Currently, the script only works when using the default Discord theme, as it needs to read the color values on the screen to determine if a stream is running and to detect when the Screen Share menu loads. I plan to add support for other themes in the future.

- The script is currently dependant on the relative coordinates of the Discord window. I plan to at least make it only scale-dependent in the future by locating the bottom left corner of the Discord window and using that as a reference point. This will allow the script to work even if the Discord window is resized or moved. However, it will still not work if you are running Discord with a different scaling than 100%.

- Possible infinite recursion when the hotkey is not able to check if the Screen Share menu is open. This can happen if the coordinates are not configured properly or if the Discord window is not in focus. I plan to add a failsafe to prevent this in the future.



## Contributing
If you would like to contribute to this project, feel free to open issues, suggest improvements, or submit pull requests. Your contributions are highly appreciated!

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).

You can find the full text of the license [here](https://www.gnu.org/licenses/gpl-3.0.html).
