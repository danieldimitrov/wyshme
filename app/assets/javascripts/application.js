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

$(function() {
  $('.ui.dropdown').dropdown();
  $('.ui.checkbox').checkbox();

  $('#register-modal.modal').modal('attach events', '.register-toggler', 'show');
  $('#login-modal.modal').modal('attach events', '.login-toggler', 'show');
  $('#new-list-modal.modal').modal('attach events', '.new-wysh-list', 'show');
  $('.tooltip').popup();
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
  $('#wysh-list .item').on('click', function(event) {
    event.preventDefault();
    $('#wysh-list .item').removeClass('active');
    $(this).addClass('active');
    $(this).scrollintoview();
  });
  $('#wysh-list .item .ui.buttons.actions .close').on('click', function(event) {
    event.preventDefault();
    $('#wysh-list .item').removeClass('active');
    $(this).closest('.item').scrollintoview();
  });
  // $('.ui.popup').popup();

  $('#account-sidebar.sidebar').sidebar({overlay: true}).sidebar('toggle');

  $('#selected-item').dimmer('show');
});
