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
  $('#new-wysh-list-modal.modal').modal('attach events', '.new-wysh-list', 'show');
  $('#wysh-via-url-modal.modal').modal('attach events', '.wysh-via-url', 'show');

  $('#wysh-list-toggler').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    $('#wysh-list-brief').toggle();
  });
  $(document).click(function() {
    $('#wysh-list-brief').hide();
  });
  $('#wysh-list-brief').on('click', function(event) {
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

  // forms
  $('#wysh-via-url-modal .ui.form').form({
    url: {
      identifier  : 'url',
      rules: [
        {
          type   : 'url',
          prompt  : 'Please add valid URL'
        }
      ]
    }
  });
  $('#new-wysh-list-modal .ui.form').form({
    name: {
      identifier  : 'name',
      rules: [
        {
          type   : 'empty',
          prompt  : 'Name can\'t be empty'
        }
      ]
    },
    date: {
      identifier  : 'date',
      rules: [
        {
          type   : 'empty',
          prompt  : 'Date can\'t be empty'
        }
      ]
    }
  });
});
