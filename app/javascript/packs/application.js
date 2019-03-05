import "bootstrap";

import { initSideBar } from '../components/sidebar';
initSideBar();

import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  text: "Your application has been sent!",
  icon: "success"
});


import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { toggleFilterButtons } from '../components/filter_btn';
toggleFilterButtons();
