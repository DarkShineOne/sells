PGDMP     .    !                {            test    15.3    15.3 7    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            >           1262    25503    test    DATABASE     x   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE test;
                postgres    false            �            1259    25523    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    25522    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    219            ?           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    218            �            1259    25556    characteristic    TABLE     y   CREATE TABLE public.characteristic (
    id integer NOT NULL,
    name character varying(255),
    categoryid integer
);
 "   DROP TABLE public.characteristic;
       public         heap    postgres    false            �            1259    25555    characteristic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.characteristic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.characteristic_id_seq;
       public          postgres    false    225            @           0    0    characteristic_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.characteristic_id_seq OWNED BY public.characteristic.id;
          public          postgres    false    224            �            1259    25580    customer_account    TABLE     !  CREATE TABLE public.customer_account (
    userid integer,
    username character varying(255),
    firstname character varying(255),
    secondname character varying(255),
    email character varying(255),
    phone character varying(255),
    customer_password character varying(255)
);
 $   DROP TABLE public.customer_account;
       public         heap    postgres    false            �            1259    25530    discounttype    TABLE     _   CREATE TABLE public.discounttype (
    id integer NOT NULL,
    name character varying(255)
);
     DROP TABLE public.discounttype;
       public         heap    postgres    false            �            1259    25529    discounttype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discounttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.discounttype_id_seq;
       public          postgres    false    221            A           0    0    discounttype_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.discounttype_id_seq OWNED BY public.discounttype.id;
          public          postgres    false    220            �            1259    25514    expiredsale    TABLE     #  CREATE TABLE public.expiredsale (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    logourl character varying(255),
    salelink character varying(255)
);
    DROP TABLE public.expiredsale;
       public         heap    postgres    false            �            1259    25513    expiredsale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expiredsale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.expiredsale_id_seq;
       public          postgres    false    217            B           0    0    expiredsale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.expiredsale_id_seq OWNED BY public.expiredsale.id;
          public          postgres    false    216            �            1259    25537    item    TABLE     n  CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying(255),
    price double precision,
    rating numeric(2,1),
    itemcount integer,
    logourl character varying(255),
    itemlink character varying(255),
    categoryid integer NOT NULL,
    priority integer,
    disctype integer,
    discount integer,
    pricewithdiscount integer
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    25536    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          postgres    false    223            C           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          postgres    false    222            �            1259    25567    itemtocharacteristic    TABLE     �   CREATE TABLE public.itemtocharacteristic (
    itemid integer,
    characteristicid integer,
    value character varying(255)
);
 (   DROP TABLE public.itemtocharacteristic;
       public         heap    postgres    false            �            1259    25505    sale    TABLE       CREATE TABLE public.sale (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    logourl character varying(255),
    salelink character varying(255)
);
    DROP TABLE public.sale;
       public         heap    postgres    false            �            1259    25504    sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sale_id_seq;
       public          postgres    false    215            D           0    0    sale_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.id;
          public          postgres    false    214            �           2604    25526    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    25559    characteristic id    DEFAULT     v   ALTER TABLE ONLY public.characteristic ALTER COLUMN id SET DEFAULT nextval('public.characteristic_id_seq'::regclass);
 @   ALTER TABLE public.characteristic ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    25533    discounttype id    DEFAULT     r   ALTER TABLE ONLY public.discounttype ALTER COLUMN id SET DEFAULT nextval('public.discounttype_id_seq'::regclass);
 >   ALTER TABLE public.discounttype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    25517    expiredsale id    DEFAULT     p   ALTER TABLE ONLY public.expiredsale ALTER COLUMN id SET DEFAULT nextval('public.expiredsale_id_seq'::regclass);
 =   ALTER TABLE public.expiredsale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    25540    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    25508    sale id    DEFAULT     b   ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id_seq'::regclass);
 6   ALTER TABLE public.sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            0          0    25523    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    219   �=       6          0    25556    characteristic 
   TABLE DATA           >   COPY public.characteristic (id, name, categoryid) FROM stdin;
    public          postgres    false    225   �?       8          0    25580    customer_account 
   TABLE DATA           t   COPY public.customer_account (userid, username, firstname, secondname, email, phone, customer_password) FROM stdin;
    public          postgres    false    227   �D       2          0    25530    discounttype 
   TABLE DATA           0   COPY public.discounttype (id, name) FROM stdin;
    public          postgres    false    221   �D       .          0    25514    expiredsale 
   TABLE DATA           c   COPY public.expiredsale (id, name, description, starttime, endtime, logourl, salelink) FROM stdin;
    public          postgres    false    217   E       4          0    25537    item 
   TABLE DATA           �   COPY public.item (id, name, price, rating, itemcount, logourl, itemlink, categoryid, priority, disctype, discount, pricewithdiscount) FROM stdin;
    public          postgres    false    223   6E       7          0    25567    itemtocharacteristic 
   TABLE DATA           O   COPY public.itemtocharacteristic (itemid, characteristicid, value) FROM stdin;
    public          postgres    false    226   ��       ,          0    25505    sale 
   TABLE DATA           \   COPY public.sale (id, name, description, starttime, endtime, logourl, salelink) FROM stdin;
    public          postgres    false    215   	�       E           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 20, true);
          public          postgres    false    218            F           0    0    characteristic_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.characteristic_id_seq', 95, true);
          public          postgres    false    224            G           0    0    discounttype_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.discounttype_id_seq', 2, true);
          public          postgres    false    220            H           0    0    expiredsale_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.expiredsale_id_seq', 1, false);
          public          postgres    false    216            I           0    0    item_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.item_id_seq', 157, true);
          public          postgres    false    222            J           0    0    sale_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sale_id_seq', 1, false);
          public          postgres    false    214            �           2606    25528    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    219            �           2606    25561 "   characteristic characteristic_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.characteristic
    ADD CONSTRAINT characteristic_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.characteristic DROP CONSTRAINT characteristic_pkey;
       public            postgres    false    225            �           2606    25535    discounttype discounttype_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.discounttype
    ADD CONSTRAINT discounttype_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.discounttype DROP CONSTRAINT discounttype_pkey;
       public            postgres    false    221            �           2606    25521    expiredsale expiredsale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.expiredsale
    ADD CONSTRAINT expiredsale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.expiredsale DROP CONSTRAINT expiredsale_pkey;
       public            postgres    false    217            �           2606    25544    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    223            �           2606    25512    sale sale_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_pkey;
       public            postgres    false    215            �           2606    25545    item fk_category    FK CONSTRAINT     u   ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_category FOREIGN KEY (categoryid) REFERENCES public.category(id);
 :   ALTER TABLE ONLY public.item DROP CONSTRAINT fk_category;
       public          postgres    false    223    3217    219            �           2606    25562    characteristic fk_category    FK CONSTRAINT        ALTER TABLE ONLY public.characteristic
    ADD CONSTRAINT fk_category FOREIGN KEY (categoryid) REFERENCES public.category(id);
 D   ALTER TABLE ONLY public.characteristic DROP CONSTRAINT fk_category;
       public          postgres    false    219    225    3217            �           2606    25575 &   itemtocharacteristic fk_characteristic    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemtocharacteristic
    ADD CONSTRAINT fk_characteristic FOREIGN KEY (characteristicid) REFERENCES public.characteristic(id);
 P   ALTER TABLE ONLY public.itemtocharacteristic DROP CONSTRAINT fk_characteristic;
       public          postgres    false    225    226    3223            �           2606    25550    item fk_discounttype    FK CONSTRAINT     {   ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_discounttype FOREIGN KEY (disctype) REFERENCES public.discounttype(id);
 >   ALTER TABLE ONLY public.item DROP CONSTRAINT fk_discounttype;
       public          postgres    false    221    3219    223            �           2606    25570    itemtocharacteristic fk_item    FK CONSTRAINT     y   ALTER TABLE ONLY public.itemtocharacteristic
    ADD CONSTRAINT fk_item FOREIGN KEY (itemid) REFERENCES public.item(id);
 F   ALTER TABLE ONLY public.itemtocharacteristic DROP CONSTRAINT fk_item;
       public          postgres    false    223    226    3221            0   �  x�}�MNA��ݧ�F�.�IP�ĕ��.MƑё��
�n��A�twի�^U���%�IAΐ�KT����������e�`��w��K��SS`�+Mk;�0��gF�Z.6�����b�<>�D�r9g�����䊊�D.��*�2P%�=�K'��r����9��������oZ�P
�,�؞�-�Q�0	�Ӝ���?�>m9�i_$��>M�-.l7��Om�����S=���hU��]Ӟ5d��$A�1�~��m��+�?7Z|C�^U=�sbFszz��>����ŉMddÚ�7����Eh\��8�T��P#3�j���Z%�OeY�V�]�/��o�8�UCi����?��ŭm��y���؀c�v�x�{����      6     x��W�n�F}�~�>�/�H����r\;�[M�E���})@�bDS����sfW�hQ����mg���a`ޙ����:U�_�ƾ6-~^ؙ�q�?Lm��v
�)����eMi6�~kV���-�T��|�*�`k��\;ˠ5��@����0���l𱵗���TdL#jk�ȣ�����{�,0?á���5��g�܅�+�p��9"�3S� ��|�`L����JHñ_��=���N�U>���~���kf������1.���%� ��v~�[M�3��d#���:�l�B� �#�LUp���$l�b�U��9�����.&;���c~��ѩF��Qq��T�^ɫxW@�La��-M3@���� <�`�H�]�0c��\i�K<C"�Q�{���k���hL�������	�F:�K�L=
F]?,{�5��Ӱ�K�`>� .]_.��rmֽH�L?����F!��������HB�])9E ��؞K��i{;kF�7�×**d��5��'eAB!E��TE�]V��
��־r)3�ƣ�qt ˕x߈�1 |#. x~G���DG�$S��'�v�xM����t��t:<�A��J�"�ޏr%�L��Z1XH��d#�K㬘�RZYW�Y�U�\V�_�THW5m`��n�ʓ[�|FZj�#Sɐ'��K���|���ʜ�Y��+�C7U6��
&*N�����
�wvFy�#��!���^�J2ɧ���À�@)$z������sJ=�6�w�t�X�$���"�+z�%ZY�H!�?#�9��\����ۊ"Gj�.���8�[�y��`=-�|n�ǙHG��w�3��BQ����E<�x�z�_��@�h In��-ix�Y±J�K
�]ELx��?�9�dc�u���2�D?9�X����1:�p]�/0tPg������@�/8��/��Eo_S*wϔ0��M�K!CDI��=/YvP�論f�=����`���|�De��>��r5����ȵK`�&PH��S�;�2X=����=�NU� '� ��s��-�9C��~��Q��a9BQd�̎��˲���|�2��8)q���ۖ<	����b����{9ki�W�>EG՝�<rCs�ܝ��Iy ��vA`%=�&8� sg��`��+������Efx�8YI`W\�]NT>�����`r�_�d�����8Q���0B�'�;����-�{�暂d�c�_�E�ԄMe������ �$��?�/��˓֎πSY��W_(���6k�      8      x������ � �      2   0   x�% ��1	Рубли
2	Проценты
\.


���      .      x������ � �      4      x��}[s�Wv�3�+�1�T����7^$���H#r�q*/�JB� ���2�$N�Sq��T����\S%;�Dg� ����u7�n~ Mf4$���Y�>{���>{�[g�����~{����y���~|�Ggߟ�����~8����ýt�s2����饺���'�}�h�������߿�㳿�%U���$޲�&/NO�N��lV>�'ӓ�G�����x��g'�f�wNgJ��/WTQB�����&e�Z�ς�չ�������W�=k㛈6F�\�-g4~�-�"M]�O�9z��떏nMfGǇ�e9�i%d&�l|�J��^�==>,雃����|�ӣ׻S.�<߫��;}g��ii�o��ݒ�~I+�-)���uH>m=�M>䍸������݀�#�\�)r�%eTX�O��>{]1ڦYS&Y���R�ܻ	YȔCk9�ִ6�$�-�Z-�W68��UO��Q�L�"�h�)%(���)�9���2�ӓv<�J��uj�71: /����W�~�����=��)n�\5����8#Z�t>w��bH�j����d��Y�<��!�j�1��N�W���1I}�M��se�"��=�����&�E��Z�WN� Z�"~Fi�g6ߴJ�lڇ�����0��oo�M��*�Zi�s�:�Xe��P��JIZӀ�sJ��02����1F&�Xc�R���p���rp^x����@��;<A֋p��Ube߾�ʧ';;��wKy��k7Kw tr�Wx��vh��j�*l����QIӻ��*�ަ��/��{+&�D\B.Aw)C�k�d,�֖����W,���v㝂7C0ke}���Z-���T 8�m����&v��mn����;i��^�N�-}�u*��D�/a�9�(�����D�ͭ���`�����F��a�!�^�]�>���s����͌aחB��[X�pv\3���5_`��� �X����3����h���j��q	Bm����)��G�8�̐v��^9 k¦4jV>SO�#&'��,��ɕ�r�j�ٱ�c�H���j�wm���_�@��|�p>�|�ӗG�����/ dХ�hK�66B�V`36l�kW�^��b�I�������0���E?u�a2��Iw�ћ����r0lF��\�!�0��lp��V���Ek}��a�hnN�@�Ǟ���Y�ܜf;CÓ��jZT�Pk��B�����@�L6��U�R@�LU�fX��>+#+"g��Jg{�� F�
>2�W�P���®�B�v�ڸ������1)6F-�x��U|E���K���_��M���(p�[f�#��*��*	:��p-&W����/֜e�,� �� ��j6����Κ��+�XvI�E-MOjR)7FQxO�[�[��(�`�~N�\�p}�"P@?�)����br�z$ڞ���n%�>v;� 788+r,�P�1�%sL�E�������.d�>�A�ku�ئ�,.��7۴�n��E`$.�Ë�#��^g�C»i��!�!h�Rí�?�u�&2�f)S��ץ�A���8G�� w.& gd�`Ӯ(���U�t�Z�q����ɽ�Sx{��p�+o��L����`m]�*����
����3�Ư8��'d�ͻ�g�
��`i�0�&���M��v|æ泩E�ۍĈ2,yZN�%�mV�ac)����2x6L�����Uj�65�5v,=��ťjA�D��	AS���U���D��^!�ZU\����/"P>lt�m��x3'+8���RA�8%�m��+_�R.	���Í�D��p�>K�����|y|�B��ƜeKH4���b�'T_ 0�����+زEV:��C�:R�bc(nz�4c��./C[�����G3�b�!۱����X����5����L�.k�#{�bMn,=�j�G�f�@��A]D쵖 s)4�I�@�W]]Ϥ�%��wiT��f!:��	N5�C��@����"3�V5��Q�g$�V+O�Byl ��=�����@k<�K''��Hj����<��n
[������R
���/X���cVsI���P�I�W��(A߄�؈�Ԧ�.�7�� ��0`6�*����񜋅/v��<q�h�Z�q�����e?7ݭB^�I��fh|�_Dc���LTO'T��Y)[ L�U�a=�u٢-NC_�$Bv&�,{Sx�Q�'ěK�& �k<�
�jL2��g#V�
�5�V�ǐU[��\�6����z�1��BT}�r���V7�	�,- �Q]���S6Ppe�R,$.�ύ�%R�%�j�����<�Z#�N�����Zeq~����������ynJNֲ��(��,5�eL!@Iu�pY V�VK�%xg�{K�)��X���9z�:�%6b����S����;��F$�Rym`�R���������\��TĿ�����|&�_���o'_���O��wF��/m������Rd��а��A_(�Lh[����:���ǜ��P]�Z�I���X�=h)alڄ�4��? A�$$ĀV�k�q����b��Z�]nI5g a8�`�N�+��/�����O?#d��/��K�RY�]��/����A��x�Н���U�3k��f�t�>6�< ���_�b[�Y!Ę��D�J�k� �q4E�38�W��c���;ew	�=�]�J5lL�kEvp[A<���?ƞ����}����'oCS4�Ƨ?��=�->���L>���=<���{lN��q�N�8��)�vz����?���٪�sf;�����O�\`-���,�Z�����(�T��J���d�%Ċ��BI��T:+���s�n��}�1����<�F�tr���i�n7!��ã��?R��������4u�h@�Z�ݥcԃ��Ӣ��h���p�f+	T��)�"�s�6R��!A�l��g?+� \j٠f=<l ݭ@�x<�.��R���D�h9�f��(�x��2�i��p�/�T$���@o7�}e�ݐX��~R��j"��h������u3S !SSp�/�]gB�Me���l�Y|���+<��A�T�Li�k�w7��^c�r���o+w����|�&w~�Խ�޽l#�gU�`3� �Q)�]��#�+N*;k.�����T@Z}.����^x�T��p.)�&!��D�� ]��� ��6�a5\�U`?�#0�/��*{yb
�gB췄��Cg>�Oܽ'��n�<e�:��@�{�G%6ؤ�QY%g*�� ��Č��S258�;8���_�ϩ�.Ќ �#����G�S%��n�%�J����4}�<�C��f)���o�pC���v<y��/�O�}~yE:ive)��Ή���i��S	�?H�g���%�\DT� ��������3��@�j*!�l��[��ߠ�m��4�G�L� h���m8�
�e��շ�S����L�J�i�`yr0���É��O����'��v%CyP��������R�h�ɩWk�k�,`:��8�/Z�B($�����&> �Σ���S�� dl�Ɓ��O���r�;k�Q�7v��͖ԱЪ�L<$�I;�_���]�Rf2��mɲ�G���C�FG� ;�����ߕ�
o�OZha�9�������I�4���y~ �#��Z�������=8�}�����g���3�l/�N�"����>��+���m���p��ҝ�<q�����Z��ECOJ0qR�2<�h�YW=|��{i*�.sGt̩��Tk��䡃��2�Z�S2jW��]��~t�wp����8��Jm��(�FH��r�i��3˭���gWQ�E����k�.��Wf�bt92������1{c���V�n:T�gZ��쩪}�]w]k/��L��vԵX�ngS�Z���o3��z͟��Q�VLx�J�Ud�%�C�RoS���뉤#6|x]2�+�̋��%#���"x����J�^W�tH�xJ�z�������(��/�!6��w��^V�9O|�Q���ヿ����+�>s^=���5T�:�S���)���F���"hsGl4    "Z��>��x��5�[a��u�:�@WX��TP��M����*��SA���#�{�v�V�}��o؎��A����A9x俁���~�`?{����g��+.��=�?C����b0���P&r������ùb{�qVD���,��(��ep.X�y��$<���>Xx�x(�2Y�`���c�6�}����H������\�د_�����/��;N�2�jI��M��y�q�޴h�8��*�$�kOBF��A�cEv���\�^�x�@������n��S,�+_$D�������Fџ�v|�$MFM�<��5<�wt�{�IT���9Hq�\ٓ�9�a(oSA�Zv&�Y�����9� �JR�G���oIE����aPhA+��a�P�ևq�أ,pC��4��I��%���8�(|?�:dVwn���ӳ��ke�i�a�|bo|����
mr�j�Wpz�D�qfA� ; D��ɋP<�q0	��'P �t�.��MZh�
:�6zh����ê�^8�������#�w���J*���Q�WgY�"ϋ���3�ͧ�c��Y��m��B�^X|;>��[k�
�43��Đ��T9�UV���X�n�
R~��3�k�C-%�V<4���˅/��蚴	����p����Q� bZRf�w�C�@kD�w_�,Û��3R���'�B$���*S�4�ڞ�E��K����j�x�}F�5<5���zW�\x����"Y:�c�e�6�Ï!��o��k��Y��ę9�D_Y�Z��	�h�������lP,��X��5�b-s#��`��{��_{c%4!��5"�~�H3x>?���g�d܀x_�f��t޼h�Y�
��LQ�n<3sf�A�|F�YU�;-���:O}�y�JA�09�������8����=�w2�W���#3��p�@&���]0`� s�׋*�����Y�8�������ɣ��NvN'��L�t�g+,Qlw������[װ7�������	Q��^�ݛ�+���x��UV�ak)�k��k
��"�I��w�FշM)DD���/����N������'��0�a��z2Ţ���g�f�熢O��mc>՟MdX�CPvC��Z*�6�,:��z����\5x4dv����f+4zML�A�񾞱:�\ЬVwY��to�7K%�2y�1�SV���Qc�t��Ϝv��}��2�jQ�wc)/��_j6J�|֞����͵΢��P�:���G
���B�$���g X
�A-F/���">F�"��@:� EA1������v*3D �}0�~԰eN�40/ �At�<�5�\jBI��3����Vj�d8��r��G\R^�,"�U2�r�;)E'	��ɏVc��i���;�	e3L�*�r��%���o���������Z%?�T�/��;g�+D*��aD�YR�I��*jl���^�� ��p���$�4�	���|gY/>�=eM��)���#���(h67��IQZU�Y�>�>ݯ�p�r�ﰞk��g�� d��~f�����JutT�]up?�Ƈ�Ø
����Ff(�/{�T.�R��h0��u�R�fUP�`k5�h�9�;9^H`b6�Dho�r���k�P4 ��ɚ���l����~?p��j;�$;5�5�ҵd�`$v�1O "A����0y�+�=��7r!�E�"�j�|���� r1^��ޘJ�&���)�W3��\;�5�-���m�ɕ�ڱ���Y�]%�}����H��c3:ۚg�[��+�lG�K�06��1�-���_1R��&�2ǻc���L\�q����u��7܇J��V~0�~�A�-�%j�����Y�d讹�[�3b������N�8�!)jb�//���#�Y\�XouK��c�&m;v��)�!����]�0?� ��# z���mآP�ݱ�7)ze6������3Ľ(�]v` `�" ��ʹRm����h�z����񯍦Zr�����k��J����B�	�$�����_}6�f�����+݁��rL	�7y�VXcN>v߻U%J�\��MV�K%D/�ǭ��@�X�ـ�0����Ўg��Վ�R3%��u~��2�X�4������ǝ �}�r���u1th�R�]P2����	��
k�[6�!�^UkR�`<d<d潟H�̩i��q�b��eM��N�e�9�[ ��4خ+��`��A/�.Ф�1�{�y�p�3y���n)�V�a5{ ����,�S�*Ǜߢa+{Yx]�H��0<��ٱ &�UgW x�
U�B9IF���X�h�ʃ��*]�2�^n�=���'��,�.�ܽ{KY�������-+~�$\iV��L]��0� �I�P��kp�ٛ� ����i5i��n�{Ҁ
��6_!ߚ�`e�
���4����꒗n���޶������/��gv�Bε�y�Ғ���X�C����1�Ҽu��zfuD0ڶ��o4��
��U"2�����:k3�'v�H���	�g�y�RJ}C�`��hLS�j|Z�bm]���9��u�ڙPd��5x�3�T�� A�0yaӱ"��1U�s8ɋ�>��k���ل
�]�,�N"j�z�X�K�$�tq��.ܣ�w~�N�(�~��3�yc�=[�瀢n�"T��QT�a��@tղ5B���ʌ"�5�Qu���/�v&���yo�F��&�^.6&	�TpﰈQ�a�My})�sq��Sw�h���y�y����o.��"Av��8��*����а��56-�,��L*�-�!7*�n��:gX[�n�cTPs��sz�pݮ1	�ˋEB9��+�M��X~��de�ᥧ��:0&Ϻ?w�J�������/`K����كgw��!�T����y���֡qx-65��(���g�[�q6�:�}oE����Z���C�(�0m�ov d��~�L �'q��z�����<�gl�k�j|�:�\W��yv�}�L�����}���x4CZAܼ��m�tƆ�.P�E��\Y}�t]��(���P`lN�����v�h�g7p�v�C�B7�l�`�,�����[�pJ��f �??)�Ҏ�e�����/�}̣�9~<fN������sR���/�O�v��=z�W��hn^�^l5�Z�9���\��"��NR�:6<CJaN���j��oawLd���%�l [ci
���/�k�"��U�Ĉ�j�8��q?���sJ���e�r�Ӳs��P;�4*�=o6 �n�=�<{��nE,�-������(5D��x�Ղ�T�")=�W�r�Aê���"��� r��V
,4���-�� 6s+�u{PJd������b����듣�^`��/P;����9�.j?NO�p��
���N�,L�Aj!҅�=�d���`y�}�zS��Ѧ��#�C�qv��6�&�\f�1]��b[���x�#P�a�����N�*m�w�oU`�x<0ȈQa y����/�}y�s�K���kH/�0-�d�*_�\/K�r�6��'i�����ɳg^�qO���t��/�l�FM]ή�Ա�5�L�^�2h�L�6<-L�@w�'��W�ĈԡF!~JUT� 68h�,+}l�bTp9x�)OyHM߱ؓ����_{�܉��t�h�y�7C�G��?}0�L�D?|�V+̖�Hq�"v�ˊ-�;����l��,�v�<�OB��"�m ��+��C���yh�E־gB����\;x"0�(��]���O��F�8Qk67����ndtN�D���g���_#B�Ձz-����&{v�ղu]b��<>虍5Oz)���BB�&��,#�f�+����7��H^~rt�.t��[]otN|��sq�z�^�(���y���8�e���H��I�E���������yi�a'*螆��l�P�0H�Z��s�6%�KD��WYY�
�V�;�y�a��ڐS-p u4Im)��� C�W��e �{F���kFz�@ɋm�6����������v��e�Cc}�2c'i ���VX'�;    c�)�Ish6�0�#��UK�L�k2b�25�lT*�<"^���xh��r�P߅t����/�x�Ri�k��0����ԓ+OZ�V[Dr��F���� ����^2p�����Ђ�Õ��S���	V#<$e1
� �|�L*tT]Ƭ�{c�6��iS�ʾz�NVS �"�V݄dz'W���*]K��X#w.���)��ܖ֡M�A�C���L�܋�m�|
=h�_ҍ��qQ=���P��m�e@��hp+i~=�j�ɕ�q�yی�D��7��k���d��vݙ*ճ�@UpE8�Ї����� DlES���]����֣��p�F�e���L��Q�97H�nb��}>b���]9rI����|l>YU<�ly�'�I(��ѱ�1�r���3��3��`�u�u� �!t'�[[J>��䕃�DU��M�=��UGO���l���j����e�s��ڈ��s��=|"V�^oG�[�,����
/����N�+��Ѹ �ʯ���!L({D�E�,v`�02����Ӱ`����8Z#% ���$�p�<��+�%��a</��h�UU}g��l!Sn,��k%�a��������<b�3�Y�T�tQ��K�= b��$.�����ظZ�$Ȭ���am7��<�3�G�/���&
�]��lM�i�e�\%
�^���[a@`;H��ܹA��z�b:�'�s،�5*�����ɲ���D�ҳ�%;�[����M�ʼחe�y�R���7Q-K�}�ٓ;xE+a�_OV3���ME�U���٘�D8M�����1�%&� \�R=*��!�g|��
���R�������vpr�d�Fwv�CLcgݡM������$M�E�(_M/2��7����P1�^�������ӻ_���xw����4���\UȬ�SƱ�{TP*p�v��;̞4�Ep�*d��#S�/��6kM5t���O+ψy�[����9$p���f��wQ\$�_�7�Ѱܼ�
Ź:	#��J�:��o��Vq��xD&���M�D	*ޑgQ��=�	�HdQ�r���~� �Vpz%��8:�됌�M��a�΋pu�%c^	��������Q?q�Մ��Xk�Xf�j��|����О��Ӑ˞A��
��3�	E���x�wHV��SspD`ErT
�D#Jk;�u����I0p���{x�7��s��f	D�����X��~�D���-+C��r�U�\jPL���*�ҋ�p)7;g��i��5v�/lAzzi�!������'�yQA\�6�|$�K�ߕk��7��D�d���8�Zw��[sg���`.˽'O&�7N'Vy^����Z�+0�Ƀ+��٤��R�9�����#"�J�/,���T�:�0GE����(5K�/ۨ��s�G �t�e��e�����i)''�a���� �����^ �f�+'����0��[������c��+cL`&[J��5�@��
���q�
K�]6/t
�8hU���d꜍+�L�9@g�.����*D�j&�t�y��EE�q�2D�e�Γ�Tv�pXzްso��%�~0B�Φ�a�Bb�9�>��0�j8������uC��ɧX�V�A߷ۿ���de���K�}�]�\�֚d%ې�%� �3� ���-`��`)�9�ʅ^5�ɒ��I%0H�[����y�p?���J���K��Oڰ��e��fx��|�vp7��{޿���	�Њj�$�Z����k�a��N��2��=[a3mm�k�v�w��@(�&�!��إ���$�۵�5o{Wvk%����u�,�	?$]��qXrM��2$�8:����o����O�p�z�&���"]�daϘ����%l� �f=u�:i]�������Snp�Y�x|$�z�k��;$Hl�Q�;��C{a(��a�5�\�q��5p�o�9�/8\�o�﷗�[��}�qm^��rZQ��%��,o��#X��iJ��Y5�(��+�$y#���-(��IɁ(Gp)�����Z�zgtO�*2���Ş��U:�M��t���y������!�K� ������'�.�{f���o'k)�]y�z�eΙ�l!"X�#~2Q­)�
�S�)����,�Q�JQ����i:0M�ة='��o���A��g�j��1�YRb�^�����잼��y������>ך�y�z�r�s�^�Q\���� �����v�7�G+�o�:��4	'5uh�@?��g�'��Ɠ��`�x%�In�p�UF#�9�.�%g��	4�*�	єYF�z����:Z/��k���z	+��}�RE���  �	?�����C�����7w�����;y'�nEN^�+^�x�X�L�îR�HȤ!b�q-�.	b"z�yxh����Xe�����T�*�?Vp�=T\�y�4������쵓Ó���i=~�����J/z�C���`V�
����9�<�y�?�r1@\w/Gݘ{UX������E�䙎�����*i]jH���J1,.�b�EC�#��c[�C�U;�_�+�9/���i\��k��r����t���r؀zhq�:T�Y_����g�~�>�@�-=+'{S(�kMLv�$�m�o
��]μ��v��� 80V���6ǈ��V�a�/"�q����C�a4����%FPY�ʰȃ�Ǘfȥ2UÝ����P��b��v2o����c[��"�ky�{?H�v�j8�҆�C�W��c5tȰ�6����Ê��g���<�ge��f���a�*N����6x���*�1K0ݼ�w��Ã�7m����YlɅ�|%�Gܨ�wRÄ�h7AJ���v�5f� @���sh$(�\[���]INA�JIv���>s`@��A����(�[�;@8Z����g/��d�+��*_]́TK������6�I�H����?�)A��5�Y7�-	�&Gh�ȱ6����aB����Hq��h���;N��}��/�C!)lO�Du51e"�:C�R����#8�Ϯ���}��˫vz�@�,���
f�7���ɯ�o������[���'���K�I��֦J'K�����К��8\Dᐂ�<�3I��d�]I�FsFM���cu\�|r���2*X�FݬA�է�����L_Y!7��X�k���{a.c�F( ӱ���Y<����\ui:�}���˼Р9,���J�|9� (F�M)��j�����s؎۷��t�X��9u�q�� ����|.3n��8��zhH-[U����؜��ֆ�$���JNȈ�*���PE� !x���{2�>/P�]&RR�3c���P�va4��g��xf��P2Z�#
Bd��CD|��p���eKb,��!����m��l����-�k�SA��7ف�K P8D�&#��66͎��k)F2�8���j�N�b�A��ΧwJ��E/��������}�0��*\��"�d��Z�9.؜aˎ|�aU�u�=Rkm-Q��Y��K�����vb�ri�6�mM0�=3g�GU�K�l@�u�����^{Q.z���90��[vn��c=�p1��<)�X6Τ��b�f���o��Χ"�}\x��ߚ|�p@��Ms"[ ��Oo����m��^`� �2�A��0�)=��ɝO&�����ڲ[E�X�;Xc��ռ-L�@�ˌ�u�I�j�>����%�Bj��KՆ���&#�A?gΑM���e�e�� )=-iʉr�Kw���e晾�3p���2nr�_����(����>��)������?-���؈B
.��l�t^��A֟�����Cɜ���p��;*�jech�\*)��\s� `T5�W��t�ev�O�\����{
`��	V��k;9 <fy�䀎�:�r�#G��F=Šm�#�9�vŗ��f>���"�KP2�����{��I�;Ht�l�g��<�xc�UmT�Ì�+�q����v�� ���{���(�ns�0��� �}g�_;[�ə�    ��)5Nڄ/�V�5�=4{�V~�w�RE�:��5��}6��ؔ��F����M�Q�m��ܸ*�'���`��A?�l��g`Q�, ��8��v).���^���$N�>�� ř��[�+Ά���,���~_��}���h1����ξ�k���Kv��a8�&2w~~�;P�G�8��<n�gO��{�s)��tp;��*i�iMG�ba]��z'0���L�i_��FX�B��"#˖�^��
�o�`Wi"p�`Fm�E��Ü�Al�tZvv��{;�	(�_�c6#=_���I-�%��>��K��+��-n���_ܛܹ��'�' Nf1���t*�lE���"y�11�[�N�&g��
^�{sri�K�{�����!�)��5��b�E(\QTK�+�|��p�C�i�W�e�ү�!��"�E��� k0ݳ��_������diS�^6���zc��
�++9D���C�Bݲ�F;XX2�O�Q��'���Vos��P� ����a�
�͌�}J�X�l�w٤������,@:���yΈ����smC�ȟ,�y|o�O�^_;�Ӆ���]R����8^F�o��Y��eH���aZ~�%
^j؏Ա�RخJ���2�Q�(�ƛ��Q�k����9�Y�~Y�f�����5|x���!���K�|�t���V�B���zbu�Ж#��������>=�����C$�-wȒ�y{GWa�6N�A�V�7&��J�����P}��];8���2@�c&��'Bz��xiw�j3O��G?y:��O����|v��[&(p��m|+�E�\Yp ���t�w�l�7�#�(Y4��0Mx"�1�uO�feBtTnaT���ih�ZP�����|�=O�-���t���"��9\��<�$�*\�L�_G�4(�F���p�u3K'u�'O�a�m<�vmH��Q*8�t)з��
l��u�i�`m�Q�ʛ�A�ɶԱWm�[�8�xm _���Įz$���=�8d|�Q�]6���]��ܙ���ǩ�,�U������J�χ���| m����8t2����f~�>����^N�>z8}:e����oq�#
ތ��h�����)g�t85-g�rPm`���*Y��9����YE�K�6Yk���g���6� �Y�!�|���A?N�C��a>|~�^�Ӷ7�\�4８�N�[�Bi�`y���������m�r�S�&0t	��%*]�"$��U)X��aT�P9ټ�?v��A�;X�_K���-e�A�u΍7z���`�+ 0����۟j1�T9���~w�4S���ޅ'��A}мe�J�.Cfޖ״�?��њ�}��f,�H��^!=f�{6L)�8�ɺ.%�p�<�1`͵�!Flj��k�|�"�TZ(���"'?lf����'P�
��)
r���F�A��M�xۨGk�`g*s4�a�bNʲ6���*�������4�����A�87��ږ���M���
ײ7칌�Y�ҁ���p�%6[z�<�o� �Rf쾠����6���!�ʈЌE �y�fa���`sxompt�	�#{��-�?,�8�ز*��Va�ȫ∨.x瑀��EΘ����6���Pb��h�9�y������(�+u��u�*pF�����^��C����ͷ�$��;�����O�`#F�M�W�z�Ғ���)����Ef���"�B,1~&3��Jl6�\񽁠T��P|�2�f����Cau*�|�$w�^��9-y}2m/w���C+���Dm��:o�}�S>���(V�r� �����:��3�FE28lB���"X�R
�Zo�:DP��f����'c�Qtx���{L�{1Q&�j=ox���{0���:k�����G���a:fvw�z�D+��>T�Ń+R��5�l*�j�ڄ��.&�`���"cRqK���� �m(���1�v�����e2�H�Je��䡜|������!�7�u��C�12�Ŏ��Y�K��f�"��R����Rƅ�M��=����{2V��yƀoK�a�0�f�	�LؘA!���	kYڌ�Y�6�d�{=>�?����\�h =��c�pcMc�a������u�����CY٬d+Q�[���lr� ��^���� ���G����
,�j4G
�h��j��~���Wbi5��`�a'��Py���O��<:|:����ߎ'Ϟ
��7�VPٌR�X�섮���"��(BXWr�]cݕ�=�|w�`��VR�8�`�J<<���P]���看��˲t΋��v<�9<��a��קB>?����q�hH�_d@/n����>��*ՙ����ɋt|4������_�^s[vE
T�#ݚ21���t4�Y�a_)˫�x���xyB&�p�q�p�5z���Y����cR|��k�]�*<��L�yvt�����t�p�h���G�z��eZ�<>��#/.M�l�
[�h�Wkö���*e�]���6��	͇m;�4��Z���i-��3'�p�� ��?ó�X;k��!ý/ڌ��rs�<��(ϋ�m�Q*��o��O�eS90�
�l3���&�sLH$WB��r&x� �5�k�[`�4��@((�t�h�.�ˠ�ǋ�(���n�̔�S�9��nŰqI��|�r�{�鮍�<������2Ks`��Crvr{���r�
QN�r�%�ރM�7�a�(S_��7ѭ���:FR+rl�z��nɢ�&��~w��}�%��=m;��$$��`�3�^��Y��֬-�Fd��ٝT����2(1��bv<�=3�9�Eߜz05��8�vR_��6���w�tw��=9�(e�ˀ�e��ݯD����˃:�r���ɧ_�0��oLQS��M1[d�:��Y���O��;��KD�5!d�_Xl���$��Uqt1왕��b�F9^��򟄄�[������7mGa�f������p�+�yȐ<p�/��e�vz�U�x�p^ �{ߣO��F��'���2�����>����xt^�U����*̶�@턡�������B)%7b3d�h(ɋ� ���y��<��'j~��Te/*#'��
88 �Cj�v��U=H�>�� &�>���J��c���&���TR�>�6�סvh�ZN����������Kyx��_<c1�޶�M�C��+�b�%y�,6�G�
�>cuYI���6�d���qL��Mͅ#��c�����(a�w�ƻ�f7�Ա�c�1[yQ�L_�wn,L	����3��k-���t8Q��999,��o���B�g��d ׄ��I��4<p��
�RA�yY�P#�
����Ґ��>��
��a" \ 6��T�{�k�;5�Z���-N���iR~C�SbӞ,�N�ƥ"�����ѽ�늡�%�IZeDl��o.��W���ؔ 
1�>���l�f0lW����A�;�̆q~W{�x��y�e�8?������O���;�R:�//��8oO��_U�,3�װ��v�M�<z�̝'���z�*G�8
�j:���a�c3<��VNF�@B�t80oa��c��lOþ~��CS��"�85��ǖ�Co����r���t|X�������ÓS�ް��Ω3����I7�9+���7���{ ���Ky����}5!\�2��5ך#z�tdȳ�K�m�5��V��u�����3��5�'v�%d����4��lkN!����z��uжlM^���X�`��F|��w�>z4ql�;y��cַ���jQϨY~�$��'x�K�g�6_g����� M���O�q�����Uyk�)L;ޥ<$�]��`��<�������ٙ+��^FVC��l9��#����J�qZm�p�M}�e���XD�H*�"[�3�l�l����u����[�Za�`��a��P.�W��h�+���s��u��K�Usp#IN����V����eeA7����{�+�I(���'qQl�'Y�!DakT���Q�*u��ZІ��@n�� �C���}�6) '  ُz��9��\��r�<����sX�NDv����*��`��ڔ�yS�~��v`��-�ܽieְz��l@����+'(w�^5����bGVǖ�xH���5+�ǋ���vm�v3gpW�za��v1Ɠp����O��ټk�V��r�yvYy�D��r�r��m�;�	;��خ"/�4�;g���&*����C4ϳ<������#�`�C���������Kʆ����q��$^� ٪��Cux�d�G�����܌��yJdv�����@nwĹм�%F�*K�_A��ye � ��&Y�e?.)�a�7�V�U7+���}dh�Rw�{Y�A��Yf�E�1C1��L�m�El���� �e���0hV�������Y�1G6w���o�2��v���7b���.�8��^�1�]Я{������v[�?��>�4�	�`�PC��v'��3Q�u2��Ap�Wk�Ŷ��x����-X�����rp&�:\]{�����.�W�+���[.������-�7�)]¦=�״���suE�kE��h��h8R͡�A�jA{yI�;�� �K����)�����A��GK��~�4YX�*�c�́�{Aj�����c�����^�Z�П�d�ewT�;~I�}
�cjr��$M8�Y>��?�Ts�E��u�ZJ�p�-��97���E�Y�l���+>��KHl^v�������[Rm� ���@vZI���Dv.E3c��qPd�C$�%�Y4�Z�Ih�-����j9�PF?ZJ��Ɇ^��2�_�O�e%&�Ò�?�hMs�������wY&�i����0?�Xa�\4JX��M&8� ."�������Ų<փ������/�@�R�傞	�z�^,���Ph�Y^f�6�ś��^����g�GPa�pՊ�Z�ݝL�Y�i3�畋��f|�35�\�<�JFC��R��H�!+�ߖ�}uo�����^�k,��;G���k:���p�7�U�%�z�Ed.�~��ˣ�v|����ɣ{_L4��ܖ��T�+Jr��(x���"�i��YdX�$�1q��f�Dr,^��9�*�m�I)��/C�@���~4o�w�Ĥ73�݋5Ow��T3� ���0T�ڏ��.�������uF�g�@%����-�l�Y��X8j�@+�֘8X2����J�7��[���������2��7H����n��n˅;X�O��k?�;p�g_?Þظ#���%�?�W(ΠJ�("&m�"�U�3� /�/\����-h�6��Ԫ���ψ�!�8��5Iz1>�4�Ι�a�{7���z}�s��X�c�GO�~���[z��Ey��è�6�"O��tjŎr���zh4i�:gF��j���9�B�#�Y�����Pj=���Iڶu���^�k�%��]R���/o����(/e�R��Z�� ��P�3mf�]�M�hD ��9�em��H�R�R[NӀ��a�N�Є�����+�Alf�Kh��~{Y����8���۷o�?�&�      7   x  x��[K��>���9&�����1|	��/2 ؐ�8��z�Vٖ�\�K�V+�޻����T��d�3��$Al7�$��Ȫ����D'ְޜ�NvR@�~��ǒ�6��כ��G���Gë�p9�O7w���|8������|;\���w��x��\rw�m�^R�~+ ��N��������θ����D2K\$q�}�"��"�\�~.j�2.�8.j�Eո`k�9��=���VH�D/�����E���cK&������d\�q\̒����2G\,q�#{��b���16��Cl1̓;�!����=|@���w��[��N��>�I�_Z��Ͼ�������x������4Ix�	"�tHR��$�XM-E�AU�L$^����BYE��
�bq��;R]��V��B�=K�й�)���RQӌ$��˩8ROE!��AQ��]�*��TQh�hUa��9�#uU�*l!�r9�#�V���+�^����	���^����G��}��Hݕ���ݕ�3��8��2��
A���Z�X��^�~���p���9����^0�8��(tFYp�<�2��� eO/�A� ��s����jT�>W:��TA�������C��4�F�XT���C]�nn�FĻ�^�1�s+ݙ~�&!K]��G�8�	Gg8P�@�94� ���cJ�8
fp �&��c	'��­ $�X��]ıM86�,�nx���q`��H�F^���9�����~�F��Ut+t2n��ΰcFr�a���e��Fp_,�ϗ�7��tyU_,/U�8T��Pq?��|Go9��'_��:.+�<������\,�I��82],UʈR��q�dDe2�
��ņ�h�1�6i��4EA��5Ej;㰦��IRK��k�L��+S���]�IiT�4�T�J#�(H����FeR�\	�"}��r��De�D�rQM�|
��)�5�M�Z�p�IL�p�>_����8-2�t��h�����
�BU��O7���TEc�㷍�|z�gq�twCq
���r�[?���|��N�Fǡ5���.�}�Cj��3�^�:�A�z�9`XdA����*۽g��gw��9��L�����@�>)����9�p��39����
�_��օI�%���j{�\��^�pQ,�c0ls%���\�զr�Wͧ��K(�C���5M"�]TX�QUF��*����/*,�D%jP��^(�B�J�P�%۠X5���UB�JՠXC0�f�֦1��6�%���P(	W�p������#BA"ZP�@!Q �D4I��١��5j�5ͨK�t�J̀\3����L�D����j� �8ԕX��4�<@.P�`y�}=^�8[�O|۔�`rq05q0}�o�8jM!��¸0�`��`���`tCÂ�{>	7�`�\0LM0����Uuth�B3�rA���G�m���:Z
�*:��]��"I����A�U8Ϲ���;.��T�`� ��;�lB󋕛���51� ��Q�Qw|��$��$��яW�hi�H�L4�DӇ�+���l#a �z.@��^R��2���g�D�@�G�K	k=隔����D����0Y�D�:la�o鼏�4i�N����v8�=�3|��XO�A��Me�n��fa��PqO���oS��l�=�p[7ܲ�=?̫d�,D�v+Y5����qD�n&�"��d��R.%�lɺ=3{b|:�>�{I_'�G�>%����~KϷ=v��PQtI��2��P�j:Q��ڝ�ڣUQ���ש���d��F��̅,U��`�8�"A���c��6cV&�D����x���,2z=L�D�Y��Ԫ�V�~�R?:(�ZU'��YWκ�g]mu�i�au:�s���Z[O�V�F���i�[���Tx�fb�=�au{`��2{�����E{L��s��%k[O�֌qaҸ0Y\��!�O���G�i��s��%Y[O���݅���݅����nO؉(Lє�l;�l{Pʶ!e�K�]�]�4e[�۱��s>��)����)��m=�[�D6M��g��o�<o�t� u}��\?�u%o�WS���;0y�,y����0Q��H�ŉd�J�NT���-�a�E�j�)�5k��?'�qs�v�l'���dt��l'3�˜]ϸOr�]v�_�֣&�C��]�S��/e>��g���j��KV�_<�8�)5_y����KgW�	��eS��@�����:�3޲p�)��әBg|��;�C��%/�9������Bme/���K%���~�`^O���mR@À|E�̀f�!��)��*qo�R�D��[��(�v�݅�:��H抜&���J�����䴬H	�M��E�W��*O���˪X)&�� �.�{�����"�o	C��oe*l��Ft�<�`g��&������+*q��bx~����Ji:����q��fg���̄&��IF�-ih>E��b�ʺK�Qu��ׇ=Ʊ]z�%_к��n���Ȅ��-���6,4��(�I��tz�!�nG��$v�PW����1�ú�ۡ�]`�� f����b`�10;���ia`w1���
���)ؙ�m��vQp�(�
�~-"G�uh��3�m�T�اQŨ?�B�c����ڬ�$�D��(z������E/��R�^�襲^>���|�+�g���<m��LϤ�8�O��)KѮ� ����&��o�!Ul�?,������8��ڣP�����Bs$����yƲ�X6��Gb����O����mR�?��x甫mO~�;�s��Kt��o�^RL�+��R�q/����O?��z��'�{�y����~�g?�q	AƝ�!���l�5�Æ2$��#n|���<�������W+J]���$TA�\���|�����3�V�ti�'Ê�>�K���P�?�����ݿ~*Ʃ"�&�n��H�SW�u�IW�D�I7�uS��%���������f'wE"���">���,"Fl��!b�t�������֝ONCi"�U�5"2O�,��������?�е�)T��Q*��-
_ !O��_�W�´�|�C���ujш{�������F�vsB7�nX��b@�m�t�<�A��r?�Yƹ���E��v|b8�X�r±u+�̕9@�:��-q\���8ƹ��	}�����~�Bz�63�'�Iԩh�-+�g�PC��{�	�Mj��M��a�C=rǡ+�.�2=��H�O��G��[�ta��!u��I�ʤ�JFTY+���ň:k�����Y+HZ�����h���L!��*.�O�?6_c����c�Y,bH�qf����L��>_��~����;P��b1z1m���Iv%�k���r2�㳌����q[ɸ�d\���9_%㷒�[��2���PQvz\&*��o��m�M���O�n��B��X��Q�㷩�G (:�XS�D7��[�{������1�4x�@��1Q�wjM����%}�
�6?���-�7w�|��w�ǝ���S�1w1Pl�	�)��QIo3�"���Jy(��w�����gBE:�03�)�sf�Aj9T,� �� ���ܤ4Lf�)}����5�mæ?�n��������T����ؔ�%"Mֺ�K��͇���.���[5nqI�>��6N�-�s|�����4�IB\����@�}�-��A�D�h@�i�s|��/Ɨ�j'��T�*�N�!���#�9>��j��	�ى`a<���^Cr�g��f6�[ذ3�uͺ!��і �g��Yj�g��I*�h�8��t	;�D��� �$�ag@�L'	d��Y�ag@��T��3�Ag��Р��Β;C [熐��g��!&Chi0Kك�!6Chi���'''�{�      ,      x������ � �     