import { createSSRApp } from 'vue'
import App from './App.vue'
import store from "@/store"

createSSRApp(App).use(store).mount('#app')