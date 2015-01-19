angular.module('tasks', [])
  .controller 'MainCtrl', [
    '$scope',
    ($scope) ->
      $scope.test = 'Hello world!'
  ]
