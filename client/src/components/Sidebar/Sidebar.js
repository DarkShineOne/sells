import CategoriesList from "@/components/CategoriesList/CategoriesList.vue"
import SubCatList from '@/components/SubCatList/SubCatList.vue'
export default {
  data() {
    return {
      findText: "",
      subcatAvaible: false
    }
  },
  components: {
    CategoriesList, SubCatList
  },
  methods: {
    findCategory() {
      this.$store.commit('loadCategory', this.findText)

    },
    subCatDraw() {
      if (this.$store.getters.getSubCats.length == 0)
        this.subcatAvaible = true
      else {
        this.subcatAvaible = false
      }
    },

    subCatSelect(info) {
      this.$store.commit('addSubCategory', info)
    }
  }
}