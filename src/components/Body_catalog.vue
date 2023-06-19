<script>
import Bilet from "@/components/Bilet"
export default{
  components:{
        Bilet
    }


    //!!!!СДЕЛАТЬ МЕТОД ДЛЯ СОЗДАНИЯ BILET и сунуть его в V-FOR!!!!
}
</script>

<template>
    <div class="body-catalog">

      <Bilet 
      name = '6.1" Смартфон Apple iPhone 11 128 ГБ черный [6x(2.65 ГГц), 4 Гб, 1 SIM, IPS, 1792x828, камера 12+12 Мп, NFC, 4G, GPS, 3110 мА*ч]'
      voblers = "Рассрочка 0-0-12 или Выгода 3 600 ₽"
      stats = "STATS"
      image = "img/ipone.png"
      />


      <Bilet 
      name = 'ДИМА '
      voblers = "Выгодные комплекты"
      v_color="#F2EDFF"
      v_text_color="#7C4CFF"
      stats = "брак"
      image = "img/ava_pixel.png"
      />

      <Bilet 
      name = 'Ну реально ДИМА'
      stats = "брак"
      image = "img/bugur.png"
      />

      <Bilet 
      name = 'ДИМА '
      voblers = "РАССРОЧКА 1 дима по цене 3"
      stats = "брак"
      image = "img/ava_pixel.png"
      />

    </div>
</template>

<style>
  .body-catalog{
    /* background-color: rgb(243, 91, 91); */
    width: 100%;
  }

</style>
