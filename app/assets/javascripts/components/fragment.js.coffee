@Fragment = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.fragment.datatype
      React.DOM.td null, @props.fragment.value