###

  This object is a dum object used to trigger events.
  This is created as a global app object so we
  can use it to track state change.

  Example:

    This is what we're trying to solve, this example
    is bad because we're creating events for each item,
    thus we are creating "n" events for "n" views.

    class Spark.Views.AllListItems

      addOne: ->
        view = Spark.Views.OneListItem()
        view.on('listItemClicked', @someFunction) <- This is the problem

    class Spark.Views.OneListItem

      events:
        'click' : 'onListItemClick'

      onListItemClick: ->
        @.trigger('listItemClicked')

    --------------- VS ----------------

    class Spark.Views.AllListItems

      addOne: ->
        view = Spark.Views.OneListItem()

    class Spark.Views.OneListItem

      events:
        'click' : 'onListItemClick'

      onListItemClick: ->
        eventTrackerInstance.triggerListItemClicked() <- MONEY!

###
class App.Models.EventTracker extends Backbone.Model

  triggerModelClicked: (opts) ->
    @.trigger('modelClicked', opts)