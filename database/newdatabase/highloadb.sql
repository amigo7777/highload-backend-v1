PGDMP     .                    {         
   shopdns_db    13.4    13.4 *    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    26902 
   shopdns_db    DATABASE     g   CREATE DATABASE shopdns_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE shopdns_db;
                postgres    false            �            1259    26903    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         heap    postgres    false            �            1259    27164    cart_tovars    TABLE     j   CREATE TABLE public.cart_tovars (
    carts_id integer,
    tovars_id integer,
    id integer NOT NULL
);
    DROP TABLE public.cart_tovars;
       public         heap    postgres    false            �            1259    27209    carts_id_seq    SEQUENCE     t   CREATE SEQUENCE public.carts_id_seq
    START WITH 5
    INCREMENT BY 1
    MINVALUE 5
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.carts_id_seq;
       public          postgres    false            �            1259    27093    carts    TABLE     1  CREATE TABLE public.carts (
    id integer DEFAULT nextval('public.carts_id_seq'::regclass) NOT NULL,
    list character varying(255) NOT NULL,
    sumprice integer,
    "customerId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.carts;
       public         heap    postgres    false    208            �            1259    27212    customers_id_seq    SEQUENCE     z   CREATE SEQUENCE public.customers_id_seq
    START WITH 13
    INCREMENT BY 1
    MINVALUE 13
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false            �            1259    27082 	   customers    TABLE     X  CREATE TABLE public.customers (
    id integer DEFAULT nextval('public.customers_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    uuid character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false    209            �            1259    27194    customers_orders    TABLE     s   CREATE TABLE public.customers_orders (
    customers_id integer,
    orders_id integer,
    id integer NOT NULL
);
 $   DROP TABLE public.customers_orders;
       public         heap    postgres    false            �            1259    27149    order_tovars    TABLE     l   CREATE TABLE public.order_tovars (
    orders_id integer,
    tovars_id integer,
    id integer NOT NULL
);
     DROP TABLE public.order_tovars;
       public         heap    postgres    false            �            1259    27215    orders_id_seq    SEQUENCE     u   CREATE SEQUENCE public.orders_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false            �            1259    27101    orders    TABLE     �  CREATE TABLE public.orders (
    id integer DEFAULT nextval('public.orders_id_seq'::regclass) NOT NULL,
    spisok character varying(255) NOT NULL,
    "cartId" integer NOT NULL,
    sum_price integer NOT NULL,
    orders_date timestamp with time zone NOT NULL,
    "cstomerId" integer NOT NULL,
    status character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    210            �            1259    27219    tovars_id_seq    SEQUENCE     u   CREATE SEQUENCE public.tovars_id_seq
    START WITH 3
    INCREMENT BY 1
    MINVALUE 3
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tovars_id_seq;
       public          postgres    false            �            1259    27074    tovars    TABLE     3  CREATE TABLE public.tovars (
    id integer DEFAULT nextval('public.tovars_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    amount integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.tovars;
       public         heap    postgres    false    211            �          0    26903    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          postgres    false    200   �2       �          0    27164    cart_tovars 
   TABLE DATA           >   COPY public.cart_tovars (carts_id, tovars_id, id) FROM stdin;
    public          postgres    false    206   �2       �          0    27093    carts 
   TABLE DATA           [   COPY public.carts (id, list, sumprice, "customerId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    203   3       �          0    27082 	   customers 
   TABLE DATA           W   COPY public.customers (id, name, password, uuid, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    202   �3       �          0    27194    customers_orders 
   TABLE DATA           G   COPY public.customers_orders (customers_id, orders_id, id) FROM stdin;
    public          postgres    false    207   �4       �          0    27149    order_tovars 
   TABLE DATA           @   COPY public.order_tovars (orders_id, tovars_id, id) FROM stdin;
    public          postgres    false    205   5       �          0    27101    orders 
   TABLE DATA           }   COPY public.orders (id, spisok, "cartId", sum_price, orders_date, "cstomerId", status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204   -5       �          0    27074    tovars 
   TABLE DATA           S   COPY public.tovars (id, name, price, amount, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    201   6       �           0    0    carts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.carts_id_seq', 6, true);
          public          postgres    false    208            �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 13, true);
          public          postgres    false    209            �           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 4, true);
          public          postgres    false    210            �           0    0    tovars_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tovars_id_seq', 3, true);
          public          postgres    false    211            K           2606    26907     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            postgres    false    200            W           2606    27168    cart_tovars cart_tovars_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.cart_tovars DROP CONSTRAINT cart_tovars_pkey;
       public            postgres    false    206            Q           2606    27098    carts carts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public            postgres    false    203            Y           2606    27198 &   customers_orders customers_orders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customers_orders DROP CONSTRAINT customers_orders_pkey;
       public            postgres    false    207            O           2606    27090    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    202            U           2606    27153    order_tovars order_tovars_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_tovars
    ADD CONSTRAINT order_tovars_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_tovars DROP CONSTRAINT order_tovars_pkey;
       public            postgres    false    205            S           2606    27109    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    204            M           2606    27079    tovars tovars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tovars
    ADD CONSTRAINT tovars_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tovars DROP CONSTRAINT tovars_pkey;
       public            postgres    false    201            \           2606    27169 %   cart_tovars cart_tovars_carts_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_carts_id_fkey FOREIGN KEY (carts_id) REFERENCES public.carts(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.cart_tovars DROP CONSTRAINT cart_tovars_carts_id_fkey;
       public          postgres    false    203    206    2897            ]           2606    27174 &   cart_tovars cart_tovars_tovars_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_tovars_id_fkey FOREIGN KEY (tovars_id) REFERENCES public.tovars(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.cart_tovars DROP CONSTRAINT cart_tovars_tovars_id_fkey;
       public          postgres    false    201    2893    206            ^           2606    27199 3   customers_orders customers_orders_customers_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.customers_orders DROP CONSTRAINT customers_orders_customers_id_fkey;
       public          postgres    false    207    202    2895            _           2606    27204 0   customers_orders customers_orders_orders_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_orders_id_fkey FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.customers_orders DROP CONSTRAINT customers_orders_orders_id_fkey;
       public          postgres    false    204    2899    207            Z           2606    27154 (   order_tovars order_tovars_orders_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tovars
    ADD CONSTRAINT order_tovars_orders_id_fkey FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.order_tovars DROP CONSTRAINT order_tovars_orders_id_fkey;
       public          postgres    false    204    205    2899            [           2606    27159 (   order_tovars order_tovars_tovars_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tovars
    ADD CONSTRAINT order_tovars_tovars_id_fkey FOREIGN KEY (tovars_id) REFERENCES public.tovars(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.order_tovars DROP CONSTRAINT order_tovars_tovars_id_fkey;
       public          postgres    false    205    2893    201            �   S   x�320260607�4�06�M.JM,I�-�/K,*��*�2�����K�K�sSѕ�Z$��K�¤�R��c���� -&�      �      x������ � �      �   �   x��н
�0��9���p~��9 �..R
ڔ���
Ѫ��>���P��d6y�%� P��-�E4�[��+�/I�K��4�bOÜζ�%��`���!t����%^'�?�H2�Zat��H:�BR0DH�scM.�n�{�C���q|�WI���
S�b�      �     x�uнN�0��9}��Q�؎�sa`�X���P��{{*t�Y�[���?�Ӯ�W�"��:.*�.�hHGB��S!�Mq�h�0Z�� �m`�������_T�:�a:����<;�G��S��_*CN���������8:�}q����7Kg|+t�_��t�+��ɉ��u�*01G�D��"`5���P ��@�!vH��6�����RO��q�ߣ�6UoS�t�'{�J
l@t�i�چ4j�����bn����ej^ۦi�$�u�      �      x������ � �      �      x������ � �      �   �   x����n1Dk�+�Gg�Ξ�D�N�"\,�tw>����c�(� �t�y�>��2��[s��"2 HC5G�D5/$�ގn7�i���?�im�%n���ʊ�J��<���%�M�K�ʂ�^L�c���j<Z�6��,��y���OK��>%�U��ch+
��JΣ�s��]!@CT^�H���oe?���r)      �   �   x�uν
�0�9y��%�ޛ���E��t���@�J���.�?t>�|�x-���)�O\�@ ��  ��jDE�\H�����$1��p����Aw\2nUB�FԻ��K�>94�r8)��!a4!�[q��֯M��%�{��W|��+�	�S��ѿ{���)�J�:/     