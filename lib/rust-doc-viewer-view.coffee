{CompositeDisposable} = require 'atom'
fs = require 'fs'

module.exports =
class WebEditorView
    constructor: (serializedState) ->
        console.log serializedState

        # Create root element
        @element = document.createElement 'iframe'

        # Project name
        project_path_arr = atom.project.getPaths()[0].split '/'
        @project_path_name = project_path_arr.pop()

        # Path can't be determined by this. We need to parse Cargo.toml
        # path = "file://" + atom.project.getPaths()[0] + "/target/doc/" + @project_path_name + "/index.html"

        cargo = atom.project.getPaths()[0] + "/Cargo.toml"

        # Synchronous because this is the start of the application
        try
            lines = fs.readFileSync(cargo).toString().split '\n'
            main_name = ""
            for line in lines
                if line.search /name/ != -1
                    check = line.split ' '
                    if check[0] == "name" and check[1] == "="
                        main_name = check.pop().replace /"/g, ''

            path = "file://" + atom.project.getPaths()[0] + "/target/doc/" + main_name + "/index.html"

        catch error
            atom.notifications.addError "Project is not a Rust project!"
            atom.notifications.addError error
            atom.notifications.addInfo "Make sure your Rust project root folder is in your Atom tree"
            return

        @relocate path

        # @relocate 'file:///home/gray/bin/dev/rust/geode/target/doc/geode/index.html'
        @element.setAttribute 'name', 'disable-x-frame-options'

        # It is very important to note that this is for development only...
        # Sites like google, yahoo, and tumblr do not work.
        self = this

        @element.addEventListener 'load', (event) ->
            self.title = this.contentDocument.title
            # atom.notifications.addSuccess self.title + " has loaded."

    relocate: (source) ->
        # if a document model has been established, use it
        if (@element.contentWindow)
            @element.contentWindow.location.href = source
        else # otherwise use the src attribute.
            @element.setAttribute('src', source)

    # This is the tab Title and it is required.
    getTitle: () ->
        return @title || @project_path_name + " Documentation"

    # Returns an object that can be retrieved when package is activated
    serialize: ->
        if @element.contentWindow
            return @element.contentWindow.location.href
        else
            return @element.getAttribute('src')

    # Tear down any state and detach
    destroy: ->
        @element.remove()

    # Also required. (allows pane/panel to access it)
    getElement: ->
        @element
