import { createApp } from 'vue'
import App from './App.vue'
import router from './router/index.js';
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css'; 
// import { WechatOutlined } from '@ant-design/icons';

// Vue.prototype.$axios = axios

createApp(App)
.use(Antd)
.use(router)
.mount('#app')

