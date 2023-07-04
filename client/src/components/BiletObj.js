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
            var str = ""
            for(var i in this.product.ar){
                str += JSON.stringify(this.product.ar[i])
                //console.log(JSON.stringify(this.product.ar[i]).replace(/"/g,"" ))
            }

            return str.replace(/"NULL"/,"").replace(/""/g,", ").replace(/"/g,"")
            //console.log(this.product.ar.lenght())
            //console.log(JSON.stringify(this.product.ar))
            //return this.product.string_agg.replaceAll("\\\\", ", ").replaceAll("\\", ", ").replaceAll("NULL", "").replaceAll(", ,", ",")
        },
        addSpaces(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
        }
    }
}
