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
//= require jquery_ujs
//= require bootsy
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

(function() {
  jQuery(function() {
    return $('#fileupload').fileupload({
      add: function(e, data) {
        var file, types;
        types = /(\.|\/)(gif|jpe?g|png)$/i;
        file = data.files[0];
        if (types.test(file.type) || types.test(file.name)) {
          data.context = $(tmpl("template-upload", file));
          $('#fileupload').append(data.context);
          return data.submit();
        } else {
          return alert(file.name + " is not a gif, jpeg, or png image file");
        }
      },
      progress: function(e, data) {
        var progress;
        if (data.context) {
          progress = parseInt(data.loaded / data.total * 100, 10);
          return data.context.find('.bar').css('width', progress + '%');
        }
      },
      done: function(e, data) {
        var content, domain, file, path, to;
        file = data.files[0];
        domain = $('#fileupload').attr('action');
        path = $('#fileupload input[name=key]').val().replace('${filename}', file.name);
        to = $('#fileupload').data('post');
        content = {};
        content[$('#fileupload').data('as')] = domain + path;
        $.post(to, content);
        if (data.context) {
          return data.context.remove();
        }
      },
      fail: function(e, data) {
        alert(data.files[0].name + " failed to upload.");
        console.log("Upload failed:");
        return console.log(data);
      }
    });
  });

}).call(this);