# Rust Documentation Viewer
Atom package for easy viewing of rust documents inside of the text editor

## How to Use
first, make sure you have your rust project's root folder in atom's tree view. You can add this by right-clicking and selecting `Add Project Folder`. After that you'll need to make sure your docs are built, by running `cargo doc` in your project's root dir. After this, you can open up your project with `alt-shift-D` or by pressing `ctrl-shift-p` and typing in `Rust Doc Viewer open`

Note that these will open up your own rust docs, which is useful if you are using a project framework such as amethyst, or tcod-rs. This is still in development, and feedback is appreciated.

There are still a number of problems that need to be fixed. If you encounter an issue, please let me know.

#### Credits

A big thanks to [Atom Web View](https://github.com/gabceb/atom-web-view) for a nice framework for having atom panels with iframes in them. I encourage you to check it out. 
