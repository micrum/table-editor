@Fragments = React.createClass

  getInitialState: ->
    fragments: @props.data

  getDefaultProps: ->
    fragments: []

  createFragment: (fragment) ->
    fragments = @state.fragments.slice()
    fragments.push fragment
    @setState fragments: fragments

  deleteFragment: (fragment) ->
    fragments = @state.fragments.slice()
    index = fragments.indexOf fragment
    fragments.splice index, 1
    @replaceState fragments: fragments

  updateFragment: (fragment, data) ->
    fragments = @state.fragments.slice()
    index = @state.fragments.indexOf fragment
    fragments.splice index, 1, data
    @replaceState fragments: fragments

  render: ->
    React.DOM.div null,
      React.DOM.table null,
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Type'
            React.DOM.th null, 'Value'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for fragment in @state.fragments
            React.createElement Fragment,
              key: fragment.id,
              fragment: fragment,
              handleDeleteFragment: @deleteFragment,
              handleEditFragment: @updateFragment
      React.createElement Form, newFragment: @createFragment