# Rust Documentation Viewer

No longer actively maintained.

View your Rust project docs right inside of Atom.

[![apm](https://raw.githubusercontent.com/surrsurus/atom-rust-doc-viewer/master/media/screenshot.png)](https://atom.io/packages/rust-doc-viewer)

An Atom package to make viewing your project's Rust documentation much easier. This plugin will open up your current Rust project's documentation in a seperate pane so you don't have to have a web browser open at the same time as atom.

## How to Use
first, make sure you have your rust project's root folder in atom's tree view. You can add this by right-clicking and selecting `Add Project Folder`. After that you'll need to make sure your docs are built, by running `cargo doc` in your project's root dir. After this, you can open up your project with `alt-shift-D` or by pressing `ctrl-shift-p` and typing in `Rust Doc Viewer open`

Note that these will open up your own rust docs, which is useful if you are using a project framework such as amethyst, or tcod-rs. This is still in development, and feedback is appreciated.

## Installation

You can install the package directly from your atom text editor by searching for `rust-doc-viewer` in packages. You can also install it from the commandline using `apm install rust-doc-viewer`.

## Acknowledgements

A big thanks to [Atom Web View](https://github.com/gabceb/atom-web-view) for a nice framework for having atom panels with iframes in them. I encourage you to check it out.
