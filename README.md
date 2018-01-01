nix-syntax-for-mcedit
=====================
This repository contains a configuration file that can be used to syntax
highlight [Nix expressions](http://nixos.org/nix) in `mcedit`, the editor that
comes with [Midnight Commander](https://midnight-commander.org).

Features supported:

* Keywords
* Single and multi-line comments
* Strings, indented strings
* Integer, float, null and boolean literals
* Separators
* Nix builtins
* Limited URL and path support
* Limited anti-quotation support

Installation
============
There are two ways to use the syntax configuration file.

Manual installation
-------------------
Manual installation can be done by copying the `nix.syntax` file to the 
corresponding user's configuration folder:

```bash
$ mkdir -p ~/.config/mc/mcedit
$ cp nix.syntax ~/.config/mc/mcedit
```

Then we must create our own personalized version of the syntax configuration
file. We can save a copy of the syntax file as follows:

* Open `mcedit`
* Unfold the 'Options' menu (F9 -> 'Options')
* Pick the option 'Syntax file`
* Press 'F2 (save)` to save.

It may happen that you see an error message about write permissions. Restore
write permissions as follows:

```bash
$ chmod 644 ~/.config/mc/mcedit/Syntax
```

Finally, add the following lines to the configuration file above the unknown
entry:

```
file ..\*\\.nix$ Nix\sExpression
include /home/sander/.config/mc/mcedit/nix.syntax
```

Now the syntax highlighting should work.

Deploying a modified Midnight Commander with the Nix package manager
--------------------------------------------------------------------
Alternatively, we can use a Nix expression that patches the Midnight Commander
in the Nixpkgs repository to include the Nix expression syntax as part of the
default installation.

A Nix-enabled `mc` distribution can be installed into the user profile as
follows:

```bash
$ nix-env -f default.nix -i mc
```

License
=======
The contents of this package uses the same license as Midnight Commander, the
[GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html) or higher.
