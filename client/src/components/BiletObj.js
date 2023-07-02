export default {
    props: {
        product: Object
    },
    methods: {
        goDNS(link, add) {
            if (add)
                location.href = 'https://www.dns-shop.ru' + link.replaceAll(" ", "") + add;
            else location.href = 'https://www.dns-shop.ru' + link.replaceAll(" ", "")
        },

        /*  log(){
              
              console.log(JSON.stringify(this.product))
              console.log(JSON.stringify(this.$store.state.categories))
            }, */
        delslash() {
            return this.product.string_agg.replaceAll("\\\\", ", ").replaceAll("\\", ", ").replaceAll("NULL", "").replaceAll(", ,", ",")
        },
        addSpaces(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
        }
    }
}
