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
const checkbox  = document.getElementById('checkbox');
// const header = document.querySelector('header');
// const logoName = document.querySelector('.name');
// const footer = document.querySelector('footer');
// const footerLinks = document.querySelector('.main-footer--links');
// const nav = document.querySelector('.main-nav');
// const main = document.querySelector('.main');
console.log(checkbox);
if (checkbox) {
checkbox.addEventListener('change', () => {
    //change to mode light/dark mode
    document.body.classList.toggle("dark");
    // header.classList.toggle('dark');
    // logoName.classList.toggle('dark');
    // footer.classList.toggle('dark');
    // footerLinks.classList.toggle('dark');
    // nav.classList.toggle('dark');
    // main.classList.toggle('dark');
    
});
}
})