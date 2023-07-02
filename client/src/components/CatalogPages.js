export default {
    methods: {
        pageUp() {
            this.$store.commit('setPage', this.$store.getters.getPage + 1)
            window.scroll(0, 0)
            this.$store.commit('loadPage')
        },
        pageDown() {
            this.$store.commit('setPage', this.$store.getters.getPage - 1)
            window.scroll(0, 0)
            this.$store.commit('loadPage')
        },
        selectPage(page) {
            this.$store.commit('setPage', page)
            window.scroll(0, 0)
            this.$store.commit('loadPage')
        },
        getMaxPage() {
            return Math.ceil(this.$store.getters.getProductCount.count / 18)
        }
    }
}
