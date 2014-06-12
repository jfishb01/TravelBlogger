CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = '725'
  config.height = '600'
  config.toolbar_Basic = [
   ['Format'], ['Bold','Italic','Underline','-','Indent','Outdent'],['Undo','Redo','-','Find','Replace'],['Table','Link','Smiley']
  ]
  config.toolbar = 'Basic'
  config.enterMode = CKEDITOR.ENTER_BR
  config.removePlugins = 'elementspath'
  config.resize_enabled = false
  true