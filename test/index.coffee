import assert from "assert"
import {print, test, success} from "amen"

import * as _ from "@dashkite/joy"
import Events from "../src"

do ->

  print await test "DashKite Events",
    do ({events, resolve, promise} = {}) ->

      promise = new Promise (r) -> resolve = r

      [

        # for the first two tests, if nothing throws
        # we'll just assume the test is passing...

        test "create an event stream", ->
          events = Events.create()

        test "set an event handler", ->
          events.on test: resolve

        # ... because if something is weird, we should
        # find out here in any event
        test "dispatch an event", ->
          events.dispatch "test", "foobar"
          assert.equal "foobar", await promise

      ]
