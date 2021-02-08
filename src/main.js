import Vue from 'vue';
import VueLazyload from 'vue-lazyload';
import infiniteScroll from 'vue-infinite-scroll';
import App from './App.vue';
import store from './store';
import router from './router';

Vue.config.productionTip = false;
Vue.use(VueLazyload);
Vue.use(infiniteScroll);

new Vue({
  store,
  router,
  render: (h) => h(App),
}).$mount('#app');
