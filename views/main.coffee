Task = Backbone.Model.extend(
  defaults:
    title: 'do something'
    completed: false
);
Tasks = Backbone.Collection.extend({ model: Task });

TaskView = Backbone.View.extend(
  tagName: 'li'
  initialize: ->
    @model.on('destroy', @remove, @)
  events: 'click .delete': 'destroy'
  destroy: ->
    if confirm('are you sure?')
      @model.destroy()
  remove: ->
    @$el.remove()
  template: `_.template($('#task-template').html())`
  render: ->
    template = @template(@model.toJSON())
    @$el.html(template)
    @
);
TasksView = Backbone.View.extend(
  tagName: 'ul'
  render: ->
    @collection.each( (task) ->
      taskView = new TaskView( model: task )
      @$el.append taskView.render().el
    , @)
    @
);

tasks = new Tasks([
  title: 'task1'
  completed: true
,
  title: 'task2'
,
  title: 'task3'
]);

tasksView = new TasksView(collection: tasks)
$('#tasks').html(tasksView.render().el)