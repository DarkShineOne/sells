import { createSSRApp } from 'vue'
import { createStore } from 'vuex'
import App from './App.vue'
import PostService from "@/PostService"
const store = createStore({
    state () {
      return {
        count: 0,
        products:[],
        categories:[],
        page:1,
        sort:0,
        priceMin:0,
        priceMax:0,
        category:[]
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

      addCategory (state,cat){
        if (state.category.indexOf(cat) > -1) {
          state.category.splice(state.category.indexOf(cat),1)
        } else{
          state.category.push(cat)}
      },

      remCategory (state,cat){
        if (state.category.indexOf(cat) > -1) {
          state.category.slice(state.category.indexOf(cat),1)
        }
      },

      setPrice (state,min,max){
        state.priceMin = min
        state.priceMin = max
      },

      async loadPage(state){
        try{
          var loadStr = ""
          if (this.state.sort) loadStr+="&sort="+this.state.sort;
          if (this.state.category.length) loadStr+="&category="+this.state.category;
          console.log(loadStr)
          state.products = await Promise.resolve(PostService.getPost('?page='+this.state.page+loadStr))
        } catch(err){
          console.log("error pages")
        }
      },

      async loadCategory(state){
        try{
          state.categories = await Promise.resolve(PostService.getCategory())
        } catch(err){
          console.log("error categories")
        }
      },

    }
  })



createSSRApp(App).use(store).mount('#app')