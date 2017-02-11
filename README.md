# Rust Documentation Viewer
An atom package to make viewing your project's Rust documentation much easier.

## How to Use
first, make sure you have your rust project's root folder in atom's tree view. You can add this by right-clicking and selecting `Add Project Folder`. After that you'll need to make sure your docs are built, by running `cargo doc` in your project's root dir. After this, you can open up your project with `alt-shift-D` or by pressing `ctrl-shift-p` and typing in `Rust Doc Viewer open`

Note that these will open up your own rust docs, which is useful if you are using a project framework such as amethyst, or tcod-rs. This is still in development, and feedback is appreciated.

There are still a number of problems that need to be fixed. If you encounter an issue, please let me know.

## Installation

You can install the package directly from your atom text editor by searching for `rust-doc-viewer` in packages. You can also install it from the commandline using `apm install rust-doc-viewer`.

### License 

<img src="https://ag01research.files.wordpress.com/2013/10/20090915152417-1.jpg" width="100">

This software is licensed under the MIT License. Read more about it [here](https://github.com/surrsurus/atom-rust-doc-viewer/blob/master/LICENSE).

### Acknowledgements

A big thanks to [Atom Web View](https://github.com/gabceb/atom-web-view) for a nice framework for having atom panels with iframes in them. I encourage you to check it out.
