import $ from 'jquery';

const initProfil = () => {
  (function($) {
    console.log($("#profil"))
    $(window).scroll(function() {

      $(window).scroll(function() {
        space = $(window).innerHeight() - $('.fab').offsetTop + $('.fab').offsetHeight;
        if(space < 200){
          $('.fab').css('margin-bottom', '150px');
        }
      })

    });

  })(jQuery);
};

export { initProfil };
