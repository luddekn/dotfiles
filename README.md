# i3 Configuration
Check the [new_computer_setup.sh](https://github.com/luddekn/dotfiles/blob/main/new_computer_setup.sh) script, the packages that need to be installed are on the top!
After installing the needed packages, run the [install]() script to link all dotfiles to their intended places using stow.

# VSCode configuration
### Extensions
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [HTMLHint](https://marketplace.visualstudio.com/items?itemName=HTMLHint.vscode-htmlhint)
- [JavaScipt Code Snippets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets)
- [Liveserver](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Dark Pine Theme](https://marketplace.visualstudio.com/items?itemName=LudvikKristoffersen.dark-pine-theme)
- [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
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
