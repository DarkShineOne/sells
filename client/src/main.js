import { createSSRApp } from 'vue'
import { createStore } from 'vuex'
import App from './App.vue'
import PostService from "@/PostService"
const store = createStore({
    state () {
      return {
        count: 0,
        products:[],
        page:1,
        sort:0,
        category:0
      }
    },
    mutations: {
      incrementPage (state) {
        state.page++
      },

      decrimentPage (state) {
        state.page--
      },

      resetPage (state){
        state.page = 1
      },

      setSort (state,srt){
        state.sort = srt
      },

      setCategory (state,cat){
        state.category = cat
      },

      async loadPage(state){
        try{
          var loadStr = ""
          if (this.state.sort) loadStr+="&sort="+this.state.sort;
          if (this.state.category) loadStr+="&category="+this.state.category;
          state.products = await Promise.resolve(PostService.getPost('?page='+this.state.page+loadStr))
        } catch(err){
          console.log("error")
        }
      },

    }
  })



createSSRApp(App).use(store).mount('#app')