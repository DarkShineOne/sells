import Sidebar from '@/components/Sidebar.vue'
import Body_catalog from '@/components/Body_catalog.vue'

export default {
    components: {
        Sidebar, Body_catalog
    },

    created() {
        this.$store.commit('loadPage')
        this.$store.commit('loadCategory')
    },
}