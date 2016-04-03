@Form = React.createClass

  getInitialState: ->
    datatype: 'string'
    value: ''

  submitHandler: (e) ->
    e.preventDefault()
    $.post '/fragments', { fragment: @state }, (data) =>
      @props.newFragment data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      onSubmit: @submitHandler
      React.DOM.div, null
        React.DOM.select
          id: 'datatypeSelect'
          name: 'datatype'
          onChange: @changeHandler
          React.DOM.option
            value: 'string'
            'String'
          React.DOM.option
            value: 'number'
            'Number'
      React.DOM.div null,
        React.DOM.input
          type: 'text'
          placeholder: 'Value'
          name: 'value'
          value: @state.value
          onChange: @changeHandler
      React.DOM.button
        type: 'submit'
        disabled: !@valid()
        'Create fragment'
      React.DOM.span
        "enter a #{@state.datatype}" if !@valid()

  changeHandler: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    # checks if value present and validates a value
    if @state.value
      if @state.datatype == 'number'
        !isNaN(parseFloat(@state.value)) && isFinite(@state.value)
      else
        typeof @state.value == 'string' || @state.value instanceof String