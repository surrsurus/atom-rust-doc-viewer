# atom clean up work
{CompositeDisposable} = require 'atom'

# included modules
WebEditorView = require './rust-doc-viewer-view'

# universal resource link (parser)
url = require 'url'

module.exports =
    activate: (state) ->
        @disposable =
            new CompositeDisposable()

        # for the iframe..
        pane = atom.workspace.getActivePane()
        paneElement = atom.views.getView(pane)

        # for the address bar...
        # textEditor = atom.workspace.getActiveTextEditor()
        # textEditorElement = atom.views.getView(textEditor)

        subscription =
            atom.commands.add 'atom-workspace',
            'rust-doc-viewer:open': => @open()
            'rust-doc-viewer:reload': => @reload()

        @disposable.add atom.workspace.addOpener (uri) ->
            return new WebEditorView() if uri is "view://web"

        @disposable.add atom.views.addViewProvider WebEditorView, paneElement

        @editor = editor = atom.workspace.buildTextEditor()

        element = atom.views.getView(editor)
        element.setAttribute('mini', '')
        self = @

        element.addEventListener 'keydown', (e) ->
            if(e.keyCode == 13) # Enter
                atom.commands.dispatch(editor, 'core:confirm')
                self.hide()
            if(e.keyCode == 27) # Escape
                atom.commands.dispatch(editor, 'core:cancel')
                self.hide()

        @disposable.add atom.commands.add editor,
            'core:confirm': @confirm
            'core:cancel': @cancel

        @panel = atom.workspace.addModalPanel(item: editor, visible: false)

        @disposable.add subscription

    deactivate: ->
        @disposable.dispose()
        @panel.destroy()
        @element.destroy()

    confirm: (event) ->
        pane = atom.workspace.getActivePane()
        """
        text = this.getText()

        if pane.activeItem instanceof WebEditorView
            pane.activeItem.relocate text
        else
            atom.notifications.addError "Web View must be the active item."
        """

    reload: (event) ->
        pane = atom.workspace.getActivePane()

        if pane.activeItem instanceof WebEditorView
            pane.activeItem.element.contentWindow.location.reload()

    cancel: (event) ->
        atom.workspace.panelForItem(this).hide()

    show: ->
        atom.workspace.open("view://web", split: 'right', searchAllPanes: true)

        # @panel.show()
        # atom.views.getView(@editor).focus()

    hide: ->
        @panel.hide()

    open: ->
        if @panel.isVisible()
             @hide()
        else
            @show()
