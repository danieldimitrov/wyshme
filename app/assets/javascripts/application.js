// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require jquery_ujs

//= require modernizr
//= require semantic-ui

//= require angular
//= require angular-resource
//= require angular_app
//= require_tree ./angular

//= require plugins
//= require boards
//= require account

$(document).click(function(e) {
  $('#new-wysh-modal .wysh-category').removeClass('active');
});

$(function() {
  $('.ui.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
  $('.tooltip').popup();

  $('#register-modal.modal').modal('attach events', '.register-toggler', 'show');
  $('#login-modal.modal').modal('attach events', '.login-toggler', 'show');
  $('#new-wysh-modal.modal').modal('attach events', '.new-wysh-list', 'show');

  $('#new-wysh-modal .wysh-category .multinput input').on('input', function () {
    // check is category already created
    var val = $(this).val().toLowerCase();
    var alreadyCreated = false;
    $('#new-wysh-modal .wysh-category .cat-list .item:not(.new-cat) span').each(function(){
      if(val==$(this).html().toLowerCase()){
        alreadyCreated = true;
        return false;
      }
    });
    if($(this).val()=='' || alreadyCreated){
      $(this).closest('.wysh-category').find('.cat-list .item.new-cat').addClass('disabled');
    } else {
      $(this).closest('.wysh-category').find('.cat-list .item.new-cat').removeClass('disabled');
    }
  });
  $('#new-wysh-modal .wysh-category .multinput').on('click', function (e) {
    e.stopPropagation();
    $(this).closest('.wysh-category').addClass('active');
    var input = $(this).find('input');
    input.focus();
  });
  $('#new-wysh-modal .wysh-category .multinput .labels').on('click', function (e) {
    e.stopPropagation();
  });
  $('#new-wysh-modal .cat-list .item').on('click', function (e) {
    e.stopPropagation();
    if($(this).hasClass('disabled')){
      return false;
    }
    if($(this).hasClass('new-cat')){
      var input = $(this).closest('.wysh-category').find('input');
      var val = input.val();
      input.val('');
      $(this).addClass('disabled');
    }
    else {
      var val = $(this).html();
    }
    var label = $('<a class="ui label">'+val+' </a>');
    $('<i class="icon close"></i>')
      .on('click', function () {
        $(this).parent('.label').remove();
        return false;
      })
      .appendTo(label);
    $(this).closest('.input').find('.multinput .labels').append(label);
  });


  $('#wysh-list-toggler').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    $('#wish-list-brief').toggle();
  });
  $(document).click(function() {
    $('#wish-list-brief').hide();
  });
  $('#wish-list-brief').on('click', function(event) {
    event.stopPropagation();
  });

  $('#account-sidebar.sidebar').sidebar({overlay: true}).sidebar('toggle');

  $('#wysh-list .item:not(.active) .image, #wysh-list .item:not(.active) .name').on('click', function(event) {
    event.preventDefault();
    $('#selected-item').show();
    $('#selected-item').dimmer('show');
  });

  $('.active.item .close.button').on('click', function () {
    $('#selected-item').dimmer('hide');
    $('#selected-item').hide();
  });
});
