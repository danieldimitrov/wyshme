App.controller 'ListsCtrl', ['$scope', 'List', ($scope, List) ->
  $scope.items = [
      image_url: "/assets/demo/Nextime-Old-fashioned-Turntable-Clock.jpg"
      name: "Nextime Old-fashioned Turntable Clock"
      description: "Danish designer clock with high quality high torque movements."
      price: 88.99
      wyshes: 115
      likes: 25
    ,
      image_url: "/assets/demo/05cea7c294cdda1708708c8ea87e2dac.jpg"
      name: "Cute Dog"
      description: "Just a dog and his monkey :))"
      price: 88.99
      wyshes: 115
      likes: 25
    ,
      image_url: "/assets/demo/633e34425381befd25deced140d9f628.jpg"
      name: "Adapter"
      description: "USB to Apple jack"
      price: 88.99
      wyshes: 1153
      likes: 25
    ,
      image_url: "/assets/demo/238118e9dfa790712af9749c56c8ea16.jpg"
      name: "As Tune As Possible Bag"
      description: "Whether you listen to music all day long or broadcast your own..."
      price: 56.99
      wyshes: 15
      likes: 5
    ,
      image_url: "/assets/demo/105174_l_85.jpg"
      name: "Nikon 2195 - 85mm - Nikon Lenses - F/1.4g Classic Portrait Nikkor Lens"
      description: "Oh my gosh!"
      price: 1499.99
      wyshes: 1315
      likes: 2571
    ,
      image_url: "/assets/demo/26490938_018_b.jpg"
      name: "Assembly Home Crewel Squiggle Pillow"
      description: "Overview:\n
* Reversible overstuffed pillow from Assembly Home\n
* Topped with a two-tone squiggle design in wool\n
* Solid cotton back in a fun contrast shade\n
* UO Exclusive"
      price: 44.99
      wyshes: 315
      likes: 525
  ]

  # TODO: uncomment line below to start work through API
  #$scope.items = List.query()
]
