import { createSSRApp } from 'vue'
import { createStore } from 'vuex'
import App from './App.vue'
import PostService from "@/PostService"
const store = createStore({
    state () {
      return {
        count: 0,
        products:[],
        page:1
      }
    },
    mutations: {
      incrementPage (state) {
        state.page++
      },

      decrimentPage (state) {
        state.page--
      },

      async loadPage(state,d){
        try{
          state.products = await Promise.resolve(PostService.getPost(d))
        } catch(err){
          console.log("error")
        }
      },

    }
  })



createSSRApp(App).use(store).mount('#app')