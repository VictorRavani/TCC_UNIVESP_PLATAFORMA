--
-- PostgreSQL database dump
--

\restrict WGL0y26XMrg02i53JHknr9ap9kFJQaCEihAIq4BoLxRl6fzrcSS2dgMthl2MpGs

-- Dumped from database version 16.3
-- Dumped by pg_dump version 17.10

-- Started on 2026-05-23 14:02:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16910)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id bigint NOT NULL,
    nome character varying(100),
    codigo character varying(50)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16913)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.clientes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16914)
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    id integer NOT NULL,
    codigo character varying(30) NOT NULL,
    descricao character varying(150) NOT NULL
);


ALTER TABLE public.material OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16917)
-- Name: material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 218
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_id_seq OWNED BY public.material.id;


--
-- TOC entry 219 (class 1259 OID 16918)
-- Name: operador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operador (
    id bigint NOT NULL,
    nome character varying,
    codigo bigint,
    status boolean
);


ALTER TABLE public.operador OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16923)
-- Name: operador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.operador_id_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 220
-- Name: operador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operador_id_seq OWNED BY public.operador.id;


--
-- TOC entry 221 (class 1259 OID 16924)
-- Name: ordem_de_producao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordem_de_producao (
    id integer NOT NULL,
    numero_op character varying(255),
    quantidade double precision,
    id_produto bigint,
    data_entrega date,
    id_material integer,
    numero_qualidade character varying(50),
    id_tratamento bigint,
    id_cliente integer,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status_id integer DEFAULT 1
);


ALTER TABLE public.ordem_de_producao OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16929)
-- Name: ordem_de_producao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordem_de_producao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordem_de_producao_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 222
-- Name: ordem_de_producao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordem_de_producao_id_seq OWNED BY public.ordem_de_producao.id;


--
-- TOC entry 223 (class 1259 OID 16930)
-- Name: processos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.processos (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.processos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16933)
-- Name: processos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.processos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.processos_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 224
-- Name: processos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.processos_id_seq OWNED BY public.processos.id;


--
-- TOC entry 225 (class 1259 OID 16934)
-- Name: producao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producao (
    id bigint NOT NULL,
    dt_inicio timestamp without time zone,
    dt_fim timestamp without time zone,
    status integer,
    qtde_produzida bigint,
    id_operador integer,
    id_ordem_de_producao bigint,
    id_processo bigint NOT NULL,
    id_operador_fim integer
);


ALTER TABLE public.producao OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16937)
-- Name: producao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producao_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 226
-- Name: producao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producao_id_seq OWNED BY public.producao.id;


--
-- TOC entry 227 (class 1259 OID 16938)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id bigint NOT NULL,
    nome character varying,
    codigo character varying(100)
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16943)
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 228
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 229 (class 1259 OID 16944)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16947)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.status_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 230
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- TOC entry 231 (class 1259 OID 16948)
-- Name: tratamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratamentos (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.tratamentos OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16951)
-- Name: tratamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tratamentos_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 232
-- Name: tratamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratamentos_id_seq OWNED BY public.tratamentos.id;


--
-- TOC entry 233 (class 1259 OID 16952)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    setor character varying,
    senha character varying,
    usuario character varying,
    privilegio bigint
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16957)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 234
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4733 (class 2604 OID 16958)
-- Name: material id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material ALTER COLUMN id SET DEFAULT nextval('public.material_id_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16959)
-- Name: operador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operador ALTER COLUMN id SET DEFAULT nextval('public.operador_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16960)
-- Name: ordem_de_producao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao ALTER COLUMN id SET DEFAULT nextval('public.ordem_de_producao_id_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 16961)
-- Name: processos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processos ALTER COLUMN id SET DEFAULT nextval('public.processos_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16962)
-- Name: producao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao ALTER COLUMN id SET DEFAULT nextval('public.producao_id_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16963)
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 16964)
-- Name: status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16965)
-- Name: tratamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamentos ALTER COLUMN id SET DEFAULT nextval('public.tratamentos_id_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 16966)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4937 (class 0 OID 16910)
-- Dependencies: 215
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, codigo) FROM stdin;
9	EATON CAXIAS	6
10	EATON VALINHOS	30
11	CUMMINS-MERITOR	37
12	CONFORMETAL	41
13	ZF AUTOMOTIVE	103
\.


--
-- TOC entry 4939 (class 0 OID 16914)
-- Dependencies: 217
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material (id, codigo, descricao) FROM stdin;
3	MP180	NBR5915 EEP 1,50X1200X2000
4	MP24	NBR5915 EEP 1,06X1200X2000
5	MP23	NBR5915 EEP 1,06X1200X2000
6	MP3	NBR5906 EP DO 4,00X1200X2000
7	MP5	NBR5906 EP DO 2,55X1200X2000
8	MP115	NBR5007 G2 L590 0,25X230XROLO
9	MP600	NBR6662 SAE 1070 CO 1,00X87XROLO
10	MP882	NBR6662 SAE 1070 TR 0,95X95XROLO
11	MP667	EN10084 2008 16MNCR5 4,00X245X950
\.


--
-- TOC entry 4941 (class 0 OID 16918)
-- Dependencies: 219
-- Data for Name: operador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operador (id, nome, codigo, status) FROM stdin;
36	EDNILSON MOREIRA DOS SANTOS	618	\N
37	LUIS CARLOS CRISTIANO	1134	\N
38	FIDELICIO PEREIRA SILVA	1566	\N
39	GILMAR ADAO AZEVEDO	1194	\N
40	FERNANDO SANTOS SOUZA	1209	\N
41	JOSE DA SILVA CAMPOS	1266	\N
42	THIAGO DA SILVA LIMA	1280	\N
43	EDINALDO JESUS DOS SANTOS	1315	\N
44	ISAIAS GOMES SILVA	1362	\N
45	ANDRE LUIZ DOS SANTOS	1364	\N
46	ARNALDO POPPI	1390	\N
47	WASHINGTON LUIZ DA SILVA	1453	\N
48	VALTER DE SOUZA MOREIRA	1455	\N
49	JOÃO MAICO PEREIRA DOS SANTOS	1514	\N
50	UBIRACI PEREIRA DA SILVA	1520	\N
51	PAULO HENRIQUE CRUZ DE SOUZA	1522	\N
52	LUIZ RICARDO PEREIRA DA SILVA	1526	\N
54	ELIZEU PEREIRA DA SILVA	1533	\N
55	VINICIUS SOUZA DE OLIVEIRA	1542	\N
56	RICARDO PELIZARI	1545	\N
57	FRANCISCO CHAGAS DA SILVA	1546	\N
58	EDMUNDO JOSE DE ALMEIDA	1549	\N
59	ANDRE DE ALBUQUERQUE PINTO	1551	\N
60	MARCELO CAMPAGHOLI VISLOVSKY	1553	\N
61	EDSON JOSÉ DA SILVA	1557	\N
62	PAULO ROBERTO DE JESUS SANTOS	1558	\N
63	EDSON GARDINO ALVES DA SILVA	1559	\N
64	IVONETE DA SILVA CAMPOS	1561	\N
65	ROGERIO SEBASTIÃO SABINO	1562	\N
66	MATHEUS SANTIAGO DOS SANTOS	1564	\N
67	DIEGO PARAIZO BRAGA	1567	\N
68	MAYKO VINICIUS SANTANA PRESTES	1568	\N
69	GUSTAVO FERREIRA RODRIGUES	1569	\N
70	NOEL DOS SANTOS	1570	\N
71	DANIEL VIEIRA FELIPE	1572	\N
72	YASMIM VICTORIA DE BRITO BELARMINO	1573	\N
73	LARISSA DE SOUZA OLIVEIRA	1574	\N
53	ANDERSON DE BARROS LIMA	1528	\N
74	ALYSSON FIUZA DOMINGUES	1575	\N
\.


--
-- TOC entry 4943 (class 0 OID 16924)
-- Dependencies: 221
-- Data for Name: ordem_de_producao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordem_de_producao (id, numero_op, quantidade, id_produto, data_entrega, id_material, numero_qualidade, id_tratamento, id_cliente, data_criacao, status_id) FROM stdin;
92	Acúmolo de Lixo	119871650	2387	2026-05-24	7	-23.525112, -46.723563	1	9	2026-05-23 11:50:55.294412	1
93	Queda de arvore em dois carros	11987168029	2374	2026-05-22	10	-23.542153, -46.692796	1	13	2026-05-23 12:15:33.325919	3
94	Arvore	11987168029	2373	2026-05-26	10	-23.525923, -46.678698	2	13	2026-05-23 12:26:55.574384	4
95	rtrrtr	445454545454	2373	2026-05-22	10	-23.559581, -46.721420	2	13	2026-05-23 13:26:24.265601	1
\.


--
-- TOC entry 4945 (class 0 OID 16930)
-- Dependencies: 223
-- Data for Name: processos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.processos (id, nome) FROM stdin;
2	Estamparia
3	Solda
5	Envio para terceiros
6	Recebimento (terceiros)
1	Materia-Prima
4	Retifica
7	Inspecao final
8	Expedicao
\.


--
-- TOC entry 4947 (class 0 OID 16934)
-- Dependencies: 225
-- Data for Name: producao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producao (id, dt_inicio, dt_fim, status, qtde_produzida, id_operador, id_ordem_de_producao, id_processo, id_operador_fim) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 16938)
-- Dependencies: 227
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, codigo) FROM stdin;
2374	7789	Queda de árvores
2375	7512	Alagamentos
2373	4584	Descarte irregular de resíduos
2387	4454	Danos em infraestrutura urbana
\.


--
-- TOC entry 4951 (class 0 OID 16944)
-- Dependencies: 229
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, nome) FROM stdin;
2	Em Produção
3	Finalizado
4	Cancelado
1	Aguardando
\.


--
-- TOC entry 4953 (class 0 OID 16948)
-- Dependencies: 231
-- Data for Name: tratamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratamentos (id, nome) FROM stdin;
1	Témico
2	Geral
3	Amostra
4	Não Conforme
\.


--
-- TOC entry 4955 (class 0 OID 16952)
-- Dependencies: 233
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, setor, senha, usuario, privilegio) FROM stdin;
1	\N	$2b$12$P6Tg4mQe70YDibcTZtuW1uwYDDCrFTln2cBEs23hsxZmC5eHnInka	adm	3
102	\N	$2b$12$vz5J17yhCM.9Grj79sxm0eyT/ch9/eLYX29mF.nthpQUHh5IVYCFq	admin	3
98	solda	$2b$12$BVu3famj7mdVvE4ggxTyM.ndXQfUj0WPN9u/Zafq8JgYkCyS7.W8y	solda2	1
103	materia_prima	$2b$12$mG4ut4DFn9/AfvdqdYoFNuJQqyqKdqSNbkJfQYM9.avfYfLYlpaN.	Teste	1
\.


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 216
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 15, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 218
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_id_seq', 11, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 220
-- Name: operador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operador_id_seq', 83, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 222
-- Name: ordem_de_producao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordem_de_producao_id_seq', 95, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 224
-- Name: processos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.processos_id_seq', 8, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 226
-- Name: producao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producao_id_seq', 341, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 228
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 2391, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 230
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 4, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 232
-- Name: tratamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratamentos_id_seq', 1, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 234
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 103, true);


--
-- TOC entry 4745 (class 2606 OID 16968)
-- Name: clientes clientes_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_codigo_unique UNIQUE (codigo);


--
-- TOC entry 4747 (class 2606 OID 16970)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 16972)
-- Name: material material_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_codigo_key UNIQUE (codigo);


--
-- TOC entry 4751 (class 2606 OID 16974)
-- Name: material material_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_codigo_unique UNIQUE (codigo);


--
-- TOC entry 4753 (class 2606 OID 16976)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 16978)
-- Name: ordem_de_producao numero_op_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT numero_op_unique UNIQUE (numero_op);


--
-- TOC entry 4755 (class 2606 OID 16980)
-- Name: operador operador_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operador
    ADD CONSTRAINT operador_codigo_unique UNIQUE (codigo);


--
-- TOC entry 4757 (class 2606 OID 16982)
-- Name: operador operador_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operador
    ADD CONSTRAINT operador_pk PRIMARY KEY (id);


--
-- TOC entry 4759 (class 2606 OID 16984)
-- Name: operador operador_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operador
    ADD CONSTRAINT operador_un UNIQUE (codigo);


--
-- TOC entry 4763 (class 2606 OID 16986)
-- Name: ordem_de_producao ordem_de_producao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT ordem_de_producao_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 16988)
-- Name: processos processos_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processos
    ADD CONSTRAINT processos_nome_key UNIQUE (nome);


--
-- TOC entry 4767 (class 2606 OID 16990)
-- Name: processos processos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.processos
    ADD CONSTRAINT processos_pkey PRIMARY KEY (id);


--
-- TOC entry 4770 (class 2606 OID 16992)
-- Name: producao producao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao
    ADD CONSTRAINT producao_pk PRIMARY KEY (id);


--
-- TOC entry 4773 (class 2606 OID 17058)
-- Name: produtos produtos_codigo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_codigo_unique UNIQUE (codigo);


--
-- TOC entry 4775 (class 2606 OID 16996)
-- Name: produtos produtos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pk PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 16998)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 17000)
-- Name: tratamentos tratamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamentos
    ADD CONSTRAINT tratamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 17060)
-- Name: produtos unique_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT unique_codigo UNIQUE (codigo);


--
-- TOC entry 4783 (class 2606 OID 17004)
-- Name: usuarios usuarios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (id);


--
-- TOC entry 4768 (class 1259 OID 17005)
-- Name: idx_producao_processo_data; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_producao_processo_data ON public.producao USING btree (id_processo, dt_fim);


--
-- TOC entry 4771 (class 1259 OID 17061)
-- Name: produtos_codigo_un; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX produtos_codigo_un ON public.produtos USING btree (codigo);


--
-- TOC entry 4784 (class 2606 OID 17007)
-- Name: ordem_de_producao fk_material; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT fk_material FOREIGN KEY (id_material) REFERENCES public.material(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4789 (class 2606 OID 17012)
-- Name: producao fk_operador_fim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao
    ADD CONSTRAINT fk_operador_fim FOREIGN KEY (id_operador_fim) REFERENCES public.operador(id);


--
-- TOC entry 4785 (class 2606 OID 17017)
-- Name: ordem_de_producao fk_ordem_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT fk_ordem_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 4786 (class 2606 OID 17022)
-- Name: ordem_de_producao fk_ordem_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT fk_ordem_produto FOREIGN KEY (id_produto) REFERENCES public.produtos(id);


--
-- TOC entry 4787 (class 2606 OID 17027)
-- Name: ordem_de_producao fk_ordem_tratamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT fk_ordem_tratamento FOREIGN KEY (id_tratamento) REFERENCES public.tratamentos(id);


--
-- TOC entry 4790 (class 2606 OID 17032)
-- Name: producao fk_producao_ordem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao
    ADD CONSTRAINT fk_producao_ordem FOREIGN KEY (id_ordem_de_producao) REFERENCES public.ordem_de_producao(id);


--
-- TOC entry 4791 (class 2606 OID 17037)
-- Name: producao fk_producao_processo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao
    ADD CONSTRAINT fk_producao_processo FOREIGN KEY (id_processo) REFERENCES public.processos(id);


--
-- TOC entry 4788 (class 2606 OID 17042)
-- Name: ordem_de_producao fk_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordem_de_producao
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES public.status(id);


--
-- TOC entry 4792 (class 2606 OID 17047)
-- Name: producao producao_fk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao
    ADD CONSTRAINT producao_fk_4 FOREIGN KEY (id_operador) REFERENCES public.operador(id);


--
-- TOC entry 4793 (class 2606 OID 17052)
-- Name: producao producao_operador_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producao
    ADD CONSTRAINT producao_operador_fk FOREIGN KEY (id_operador) REFERENCES public.operador(id);


-- Completed on 2026-05-23 14:02:23

--
-- PostgreSQL database dump complete
--

\unrestrict WGL0y26XMrg02i53JHknr9ap9kFJQaCEihAIq4BoLxRl6fzrcSS2dgMthl2MpGs

