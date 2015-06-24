###
@todo
###

require "./style/ripple"

module.exports = React.createClass

  # -- States & Properties
  propTypes:
    origin    : React.PropTypes.object

  getInitialState: ->
    className : undefined

  # -- Lifecycle
  componentWillReceiveProps: (next_props) ->
    @setState className: "active" if next_props.origin?

  componentDidMount: ->
    el = @getDOMNode()
    for key in ["animationend", "webkitAnimationEnd", "oAnimationEnd", "MSAnimationEnd"]
      el.addEventListener key, (=> @setState className: undefined), false

  # -- Render
  render: ->
    <div  data-component-ripple
          className={@state.className}
          style={left: @props.origin?.left, top: @props.origin?.top} />