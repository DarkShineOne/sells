import PostService from "@/PostService"
import { createStore } from 'vuex'
const store = createStore({
    state() {
        return {
            count: 0,
            products: [],
            product_count: 0,
            cat_list: [],
            cur_page: 1,
            cur_sort: 0,
            cur_price: [],
            cur_category: []
        }
    },
    getters: {
        getCategories: (state, getters) => {
            return state.categories;
        },
        getPage: (state, getters) => {
            return state.cur_page;
        },
        getProductCount: (state, getters) => {
            return state.product_count;
        }
    },
    mutations: {
        setPage(state, pg) {
            state.cur_page = pg
        },

        setSort(state, srt) {
            state.cur_sort = srt
        },

        addCategory(state, cat) {
            if (state.cur_category.indexOf(cat) > -1) {
                state.cur_category.splice(state.cur_category.indexOf(cat), 1)
            } else {
                state.cur_category.push(cat)
            }
            store.commit("loadPage")
        },

        remCategory(state, cat) {
            if (state.cur_category.indexOf(cat) > -1) {
                state.cur_category.slice(state.cur_category.indexOf(cat), 1)
            }
            store.commit("loadPage")
        },

        setPrice(state, min, max) {
            state.cur_price[0] = min
            state.cur_price[1] = max
        },

        async loadPage(state) {
            try {
                var loadStr = ""
                if (this.state.cur_sort) loadStr += "&sort=" + this.state.cur_sort;
                if (this.state.cur_category.length) loadStr += "&category=" + this.state.cur_category;
                state.products = await Promise.resolve(PostService.getPost('?page=' + this.state.cur_page + loadStr))
                state.product_count = state.products.shift()
                console.log('?page=' + this.state.cur_page + loadStr)
            } catch (err) {
                console.log("error pages")
            }
        },

        async loadCategory(state, find) {
            try {
                var loadStr = ""
                if (find) loadStr = "?find=" + find;
                console.log(loadStr)
                state.categories = await Promise.resolve(PostService.getCategory(loadStr))
            } catch (err) {
                console.log("error categories")
            }
        },
    }
})

export default store