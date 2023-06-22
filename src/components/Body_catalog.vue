<script>
import Bilet from "@/components/Bilet"
import BiletObj from "@/components/BiletObj"
export default{
  components:{
        Bilet,BiletObj
    },
  data(){
    return{

      products:[
      {"title":"Электрочайник Tefal KI740B30 серый","discount":10,"rating":4.8,"url":"/product/34df0b694e4cc824/elektrocajnik-tefal-ki740b30-seryj/","image":"https://c.dns-shop.ru/thumb/st4/fit/200/200/06a59192b477a34c374507b7696c435a/e24a533c7513abff48b01ab8eeba6ee3385bca1a5ca5531a72586bebb72fa8de.jpg.webp","characteristics":"[1.7 л, 2200 Вт, скрытый нагревательный элемент, фильтр, материал корпуса - стекло\\пластик]"},
	    {"title":"Электрочайник Polaris 1711CGLD серебристый","discount":14,"rating":4.8,"url":"/product/c036bf80d3933332/elektrocajnik-polaris-1711cgld-serebristyj/","image":"https://c.dns-shop.ru/thumb/st1/fit/200/200/28881f94640ec74cf6861f966d7a898a/d4215559a4d4fb2c4a786b3893aadc798432a0fd58003e33a17978be3287bf0c.jpg.webp","characteristics":"[1.7 л, 2200 Вт, скрытый нагревательный элемент, фильтр, материал корпуса - стекло\\металл]"},
      {"title":"Сушильная машина Gorenje DA82IL белый","discount":10,"rating":4.9,"url":"/product/c068d14bd02a3330/susilnaa-masina-gorenje-da82il-belyj/","image":"https://c.dns-shop.ru/thumb/st4/fit/200/200/f68433232370cb4679f2074e0693cccc/3d30d278d74335a00c4bec034e2a0c6ef173666574d2036f676144854799b66c.jpg.webp","characteristics":"[8 кг, сушка - конденсационная, программ - 14, 60 см x 85 см x 62.5 см]"},
      {"title":"6.7\" Смартфон Apple iPhone 14 Pro Max 128 ГБ черный","discount":8,"rating":4.9,"url":"/product/4e71cda13012ed20/67-smartfon-apple-iphone-14-pro-max-128-gb-cernyj/","image":"https://c.dns-shop.ru/thumb/st4/fit/200/200/a0c5e72e5abcc9fa130fc6d61cadbec1/928f208262d5c75241342483da048d7fd57b1bb9aa6099b7268208fbba2d47f7.jpg.webp","characteristics":"[ядер - 6, 6 Гб, 2 SIM, OLED, 2796x1290, камера 48+12+12 Мп, NFC, 5G, GPS]"},
      {"title":"Стиральная машина LG F2M5HS6W белый","discount":11,"rating":4.8,"url":"/product/7fec9ea281aaed20/stiralnaa-masina-lg-f2m5hs6w-belyj/","image":"https://c.dns-shop.ru/thumb/st1/fit/200/200/17e648d2064383440eeb6aa20fe5855f/700965408492f3bd143de91da0c87599f51ad17e16820d0d2abf495fa3c718d8.jpg.webp","characteristics":"[стирка - 7 кг, фронтальная загрузка, отжим - 1200 об/мин, программ - 14, дозагрузка белья, пар, 55 дБ, 60 см x 85 см x 44 см - 52 см]"},
      {"title":"ПК ARDOR GAMING NEO M102","discount":null,"rating":5,"url":"/product/6921e352b250ed20/pk-ardor-gaming-neo-m102/","image":"https://c.dns-shop.ru/thumb/st4/fit/200/200/76a260f8319b5a3078f75c82ef0b211d/3cdc90eed1b4527c65f6a0eae79a116d3fda29a2493895b3869c3662c3e53f5b.jpg.webp","characteristics":"[Intel Core i5-12400F, 6x2.5 ГГц, 16 ГБ DDR4, GeForce RTX 3050, SSD 512 ГБ, без ОС]"},
      {"title":"ПК ARDOR GAMING RAGE H309","discount":null,"rating":5,"url":"/product/91d2b7c4e25fed20/pk-ardor-gaming-rage-h309/","image":"https://c.dns-shop.ru/thumb/st4/fit/200/200/76d18be0ed3c4cc6b4c08749c38f72fd/a9797d46c9d87d775fbfa83df969bf706e1aae29a1edec22805402abf1c098b5.jpg.webp","characteristics":"[Intel Core i5-12400F, 6x2.5 ГГц, 16 ГБ DDR4, GeForce RTX 3060, SSD 500 ГБ, без ОС]"}


    ]

    }

  }
    //!!!!СДЕЛАТЬ МЕТОД ДЛЯ СОЗДАНИЯ BILET и сунуть его в V-FOR!!!!
}
</script>

<template>
      <div class="body-catalog">
      <div class="catalog_sort">
        <div>
          Сортировка: 
          <select class="catalog_select">
            <option>Сначала недорогие</option>
            <option>Сначала дорогие</option>
            <option>Сначала популярные</option>
            <option>По скидке(%)</option>
            <option>Сначала обсуждаемые</option>
            <option>Сначала с лучшей оценкой</option>
          </select>
        </div>
        <div style="margin-left:40px">
          Группировка: 
          <select class="catalog_select" >
            <option>Отсутсвует</option>
            <option>По производителю</option>
            <option>По наличию</option>
            <option>По категории</option>
          </select>
        </div>
      </div>
    
      <div v-for="prdct in products">
        

        <BiletObj 
        :product = "prdct"
        />
      </div>


      



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

      <Bilet 
      name = 'ДИМА ЧМО '
      voblers = "Выгодные комплекты"
      v_color="#F2EDFF"
      v_text_color="#7C4CFF"
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


  .catalog_sort{
    width: 848px;
    height: 48px;
    background-color:#fff;
    border-radius:8px;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.16);
    display: flex;
    align-items: center;
    padding: 0 16px;
  }

  .catalog_select{
    border-width: 0px;
    color:#0d61af;
    transition: all 0.5s ease;
    
  }

  .catalog_select:hover {
    color: #8e0b0b;
}
</style>
