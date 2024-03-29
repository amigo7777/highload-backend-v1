toc.dat                                                                                             0000600 0004000 0002000 00000023241 14402172276 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           1                {            dns    13.4    13.4 !    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    26339    dns    DATABASE     `   CREATE DATABASE dns WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE dns;
                postgres    false         �            1259    26356    cart    TABLE     �   CREATE TABLE public.cart (
    id integer NOT NULL,
    list character varying,
    sumprice integer,
    buyer character varying,
    customers_id integer NOT NULL
);
    DROP TABLE public.cart;
       public         heap    postgres    false         �            1259    26433    cart_tovars    TABLE     i   CREATE TABLE public.cart_tovars (
    cart_id integer,
    tovars_id integer,
    id integer NOT NULL
);
    DROP TABLE public.cart_tovars;
       public         heap    postgres    false         �            1259    26370 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying NOT NULL,
    password character varying NOT NULL,
    uuid character varying NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false         �            1259    26450    customers_orders    TABLE     s   CREATE TABLE public.customers_orders (
    customers_id integer,
    orders_id integer,
    id integer NOT NULL
);
 $   DROP TABLE public.customers_orders;
       public         heap    postgres    false         �            1259    26416    order_tovar    TABLE     k   CREATE TABLE public.order_tovar (
    orders_id integer,
    tovars_id integer,
    id integer NOT NULL
);
    DROP TABLE public.order_tovar;
       public         heap    postgres    false         �            1259    26348    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    spisok character varying NOT NULL,
    sum_price integer NOT NULL,
    orders_date timestamp without time zone NOT NULL,
    buyer character varying NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    26340    tovars    TABLE     �   CREATE TABLE public.tovars (
    id integer NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL,
    amount integer NOT NULL
);
    DROP TABLE public.tovars;
       public         heap    postgres    false         �          0    26356    cart 
   TABLE DATA           G   COPY public.cart (id, list, sumprice, buyer, customers_id) FROM stdin;
    public          postgres    false    202       3031.dat �          0    26433    cart_tovars 
   TABLE DATA           =   COPY public.cart_tovars (cart_id, tovars_id, id) FROM stdin;
    public          postgres    false    205       3034.dat �          0    26370 	   customers 
   TABLE DATA           =   COPY public.customers (id, name, password, uuid) FROM stdin;
    public          postgres    false    203       3032.dat �          0    26450    customers_orders 
   TABLE DATA           G   COPY public.customers_orders (customers_id, orders_id, id) FROM stdin;
    public          postgres    false    206       3035.dat �          0    26416    order_tovar 
   TABLE DATA           ?   COPY public.order_tovar (orders_id, tovars_id, id) FROM stdin;
    public          postgres    false    204       3033.dat �          0    26348    orders 
   TABLE DATA           K   COPY public.orders (id, spisok, sum_price, orders_date, buyer) FROM stdin;
    public          postgres    false    201       3030.dat �          0    26340    tovars 
   TABLE DATA           9   COPY public.tovars (id, name, price, amount) FROM stdin;
    public          postgres    false    200       3029.dat A           2606    26410    cart cart_customers_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customers_id_key UNIQUE (customers_id);
 D   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_customers_id_key;
       public            postgres    false    202         C           2606    26408    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    202         I           2606    26437    cart_tovars cart_tovars_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.cart_tovars DROP CONSTRAINT cart_tovars_pkey;
       public            postgres    false    205         K           2606    26454 &   customers_orders customers_orders_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customers_orders DROP CONSTRAINT customers_orders_pkey;
       public            postgres    false    206         E           2606    26377    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    203         G           2606    26420    order_tovar order_tovar_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_tovar
    ADD CONSTRAINT order_tovar_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_tovar DROP CONSTRAINT order_tovar_pkey;
       public            postgres    false    204         ?           2606    26355    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    201         =           2606    26347    tovars tovars_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tovars
    ADD CONSTRAINT tovars_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tovars DROP CONSTRAINT tovars_pkey;
       public            postgres    false    200         L           2606    26411    cart cart_customers_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES public.customers(id);
 E   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_customers_id_fkey;
       public          postgres    false    202    2885    203         O           2606    26440 $   cart_tovars cart_tovars_cart_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.cart_tovars DROP CONSTRAINT cart_tovars_cart_id_fkey;
       public          postgres    false    202    205    2883         P           2606    26445 &   cart_tovars cart_tovars_tovars_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_tovars_id_fkey FOREIGN KEY (tovars_id) REFERENCES public.tovars(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.cart_tovars DROP CONSTRAINT cart_tovars_tovars_id_fkey;
       public          postgres    false    200    205    2877         Q           2606    26455 3   customers_orders customers_orders_customers_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.customers_orders DROP CONSTRAINT customers_orders_customers_id_fkey;
       public          postgres    false    203    206    2885         R           2606    26460 0   customers_orders customers_orders_orders_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_orders_id_fkey FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.customers_orders DROP CONSTRAINT customers_orders_orders_id_fkey;
       public          postgres    false    2879    201    206         M           2606    26423 &   order_tovar order_tovar_orders_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tovar
    ADD CONSTRAINT order_tovar_orders_id_fkey FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.order_tovar DROP CONSTRAINT order_tovar_orders_id_fkey;
       public          postgres    false    201    2879    204         N           2606    26428 &   order_tovar order_tovar_tovars_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tovar
    ADD CONSTRAINT order_tovar_tovars_id_fkey FOREIGN KEY (tovars_id) REFERENCES public.tovars(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.order_tovar DROP CONSTRAINT order_tovar_tovars_id_fkey;
       public          postgres    false    204    200    2877                                                                                                                                                                                                                                                                                                                                                                       3031.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3034.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3032.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3035.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3033.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3030.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3029.dat                                                                                            0000600 0004000 0002000 00000000005 14402172276 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000017773 14402172276 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE dns;
--
-- Name: dns; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dns WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE dns OWNER TO postgres;

\connect dns

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    list character varying,
    sumprice integer,
    buyer character varying,
    customers_id integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_tovars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_tovars (
    cart_id integer,
    tovars_id integer,
    id integer NOT NULL
);


ALTER TABLE public.cart_tovars OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying NOT NULL,
    password character varying NOT NULL,
    uuid character varying NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers_orders (
    customers_id integer,
    orders_id integer,
    id integer NOT NULL
);


ALTER TABLE public.customers_orders OWNER TO postgres;

--
-- Name: order_tovar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_tovar (
    orders_id integer,
    tovars_id integer,
    id integer NOT NULL
);


ALTER TABLE public.order_tovar OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    spisok character varying NOT NULL,
    sum_price integer NOT NULL,
    orders_date timestamp without time zone NOT NULL,
    buyer character varying NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: tovars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tovars (
    id integer NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.tovars OWNER TO postgres;

--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, list, sumprice, buyer, customers_id) FROM stdin;
\.
COPY public.cart (id, list, sumprice, buyer, customers_id) FROM '$$PATH$$/3031.dat';

--
-- Data for Name: cart_tovars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_tovars (cart_id, tovars_id, id) FROM stdin;
\.
COPY public.cart_tovars (cart_id, tovars_id, id) FROM '$$PATH$$/3034.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, password, uuid) FROM stdin;
\.
COPY public.customers (id, name, password, uuid) FROM '$$PATH$$/3032.dat';

--
-- Data for Name: customers_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers_orders (customers_id, orders_id, id) FROM stdin;
\.
COPY public.customers_orders (customers_id, orders_id, id) FROM '$$PATH$$/3035.dat';

--
-- Data for Name: order_tovar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_tovar (orders_id, tovars_id, id) FROM stdin;
\.
COPY public.order_tovar (orders_id, tovars_id, id) FROM '$$PATH$$/3033.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, spisok, sum_price, orders_date, buyer) FROM stdin;
\.
COPY public.orders (id, spisok, sum_price, orders_date, buyer) FROM '$$PATH$$/3030.dat';

--
-- Data for Name: tovars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tovars (id, name, price, amount) FROM stdin;
\.
COPY public.tovars (id, name, price, amount) FROM '$$PATH$$/3029.dat';

--
-- Name: cart cart_customers_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customers_id_key UNIQUE (customers_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: cart_tovars cart_tovars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_pkey PRIMARY KEY (id);


--
-- Name: customers_orders customers_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: order_tovar order_tovar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tovar
    ADD CONSTRAINT order_tovar_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: tovars tovars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tovars
    ADD CONSTRAINT tovars_pkey PRIMARY KEY (id);


--
-- Name: cart cart_customers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES public.customers(id);


--
-- Name: cart_tovars cart_tovars_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;


--
-- Name: cart_tovars cart_tovars_tovars_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_tovars
    ADD CONSTRAINT cart_tovars_tovars_id_fkey FOREIGN KEY (tovars_id) REFERENCES public.tovars(id) ON DELETE CASCADE;


--
-- Name: customers_orders customers_orders_customers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: customers_orders customers_orders_orders_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers_orders
    ADD CONSTRAINT customers_orders_orders_id_fkey FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_tovar order_tovar_orders_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tovar
    ADD CONSTRAINT order_tovar_orders_id_fkey FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_tovar order_tovar_tovars_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tovar
    ADD CONSTRAINT order_tovar_tovars_id_fkey FOREIGN KEY (tovars_id) REFERENCES public.tovars(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     