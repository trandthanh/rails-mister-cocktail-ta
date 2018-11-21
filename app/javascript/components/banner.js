import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#search-typed-text', {
    strings: ["Change your life", "Learn to code"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
