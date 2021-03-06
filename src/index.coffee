import EventTarget from "@ungap/event-target"
globalThis.CustomEvent ?= do ->
  class CustomEvent extends Event
    constructor: (name, {@detail} = {}) -> super name

# TODO where does this belong?
class Events

  @create: -> new Events

  constructor: -> @target = new EventTarget

  dispatch: (name, value) ->
    @target
    .dispatchEvent new CustomEvent name,
      detail: value

  on: (description) ->
    for name, handler of description
      do (name, handler) =>
        @target
        .addEventListener name, (event) ->
          handler event.detail
    @

export default Events
