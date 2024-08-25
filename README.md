SAT+QBF support in Vim
==========================================================================================

This plugin is a combination of previously split plugins. These include 'Vim-DIMACS',
'Vim-QCIR', and 'Vim-Limboole'. Now, the plugin is a repository for many types of
SAT/QBF-related files, including syntax highlighting, file type plugins, file type
detection, etc.

This plugin supports syntax highlighting and some basic file type settings for the SAT
problem specification file format of the solver [Limboole](https://fmv.jku.at/limboole/).
It was developed for students at the institute for formal models and verification at JKU
Linz.

Supported File Types
------------------------------------------------------------------------------------------

SAT/QBF encoding related:
- `[Q]DIMACS`
    - Extensions: `.dimacs`, `.qdimacs`, `.cnf`, `.nnf`, `.dnf`, `.in`.
    - Header: Problem specifier of form `p cnf|dnf|nnf <nVars> <nCls>` in the first 12
        lines of the file.
- `QCIR`
    - Extensions: `.qcir`
    - Header: Version ID of form `#QCIR[-[G]<idNum>]` in the first 12 lines of the
        file.
- `Limboole`
    - Extensions: `.limboole`
    - Header: N/A

SAT/QBF proof related:
- `[D]RUP` and `[D|L|F]RAT`
    - Extensions: `.rat`, `.drat`, `.rup`, `.drup`, `.lrat`, `.frat`,
        `.proof`, `.trace`, `.out`
    - Header: N/A

News
------------------------------------------------------------------------------------------

- `v.2.0`, Added syntax support for LRAT
- `v.1.0`, Initial release

### Old News

Vim-DIMACS:
- `v0.4.1`, Expand file type detection.
- `v0.4.0`, Added support for deletions, such as those found in DRUP and DRAT traces.
- `v0.3.0`, Added support for traces.
- `v0.2.0`, Added support for QDIMACS.

Vim-QCIR:
- `v0.1.1`, Fix bug in file type detection

Vim-Limboole:
- `v0.1.0`, Initial release

How to Install
------------------------------------------------------------------------------------------

Using a plugin manager similar to [vim-plug](https://github.com/junegunn/vim-plug):

```vimscript
Plug 'MarcelSimader/Vim-SAT+QBF'
```

License
------------------------------------------------------------------------------------------

Creative Commons Attribution-ShareAlike (CC BY-SA 4.0)

