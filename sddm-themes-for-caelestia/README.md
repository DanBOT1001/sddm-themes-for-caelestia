# SDDM Themes for Caelestia Shell

A simple, stable interface to switch SDDM login themes directly from your shell configuration.

## Features
- **UI-Based Control**: Select your theme visually.
- **Stable Architecture**: Uses a background file-watcher bridge to avoid shell crashes and permission errors.
- **Root-Ready**: Automatically triggers `pkexec` for secure configuration changes.

## Installation

1. **Move files**: Place `SddmPage.qml` into your Quickshell pages directory (e.g., `~/.config/quickshell/caelestia/modules/nexus/pages/`).
2. **Setup the Watcher**:
   - Copy `sddm_watcher.sh` to your home directory.
   - Make it executable: `chmod +x ~/sddm_watcher.sh`
   - Start it in the background: `~/sddm_watcher.sh &`
3. **Configure Startup**: Add `~/sddm_watcher.sh &` to your system startup applications or your shell's autostart file to ensure it's always running.

## Usage
Simply click on a theme card in the UI. The watcher script will detect the request and prompt you for your password via `pkexec` to apply the changes.

## Credits
Created Using Gemini

<html>
   <body>
      <img width="1808" height="1138" alt="image" src="https://github.com/user-attachments/assets/033a20aa-1f8a-4cdd-97cb-8abb557ab9c6" />

   </body>
</html>
