PGDMP         "                {            test    15.3    15.3 =    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    17245    test    DATABASE     x   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE test;
                postgres    false            �            1255    17431    itempricewithdiscount_func()    FUNCTION     �  CREATE FUNCTION public.itempricewithdiscount_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
BEGIN
IF (new.DiscType = 1)
	THEN
		BEGIN
			New.Price = (select item.price from item where item.id = new.itemid)/100*(100-new.Discount);
		END;
	ELSE
		BEGIN
			New.Price = (select item.price from item where item.id = new.itemid)-new.Discount;
		END;
	END IF;
return NEW;
END;
$$;
 3   DROP FUNCTION public.itempricewithdiscount_func();
       public          postgres    false            �            1259    17356    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    17355    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    219            H           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    218            �            1259    17384    characteristic    TABLE     y   CREATE TABLE public.characteristic (
    id integer NOT NULL,
    name character varying(255),
    categoryid integer
);
 "   DROP TABLE public.characteristic;
       public         heap    postgres    false            �            1259    17383    characteristic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.characteristic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.characteristic_id_seq;
       public          postgres    false    225            I           0    0    characteristic_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.characteristic_id_seq OWNED BY public.characteristic.id;
          public          postgres    false    224            �            1259    17426    customer_account    TABLE     !  CREATE TABLE public.customer_account (
    userid integer,
    username character varying(255),
    firstname character varying(255),
    secondname character varying(255),
    email character varying(255),
    phone character varying(255),
    customer_password character varying(255)
);
 $   DROP TABLE public.customer_account;
       public         heap    postgres    false            �            1259    17377    discounttype    TABLE     _   CREATE TABLE public.discounttype (
    id integer NOT NULL,
    name character varying(255)
);
     DROP TABLE public.discounttype;
       public         heap    postgres    false            �            1259    17376    discounttype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.discounttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.discounttype_id_seq;
       public          postgres    false    223            J           0    0    discounttype_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.discounttype_id_seq OWNED BY public.discounttype.id;
          public          postgres    false    222            �            1259    17347    expiredsale    TABLE     #  CREATE TABLE public.expiredsale (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    logourl character varying(255),
    salelink character varying(255)
);
    DROP TABLE public.expiredsale;
       public         heap    postgres    false            �            1259    17346    expiredsale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expiredsale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.expiredsale_id_seq;
       public          postgres    false    217            K           0    0    expiredsale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.expiredsale_id_seq OWNED BY public.expiredsale.id;
          public          postgres    false    216            �            1259    17363    item    TABLE       CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying(255),
    price double precision,
    rating numeric(2,1),
    itemcount integer,
    logourl character varying(255),
    itemlink character varying(255),
    categoryid integer NOT NULL
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    17362    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          postgres    false    221            L           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          postgres    false    220            �            1259    17408 
   iteminsale    TABLE     �   CREATE TABLE public.iteminsale (
    itemid integer,
    saleid integer,
    priority integer,
    discount integer,
    disctype integer,
    price double precision
);
    DROP TABLE public.iteminsale;
       public         heap    postgres    false            �            1259    17395    itemtocharacteristic    TABLE     �   CREATE TABLE public.itemtocharacteristic (
    itemid integer,
    characteristicid integer,
    value character varying(255)
);
 (   DROP TABLE public.itemtocharacteristic;
       public         heap    postgres    false            �            1259    17338    sale    TABLE       CREATE TABLE public.sale (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    logourl character varying(255),
    salelink character varying(255)
);
    DROP TABLE public.sale;
       public         heap    postgres    false            �            1259    17337    sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sale_id_seq;
       public          postgres    false    215            M           0    0    sale_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.id;
          public          postgres    false    214            �           2604    17359    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17387    characteristic id    DEFAULT     v   ALTER TABLE ONLY public.characteristic ALTER COLUMN id SET DEFAULT nextval('public.characteristic_id_seq'::regclass);
 @   ALTER TABLE public.characteristic ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    17380    discounttype id    DEFAULT     r   ALTER TABLE ONLY public.discounttype ALTER COLUMN id SET DEFAULT nextval('public.discounttype_id_seq'::regclass);
 >   ALTER TABLE public.discounttype ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    17350    expiredsale id    DEFAULT     p   ALTER TABLE ONLY public.expiredsale ALTER COLUMN id SET DEFAULT nextval('public.expiredsale_id_seq'::regclass);
 =   ALTER TABLE public.expiredsale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    17366    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    17341    sale id    DEFAULT     b   ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id_seq'::regclass);
 6   ALTER TABLE public.sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            8          0    17356    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    219   #F       >          0    17384    characteristic 
   TABLE DATA           >   COPY public.characteristic (id, name, categoryid) FROM stdin;
    public          postgres    false    225   �G       A          0    17426    customer_account 
   TABLE DATA           t   COPY public.customer_account (userid, username, firstname, secondname, email, phone, customer_password) FROM stdin;
    public          postgres    false    228   �L       <          0    17377    discounttype 
   TABLE DATA           0   COPY public.discounttype (id, name) FROM stdin;
    public          postgres    false    223   M       6          0    17347    expiredsale 
   TABLE DATA           c   COPY public.expiredsale (id, name, description, starttime, endtime, logourl, salelink) FROM stdin;
    public          postgres    false    217   M       :          0    17363    item 
   TABLE DATA           a   COPY public.item (id, name, price, rating, itemcount, logourl, itemlink, categoryid) FROM stdin;
    public          postgres    false    221   ;M       @          0    17408 
   iteminsale 
   TABLE DATA           Y   COPY public.iteminsale (itemid, saleid, priority, discount, disctype, price) FROM stdin;
    public          postgres    false    227   ��       ?          0    17395    itemtocharacteristic 
   TABLE DATA           O   COPY public.itemtocharacteristic (itemid, characteristicid, value) FROM stdin;
    public          postgres    false    226   ҏ       4          0    17338    sale 
   TABLE DATA           \   COPY public.sale (id, name, description, starttime, endtime, logourl, salelink) FROM stdin;
    public          postgres    false    215   �       N           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 20, true);
          public          postgres    false    218            O           0    0    characteristic_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.characteristic_id_seq', 95, true);
          public          postgres    false    224            P           0    0    discounttype_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.discounttype_id_seq', 1, false);
          public          postgres    false    222            Q           0    0    expiredsale_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.expiredsale_id_seq', 1, false);
          public          postgres    false    216            R           0    0    item_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.item_id_seq', 157, true);
          public          postgres    false    220            S           0    0    sale_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sale_id_seq', 1, false);
          public          postgres    false    214            �           2606    17361    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    219            �           2606    17389 "   characteristic characteristic_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.characteristic
    ADD CONSTRAINT characteristic_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.characteristic DROP CONSTRAINT characteristic_pkey;
       public            postgres    false    225            �           2606    17382    discounttype discounttype_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.discounttype
    ADD CONSTRAINT discounttype_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.discounttype DROP CONSTRAINT discounttype_pkey;
       public            postgres    false    223            �           2606    17354    expiredsale expiredsale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.expiredsale
    ADD CONSTRAINT expiredsale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.expiredsale DROP CONSTRAINT expiredsale_pkey;
       public            postgres    false    217            �           2606    17370    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    221            �           2606    17345    sale sale_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.sale DROP CONSTRAINT sale_pkey;
       public            postgres    false    215            �           2620    17432     iteminsale itempricewithdiscount    TRIGGER     �   CREATE TRIGGER itempricewithdiscount BEFORE INSERT ON public.iteminsale FOR EACH ROW EXECUTE FUNCTION public.itempricewithdiscount_func();
 9   DROP TRIGGER itempricewithdiscount ON public.iteminsale;
       public          postgres    false    227    229            �           2606    17371    item fk_category    FK CONSTRAINT     u   ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_category FOREIGN KEY (categoryid) REFERENCES public.category(id);
 :   ALTER TABLE ONLY public.item DROP CONSTRAINT fk_category;
       public          postgres    false    3222    221    219            �           2606    17390    characteristic fk_category    FK CONSTRAINT        ALTER TABLE ONLY public.characteristic
    ADD CONSTRAINT fk_category FOREIGN KEY (categoryid) REFERENCES public.category(id);
 D   ALTER TABLE ONLY public.characteristic DROP CONSTRAINT fk_category;
       public          postgres    false    219    225    3222            �           2606    17403 &   itemtocharacteristic fk_characteristic    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemtocharacteristic
    ADD CONSTRAINT fk_characteristic FOREIGN KEY (characteristicid) REFERENCES public.characteristic(id);
 P   ALTER TABLE ONLY public.itemtocharacteristic DROP CONSTRAINT fk_characteristic;
       public          postgres    false    3228    225    226            �           2606    17421    iteminsale fk_discounttype    FK CONSTRAINT     �   ALTER TABLE ONLY public.iteminsale
    ADD CONSTRAINT fk_discounttype FOREIGN KEY (disctype) REFERENCES public.discounttype(id);
 D   ALTER TABLE ONLY public.iteminsale DROP CONSTRAINT fk_discounttype;
       public          postgres    false    223    3226    227            �           2606    17398    itemtocharacteristic fk_item    FK CONSTRAINT     y   ALTER TABLE ONLY public.itemtocharacteristic
    ADD CONSTRAINT fk_item FOREIGN KEY (itemid) REFERENCES public.item(id);
 F   ALTER TABLE ONLY public.itemtocharacteristic DROP CONSTRAINT fk_item;
       public          postgres    false    221    3224    226            �           2606    17416    iteminsale fk_item    FK CONSTRAINT     o   ALTER TABLE ONLY public.iteminsale
    ADD CONSTRAINT fk_item FOREIGN KEY (itemid) REFERENCES public.item(id);
 <   ALTER TABLE ONLY public.iteminsale DROP CONSTRAINT fk_item;
       public          postgres    false    3224    221    227            �           2606    17411    iteminsale fk_sale    FK CONSTRAINT     o   ALTER TABLE ONLY public.iteminsale
    ADD CONSTRAINT fk_sale FOREIGN KEY (saleid) REFERENCES public.sale(id);
 <   ALTER TABLE ONLY public.iteminsale DROP CONSTRAINT fk_sale;
       public          postgres    false    227    215    3218            8   �  x�}�MNA��ݧ�F�.�IP�ĕ��.MƑё��
�n��A�twի�^U���%�IAΐ�KT����������e�`��w��K��SS`�+Mk;�0��gF�Z.6�����b�<>�D�r9g�����䊊�D.��*�2P%�=�K'��r����9��������oZ�P
�,�؞�-�Q�0	�Ӝ���?�>m9�i_$��>M�-.l7��Om�����S=���hU��]Ӟ5d��$A�1�~��m��+�?7Z|C�^U=�sbFszz��>����ŉMddÚ�7����Eh\��8�T��P#3�j���Z%�OeY�V�]�/��o�8�UCi����?��ŭm��y���؀c�v�x�{����      >     x��W�n�F}�~�>�/�H����r\;�[M�E���})@�bDS����sfW�hQ����mg���a`ޙ����:U�_�ƾ6-~^ؙ�q�?Lm��v
�)����eMi6�~kV���-�T��|�*�`k��\;ˠ5��@����0���l𱵗���TdL#jk�ȣ�����{�,0?á���5��g�܅�+�p��9"�3S� ��|�`L����JHñ_��=���N�U>���~���kf������1.���%� ��v~�[M�3��d#���:�l�B� �#�LUp���$l�b�U��9�����.&;���c~��ѩF��Qq��T�^ɫxW@�La��-M3@���� <�`�H�]�0c��\i�K<C"�Q�{���k���hL�������	�F:�K�L=
F]?,{�5��Ӱ�K�`>� .]_.��rmֽH�L?����F!��������HB�])9E ��؞K��i{;kF�7�×**d��5��'eAB!E��TE�]V��
��־r)3�ƣ�qt ˕x߈�1 |#. x~G���DG�$S��'�v�xM����t��t:<�A��J�"�ޏr%�L��Z1XH��d#�K㬘�RZYW�Y�U�\V�_�THW5m`��n�ʓ[�|FZj�#Sɐ'��K���|���ʜ�Y��+�C7U6��
&*N�����
�wvFy�#��!���^�J2ɧ���À�@)$z������sJ=�6�w�t�X�$���"�+z�%ZY�H!�?#�9��\����ۊ"Gj�.���8�[�y��`=-�|n�ǙHG��w�3��BQ����E<�x�z�_��@�h In��-ix�Y±J�K
�]ELx��?�9�dc�u���2�D?9�X����1:�p]�/0tPg������@�/8��/��Eo_S*wϔ0��M�K!CDI��=/YvP�論f�=����`���|�De��>��r5����ȵK`�&PH��S�;�2X=����=�NU� '� ��s��-�9C��~��Q��a9BQd�̎��˲���|�2��8)q���ۖ<	����b����{9ki�W�>EG՝�<rCs�ܝ��Iy ��vA`%=�&8� sg��`��+������Efx�8YI`W\�]NT>�����`r�_�d�����8Q���0B�'�;����-�{�暂d�c�_�E�ԄMe������ �$��?�/��˓֎πSY��W_(���6k�      A      x������ � �      <      x������ � �      6      x������ � �      :      x����r��%vM>E^�������w<T�T��R�*�'|�A�@�XW#i�툞p�'��������ROk�Z=R��$~��g�D&��$��E`Ŀr������������������p��7�y�/����/�w���:��������������g_Τ��ރ�ޟ={�ţ٣����?�+������T��[�x��z~vv|��C����O�v�b8{�� �gf�g�b�+�(��Q݊`Us���P�u݇`ku��*C�>����U9�B���&��Q8�s���_|˲HSDW��w>{�����䨾(g�VB�`r��W��������QI���͏=?~�7�C���:��w绿��vr���ᖼ�n]�������Gވ�Z����P�@��*�(ᒍ2*��>iS�7V��]t�h���L�Zo�N�w��)��rr�il.I&[��Z&�lp�̫�BmS@��Ev�4SJPf�3>�|o������2�:d.L
��ќ��տǯ?��5��8�K��$W*� {4ΈV�)�����>��P���ژL5=�b�:D�R->��I�j��%��i|�L�T�v����?u�A�GcR-�3g��&x-\P�|xt������~C/\M+mtNZG�l�éT��5�:��*
3"!���cd�����&���hT���2��+>� -x[��p���Z/Tb���移��#~vS��������hfV�m�Q��.2F%M�!�TƊR�ҾM�VL�0�\��R�\ע�X\�-kE�?W,В�v�B(� ,ke}���Z-L���� l�������&&!�����e���.rY�2lI4��?�%,-G%�S��A�P����Tg�1�pZH�僆���zV��лY2�B�3�W
�Jz���:���Ī.��f���~����/�g_~+�����p"�o����~r��)�s(&��QCAjK=%�|��y��N'W���!����_���$�1ZՌ��d���fT�5�2��"�����_���������)���aC'\�Z9F�8	Ɖ�E?Cf7�뒑3E?f��1�����"��M@jԌX9�f�Sq.��G��a&�?g+,��^��ְ��Љ�{��kA���ᝄ�4-�� ��a ^���`V&Y���j)`\�*e3IU���y-�l��=FY�E� )��<+T,��Z��0��<W���b�w�*� ��*R%�؄hnbA`N�	NEm��,���n�J�J�I�*\��U���oj5gY��0�!� ��*͆)��dcS�Y��5�a�]�:{�rcЄ����-MȀH�Vy!�s�jF܂��}���$rP��ҋɵ� hY2�����p]�cL�NV�Xt �XI͘2���
�J�z��嵄}�/�v��f����	�(� 9p�v�U$3p��:��%"����Y(51��Y7	��k�2U�]�.��)L�ъ�Z�bPF�<�-u��r�{�����=���+��[x����15TDS�-um����sVĤ.���?�@лCH�A6���E"�Zw�Rp^�e� ����|6�HD��p^�������k��e�l�=y]��0��mh_k<T$�^ئ�ťjA�D��	!K��*�P�F"`8�WH�V�=�&CZ��9B��;����b��TP�B@~ 3��s��Ɯ������Y;���g_���,�)}X�ZG;-�=��	��Pw�o�Y��
^j� �N�Љ�l��J@���j�X+}C��P�V*������)E�!2�c��y�o���t�W|p��z��r)Yn��/dϥx&ͦQ5��E��k-A�R��``�_uMt=HK���Ψ�C1�ɂ�k��j���#��*	�@��an��2�������o�{�ųH���tz
�H�V+�'.j�(5i[��A)��mATk�a��A쇪XR�X�6MB�!�E	�$������M)]�o.:ׁ'К���N�j*r.��A�}��
�x�K�t-w��TX!�� �����d'�]��6/C
�f"S:�Q5P9f�M`l��C`SQD��ߴ.[��i���D��D]o
�f*l��RFV ꚰ��%h�%�kЬ�D!O��#��L�� +�d�I<���A'�|��V7�t�,-��Q]���M6��R��	����������e��b�8����2�w����������]�
�A-"K'�)�nC.�1?�	`'��l�L�7e�W�T5B4^��Ji	���D0�`J�~�X%��ȑQ�"��y|���I:� �����?�8f��^����g_������wF��m��Ķ�XRdJ�P~�k�A�+�fP���
����:�����:��/�8`�I�zbP�=h)aJڄ�J�����Q�|'�Ê�u�|����Q�.�¿�m����xt��{?�����.�0e�V9,xR�U!�8�D���B�ec�W��4����\}l.y ���"b�4`��B�Aϰ"a'�*1V�kĩ���x+���
u�_��-{�SĿ�,����훿�����<����fo~CK�Ƈ>�gPɿ\~��7=�|w��dv�������@Ǜ9q��sp����U���J�V#�3[�Q�ț`]*�k��8I���LVv �FW)��z�Z�+rb
%�-8kV��%xg��B�|��^�T
��F�srx��,�����������n�o)�ۈ�|��s��N�X�T"�"���������w+5B��)�"X���4RՄ�/��l��g?g�%��lP��	��V@�=��R�mP*��,�嬚1H�SX��R�IH��-֣�/�H�O���Բ��v3F�f�I�������'��E�&�-��@���$�AP���@�7�yx)�}�ŧ:���[=(����_^���)��:�v7����I;����>�ک{?�{���#��ز� ��Q)!ֶ&"�+N*;4RHI��d*`�>�EJF	/���Q��)�&!r�RMx��'�n���x2�x|�;�����N���>�~KD�>t�s����K9mP��*�ŮC�'��Q"d�5*��r�LV
��(�"SC�α#�{/�����+�酤�l�W?u�'y��t�.�􃀞=w��ӝ�Hs� 7�a�m'����r���W�X�+ϙ�V����LI��A��z���.�Mb�)�͵��aֽ��US	�e2۲�-��l#�O�~���k0	���g4W����̟��~~H��\}Y)� ��_" O�:0�R�T����EHDN�^Dl)B���ԫ�5� �	p�ց��a���ء7B�PU�)݀�� �yJN#v�86� ɾE�]MuZ|���0�i��� �j!5d������R� �
ږ,;lm1�j5::�yP)L�W���U�V��dhƛ�d����� Iv7Iu�^��\��x�	������:�������e̿�Og3�������ݕ�[붫>fx���t�,�H �Ad-��!�$8�aPE4ᬫ�� Z4s�����R�]z�5ج���)�\�pJF��R���0��<=;I�/S;xts��G��Z�
@V��]E���?榑»��/_�Ԡ ����6`YH^�c��X���Vrl:Բg��ê)O}�]w]k#�m�L`kv*RX�֤���fA��zx���[E�Zb6V����,����b�Pk���t���H��n��zp+�g����!ϡ��e�f�+�z|?|}�)b�\\Cd����2�������'`�'�y�gΫw���U��^v�.+CbWۨ�Oe�HeFD�0ڇ�M�Lo�Zc�U&h\�gNd��,J� �VK��D���}�e��������ô�tx���+����_b����I�1���'��O+����_�����x����%���4��ri�۞|�}/H<"��U*R6�+��"
t�g?���<߁��`]�1��p|ód0�*�˂t�e"�M�٠�-_��������vzx�޾z� �W7�w�    �$�ۼ�
ۢ�3m� �v���ht&r�Dp�yM�鈭��z��r�z��7C�"0�9���)-@��\0���o5��B���>��0m��I�����]���Um��Ё��I����T0����j�=)�� �JR�G��oIE���4Q�W���a�ЊևIi֣�l����{rl���y?�<b5sa������kr`*�0���ad

Od�Vô��@�C���}��E��6'/B��i�V$��*|� Y� �o���W\4j�  Y,����Q�Ks�K0F{$�z2|vu��*�,�ݸ��|*96��˂Xj��*���@���g�Ia��[S�P�����K� �J��Qee������Mx,���.<�E�&�@#��w]Sp�2X�o}��v>�FJJÊ��Nw���!�K2B1��"�>��q2�Ϡ"|Vɘ������']*�ddA#&{: �3��A�������]�Ȼ�Ņ��tקй�g �U��	FU��r ²�"i�`lPx�K���u�{�Eڠ]S�ֲ�`]�	ٰoh���+���t�ֻ�c��=�'�6 ��(�7C0.Zg�5����R�l�׍?�4V ��U5�Z��jɫ��n��[�8��,>�8�� .OB�ش�Y�W��辧4��3�?܏���<�~����ϋ�u�o���=:��t�lv��LK7{��"�V�*x&,�u��
��'�*�]!woB`h�<x�B z��*+����tE�5]j��$��+DSR֦"��u�n��G�Guw�Gܧ�#��X����z:�#�_]���|,�?�ɰz��f�`M"T�*�
>{��	��i��C�$�������
�[��mPU��d��:W��]�f�&��j��RI8��7��p.�% �v .�����iw��7.C���^7�����СR�Q������j��� �^��,��2`�1($H՞c�W?<��1l?���S7�΢f�� \xtQ�c��:ٹ��h�:�a��i B00���`Y�B��Ԅ�.����E�Nj�\4��r�#�(/M�%0+���b���[����y@���`�_��~C���wkK�����k�|��s���&��ݪ��4^LQfI�#Ag���I6�y����b�ٗI��gr�-��.N|�{�$>:DESLe�@*I��\�ln�咢���3�>���� �ʃ]����VJ��Q6��V�;����F�U_��`ԙ��B�k)HH&J�!�6��T.H�Rʞ�h0��u�R��ZU\`O5�F���wLOr�<��lL��P��>�&��	^�K&?Al�n}gj+	�";��ʚh(�A�^h�����p$BJ��^��@aԛ
v����ri��Y*���H��}؈ɍœo';||�7�۰����'W��ţl�}r�*)���[DZmƀ�G����<�n�*�=<>*�ؼ>�ದ� c�x#4O����2!�8^ұm���J�M������hP�������%�a������"�d�9��b��?BX�-��&Hr�A�kba//���#�k�L�(g�J�8&m;�\ה�Xu�G���V}�6KH䭲P�z�;v��&E�,d\C4�~@��!�e���(��aP�*�&�k�Ha9	6�#ȁu<�vHVmJ���-��0�+E���Y~��}���b����+�[nw}3����< �-'��ݪ�r.CF&+�aӥ��A�`��{ G�
ԃ ���QMhǳ�-h��M��r@Ժ��zF<�<�^��Ԋ'��_�ɋ�p�R�cGƋ��򫕌n��{�CH��֤N�xPpķ�+9���� ���!M�Z*~� �H�[�ۀ��t�Tr2�50qM6�15�S�t!�.����gEw�U������S,*�믢�/�,�3뀛��~��`�ʆj�9�a@�"��۱6� -����7P�K��<�q>�Tw�˺�~��q��](�����~�߮��B2k f�y;D��h�xK12{�4L/gv���L�����v�>
l��l�Dϥ�
�4e�����ߐ�Q���^.��h�pm㾺2��M{�֊�F�ήQad���S�`K�����3�`�m1�hL
���*DdU٨#�u��fJO� � �ΐS՞7֤�7ts�ދ�[��uU	p��6՗kg�Y�(����H(�:�����C��Ɗ�NĚϏ$���Ļ����*boE�WZp)�ǣ���.m�`З���辟�?N!�/�1����=��J�rǰuhx�f*�ID���]���F$�H1��r��H�o��jo���ɤ���;O����gф����$���
�?ԗ)�.�=ܕj�*�d��dH�u��7��l�˺�M+��(�H�N�B��B�pAHB$�A*����+f�v�:gS�V�cT�I�=z����T�[aEB�N���n���������Cw����x�?�=E^V�. �+��ݹs��^�B��f�}�؆Vt ��PPp�@z8�B�-�4�l��"E	�Vk�RA�qV���3;P�Py�L	�='KMz!4�uƃã��*tc��y�R������=Yܻ��/�j�͌j\ܸw�#�t�{y��"2K��uB�.�dX:���W����KdP6�{(��! !?�k�FPM�=O��CA��{^�̝���y��� z�n�J��.��Y�x��?��~��N>z���3#���W�=��W���;7na.�x�n��6<����&�b��C��2�~�k+b�F ���œ�W좎��Z jAI$�����E�x�Yb&F�P�'i�'a�t�0�%���^�9x^vO/��vf��ٳ'_�:�V(��~�M�ʠ1�CTRC�0-�N���D���j��o���o ��9)!ǤP@ CP�{���a1�2��
�D0p?�p{��眿:=n�9���%���(�y�����+`{xtv|�{x6���}t8{�Df���ٷwW��=�m9DD���F���G��r�����r:���
'����V���\�
���7�7�}��K�>BIj:��$�_��^F��i��D!�:�/c�6��'��������3/�'J�y:����M��B���%u8����^=Wy0׆�#�T
����Y�b!R�����MQI4����P�YV��Ŕ�qpr�!*H߳�����_��"�S�����%�����������Z=�6�! beh�jpB�瓁�q `�9�<�,���:��q�'�[� 
1 ��������64�"�)�3��X�
�����56�dP���3��;��T]6�p#�r�'Z=_?~z��l�赌cP3���!t�r(V��uEB@���C�J�Y�Ƴ|	i�lG��p�4FG�Y]o�蟼����=��. [4�,�ޤ��N�q�j�^�,n�.��"©e�[-�,����"��w�+B~� )2���B�ޔk��-ڔ Ӑ#�]e�o+B��+��k;kՆ�j�;שJ�1�+0fhlb�:�]��E\S˸v�����g�����I�[t�"��k�N����a}|��nX̡A4���� XM�(^��Q��Ig�R�^�-���Ɂ��3Ʃ��}G�}wJ���6����zr����l�g��K`�X���*38r��ap��ZCX��H��f<�G�2��g�(@R�b�C�(�)��B䌐�]f,�����:]- Iu��\MJn:�p���c�tD9�S`%�֖֡�L�tA�}�
"�E��6�B���Ł��F���$���8�	�$!�LM2 ,V4����t5��s^6�	�����ט��v��9m�e�\*xD�U�c�G��l���)k�PȐ.w�U���t��:��²5J�ē|V�T�[�ϩ617���L��&�b�}�dUL�/�*BIN7	dZ`Sn�N{^&gQ�Z� 	T�l�����6����YK�$S���௢�����']@v��2���    Ya�Ӊv��>?��$����ʮ>+�H�����T�
AW�V�G�,ca@*Ŋ2 o$u�9���d�h�����&dTu�W����8�:jd���Id�2��y	x�ex6�r��Z�ђ��T�J�JB�q-��)W�-���b�2�i��̹(]֥��(�wN�E�c�h�BT���'�B)]�H���4��v �M���r�ٚ\�r���J�,5p�(��h�ِNQ;�^-���#���#X>�RO���Y`*�����ɞ౧=B1Y�ǎ���g-!�i�M�ҫ�r�o�.���gO�̜V�־��*��N�[��{�1	�L�8��eG�1"�$F 	8�q�������
���2D~
�&���~��)B"MYY�`n�8#s��{e�(�:M��as/��
��nB�_�Xw!��w��������z1t����T��3<PT� ��v�E"�eO��"�W2J�(�cy���:XǇ����ݪ8��NJ����	���>h˲�+�>6��+L��+��Z��b�>�^�����Y���4&R�%8@�:��9?)Ad�W�r����Pl�{U�X%Վ�8~�됌��Ia^΋pu$3]	�akv�~�>𫅌�����⹽�!"p��B{N�Mc�v��1<>g�NWG|b����k�9-��"��4*�
n��B����xg���u$�����{��/�	�_�{~�D����B��Q�U�\j �y���*���a�����M�x��DޥY k�pYtaa#�����"�D4D�[I��r��N����M6^��t�����ޒA�{�dfx�}�`�f�M{��:�M�S���+�&�ʍB�ʡ��wG@�A����Gޚ-!��u=��iT�X� j���|�)�\rJ	i{�*i9���j����ْD������󝷈����O�r\�=��ϣu]�ܽ����&#W����c��L'ޑ���~Ya����	gN����wp7���ٸ�\��Qh|�R�
�B$�eIV@%ዧ��؇M�5c>���wz����aO����?X<�h�v ����q+�xH��ׯ�M�'��1�x���	���K�:
ć����@�4�k�d�5aPJ�L��GA~eDA���@��g/ 	J�s��j|'K�;uz����O�?�ǝ{Gy�p���eo^]��~����y��nws�[~��w�Z;���l"�ךLe����#i؞��*ܰ�M����i�y^�,�ߛ@������&�u�5�y۵������uz$-�y+�	?�$���`|����2�p[r���B���:{��ibc*��ٝ�������{~.�O��rCPх��q�LJ��2��V�:�*Q�%hd ��]�\�R�+@Q�
Kd��V̝g�A;u�� �9��7?�Ě������l����n��_�D�Rv~%��� �w;�-L��є���R���K�]7���g|D����f詃o"gJ�j��^����L�"� ��Yv��U�	��fJS�5�Є����oכ���5�^2�F���+v���}�?�_ �.������NƵ�j�e%IT.v�&��/����
7q	(��w�hx� UOlj�d��i�*���v"%�A����K^�Zh�^�������V�.������d/���q[���`�w���x;@��o��E����ZNs�=��~��Bޕ�c��ە�9��]�9�g��&���=�Ay�/D,�h�R�}���p��O+N�����8-+=�U��8AJ3[6@�9xq���ݽ�����v��??��f�vv����<|v,��>i����f��n��SY`�r��~��!{�8"J�:���DR̭.����bd�\��0Y0�l��L�,� Re�.�2��ءP����y~�x����I/�����x����?������#p�����w����9�y7����l�u��xH����*]&��9V��=P2�۬A-'���@w���9�p��Z%�
���f�S�HC��i4�������t~6>缞��G����9ߍ�������vgOww��ll�bX׫|�z��ܫ�f�ޠ�좦�$�fϴDz\��u�!�
�*����l6Ѐ�@��U�}�~��.vR#ށ�r)N�Ÿ��t~�'����es2����@�}{�7ğ=|����u��7����X�`<\b�3&���|S Ee�r�N��;�n�V�
F��/r��]=8���ۈ��-S[� ~�Ֆ�.��/@��{Y�G<|~vri�:��N��7�}�3���-�Ӽ��劇�� ��V^I��#�_Y�8&�f��ipH��~[d:�O��EG%5O��l��l"��#:!�Y�%"��lC$�<s��Kְ�-�Z�^<?:<|��/����r�\��/����v��@�͊bsr+���ix���@e4I�� hsm}����(����,I��2���D%��X/FI�"�SfS�Y��uE/VB]����ml@�m���F�0�X����k~sq�෣:�.!�#�^ �s<4��@-����F[ј�Zw\509"��G� Sp9�Du5��"�:C�R���$���@��
�:I?�����/�^�M|-^�A7ִ��������\u�#�l'��:*�d,�����Ckv\*��x=��ѳGLG���$隒D�4Ufj�P����#O�6���0ְ���_���әWs�/��Anډ���eq6�Q�F���bM���\lX��V]��, �H�¸��{��C��V�C9$+1�͑�jD	�U����쨼��}�����][�@�����˪���oǾ�Ql�����@�~.,�m�J��>M�d�:�	�Q۵]#k�h�gv�>���/�e96 !׵����BmF�{f��OV�*���I1 ���}$�;G�,!]�W�c}�-�#���v7����� 2ћ���%�p�MF��6NE̎��� -�P9��=W
��xW�;a�}~��	'w_�f��H�e�Ltz���	uK��Ƙe��� ��t"��Zk�$�HG-��.�Ē���R�ʥ9�,��5�����54�/Q��y������A�PK$��H|�v� ��C9^{*<��{�y��;j̀�s�n!v>�y{G���z��R�o���x~x�Ln���;��K$�fH|����gw>�ݗ��y�JԌ.��b�r$ow!��2p�]���UYHͼ$F�������Co��X�Q�dd���%2S�@U��k��Xy�FD�yIs��Zc�?1��h��hv����w�D���������������i�75���%���)�KVsD��Eg��3�
�[��ЊkIx�ȓ�C��1�VV��x��kdup��'{-ٯ�2�b�e}��e�;'��%͏��';=x���?ߒQnuBh�Py�������@O6��� ���3�*�̩f��y[FjĘ�5
P����ʩf6[^�k6�[զ$c1�i���E�+�hK4�MиwK��&w�cĻ����Y�b�819X�A5�GR�;DPHY'�A3q��`�#"�+�ςXA	V���b��}���o
��p���z<��P;dI��<jgt����/vH9�5��7�Dx�QDi�x��r@����-��.�)<�����u�W�����8������vp�N�ً�6{����1��;~�n�`td����rn��u���D6�J��<+������D(e�'��U�Ci��`�,��K/�#������c��w:uZ/�)@m�Է_ݛݹ��'�'�0&n7IH�,�5r���͹�zf�:�l2���&��z@\8�
9q.q5J�Q\�ښ��D�-$�(�Ny�i��O���2�ˣ2O�Wx!�pa�
.�t_N��'�x���'?�0�-/2A��R�1Yx=���HR�?�!ٞ��	��thg��?Y���\A\#�2���:(wm�f�2��`���'��Y+{�KTN�[�n�^A�W\K��t���D����N�    P�Om�\*����%s��P`"	��ĽS�ǐI]����Dޖ�Uآ�S��V���(�����C"�� �/wh�o�N�V!ѫ����%�c��~�t~�_@	���p���ա
����7+w��\y�-��N`:G��������s�S����ns�Ua[���H�&tA�"�S�6��)ւ
\v�[�I?\����<��G�GK|�>�����3J�a��~,���±����"�MW!�-!��3Jg�.r��Za�cy���ue���4'�J{�V��70݈��-������ �m*�=�+���e#:I?�]����_��Tv/\�~wvɚ@�8)�_�0�T�gH������cp.gw������G�O�<�]���w�G��E0���3�%Z�r4�k9˥��#:`��d݃���e� ��d����.>{���}A��op�DY���=�'iY �壝��2���y�S�������P8��>
��>�k�$��j�5ț��I\�Y)(]�"$��l��(z��i�9�������s�=7�*BYK�y��j�s��+�:Yi`F�^�s-�������f�>󻷔�[a}м���.Cf=��_�s�〰BI�5B�-����5��49���"؛RTqH��@J��o*��\k�cd����1�T����)`�����a2��T�˹����]P�h�L�T~�x��Gk:7F{��l�p���a���*��k���nW��o���ѐ���-�v���9W�V�j9 ���
G�=8O��*�-<*h��4 q�q4/8���w��+�Ç,�1O�}�÷�YB�@&�2������hcb�1[!L#���O�t`T�b�87P�Z�y5H����N��J�v����J@n�}�p�����:�!���f��--L-F�S������-&w�X�����K��<7���!���{�����GCl�6��Y�T�B0o��d��2���+�70������H���[&�����[��
[9�`\b����� ,�«�y{�7j�F ���toz��U��+��q�ԉ����;x�σ�HK�1��-P
hSo���DWQ×�0��g��#fO��Z��>�Z��? �/�|02I��VO>�-"��[�c�FP�q�A�R�ϡrZ�j,�#?s�����]L.��s�D�����}���	^�_.�Y����%u$�z��翸��v�� �@Ut��ap�2~:����ôAV���2���"��p�u���#���'W��A��a|Y�H�S��5;����7��x���paz	����_|�/~.h �[��#+p��JP9r#��!P��rS@f�lVrB /@Bi��l�	�B��-o~5������#���L �L�떧�����+��.�U0<|�����=���=8h'�gO�|p����B=^��0B�Ű��}p��0�b����(�֕\}�x�ʌ�O�;�v��VR��� ��<���穥�J�5Q��e��-�w���|��l^�Ǜ�:rg	�X-}W�zw_�G&�q���I�R�gO����ٗ�����f�
��n�P�0�tk��ȉ@@2�)'pey�/b��t^��]&���}p��5z��oP[Y���fpQ��S���F�*<��^�El�2���|���x���'����ʼZy��ʄ�-l	��߬�[�d���ABvU�n*'<<q�4��Z���	a*~3�UpQ� s�Q:#:�X;�A�!b�/�L��%nrs܌<y�el.n��9���)��
bj3� �&�s�ɕ,�;��x(��>7��,�6�'Qc�e\ꀴA��}�d��7q#�V�[���ͭ�6m�Y|�T΂;ù"�q� ���'s�+wRq;@#=�uQp|��lǭФ��)^��=�����\���H�5�9jn5��{�CȆ��=�)��m%��נ�X��r�'H�(����u����OUxJm�#�܇Ή�� F���AFy��8��7x@��O6�rb�T��;l�����-�'G?������18@�q�(��8����_��>�:�R���7e�)#�X12y@��� _a�━��X�S�fMi6Y}�<d5DT܂B�zf_��p�('��Y���cq�D�X쌏6?ƣ��qX����!��H���5[�W��u��yۜ�}�>!��:�ϑu������I���ģ��2/vN��Oޚ�R"�͒ȑm�_�����܄U�c�c3q06�'_��߮^S9�ƈ��T��ܩ�9{;q�aYy�����n��}5�wa$|��B��K��
���;.�N�6�Ʊ�b� N��XK���������mHz��a�����-�䝳�r�qmy`�MI�s�<4�#�J�"����!����f-|u�x�+�2L��n��a��){x^_Ϗ^���P�� ����P35�=��ӣ���nA�lUlW�¬���Gx���M#p�8Th�
�����"3W�H=�ES�B ��tC�z<�� 4��T ]�H��>�"t�9�t�x�%T~�o��m8)b5� 6�b�T��5x
�!�ay�)45P"��UF2����U��O4P\!�����l�AP�1�N'G��"�/ I7J]D��EI��������������{q)�ϋa�o���9�N��v������yr���V]"q�	r�hd����f����z7�{AVt�!�gN���M�99sL}!ю�5�nH�BN�	�Y�kxi'���{�EL�^���2^�;z�N����]�{�L:-�-% c��������4w�.�������X� e�&Q�=�`2�!�Rt[%a���1�Bo}ZC�]�Қ��g� X�}L�`4S˶��e��ׯ�_�e+ ��4��x�o�>|�h�8&s��)w�n�ȋV8���=�$,�'xD�c���xt.��w���M��.X��[х�	�����xvr,pH�愈���EI�f9^}��;�w~p��R~r��4L)6�5��r����Y�ۧ�I�Vd�y���f�g������<���s��f��>�'E�BY�Q^�PS�s�����'
�-S�3L�i����K�,�Kn�����{E<dQ�SC�Q(��A(�<��p�!({�M�:(]-���s+DL@���q���>@	���e��ศ|q��F�R���H�i��`�jyC��*x�b7p�NG$_���޴2p1��\'���cz˕�5;⧉�����.r}Yck��k6�N���RC<���f~H��E�O��O��٭q��6uu�P�ֶ ��<�eJN#�x����9��������y{�@>#Z�$@qR�2"/w���y��#^?����b$�z���ԿO_�Z�i?5����M��b�m�����Z^G5��W������&^,�#;(u]b�D�����X!|ʀl�9y���i?��{uo�~K�����b���{���ڭ�x�k-���C:�no���kZ�E�q����B����� S��0nφ��TrxH�0d�E�V�<�h��|���x.iѽ��F���[Fm����+Jd�&D�YBy��,K$oQ�u2���4k���v[���`CM�,��Ż�
0�
��(N+ι��\Ң2�w~��§Ē��^��|�5٣ ��&F�%rQQ-&ڜ+�Ps;�w��Z$m�QA�縎��A�R.��:\
�p�nvM��OA��TM�Hքԯ��Tvs$ǧ��1~�4��\:��m����KN����hr�R�� iLMЄS���>K^�������I��g�R:� .SnY��4�!�-M6��n8&���o����ܛ�]?�{�����[Rm74��	\N@H���Dv.E���	6�8���e�����#/>���x��853� ���j�ķɆ^����w��睷%����r9
��_����}{��'Z����#��-Iޞ�O�@4�v��$� )^;#=r6	hM��Aǐ�Bp
T'5�&X���)F�V����U5��0� V  ������e^�	��% �"�Vmu�Kwv#p����"������:�A=��A�h���bȑ�uT�t��M�\a����b��U|�T���H�8�a�&8j��O w�|q|�NNs;ٙ=���L��m�r �g$�j���`�-"&F^"�@�$ip�4Ǫ����5��̖�����2Ҳ�O�Tx�Y����M�{��n9�k�G8?��yg��nt�j�����\%ؙ��w�db�Y��],\�n��,kL\l]r�=�!B�
-ƉX�m,x�}��h��魇8V�3�r���'uqg~��3��M����ALs�➕�D bҖ<��{���0��&FN���\����n�sй�<�-!�ba��br�^V����n����\jG�>y���O���5?7�5u�o�%S�i������ dd��L�r׹�tQ������j�)�R��f��4W��I��([��˖���N���$9�����^�¸��C�(ӕ��:dk�Pt�f^�����e�Q�(kc�@�nq���r0����xq�	J=��&gG�Alf�X��{p������۷�f�      @      x������ � �      ?   ;  x��[K��>���9&�6��198b�	_d@0�!�q ����-ǹ:���VZ�w����T�M�ə��$�m5�$��Ȫ��Jt�kX�OD';)�_?n�aIu��ë͝��ͽ����j�·'�;��p1�o�៯7�W�r���+��W�]w�/�����
���+ly��3�ŧs�}1�:���I\d����9���J\T�E�E͹�l�5�X~}��
�b��qL����?+�\$1�bN�8&0g����>��b��b�\�~.��8�b������9�\f؎�yMb�i�q�����{��b�B�����p~�O��'�q�~n��?��OӏϹ/`�8�+�i:��lD�鐤
?I걚Z��U2�xYj���**e�U���k?-ؑ�*��B��D�$B�~r���JKESL:��B)��H=����*�(�TTq���JS�Q6[.[:RWE%��. �2B�$t��
Wr����%�#uWT�+�~����1�/�X����]�@w��L�&���a�F�븸/W7V����Á�����rx����7�ç�L��/F���S�N�, �6H���m�� H�����A�մ/���0U�7�yr�y�5��H��C�p������kD���u1q��ҝ�Wh��5��pt����j�p�āE8@80��0���cD���X�ɵ��p+ �=�qzq�"�� �\7<�Ww90��N�c#�x���D��|�����*�:��x�g�1#9ΰ[������Z^_.�_���U}��TU�PM�C��8�
�=DA8��Gr�l|��븬T\0���e_�v��bQM�XT\�#��R��(U�g���BFT%#�El(]�M#�"MQ��(�bP��Hmk����I�bI�~m"�Y���T�hJW\�4�PU+�b�}�ƌ@��FR�\�"}��J�	�*D-U	�*D-�sp�O��Y8l��:�Ob	����2㴘�Ea�^�*Z䪥e���R-��ӋTE��1����x>��3���U����8��%W��֏c�6_���ӳ�qhMC+b���T����!u��sH	Ҭ�yE
sP�����W�|v�/�s���T��k�N ��Y��um��35�)�L�4��ڵ�l�.L���l	��qP�N�"��R���`���\	�Z`�5�	j\5�����|	�[P~7�4��gvQaFU+0�\`�`}Qa%J(т��j@�J�P���-(��5z^-P5�*�T��*���6�1��.�d��JG�*��-8]�W�
2ɂZ= *��$
`�D�ɜj̀R3���Ҍ�D�ͧ��(5jyhΔ˔jq�R�%P�C[���A+NRP��� -y �۷�Ս�e�̷M-���/�m#G����z�R.LK.˅S�D0:�a��=���Z.L)�%f�\�IU�Ќ'\!`�Qv�/�,����Ρp�5<�Q�yy�?iPk�r��ǧ�S�ג&��q[!�s�f4�X��I��PC
��Q'�� ��㓜9I�$����~��DӨHSG�f��'�><�Xi=� e	֩p e`�zNFʐS�Y)Q/'��HD�kr�&ͯ9��iϯa���,u�<Ď��Y�gҞ�ܗ���p��tO��c5<��|��&n�p73�'���w2|t~�n��� �m�pˆ���V�2Y�d�V�j"?��8�d]"�"��d��R.'�lɺ=3{b|>�>�{I�&�G�>'����~sϷ=v��PQtYa9ejݠL�t���-wjj�VE��^���vV�M>!�"�
X$��C��"q�E�,b��Ƕ90mŬ�|�
���� #d{Yd�$z�<�
I���TA�*�H�~tP&��MX����u�f]mu�i�au>�)�ڃR�m�Z�G#�F�<ĭ�j��+��3��d�Ay�B���y�n�v�Sl�lJ���dm��ښ1.L���}3����Z�H9O�6%Y{P���$km�]X��]X��.������Myʶ)eۃR�)��������)ۺ|mݎ��O�Wk��s�>Q>(��v�>n�l���/R��N9m�t��t}��\?�u%o�7S���;0y�"y����0Q��Ȃŉl�J�N4���-�a�E�*�ۚ������󸔳�A9�ɦ�;���9�ɂ�<g��3��CW�W7�������F��T��K��&�Yt|#��Yp�첕�gO'NwJ��T��trſ���X6����n�����=����@�?�)t&��g�m�#9D�_��\P��(�o(�Vv��+�P�m�ҏ��	7Pq�Mh����y1��hpx�ퟳ�_�F���,Q�ᆧ%
��݇`w!�Nk:��&�	7t�:g���"�(9-+RBb��c�凕/�ʓC����*V��(,ȶ���``�������a����C�m0؈�',�\�`؄W4޽����J܄���^�_�N�Y)M7W�5n3��^2����~4�h͡%�g�^��SLRYw�0�M�_����8�so���Y��ҍ�|��<��[���ӆ���)�0iS�NO?�-���JsIk���alÂX����2���6,��$,Sb�]Xv�m`�/f�-��.0��5����h���u ]	�;#�`�J�a�{u�*��&D��F�-:qM�K4{���(z�f/Y��E/�쥪^��M?�k�XA?��O��h�5dzviE��}�����(�k�Q�|S203�k;>tM}m��c_����������G��u���g7�9�j�ӄ���Ӿ�ɼ\��y��5n'x�F�ȽD��O?�����۟�����R�~e��}B���{v��d4ܹ|A�V�����m�#���yȻ��<*�Я�G�=/6_�H��I.(Ҩ�.m|�g�X�}�|X�Fz22L��s#�d�����g7W����P1΍E7�uD���ʢ�̺�9�̺�������-g/��>K�|�f'�iEQ���">���<"Fl��X�t�3��������O�Bi"�U���c�;�W�1�k����_�&tf�}� �|���c�¦:H���Po��K�2=/B���j�y���k���h�BM���Í��P𼕛�G�7��Q��:�8oyzY����%�fN8�mfx�y�G�X��9�+q�V�8wcx>������_IO�&!{B�d���۲b>a��^݃GMo��3=��T*�9ԥ����7�3G��ta}� �fN7��R�h�����ڪlDU�RY+]����:kوP������p'�f�]L�n���K\���l��*����8�XĠv��bQeI��zV�Y��eW��:��Gw���lt7��F�����F����lt_������T��g��*�!�/��/�����Stet5�
t�J?^��,:���J�9�������ȟB��aI�ǿ�%y�(�T�Z�]�qpI�G��&��o}q������a&~�q�(~�0�.��3�<E���/c�F�H$�P9E<v���쳳�44Ӏ@C�L�H@�3�?g&��C�r��
@���MN����L������5�h_���Ϙ
���mL���-�͉X"��Z��w9g���va�ߪ��Kz����p�h����b|�`|O�,�u���&*�C�6h�0�b'�(�QΑ�;Ǘ��r����@�DP�Z��*�Az����h|5����ى`a����^Cr��݉`�[ٰ3�u�zA4k�-C����� �5�s!��3��hX����%�g�2��p&I$��2�$X� �$%����@XР*�����:8k��� �:/i� J:!�i0�3�=��`�!v�������R�      4      x������ � �     