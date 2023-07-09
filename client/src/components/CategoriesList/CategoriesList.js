export default {
    data() {
      return {
        curCat: [],
        collapsed: true,
      }
    },
    props: {
    },
    methods: {
      selectCategory(id) {
        this.curCat = this.$store.getters.getCurCategories
        this.$store.commit('remSubCategory')
        this.$store.commit('setPage', 1)
        this.$store.commit('addCategory', id)
        if (this.curCat.length == 1) {
          this.$store.commit('loadSubCat', this.curCat[0])
        }
        else {
          this.$store.commit('loadSubCat', 0)
        }
      },
      categoryActive(id) {
        return this.curCat.includes(id)
      }
    }
  }