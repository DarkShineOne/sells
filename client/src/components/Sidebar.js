import CategoriesList from "@/components/CategoriesList"
export default {
  data() {
    return {
      findText: ""
    }
  },
  components: {
    CategoriesList
  },
  methods: {
    selectCategory(id) {
      this.$store.commit('setPage', 1)
      this.$store.commit('addCategory', id)
    },
    findCategory() {
      this.$store.commit('loadCategory', this.findText)
    }
  }
}