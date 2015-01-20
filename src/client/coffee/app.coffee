angular.module('tasks', [])
  .controller 'MainCtrl', [
    '$scope',
    ($scope) ->
      $scope.tasks = []

      $scope.addTask = ->
        if $scope.summary && $scope.summary != ''
          $scope.tasks.push
            summary: $scope.summary
            status: 'todo'
          $scope.summary = ''

      $scope.todo = (task) ->
        task.status = 'todo'

      $scope.inProgress = (task) ->
        task.status = 'in progress'

      $scope.done = (task) ->
        task.status = 'done'

  ]
