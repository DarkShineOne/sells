import PostService from "@/PostService"
import { createStore } from 'vuex'
const store = createStore({
    state() {
        return {
            count: 0,
            products: [],
            product_count: 0,
            cat_list: [],
            subcat_list: [],
            cur_page: 1,
            cur_sort: 0,
            cur_price: [],
            cur_category: [],
            cur_subcat: []
        }
    },
    getters: {
        getCategories: (state, getters) => {
            return state.cat_list;
        },
        getCurCategories: (state, getters) => {
            return state.cur_category;
        },
        getPage: (state, getters) => {
            return state.cur_page;
        },
        getProductCount: (state, getters) => {
            return state.product_count;
        },
        getSubCats: (state, getters) => {
            return state.subcat_list;
        },
        getCurSubCats: (state, getters) =>{
            return state.cur_subcat;
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

        addSubCategory(state, cat) {
            let stateParam = PostService.searchForArray(JSON.parse(JSON.stringify(state.cur_subcat)), cat)
            //console.log(stateParam)
            if (stateParam > -1) {
                state.cur_subcat.splice(stateParam, 1)
            } else {
                state.cur_subcat.push(cat)
                //console.log(JSON.parse(JSON.stringify(state.cur_subcat)))
            }
            store.commit("loadPage")
        },

        remSubCategory(state) {
            state.cur_subcat = []
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
                if (this.state.cur_subcat.length){ //loadStr += "&scat=" + JSON.stringify(state.cur_subcat)
                    for (let scat of state.cur_subcat){
                        loadStr += `&scat[${String.fromCharCode(scat[1]+97)}]=${scat[0]}`
                    }
                    loadStr.replace(/"/g, '\'').replace(/нет/g, "NULL").replace(/\\\\/g, "\\")
                }
                console.log('?page=' + this.state.cur_page + loadStr)
                state.products = await Promise.resolve(PostService.getPost('?page=' + this.state.cur_page + loadStr))
                state.product_count = state.products.shift()
            } catch (err) {
                console.log(err)
            }
        },

        async loadCategory(state, find) {
            try {
                var loadStr = ""
                if (find) loadStr = "?find=" + find;
                console.log(loadStr)
                state.cat_list = await Promise.resolve(PostService.getCategory(loadStr))
            } catch (err) {
                console.log("error categories")
            }
        },

        async loadSubCat(state, categoryId) {
            try {
                state.subcat_list = await Promise.resolve(PostService.getSubCat('?scat=' + categoryId))
                //console.log(JSON.stringify(state.subcat_list))
            } catch (err) {
                console.log("error subcategories")
            }
        },
    }
})

export default store