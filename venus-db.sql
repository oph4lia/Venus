--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Postgres.app)
-- Dumped by pg_dump version 16.4 (Postgres.app)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: mikkaeldumancas
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO mikkaeldumancas;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: mikkaeldumancas
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: brand; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.brand (
    brandid integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    foundedyear integer,
    website character varying(255),
    logo character varying(255),
    averagesustainabilityscore numeric(3,2)
);


ALTER TABLE public.brand OWNER TO mikkaeldumancas;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.cart (
    cartid integer NOT NULL,
    userid integer,
    createdat timestamp without time zone,
    updatedat timestamp without time zone
);


ALTER TABLE public.cart OWNER TO mikkaeldumancas;

--
-- Name: cartitem; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.cartitem (
    cartid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer,
    addedat timestamp without time zone
);


ALTER TABLE public.cartitem OWNER TO mikkaeldumancas;

--
-- Name: category; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.category (
    categoryid integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    parentcategoryid integer
);


ALTER TABLE public.category OWNER TO mikkaeldumancas;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.customer (
    userid integer NOT NULL,
    email character varying(255) NOT NULL,
    totalspent numeric(10,2),
    password character varying(255) NOT NULL,
    registrationdate date,
    dob date,
    phonenumber character varying(15),
    lastname character varying(100),
    firstname character varying(100),
    usertype character varying(20),
    lastlogindate date
);


ALTER TABLE public.customer OWNER TO mikkaeldumancas;

--
-- Name: customerorder; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.customerorder (
    orderid integer NOT NULL,
    userid integer,
    orderdate date,
    totalamount numeric(10,2),
    billingaddress text,
    shippingaddress text,
    status character varying(50),
    productid integer
);


ALTER TABLE public.customerorder OWNER TO mikkaeldumancas;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.inventory (
    inventoryid integer NOT NULL,
    productid integer,
    quantity integer,
    lastupdated date
);


ALTER TABLE public.inventory OWNER TO mikkaeldumancas;

--
-- Name: loyaltyprogram; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.loyaltyprogram (
    loyaltyid integer NOT NULL,
    orderid integer,
    productid integer,
    rewardpoints integer,
    rewarddate date
);


ALTER TABLE public.loyaltyprogram OWNER TO mikkaeldumancas;

--
-- Name: loyaltyprogram_loyaltyid_seq; Type: SEQUENCE; Schema: public; Owner: mikkaeldumancas
--

CREATE SEQUENCE public.loyaltyprogram_loyaltyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loyaltyprogram_loyaltyid_seq OWNER TO mikkaeldumancas;

--
-- Name: loyaltyprogram_loyaltyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikkaeldumancas
--

ALTER SEQUENCE public.loyaltyprogram_loyaltyid_seq OWNED BY public.loyaltyprogram.loyaltyid;


--
-- Name: orderitem; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.orderitem (
    orderid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer,
    priceatpurchase numeric(10,2)
);


ALTER TABLE public.orderitem OWNER TO mikkaeldumancas;

--
-- Name: outfit; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.outfit (
    outfitid integer NOT NULL,
    userid integer,
    productid integer,
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    description text,
    name character varying(255)
);


ALTER TABLE public.outfit OWNER TO mikkaeldumancas;

--
-- Name: outfititem; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.outfititem (
    outfitid integer NOT NULL,
    productid integer
);


ALTER TABLE public.outfititem OWNER TO mikkaeldumancas;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.payment (
    paymentid integer NOT NULL,
    orderid integer,
    address text,
    status character varying(50),
    paymentdate date,
    transactionid character varying(255),
    paymentmethod character varying(50),
    amount numeric(10,2)
);


ALTER TABLE public.payment OWNER TO mikkaeldumancas;

--
-- Name: product; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.product (
    productid integer NOT NULL,
    brandid integer,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2),
    material character varying(100),
    stockquality integer,
    dateadded date,
    lastupdated date,
    averagerating numeric(3,2),
    weight numeric(5,2),
    refcategory character varying(50),
    availablesizes character varying(100),
    colors character varying(100),
    dimensions character varying(100),
    waistwidth numeric(5,2),
    chestwidth numeric(5,2),
    shoulderwidth numeric(5,2),
    sleevelength numeric(5,2),
    totallength numeric(5,2),
    producttype character varying(100)
);


ALTER TABLE public.product OWNER TO mikkaeldumancas;

--
-- Name: returnorder; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.returnorder (
    returnid integer NOT NULL,
    orderid integer,
    productid integer,
    userid integer,
    return_date date,
    reason text
);


ALTER TABLE public.returnorder OWNER TO mikkaeldumancas;

--
-- Name: returnorder_returnid_seq; Type: SEQUENCE; Schema: public; Owner: mikkaeldumancas
--

CREATE SEQUENCE public.returnorder_returnid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.returnorder_returnid_seq OWNER TO mikkaeldumancas;

--
-- Name: returnorder_returnid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikkaeldumancas
--

ALTER SEQUENCE public.returnorder_returnid_seq OWNED BY public.returnorder.returnid;


--
-- Name: review; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.review (
    reviewid integer NOT NULL,
    userid integer,
    productid integer,
    reviewdate date,
    rating numeric(2,1),
    comment text
);


ALTER TABLE public.review OWNER TO mikkaeldumancas;

--
-- Name: shipment; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.shipment (
    shipmentid integer NOT NULL,
    orderid integer,
    trackingnumber character varying(255),
    carrier character varying(100),
    shippingdate date,
    estimatedeliverydate date,
    actualdeliverydate date
);


ALTER TABLE public.shipment OWNER TO mikkaeldumancas;

--
-- Name: sustainabilitymetric; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.sustainabilitymetric (
    metricid integer NOT NULL,
    metrictype character varying(100),
    value numeric(10,2),
    productid integer,
    brandid integer,
    brandunit character varying(50),
    productunit character varying(50),
    measurementdata text
);


ALTER TABLE public.sustainabilitymetric OWNER TO mikkaeldumancas;

--
-- Name: useractivity; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.useractivity (
    activityid integer NOT NULL,
    userid integer,
    "timestamp" timestamp without time zone,
    details text,
    activitytype character varying(50)
);


ALTER TABLE public.useractivity OWNER TO mikkaeldumancas;

--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.wishlist (
    wishlistid integer NOT NULL,
    userid integer,
    productid integer,
    createdat timestamp without time zone
);


ALTER TABLE public.wishlist OWNER TO mikkaeldumancas;

--
-- Name: wishlistitem; Type: TABLE; Schema: public; Owner: mikkaeldumancas
--

CREATE TABLE public.wishlistitem (
    wishlistitemid integer NOT NULL,
    wishlistid integer,
    productid integer,
    addedat timestamp without time zone
);


ALTER TABLE public.wishlistitem OWNER TO mikkaeldumancas;

--
-- Name: loyaltyprogram loyaltyid; Type: DEFAULT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.loyaltyprogram ALTER COLUMN loyaltyid SET DEFAULT nextval('public.loyaltyprogram_loyaltyid_seq'::regclass);


--
-- Name: returnorder returnid; Type: DEFAULT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.returnorder ALTER COLUMN returnid SET DEFAULT nextval('public.returnorder_returnid_seq'::regclass);


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.brand (brandid, name, description, foundedyear, website, logo, averagesustainabilityscore) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.cart (cartid, userid, createdat, updatedat) FROM stdin;
\.


--
-- Data for Name: cartitem; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.cartitem (cartid, productid, quantity, addedat) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.category (categoryid, name, description, parentcategoryid) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.customer (userid, email, totalspent, password, registrationdate, dob, phonenumber, lastname, firstname, usertype, lastlogindate) FROM stdin;
\.


--
-- Data for Name: customerorder; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.customerorder (orderid, userid, orderdate, totalamount, billingaddress, shippingaddress, status, productid) FROM stdin;
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.inventory (inventoryid, productid, quantity, lastupdated) FROM stdin;
\.


--
-- Data for Name: loyaltyprogram; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.loyaltyprogram (loyaltyid, orderid, productid, rewardpoints, rewarddate) FROM stdin;
\.


--
-- Data for Name: orderitem; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.orderitem (orderid, productid, quantity, priceatpurchase) FROM stdin;
\.


--
-- Data for Name: outfit; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.outfit (outfitid, userid, productid, createdat, updatedat, description, name) FROM stdin;
\.


--
-- Data for Name: outfititem; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.outfititem (outfitid, productid) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.payment (paymentid, orderid, address, status, paymentdate, transactionid, paymentmethod, amount) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.product (productid, brandid, name, description, price, material, stockquality, dateadded, lastupdated, averagerating, weight, refcategory, availablesizes, colors, dimensions, waistwidth, chestwidth, shoulderwidth, sleevelength, totallength, producttype) FROM stdin;
\.


--
-- Data for Name: returnorder; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.returnorder (returnid, orderid, productid, userid, return_date, reason) FROM stdin;
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.review (reviewid, userid, productid, reviewdate, rating, comment) FROM stdin;
\.


--
-- Data for Name: shipment; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.shipment (shipmentid, orderid, trackingnumber, carrier, shippingdate, estimatedeliverydate, actualdeliverydate) FROM stdin;
\.


--
-- Data for Name: sustainabilitymetric; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.sustainabilitymetric (metricid, metrictype, value, productid, brandid, brandunit, productunit, measurementdata) FROM stdin;
\.


--
-- Data for Name: useractivity; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.useractivity (activityid, userid, "timestamp", details, activitytype) FROM stdin;
\.


--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.wishlist (wishlistid, userid, productid, createdat) FROM stdin;
\.


--
-- Data for Name: wishlistitem; Type: TABLE DATA; Schema: public; Owner: mikkaeldumancas
--

COPY public.wishlistitem (wishlistitemid, wishlistid, productid, addedat) FROM stdin;
\.


--
-- Name: loyaltyprogram_loyaltyid_seq; Type: SEQUENCE SET; Schema: public; Owner: mikkaeldumancas
--

SELECT pg_catalog.setval('public.loyaltyprogram_loyaltyid_seq', 1, false);


--
-- Name: returnorder_returnid_seq; Type: SEQUENCE SET; Schema: public; Owner: mikkaeldumancas
--

SELECT pg_catalog.setval('public.returnorder_returnid_seq', 1, false);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brandid);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);


--
-- Name: cartitem cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.cartitem
    ADD CONSTRAINT cartitem_pkey PRIMARY KEY (cartid, productid);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (userid);


--
-- Name: customerorder customerorder_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.customerorder
    ADD CONSTRAINT customerorder_pkey PRIMARY KEY (orderid);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventoryid);


--
-- Name: loyaltyprogram loyaltyprogram_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.loyaltyprogram
    ADD CONSTRAINT loyaltyprogram_pkey PRIMARY KEY (loyaltyid);


--
-- Name: orderitem orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_pkey PRIMARY KEY (orderid, productid);


--
-- Name: outfit outfit_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.outfit
    ADD CONSTRAINT outfit_pkey PRIMARY KEY (outfitid);


--
-- Name: outfititem outfititem_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.outfititem
    ADD CONSTRAINT outfititem_pkey PRIMARY KEY (outfitid);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);


--
-- Name: returnorder returnorder_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.returnorder
    ADD CONSTRAINT returnorder_pkey PRIMARY KEY (returnid);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (reviewid);


--
-- Name: shipment shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_pkey PRIMARY KEY (shipmentid);


--
-- Name: sustainabilitymetric sustainabilitymetric_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.sustainabilitymetric
    ADD CONSTRAINT sustainabilitymetric_pkey PRIMARY KEY (metricid);


--
-- Name: customerorder unique_order_product; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.customerorder
    ADD CONSTRAINT unique_order_product UNIQUE (orderid, productid);


--
-- Name: customerorder unique_order_product_user; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.customerorder
    ADD CONSTRAINT unique_order_product_user UNIQUE (orderid, productid, userid);


--
-- Name: useractivity useractivity_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivity_pkey PRIMARY KEY (activityid);


--
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (wishlistid);


--
-- Name: wishlistitem wishlistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.wishlistitem
    ADD CONSTRAINT wishlistitem_pkey PRIMARY KEY (wishlistitemid);


--
-- Name: cart cart_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.customer(userid);


--
-- Name: cartitem cartitem_cartid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.cartitem
    ADD CONSTRAINT cartitem_cartid_fkey FOREIGN KEY (cartid) REFERENCES public.cart(cartid);


--
-- Name: cartitem cartitem_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.cartitem
    ADD CONSTRAINT cartitem_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: category category_parentcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_parentcategoryid_fkey FOREIGN KEY (parentcategoryid) REFERENCES public.category(categoryid);


--
-- Name: customerorder customerorder_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.customerorder
    ADD CONSTRAINT customerorder_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: customerorder customerorder_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.customerorder
    ADD CONSTRAINT customerorder_userid_fkey FOREIGN KEY (userid) REFERENCES public.customer(userid);


--
-- Name: inventory inventory_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: loyaltyprogram loyaltyprogram_orderid_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.loyaltyprogram
    ADD CONSTRAINT loyaltyprogram_orderid_productid_fkey FOREIGN KEY (orderid, productid) REFERENCES public.customerorder(orderid, productid);


--
-- Name: orderitem orderitem_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.customerorder(orderid);


--
-- Name: orderitem orderitem_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: outfit outfit_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.outfit
    ADD CONSTRAINT outfit_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: outfit outfit_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.outfit
    ADD CONSTRAINT outfit_userid_fkey FOREIGN KEY (userid) REFERENCES public.customer(userid);


--
-- Name: outfititem outfititem_outfitid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.outfititem
    ADD CONSTRAINT outfititem_outfitid_fkey FOREIGN KEY (outfitid) REFERENCES public.outfit(outfitid);


--
-- Name: outfititem outfititem_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.outfititem
    ADD CONSTRAINT outfititem_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: payment payment_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.customerorder(orderid);


--
-- Name: product product_brandid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brandid_fkey FOREIGN KEY (brandid) REFERENCES public.brand(brandid);


--
-- Name: returnorder returnorder_orderid_productid_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.returnorder
    ADD CONSTRAINT returnorder_orderid_productid_userid_fkey FOREIGN KEY (orderid, productid, userid) REFERENCES public.customerorder(orderid, productid, userid);


--
-- Name: review review_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: review review_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_userid_fkey FOREIGN KEY (userid) REFERENCES public.customer(userid);


--
-- Name: shipment shipment_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.shipment
    ADD CONSTRAINT shipment_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.customerorder(orderid);


--
-- Name: sustainabilitymetric sustainabilitymetric_brandid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.sustainabilitymetric
    ADD CONSTRAINT sustainabilitymetric_brandid_fkey FOREIGN KEY (brandid) REFERENCES public.brand(brandid);


--
-- Name: sustainabilitymetric sustainabilitymetric_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.sustainabilitymetric
    ADD CONSTRAINT sustainabilitymetric_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: useractivity useractivity_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.useractivity
    ADD CONSTRAINT useractivity_userid_fkey FOREIGN KEY (userid) REFERENCES public.customer(userid);


--
-- Name: wishlist wishlist_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: wishlist wishlist_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_userid_fkey FOREIGN KEY (userid) REFERENCES public.customer(userid);


--
-- Name: wishlistitem wishlistitem_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.wishlistitem
    ADD CONSTRAINT wishlistitem_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid);


--
-- Name: wishlistitem wishlistitem_wishlistid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikkaeldumancas
--

ALTER TABLE ONLY public.wishlistitem
    ADD CONSTRAINT wishlistitem_wishlistid_fkey FOREIGN KEY (wishlistid) REFERENCES public.wishlist(wishlistid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: mikkaeldumancas
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

