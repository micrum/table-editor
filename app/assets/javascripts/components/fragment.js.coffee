@Fragment = React.createClass

  getInitialState: ->
    editable: false
    datatype: @props.fragment.datatype
    value: @props.fragment.value

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
        React.DOM.button
          onClick: @deleteHandler
          'Delete'

  editableFragment: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.select
          ref: 'datatype'
          name: 'datatype'
          defaultValue: @props.fragment.datatype
          onChange: @changeHandler
          React.DOM.option
            value: 'string'
            'String'
          React.DOM.option
            value: 'number'
            'Number'
      React.DOM.td null,
        React.DOM.input
          type: 'text'
          defaultValue: @props.fragment.value
          ref: 'value'
          name: 'value'
          onChange: @changeHandler
      React.DOM.td null,
        React.DOM.button
          disabled: !@valid()
          onClick: @editHandler
          'Update'
        React.DOM.button
          onClick: @toggleForm
          'Cancel'

  render: ->
    # conditionally render form or table-row
    if @state.editable
      @editableFragment()
    else
      @readOnlyFragment()

  valid: ->
    # checks if value present and validates a value
    if @state.value
      if @state.datatype == 'number'
        !isNaN(parseFloat(@state.value)) && isFinite(@state.value)
      else
        typeof @state.value == 'string' || @state.value instanceof String

  changeHandler: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value