@Fragments = React.createClass
  getInitialState: ->
    fragments: @props.data
  getDefaultProps: ->
    fragments: []
  render: ->
      React.DOM.div null,
        React.DOM.h2 null, 'All Fragments'
        React.DOM.table null,
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Type'
              React.DOM.th null, 'Value'
          React.DOM.tbody null,
            for fragment in @state.fragments
              React.createElement Fragment, key: fragment.id, fragment: fragment