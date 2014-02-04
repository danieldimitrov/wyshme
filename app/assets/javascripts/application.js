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
//= require angular-cookies
//= require angular_app
//= require_tree ./angular
//= require ./plugins/picker
//= require_tree ./plugins/

//= require plugins
//= require lists
//= require account
//= require angular-deckgrid

$(document).click(function(e) {
  $('#new-wysh-modal .wysh-category').removeClass('active');
});

$(function() {
  $('#header_categories_dropdown').on('click', function () {
    //$(this).preventDefault();
    $elem = $(this);
    $elem.dropdown();
    $elem.dropdown('toggle');
  });
  $('.datepicker').pickadate();

  $('.ui.checkbox').checkbox();
  $('.tooltip').popup();
  $('.ui.dropdown').dropdown();

  /* Seems like we no need this code anymore
  $('#register-modal.modal').modal('attach events', '.register-toggler', 'show');
  $('#login-modal.modal').modal('attach events', '.login-toggler', 'show');
  $('#new-wysh-list-modal.modal').modal('attach events', '.new-wysh-list', 'show');
  $('#wysh-via-url-modal.modal').modal('attach events', '.wysh-via-url', 'show');
  $('#add-new-event-modal.modal').modal('attach events', '.add-new-event', 'show');
  $('#create-alert-modal.modal').modal('attach events', '.create-alert', 'show');
  */

  $(document).click(function() {
    $('#wysh-list-brief').hide();
  });
  $('#wysh-list-brief').on('click', function(event) {
    event.stopPropagation();
  });

  $('#account-sidebar.sidebar').sidebar({overlay: true}).sidebar('toggle');

  $('.active.item .close.button').on('click', function () {
    $('#selected-item').dimmer('hide');
    // TODO: remove this hack
    setTimeout(function() {
      $('#selected-item').css('z-index', -1);
    }, 1000);
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
  $('#home-registration.ui.form').form({
    email: {
      identifier  : 'user[email]',
      rules: [
        {
          type   : 'email',
          prompt  : 'Please add valid email'
        }
      ]
    },
    password: {
      identifier : 'user[password]',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a password'
        },
        {
          type   : 'length[8]',
          prompt : 'Your password must be at least 8 characters'
        }
      ]
    },
    passwordConfirm: {
      identifier : 'user[password_confirmation]',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a password confirmation'
        }
        // ,
        // {
        //   type   : 'match[password]',
        //   prompt : 'Confirmed password doesn\'t match'
        // }
      ]
    }
  });
  $('#register-modal .ui.form').form({
    email: {
      identifier  : 'user[email]',
      rules: [
        {
          type   : 'email',
          prompt  : 'Please add valid email'
        }
      ]
    },
    password: {
      identifier : 'user[password]',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a password'
        },
        {
          type   : 'length[8]',
          prompt : 'Your password must be at least 8 characters'
        }
      ]
    },
    passwordConfirm: {
      identifier : 'user[password_confirmation]',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a password confirmation'
        }
        // ,
        // {
        //   type   : 'match[password]',
        //   prompt : 'Confirmed password doesn\'t match'
        // }
      ]
    }
  });
  $('#login-modal .ui.form').form({
    email: {
      identifier  : 'user[email]',
      rules: [
        {
          type   : 'email',
          prompt  : 'Please add valid email'
        }
      ]
    },
    password: {
      identifier : 'user[password]',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a password'
        },
        {
          type   : 'length[8]',
          prompt : 'Your password must be at least 8 characters'
        }
      ]
    }
  });
});
