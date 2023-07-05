import Sidebar from '@/components/Sidebar/Sidebar.vue'
import BodyCatalog from '@/components/BodyCatalog/BodyCatalog.vue'

export default {
    components: {
        Sidebar, BodyCatalog
    },

    created() {
        this.$store.commit('loadPage')
        this.$store.commit('loadCategory')
    },
}