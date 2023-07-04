import CategoriesList from "@/components/CategoriesList"
import SubCatList from '@/components/SubCatList.vue'
export default {
  data() {
    return {
      findText: "",
      subcatAvaible: false
    }
  },
  components: {
    CategoriesList,SubCatList
  },
  methods: {
    findCategory() {
      this.$store.commit('loadCategory', this.findText)

    },
    subCatDraw() {
      if (this.$store.getters.getSubCats.length == 0)
        this.subcatAvaible = true
      else this.subcatAvaible = false
    }
  }
}