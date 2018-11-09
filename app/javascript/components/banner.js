import Typed from 'typed.js';
function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "All the Cocktails here"],
    typeSpeed: 50,
    loop: true
}); }
export { loadDynamicBannerText };
