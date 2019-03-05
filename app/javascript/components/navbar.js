
const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-cg');
  const navbarHeight = document.querySelector('.navbar-cg').scrollHeight;
  const banner = document.querySelector(".calc-height")
  if (banner) {
    const heightToScroll = banner.scrollHeight;
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= (heightToScroll - navbarHeight)) {
          navbar.classList.add('navbar-cg-white');
        } else {
          navbar.classList.remove('navbar-cg-white');
        }
      });
    }
  }
};

export { initUpdateNavbarOnScroll };
