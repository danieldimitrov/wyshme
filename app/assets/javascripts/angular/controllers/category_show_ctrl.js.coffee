App.controller 'CategoryShowCtrl', ['$scope', 'Category', ($scope, Category) ->
# TODO: change to generic ID
  $scope.category = Category.get(id: 1)
  $scope.items = Category.items(id: 1)

  $scope.order = [
    {label: "Price",value: "price"},
    {label: "Price DESC",value: "-price"},
    {label: "Date",value: "updated_at"},
    {label: "Date DESC",value: "-updated_at"},
    {label: "Likes",value: "likes"},
    {label: "Likes DESC",value: "-likes"},
    {label: "Wyshes",value: "wyshes"},
    {label: "Wyshes DESC",value: "-wyshes"}
  ]

  $scope.priceRanges = [
    {start : 0, end : 100},
    {start : 100, end : 300},
    {start : 300, end : 1000},
    {start : 1000, end : Infinity}
  ]

]
