import BiletObj from "@/components/BiletObj/BiletObj.vue"
import CatalogPages from "@/components/CatalogPages/CatalogPages.vue"

export default {
  components: {
    BiletObj, CatalogPages
  },

  data() {
    return {
      hideSort: true,
      selectedSort: 0,
      selectedName: ["Без сортировки", "Сначала дорогие", "Сначала недорогие", "Сначала популярные", "По скидке(%)"],
    }
  },

  methods: {
    loadPageWithSort() {
      this.$store.commit('setSort', this.selectedSort)
      this.$store.commit('setPage', 1)
      this.$store.commit('loadPage')
      this.showSort_label()
    },
    showSort_label() {
      this.hideSort = !this.hideSort
    }
  }
}