import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 安装element
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(Element)
// 安装axios
import axios from 'axios'
Vue.prototype.$axios = axios
import "./axios"
import "./pre"
// 安装markdown
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'


Vue.use(mavonEditor);

// --------------------------------------------------
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
