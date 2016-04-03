@Fragment = React.createClass

  getInitialState: ->
    editable: false

  toggleForm: (e) ->
    e.preventDefault()
    @setState editable: !@state.editable

  editHandler: (e) ->
    e.preventDefault()
    data =
      datatype: ReactDOM.findDOMNode(@refs.datatype).value
      value: ReactDOM.findDOMNode(@refs.value).value
    $.ajax
      method: 'PUT'
      url: "/fragments/#{ @props.fragment.id }"
      dataType: 'JSON'
      data:
        fragment: data
      success: (data) =>
        @setState editable: false
        @props.handleEditFragment @props.fragment, data

  deleteHandler: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/fragments/#{ @props.fragment.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteFragment @props.fragment

  readOnlyFragment: ->
    React.DOM.tr null,
      React.DOM.td
        onClick: @toggleForm
        @props.fragment.datatype
      React.DOM.td
        onClick: @toggleForm
        @props.fragment.value
      React.DOM.td null,
        React.DOM.a
          onClick: @deleteHandler
          'Delete'

  editableFragment: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          type: 'text'
          defaultValue: @props.fragment.datatype
          ref: 'datatype'
      React.DOM.td null,
        React.DOM.input
          type: 'text'
          defaultValue: @props.fragment.value
          ref: 'value'
      React.DOM.td null,
        React.DOM.a
          onClick: @editHandler
          'Update'
        React.DOM.a
          onClick: @toggleForm
          'Cancel'

  render: ->
    # conditionally render form or table-row
    if @state.editable
      @editableFragment()
    else
      @readOnlyFragment()