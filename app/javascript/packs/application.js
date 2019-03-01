import "bootstrap";

import { initSideBar } from '../components/sidebar';
initSideBar();

import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  text: "Your application has been sent!",
  icon: "success"
});
