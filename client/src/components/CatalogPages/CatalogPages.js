import PageNumber from "./PageNumber.vue"
export default {
    components: {
        PageNumber
    },
    methods: {
        selectPage(page) {
            if (page < 1 || page > Math.ceil(this.$store.getters.getProductCount.count / 18)) return 0
            this.$store.commit('setPage', Number(page))
                window.scroll(0, 0)
                this.$store.commit('loadPage')
        },
        getMaxPage(cnt) {
            var maxPage = []
            for (var i = 1; i < Math.ceil(cnt / 18) + 1; i++) {
                maxPage[i] = i
            }
            maxPage.shift();
            return maxPage
        }
    },
}
