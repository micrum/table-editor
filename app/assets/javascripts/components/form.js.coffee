@Form = React.createClass

  getInitialState: ->
    datatype: null
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
      React.DOM.div null,
        React.DOM.input
          type: 'text'
          placeholder: 'Type'
          name: 'datatype'
          value: @state.datatype
          onChange: @changeHandler
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

  changeHandler: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    # checks if data present
    @state.datatype && @state.value