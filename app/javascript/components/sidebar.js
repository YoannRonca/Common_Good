import $ from 'jquery';
import mCustomScrollbar from 'malihu-custom-scrollbar-plugin';

const initSideBar = () => {
  console.log($("#sidebar"))
  $("#sidebar").mCustomScrollbar({
      theme: "minimal"
  });

  $('#dismiss, .overlay').on('click', function () {
      // hide sidebar
      $('#sidebar').removeClass('active');
      // hide overlay
      $('.overlay').removeClass('active');
  });

  $('#sidebarCollapse').on('click', function () {
    console.log('bonjour')
      // open sidebar
      $('#sidebar').toggleClass('active');
      // fade in the overlay
      $('.overlay').toggleClass('active');
      $('.collapse.in').toggleClass('in');
      $('a[aria-expanded=true]').attr('aria-expanded', 'false');
  });
};

export { initSideBar };
