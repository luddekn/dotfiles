# i3 Configuration
These are my dotfiles for i3

`sudo apt install i3` && `sudo apt install i3status`

Install `stow` for easy mapping of dotfiles
```bash
sudo apt install stow
```
Install `picom` for compositing
```bash
sudo apt install picom
```
# VSCode configuration
### Extensions

### Settings (JSON)
```json
{
	"workbench.startupEditor": "none",
	"terminal.integrated.fontFamily": "'JetBrainsMono NFM', monospace",
	"terminal.integrated.tabs.enabled": false,
	"editor.fontFamily": "JetBrains Mono Nerd Font",
	"editor.cursorStyle": "block",
	"editor.cursorBlinking": "blink",
	"editor.fontLigatures": true,
	"diffEditor.hideUnchangedRegions.enabled": true,
	"editor.minimap.enabled": false,
	"editor.bracketPairColorization.enabled": false,
	"workbench.colorTheme": "Dark Pine",
	"workbench.editor.showTabs": "none",

	"editor.lineNumbers": "relative",
	"editor.formatOnSave": true,
	"editor.formatOnPaste": true,
	"prettier.endOfLine": "auto",
	"prettier.singleQuote": false,
	"prettier.useTabs": true,
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"editor.wordWrap": "wordWrapColumn",
	"editor.fontSize": 15,
	"explorer.confirmDragAndDrop": false,
	"editor.tabSize": 4,
	"editor.linkedEditing": false,

	"javascript.updateImportsOnFileMove.enabled": "always",
	"javascript.suggest.autoImports": true,
	"editor.codeActionsOnSave": {
		"source.fixAll.eslint": "always",
		"source.sortImports": "always"
	},
	"[css]": {
		"editor.suggest.insertMode": "replace"
	},
	"settingsSync.ignoredSettings": [],

	"files.trimTrailingWhitespace": true,
	"files.trimFinalNewlines": true
}
```
