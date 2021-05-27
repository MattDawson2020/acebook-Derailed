// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
document.addEventListener('DOMContentLoaded', ()=>{
  let darkMode = localStorage.getItem("darkMode")
  const checkbox  = document.getElementById('checkbox');
  
  let darkEnabled = () => {
      document.body.classList.toggle("dark");
      localStorage.setItem("darkMode", "on");
      checkbox.checked = true;
  }
  
  let darkDisabled = () => {
      document.body.classList.toggle("dark");
      localStorage.setItem("darkMode", "null");
      checkbox.checked = false;
  }
  
  if (darkMode === "on") {
      darkEnabled();
  }
  
  
  if (checkbox) {
  checkbox.addEventListener('change', () => {
      darkMode = localStorage.getItem("darkMode")
      if (darkMode === 'on'){
          darkDisabled()
      } else {
          darkEnabled()
      }   
  });
  }
  })