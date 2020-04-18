--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: administrators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrators (
    id integer NOT NULL,
    user_id integer NOT NULL,
    username text,
    status text
);


ALTER TABLE public.administrators OWNER TO postgres;

--
-- Name: administrators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrators_id_seq OWNER TO postgres;

--
-- Name: administrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;


--
-- Name: audios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audios (
    id integer NOT NULL,
    caption text NOT NULL,
    audio_id text NOT NULL
);


ALTER TABLE public.audios OWNER TO postgres;

--
-- Name: audios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audios_id_seq OWNER TO postgres;

--
-- Name: audios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audios_id_seq OWNED BY public.audios.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.levels (
    id integer NOT NULL,
    level character varying(2) NOT NULL
);


ALTER TABLE public.levels OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.levels_id_seq OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;


--
-- Name: subthemes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subthemes (
    id integer NOT NULL,
    subtheme text,
    translation text,
    level_id integer,
    audio_id integer,
    theme_id integer
);


ALTER TABLE public.subthemes OWNER TO postgres;

--
-- Name: subthemes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subthemes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subthemes_id_seq OWNER TO postgres;

--
-- Name: subthemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subthemes_id_seq OWNED BY public.subthemes.id;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    theme text,
    level_id integer
);


ALTER TABLE public.themes OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.themes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_id_seq OWNER TO postgres;

--
-- Name: themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.themes_id_seq OWNED BY public.themes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    username text,
    status text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: word_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.word_types (
    id integer NOT NULL,
    type character varying(20) NOT NULL
);


ALTER TABLE public.word_types OWNER TO postgres;

--
-- Name: word_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.word_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.word_types_id_seq OWNER TO postgres;

--
-- Name: word_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.word_types_id_seq OWNED BY public.word_types.id;


--
-- Name: words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.words (
    id integer NOT NULL,
    word text NOT NULL,
    subtheme_id integer NOT NULL,
    level_id integer,
    type_id integer NOT NULL,
    translation text
);


ALTER TABLE public.words OWNER TO postgres;

--
-- Name: words_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.words_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.words_id_seq OWNER TO postgres;

--
-- Name: words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.words_id_seq OWNED BY public.words.id;


--
-- Name: administrators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);


--
-- Name: audios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audios ALTER COLUMN id SET DEFAULT nextval('public.audios_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: subthemes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subthemes ALTER COLUMN id SET DEFAULT nextval('public.subthemes_id_seq'::regclass);


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: word_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_types ALTER COLUMN id SET DEFAULT nextval('public.word_types_id_seq'::regclass);


--
-- Name: words id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words ALTER COLUMN id SET DEFAULT nextval('public.words_id_seq'::regclass);


--
-- Data for Name: administrators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrators (id, user_id, username, status) FROM stdin;
\.


--
-- Data for Name: audios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audios (id, caption, audio_id) FROM stdin;
\.


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.levels (id, level) FROM stdin;
1	A1
4	A2
5	B1
\.


--
-- Data for Name: subthemes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subthemes (id, subtheme, translation, level_id, audio_id, theme_id) FROM stdin;
1	ANIMALS	\N	1	\N	1
2	BIRDS	\N	1	\N	1
3	FISH AND SELLFISH	\N	1	\N	1
4	INSECTS, WORMS, ETC	\N	1	\N	1
5	APPERANCE	\N	1	\N	2
6	BODY	\N	1	\N	2
7	CLOTHES AND FASHION	\N	1	\N	2
8	COLORS AND SHAPES	\N	1	\N	2
9	LANGUAGE	\N	1	\N	3
10	PHONES, EMAIL AND THE INTERNET	\N	1	\N	3
11	ART	\N	1	\N	4
12	FILM AND THEATRE	\N	1	\N	4
13	LITERATURE AND WRITING	\N	1	\N	4
14	MUSIC	\N	1	\N	4
15	TV, RADIO AND NEWS	\N	1	\N	4
16	COOKING AND EATING	\N	1	\N	5
17	DRINKS	\N	1	\N	5
18	FOOD	\N	1	\N	5
19	DISCUSSION AND AGREEMENT	\N	1	\N	6
20	DOUBT, GUESSING AND CERTAINTY	\N	1	\N	6
21	OPINION AND ARGUMENT	\N	1	\N	6
22	PERMISSION AND OBLIGATION	\N	1	\N	6
23	PREFERENCES AND DECISIONS	\N	1	\N	6
24	SUGGESTIONS AND ADVICE	\N	1	\N	6
25	HEALTH AND FITNESS	\N	1	\N	7
26	ILLNESS	\N	1	\N	7
27	MEDICINE	\N	1	\N	7
28	BUILDINGS	\N	1	\N	8
29	GARDENS	\N	1	\N	8
30	HOUSE AND HOMES	\N	1	\N	9
31	GAMES AND TOYS	\N	1	\N	10
32	HOBBIES	\N	1	\N	10
33	SHOPPING	\N	1	\N	10
34	CHANGE, CAUSE AND EFFECT	\N	1	\N	11
35	DANGER	\N	1	\N	11
36	DIFFICULTY AND FAILURE	\N	1	\N	11
37	SUCCESS	\N	1	\N	11
38	EDUCATION	\N	1	\N	12
39	FAMILY AND RELATIONSHIPS	\N	1	\N	12
40	FEELINGS	\N	1	\N	12
41	LIFE STAGES	\N	1	\N	12
42	PERSONAL QUALITIES	\N	1	\N	12
43	CRIME AND PUNISHMENT	\N	1	\N	13
44	LAW AND JUSTICE	\N	1	\N	13
45	PEOPLE IN SOCIETY	\N	1	\N	13
46	-	\N	1	\N	14
47	SOCIAL ISSUES	\N	1	\N	14
48	WAR AND CONFLICT	\N	1	\N	14
49	BIOLOGY	\N	1	\N	15
50	ENGINEERING	\N	1	\N	15
51	MATH AND MEASUREMENT	\N	1	\N	15
52	PHYSICS AND CHEMISTRY	\N	1	\N	15
53	SCIENTIFIC RESEARCH	\N	1	\N	15
54	SPORT: BALL AND RACKET SPORTS	\N	1	\N	16
55	SPORTS: OTHER SPORTS	\N	1	\N	16
56	SPORTS: WATER SPORTS	\N	1	\N	16
57	FARMING	\N	1	\N	17
58	GEOGRAPHY	\N	1	\N	17
59	PLANTS AND TREES	\N	1	\N	17
60	THE ENVIRONMENT	\N	1	\N	17
61	WEATHER	\N	1	\N	17
62	HISTORY	\N	1	\N	18
63	SPACE	\N	1	\N	18
64	TIME	\N	1	\N	18
65	HOLIDAYS	\N	1	\N	19
66	TRANSPORT BY AIR	\N	1	\N	19
67	TRANSPORT BY BUS AND TRAIN	\N	1	\N	19
68	TRANSPORT BY CAR OR LORRY	\N	1	\N	19
69	TRANSPORT BY WATER	\N	1	\N	19
70	BUSINESS	\N	1	\N	20
71	JOBS	\N	1	\N	20
72	MONEY	\N	1	\N	20
73	WORKING LIFE	\N	1	\N	20
75	ANIMALS	\N	4	\N	23
76	BIRDS	\N	4	\N	23
77	FISH AND SHELLFISH	\N	4	\N	23
78	INSECTS, WORMS, ETC	\N	4	\N	23
79	APPERANCE	\N	4	\N	24
80	BODY	\N	4	\N	24
81	CLOTHES AND FASHION	\N	4	\N	24
82	COLORS AND SHAPES	\N	4	\N	24
83	LANGUAGE	\N	4	\N	25
84	PHONES, EMAIL AND THE INTERNET	\N	4	\N	25
85	ART	\N	4	\N	26
86	FILM AND THEATRE	\N	4	\N	26
87	LITERATURE AND WRITING	\N	4	\N	26
88	MUSIC	\N	4	\N	26
89	TV, RADIO AND NEWS	\N	4	\N	26
90	COOKING AND EATING	\N	4	\N	27
91	DRINKS	\N	4	\N	27
92	FOOD	\N	4	\N	27
93	DISCUSSION AND AGREEMENT	\N	4	\N	28
94	DOUBT, GUESSING AND CERTAINTY	\N	4	\N	28
95	OPINION AND ARGUMENT	\N	4	\N	28
96	PERMISSION AND OBLIGATION	\N	4	\N	28
97	PREFERENCES AND DECISIONS	\N	4	\N	28
98	SUGGESTIONS AND ADVICE	\N	4	\N	28
99	HEALTH AND FITNESS	\N	4	\N	29
100	ILLNESS	\N	4	\N	29
101	MEDICINE	\N	4	\N	29
102	BUILDINGS	\N	4	\N	30
103	GARDENS	\N	4	\N	30
104	HOUSES AND HOMES	\N	4	\N	30
105	GAMES AND TOYS	\N	4	\N	31
106	HOBBIES	\N	4	\N	31
107	SHOPPING	\N	4	\N	31
108	CHANGE, CAUSE AND EFFECT	\N	4	\N	32
109	DANGER	\N	4	\N	32
110	DIFFICULTY AND FAILURE	\N	4	\N	32
111	SUCCESS	\N	4	\N	32
112	EDUCATION	\N	4	\N	33
113	FAMILY AND RELATIONSHIPS	\N	4	\N	33
114	FEELINGS	\N	4	\N	33
115	LIFE STAGES	\N	4	\N	33
116	PERSONAL QUALITIES	\N	4	\N	33
117	CRIME AND PUNISHMENT	\N	4	\N	34
118	LAW AND JUSTICE	\N	4	\N	34
119	PEOPLE IN SOCIETY	\N	4	\N	34
120	POLITICS	\N	4	\N	34
121	RELIGION AND FESTIVALS	\N	4	\N	34
122	SOCIAL ISSUES	\N	4	\N	34
123	WAR AND CONFLICT	\N	4	\N	34
124	BIOLOGY	\N	4	\N	35
125	COMPUTERS	\N	4	\N	35
126	ENGINEERING	\N	4	\N	35
127	MATH AND MEASUREMENT	\N	4	\N	35
128	PHYSICS AND CHEMISTRY	\N	4	\N	35
129	SCIENTIFIC RESEARCH	\N	4	\N	35
130	SPORT: BALL AND RACKET SPORTS	\N	4	\N	36
131	SPORTS: OTHER SPORTS	\N	4	\N	36
132	SPORTS: WATER SPORTS	\N	4	\N	36
133	FARMING	\N	4	\N	37
134	GEOGRAPHY	\N	4	\N	37
135	PLANTS AND TREES	\N	4	\N	37
136	THE ENVIRONMENT	\N	4	\N	37
137	WEATHER	\N	4	\N	37
138	HISTORY	\N	4	\N	38
139	SPACE	\N	4	\N	38
140	TIME	\N	4	\N	38
141	HOLIDAYS	\N	4	\N	39
142	TRANSPORT BY AIR	\N	4	\N	39
143	TRANSPORT BY BUS AND TRAIN	\N	4	\N	39
144	TRANSPORT BY CAR OR LORRY	\N	4	\N	39
145	TRANSPORT BY WATER	\N	4	\N	39
146	BUSINESS	\N	4	\N	40
147	JOBS	\N	4	\N	40
148	MONEY	\N	4	\N	40
149	WORKING LIFE	\N	4	\N	40
150	ANIMALS	\N	5	\N	41
151	BIRDS	\N	5	\N	41
152	FISH AND SHELLFISH	\N	5	\N	41
153	INSECTS, WORMS, ETC	\N	5	\N	41
154	APPERANCE	\N	5	\N	42
155	BODY	\N	5	\N	42
156	CLOTHES AND FASHIONa	\N	5	\N	42
157	COLORS AND SHAPES	\N	5	\N	42
158	LANGUAGE	\N	5	\N	43
159	PHONES, EMAIL AND THE INTERNET	\N	5	\N	43
160	ART	\N	5	\N	44
161	FILM AND THEATRE	\N	5	\N	44
162	LITERATURE AND WRITING	\N	5	\N	44
163	MUSIC	\N	5	\N	44
164	TV, RADIO AND NEWS	\N	5	\N	44
165	COOKING AND EATING	\N	5	\N	45
166	DRINKS	\N	5	\N	45
167	FOOD	\N	5	\N	45
168	DISCUSSION AND AGREEMENT	\N	5	\N	46
169	DOUBT, GUESSING AND CERTAINTY	\N	5	\N	46
170	OPINION AND ARGUMENT	\N	5	\N	46
171	PERMISSION AND OBLIGATION	\N	5	\N	46
172	PREFERENCES AND DECISIONS	\N	5	\N	46
173	SUGGESTIONS AND ADVICE	\N	5	\N	46
174	HEALTH AND FITNESS	\N	5	\N	47
175	ILLNESS	\N	5	\N	47
176	MEDICINE	\N	5	\N	47
177	BUILDINGS	\N	5	\N	48
178	GARDENS	\N	5	\N	48
179	HOUSE AND HOMES	\N	5	\N	48
180	GAMES AND TOYS	\N	5	\N	49
181	HOBBIES	\N	5	\N	49
182	SHOPPING	\N	5	\N	49
183	CHANGE, CAUSE AND EFFECT	\N	5	\N	50
184	DANGER	\N	5	\N	50
185	DIFFICULTY AND FAILURE	\N	5	\N	50
186	SUCCESS	\N	5	\N	50
187	EDUCATION	\N	5	\N	51
188	FAMILY AND RELATIONSHIPS	\N	5	\N	51
189	FEELINGS	\N	5	\N	51
190	LIFE STAGES	\N	5	\N	51
191	PERSONAL QUALITIES	\N	5	\N	51
192	CRIME AND PUNISHMENT	\N	5	\N	52
193	LAW AND JUSTICE	\N	5	\N	52
194	PEOPLE IN SOCIETY	\N	5	\N	52
195	POLITICS	\N	5	\N	52
196	RELIGION AND FESTIVALS	\N	5	\N	52
197	SOCIAL ISSUES	\N	5	\N	52
198	WAR AND CONFLICT	\N	5	\N	52
199	BIOLOGY	\N	5	\N	53
200	COMPUTERS	\N	5	\N	53
201	ENGINEERING	\N	5	\N	53
202	MATH AND MEASUREMENT	\N	5	\N	53
203	PHYSICS AND CHEMISTRY	\N	5	\N	53
204	SCIENTIFIC RESEARCH	\N	5	\N	53
205	SPORT: BALL AND RACKET SPORTS	\N	5	\N	54
206	SPORTS: OTHER SPORTS	\N	5	\N	54
207	SPORTS: WATER SPORTS	\N	5	\N	54
208	FARMING	\N	5	\N	55
209	GEOGRAPHY	\N	5	\N	55
210	PLANTS AND TREES	\N	5	\N	55
211	THE ENVIRONMENT	\N	5	\N	55
212	WEATHER	\N	5	\N	55
213	HISTORY	\N	5	\N	56
214	SPACE	\N	5	\N	56
215	TIME	\N	5	\N	56
216	HOLIDAYS	\N	5	\N	57
217	TRANSPORT BY AIR	\N	5	\N	57
218	TRANSPORT BY BUS AND TRAIN	\N	5	\N	57
219	TRANSPORT BY CAR OR LORRY	\N	5	\N	57
220	TRANSPORT BY WATER	\N	5	\N	57
221	BUSINESS	\N	5	\N	58
222	JOBS	\N	5	\N	58
223	MONEY	\N	5	\N	58
224	WORKING LIFE	\N	5	\N	58
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, theme, level_id) FROM stdin;
1	ANIMALS	1
2	APPERANCE	1
3	COMMUNICATION	1
4	CULTURE	1
5	FOOD AND DRINK	1
6	FUNCTIONS	1
7	HEALTH	1
8	HOMES AND BUILDINGS	1
9	swimming pool nounA1.	1
10	LEISURE	1
11	NOTIONS	1
12	PEOPLE	1
13	POLITICS AND SOCIETY	1
14	POLITICS	1
15	SCIENCE AND TECHNOLOGY	1
16	SPORT	1
17	THE NATURAL WORLD	1
18	TIME AND SPACE	1
19	TRAVEL	1
20	WORK AND BUSINESS	1
23	ANIMALS	4
24	APPERANCE	4
25	COMMUNICATION	4
26	CULTURE	4
27	FOOD AND DRINK	4
28	FUNCTIONS	4
29	HEALTH	4
30	HOMES AND BUILDINGS	4
31	LEISURE	4
32	NOTIONS	4
33	PEOPLE	4
34	POLITICS AND SOCIETY	4
35	SCIENCE AND TECHNOLOGY	4
36	SPORT	4
37	THE NATURAL WORLD	4
38	TIME AND SPACE	4
39	TRAVEL	4
40	WORK AND BUSINESS	4
41	ANIMALS	5
42	APPERANCE	5
43	COMMUNICATION	5
44	CULTURE	5
45	FOOD AND DRINK	5
46	FUNCTIONS	5
47	HEALTH	5
48	HOMES AND BUILDINGS	5
49	LEISURE	5
50	NOTIONS	5
51	PEOPLE	5
52	POLITICS AND SOCIETY	5
53	SCIENCE AND TECHNOLOGY	5
54	SPORT	5
55	THE NATURAL WORLD	5
56	TIME AND SPACE	5
57	TRAVEL	5
58	WORK AND BUSINESS	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_id, username, status) FROM stdin;
\.


--
-- Data for Name: word_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word_types (id, type) FROM stdin;
1	noun
2	verb
3	adjective
4	preposition
5	exclamation
6	conjunction
7	idiom
8	determiner
9	number
10	form
11	adverb
12	abbreviation
13	liter
14	
\.


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words (id, word, subtheme_id, level_id, type_id, translation) FROM stdin;
1	animal	1	1	1	\N
2	cat	1	1	1	\N
3	cow	1	1	1	\N
4	dog	1	1	1	\N
5	elephant	1	1	1	\N
6	horse	1	1	1	\N
7	lion	1	1	1	\N
8	mouse	1	1	1	\N
9	pig	1	1	1	\N
10	sheep	1	1	1	\N
11	snake	1	1	1	\N
12	bird	2	1	1	\N
13	chicken	2	1	1	\N
14	egg	2	1	1	\N
15	egg	3	1	1	\N
16	fish	3	1	1	\N
17	swim	3	1	2	\N
18	egg	4	1	1	\N
19	beautiful	5	1	3	\N
20	blonde	5	1	3	\N
21	dark	5	1	3	\N
22	fat	5	1	3	\N
23	gray	5	1	3	\N
24	grey	5	1	3	\N
25	hair	5	1	1	\N
26	long	5	1	3	\N
27	pretty	5	1	3	\N
28	red	5	1	3	\N
29	short	5	1	3	\N
30	tall	5	1	3	\N
31	arm	6	1	1	\N
32	back	6	1	1	\N
33	body	6	1	1	\N
34	ear	6	1	1	\N
35	eye	6	1	1	\N
36	face	6	1	1	\N
37	foot	6	1	1	\N
38	hair	6	1	1	\N
39	hand	6	1	1	\N
40	head	6	1	1	\N
41	leg	6	1	1	\N
42	mouth	6	1	1	\N
43	nose	6	1	2	\N
44	tooth	6	1	1	\N
45	bag	7	1	1	\N
46	boot	7	1	1	\N
47	clothes	7	1	1	\N
48	coat	7	1	1	\N
49	dress	7	1	1	\N
50	dress	7	1	2	\N
51	glass	7	1	1	\N
52	hat	7	1	1	\N
53	jacket	7	1	1	\N
54	jeans	7	1	1	\N
55	leg	7	1	1	\N
56	pair	7	1	1	\N
57	shirt	7	1	1	\N
58	shoe	7	1	1	\N
59	skirt	7	1	1	\N
60	specs	7	1	1	\N
61	style	7	1	1	\N
62	sweater	7	1	1	\N
63	trousers	7	1	1	\N
64	T-shirt	7	1	1	\N
65	watch	7	1	1	\N
66	wear	7	1	1	\N
67	black	8	1	3	\N
68	black	8	1	1	\N
69	blonde	8	1	3	\N
70	blue	8	1	2	\N
71	brown	8	1	3	\N
72	brown	8	1	1	\N
73	color	8	1	1	\N
74	color	8	1	2	\N
75	colour	8	1	1	\N
76	dark	8	1	3	\N
77	gray	8	1	3	\N
78	green	8	1	3	\N
79	green	8	1	1	\N
80	grey	8	1	3	\N
81	grey	8	1	1	\N
82	light	8	1	3	\N
83	line	8	1	1	\N
84	orange	8	1	1	\N
85	orange	8	1	3	\N
86	pink	8	1	3	\N
87	pink	8	1	1	\N
88	purple	8	1	3	\N
89	purple	8	1	1	\N
90	red	8	1	2	\N
91	white	8	1	3	\N
92	white	8	1	1	\N
93	yellow	8	1	3	\N
94	yellow	8	1	1	\N
95	adjective	9	1	1	\N
96	adverb	9	1	1	\N
97	alphabet	9	1	1	\N
98	countable	9	1	3	\N
99	count noun	9	1	1	\N
100	English	9	1	1	\N
101	form	9	1	1	\N
102	form	9	1	2	\N
103	French	9	1	1	\N
104	future	9	1	1	\N
105	German	9	1	1	\N
106	infinitive	9	1	1	\N
107	Italian	9	1	1	\N
108	language	9	1	1	\N
109	negative	9	1	3	\N
110	noun	9	1	1	\N
111	paragraph	9	1	1	\N
112	past	9	1	3	\N
113	past	9	1	1	\N
114	phrasal verb	9	1	1	\N
115	phrase	9	1	1	\N
116	plural	9	1	1	\N
117	plural	9	1	3	\N
118	positive	9	1	3	\N
119	practise	9	1	2	\N
120	preposition	9	1	1	\N
121	present	9	1	1	\N
122	pronoun	9	1	1	\N
123	pronunciation	9	1	1	\N
124	sentence	9	1	1	\N
125	singular	9	1	1	\N
126	singular	9	1	3	\N
127	Spanish	9	1	1	\N
128	spell	9	1	2	\N
129	spelling	9	1	1	\N
130	the present tense	9	1	1	\N
131	subject	9	1	1	\N
132	tense	9	1	1	\N
133	uncountable	9	1	3	\N
134	uncount noun	9	1	1	\N
135	verb	9	1	1	\N
136	word	9	1	1	\N
137	address	10	1	1	\N
138	at	10	1	4	\N
139	blog	10	1	1	\N
140	call	10	1	2	\N
141	call	10	1	1	\N
142	car phone	10	1	1	\N
143	cell phone	10	1	1	\N
144	email	10	1	1	\N
145	favourite	10	1	1	\N
146	internet	10	1	1	\N
147	message	10	1	1	\N
148	number	10	1	1	\N
149	online	10	1	3	\N
150	page	10	1	1	\N
151	phone	10	1	1	\N
152	phone	10	1	2	\N
153	phone call	10	1	1	\N
154	phone number	10	1	1	\N
155	send	10	1	1	\N
156	telephone	10	1	1	\N
157	telephone	10	1	2	\N
158	telephone call	10	1	1	\N
159	telephone number	10	1	1	\N
160	text	10	1	1	\N
161	text message	10	1	1	\N
162	visit	10	1	2	\N
163	visit	10	1	1	\N
164	website	10	1	1	\N
165	art	11	1	1	\N
166	artist	11	1	1	\N
167	design	11	1	1	\N
168	draw	11	1	2	\N
169	paint	11	1	2	\N
170	painting	11	1	1	\N
171	actor	12	1	1	\N
172	actress	12	1	1	\N
173	camera	12	1	1	\N
174	cinema	12	1	1	\N
175	dialogue	12	1	1	\N
176	DVD	12	1	1	\N
177	film	12	1	1	\N
178	film star	12	1	1	\N
179	movie	12	1	1	\N
180	movie star	12	1	1	\N
181	movie theater	12	1	1	\N
182	play	12	1	1	\N
183	sound	12	1	1	\N
184	star	12	1	1	\N
185	theatre	12	1	1	\N
186	beginning	13	1	1	\N
187	book	13	1	1	\N
188	description	13	1	1	\N
189	dialogue	13	1	1	\N
190	end	13	1	1	\N
191	letter	13	1	1	\N
192	line	13	1	1	\N
193	magazine	13	1	1	\N
194	page	13	1	1	\N
195	report	13	1	1	\N
196	story	13	1	1	\N
197	text	13	1	1	\N
198	title	13	1	1	\N
199	write	13	1	2	\N
200	writer	13	1	1	\N
201	writing	13	1	1	\N
202	band	14	1	1	\N
203	CD	14	1	1	\N
204	concert	14	1	1	\N
205	festival	14	1	1	\N
206	group	14	1	1	\N
207	guitar	14	1	1	\N
208	listen	14	1	2	\N
209	music	14	1	1	\N
210	piano	14	1	1	\N
211	piece	14	1	1	\N
212	play	14	1	2	\N
213	player	14	1	1	\N
214	practice	14	1	1	\N
215	practise	14	1	2	\N
216	radio	14	1	1	\N
217	sing	14	1	2	\N
218	singer	14	1	1	\N
219	song	14	1	1	\N
220	write	14	1	2	\N
221	article	15	1	1	\N
222	camera	15	1	1	\N
223	film	15	1	1	\N
224	interview	15	1	1	\N
225	interview	15	1	2	\N
226	listen	15	1	2	\N
227	magazine	15	1	1	\N
228	news	15	1	1	\N
229	newspaper	15	1	1	\N
230	picture	15	1	1	\N
231	play	15	1	1	\N
232	programme	15	1	1	\N
233	quiz	15	1	1	\N
234	radio	15	1	1	\N
235	reader	15	1	1	\N
236	report	15	1	1	\N
237	show	15	1	1	\N
238	star	15	1	1	\N
239	television	15	1	1	\N
240	TV	15	1	1	\N
241	video	15	1	1	\N
242	watch	15	1	2	\N
243	weather	15	1	1	\N
244	bill	16	1	1	\N
245	bottle	16	1	1	\N
246	breakfast	16	1	1	\N
247	cafe	16	1	1	\N
248	Christmas	16	1	1	\N
249	cook	16	1	2	\N
250	cooking	16	1	1	\N
251	delicious	16	1	3	\N
252	diet	16	1	1	\N
253	dinner	16	1	1	\N
254	dish	16	1	1	\N
255	eat	16	1	2	\N
256	eating	16	1	1	\N
257	food	16	1	1	\N
258	glass	16	1	1	\N
259	healthy	16	1	3	\N
260	kitchen	16	1	1	\N
261	lunch	16	1	1	\N
262	main	16	1	3	\N
263	meal	16	1	1	\N
264	menu	16	1	1	\N
265	order	16	1	2	\N
266	prepare	16	1	2	\N
267	restaurant	16	1	1	\N
268	tea	16	1	1	\N
269	waiter	16	1	1	\N
270	beer	17	1	1	\N
271	Coca-Cola™	17	1	1	\N
272	coffee	17	1	1	\N
273	drink	17	1	1	\N
274	drink	17	1	2	\N
275	ice	17	1	1	\N
276	juice	17	1	1	\N
277	milk	17	1	1	\N
278	orange	17	1	1	\N
279	tea	17	1	1	\N
280	thirsty	17	1	3	\N
281	water	17	1	1	\N
282	wine	17	1	2	\N
283	apple	18	1	1	\N
284	banana	18	1	1	\N
285	bread	18	1	1	\N
286	butter	18	1	1	\N
287	cake	18	1	1	\N
288	carrot	18	1	1	\N
289	cheese	18	1	1	\N
290	chicken	18	1	1	\N
291	chocolate	18	1	1	\N
292	cream	18	1	1	\N
293	egg	18	1	1	\N
294	fish	18	1	1	\N
295	fruit	18	1	1	\N
296	green vegetable	18	1	1	\N
297	ham	18	1	1	\N
298	ice cream	18	1	1	\N
299	meat	18	1	1	\N
300	onion	18	1	1	\N
301	pepper	18	1	1	\N
302	pizza	18	1	1	\N
303	potato	18	1	1	\N
304	rice	18	1	1	\N
305	salad	18	1	1	\N
306	salt	18	1	1	\N
307	sandwich	18	1	1	\N
308	soup	18	1	1	\N
309	sugar	18	1	1	\N
310	tomato	18	1	1	\N
311	vegetable	18	1	1	\N
312	white bread	18	1	1	\N
313	discuss	19	1	2	\N
314	OK	19	1	5	\N
315	believe	20	1	2	\N
316	guess	20	1	2	\N
317	guess	20	1	1	\N
318	know	20	1	2	\N
319	maybead	20	1	2	\N
320	possible	20	1	3	\N
321	probablyad	20	1	2	\N
322	true	20	1	3	\N
323	advice	21	1	1	\N
324	agree	21	1	2	\N
325	believe	21	1	2	\N
326	but	21	1	6	\N
327	cool	21	1	3	\N
328	difference	21	1	1	\N
329	different	21	1	3	\N
330	excuse me	21	1	7	\N
331	guess	21	1	2	\N
332	guess	21	1	1	\N
333	I’m sorry	21	1	7	\N
334	like	21	1	4	\N
335	maybead	21	1	2	\N
336	mistake	21	1	1	\N
337	no	21	1	1	\N
338	of	21	1	4	\N
339	OK	21	1	5	\N
340	opinion	21	1	1	\N
341	point	21	1	1	\N
342	reallyad	21	1	2	\N
343	right	21	1	3	\N
344	statement	21	1	1	\N
345	think	21	1	2	\N
346	well	21	1	5	\N
347	yeah	21	1	5	\N
348	yes	21	1	5	\N
349	have tomodal	22	1	2	\N
350	mustmodal	22	1	2	\N
351	no	22	1	8	\N
352	OK	22	1	5	\N
353	rule	22	1	1	\N
354	choose	23	1	2	\N
355	decide	23	1	2	\N
356	hate	23	1	2	\N
357	like	23	1	2	\N
358	love	23	1	2	\N
359	prefer	23	1	2	\N
360	wouldmodal	23	1	2	\N
361	advice	24	1	1	\N
362	how about…?	24	1	7	\N
363	how/what about…?	24	1	7	\N
364	idea	24	1	1	\N
365	let	24	1	2	\N
366	maybead	24	1	2	\N
367	what about…?	24	1	7	\N
368	exercise	25	1	1	\N
369	exercise	25	1	2	\N
370	fine	25	1	3	\N
371	good	25	1	3	\N
372	gym	25	1	1	\N
373	health	25	1	1	\N
374	healthy	25	1	3	\N
375	run	25	1	2	\N
376	strong	25	1	3	\N
377	walk	25	1	2	\N
378	well	25	1	3	\N
379	cold	26	1	1	\N
380	cut	26	1	2	\N
381	get	26	1	2	\N
382	give	26	1	2	\N
383	have	26	1	2	\N
384	improve	26	1	2	\N
385	sick	26	1	3	\N
386	terrible	26	1	3	\N
387	doctor	27	1	1	\N
388	hospital	27	1	1	\N
389	nurse	27	1	1	\N
390	build	28	1	2	\N
391	building	28	1	1	\N
392	center	28	1	1	\N
393	centre	28	1	1	\N
394	cinema	28	1	1	\N
395	design	28	1	1	\N
396	design	28	1	2	\N
397	downstairsad	28	1	2	\N
398	downstairs	28	1	1	\N
399	flat	28	1	1	\N
400	floor	28	1	1	\N
401	glass	28	1	1	\N
402	hospital	28	1	1	\N
403	hotel	28	1	1	\N
404	house	28	1	1	\N
405	library	28	1	1	\N
406	modern	28	1	3	\N
407	movie theater	28	1	1	\N
408	museum	28	1	1	\N
409	post office	28	1	1	\N
410	school	28	1	1	\N
411	station	28	1	1	\N
412	street	28	1	1	\N
413	swimming pool	28	1	1	\N
414	theatre	28	1	1	\N
415	upstairsad	28	1	2	\N
416	upstairs	28	1	1	\N
417	wall	28	1	1	\N
418	window	28	1	1	\N
419	garden	29	1	1	\N
420	garden	29	1	2	\N
421	grow	29	1	2	\N
422	apartment	30	1	1	\N
423	bath	30	1	1	\N
424	bathroom	30	1	1	\N
425	bed	30	1	1	\N
426	bedroom	30	1	1	\N
427	buy	30	1	2	\N
428	chair	30	1	1	\N
429	clean	30	1	2	\N
430	desk	30	1	1	\N
431	dining room	30	1	1	\N
432	door	30	1	1	\N
433	downstairsad	30	1	2	\N
434	downstairs	30	1	1	\N
435	flat	30	1	1	\N
436	floor	30	1	1	\N
437	front	30	1	1	\N
438	home	30	1	1	\N
439	house	30	1	1	\N
440	kitchen	30	1	1	\N
441	library	30	1	1	\N
442	light	30	1	1	\N
443	living room	30	1	1	\N
444	office	30	1	1	\N
445	paint	30	1	1	\N
446	paint	30	1	2	\N
447	picture	30	1	1	\N
448	room	30	1	1	\N
449	sell	30	1	1	\N
450	shower	30	1	1	\N
451	sofa	30	1	1	\N
452	table	30	1	1	\N
453	telephone	30	1	1	\N
454	television	30	1	1	\N
455	toilet	30	1	1	\N
456	upstairsad	30	1	2	\N
457	upstairs	30	1	1	\N
458	wall	30	1	1	\N
459	wash	30	1	2	\N
460	window	30	1	1	\N
461	ball	31	1	1	\N
462	computer game	31	1	1	\N
463	fun	31	1	1	\N
464	game	31	1	1	\N
465	lose	31	1	2	\N
466	play	31	1	2	\N
467	player	31	1	1	\N
468	quiz	31	1	1	\N
469	rule	31	1	1	\N
470	team	31	1	1	\N
471	turn	31	1	1	\N
472	video game	31	1	1	\N
473	win	31	1	2	\N
474	activity	32	1	1	\N
475	art	32	1	1	\N
476	cooking	32	1	1	\N
477	dance	32	1	1	\N
478	dance	32	1	2	\N
479	dancer	32	1	1	\N
480	dancing	32	1	1	\N
481	hobby	32	1	1	\N
482	interest	32	1	1	\N
483	music	32	1	1	\N
484	painting	32	1	1	\N
485	reading	32	1	1	\N
486	relax	32	1	2	\N
487	shopping	32	1	1	\N
488	writing	32	1	1	\N
489	bag	33	1	1	\N
490	banknote	33	1	1	\N
491	bill	33	1	1	\N
492	book	33	1	1	\N
493	buy	33	1	2	\N
494	center	33	1	1	\N
495	centre	33	1	1	\N
496	cheap	33	1	3	\N
497	close	33	1	2	\N
498	cost	33	1	2	\N
499	customer	33	1	1	\N
500	expensive	33	1	3	\N
501	game	33	1	1	\N
502	internet	33	1	1	\N
503	list	33	1	1	\N
504	market	33	1	1	\N
505	music	33	1	1	\N
506	online	33	1	3	\N
507	pay	33	1	2	\N
508	price	33	1	1	\N
509	product	33	1	1	\N
510	sell	33	1	1	\N
511	shoe	33	1	1	\N
512	shop	33	1	1	\N
513	shopping	33	1	1	\N
514	shop window	33	1	1	\N
515	spend	33	1	2	\N
516	supermarket	33	1	1	\N
517	window	33	1	1	\N
518	because	34	1	6	\N
519	because of	34	1	4	\N
520	change	34	1	2	\N
521	change	34	1	1	\N
522	grow	34	1	2	\N
523	happen	34	1	2	\N
524	improve	34	1	2	\N
525	reason	34	1	1	\N
526	result	34	1	1	\N
527	afraid	35	1	3	\N
528	dangerous	35	1	3	\N
529	help	35	1	1	\N
530	difficult	36	1	3	\N
531	hard	36	1	3	\N
532	hardad	36	1	2	\N
533	lose	36	1	2	\N
534	mistake	36	1	1	\N
535	problem	36	1	1	\N
536	do	37	1	2	\N
537	success	37	1	1	\N
538	win	37	1	2	\N
539	answer	38	1	1	\N
540	art	38	1	1	\N
541	book	38	1	1	\N
542	class	38	1	1	\N
543	classmate	38	1	1	\N
544	classroom	38	1	1	\N
545	college	38	1	1	\N
546	course	38	1	3	\N
547	desk	38	1	1	\N
548	dictionary	38	1	1	\N
549	English	38	1	1	\N
550	exam	38	1	1	\N
551	exercise	38	1	1	\N
552	geography	38	1	1	\N
553	gym	38	1	1	\N
554	high school	38	1	1	\N
555	history	38	1	1	\N
556	homework	38	1	1	\N
557	learn	38	1	2	\N
558	learner	38	1	1	\N
559	lesson	38	1	1	\N
560	library	38	1	1	\N
561	music	38	1	1	\N
562	practise	38	1	2	\N
563	project	38	1	1	\N
564	result	38	1	1	\N
565	school	38	1	1	\N
566	science	38	1	1	\N
567	student	38	1	1	\N
568	study	38	1	1	\N
569	study	38	1	2	\N
570	subject	38	1	1	\N
571	teach	38	1	2	\N
572	teacher	38	1	1	\N
573	test	38	1	1	\N
574	test	38	1	2	\N
575	text	38	1	1	\N
576	university	38	1	1	\N
577	year	38	1	1	\N
578	aunt	39	1	1	\N
579	boyfriend	39	1	1	\N
580	brother	39	1	1	\N
581	cousin	39	1	1	\N
582	dad	39	1	1	\N
583	daughter	39	1	1	\N
584	family	39	1	1	\N
585	father	39	1	1	\N
586	first cousin	39	1	1	\N
587	friend	39	1	1	\N
588	girlfriend	39	1	1	\N
589	grandad	39	1	1	\N
590	grandchild	39	1	1	\N
591	granddaughter	39	1	1	\N
592	grandfather	39	1	1	\N
593	grandma	39	1	1	\N
594	grandmother	39	1	1	\N
595	grandpa	39	1	1	\N
596	grandparent	39	1	1	\N
597	grandson	39	1	1	\N
598	husband	39	1	1	\N
599	leave	39	1	2	\N
600	love	39	1	1	\N
601	mom	39	1	1	\N
602	mother	39	1	1	\N
603	mum	39	1	1	\N
604	name	39	1	1	\N
605	neighbour	39	1	1	\N
606	sister	39	1	1	\N
607	son	39	1	1	\N
608	togetherad	39	1	2	\N
609	uncle	39	1	1	\N
610	wife	39	1	1	\N
611	afraid	40	1	3	\N
612	angry	40	1	3	\N
613	bored	40	1	1	\N
614	feellinking	40	1	2	\N
615	feeling	40	1	1	\N
616	fun	40	1	1	\N
617	happy	40	1	3	\N
618	hate	40	1	2	\N
619	hope	40	1	2	\N
620	hungry	40	1	3	\N
621	interest	40	1	1	\N
622	laugh	40	1	2	\N
623	laugh	40	1	1	\N
624	love	40	1	1	\N
625	love	40	1	2	\N
626	OK	40	1	3	\N
627	sad	40	1	3	\N
628	sorry	40	1	3	\N
629	terrible	40	1	3	\N
630	thirsty	40	1	3	\N
631	tired	40	1	3	\N
632	adult	41	1	1	\N
633	baby	41	1	1	\N
634	born	41	1	2	\N
635	boy	41	1	1	\N
636	child	41	1	1	\N
637	die	41	1	2	\N
638	family	41	1	1	\N
639	father	41	1	1	\N
640	girl	41	1	1	\N
641	gray	41	1	3	\N
642	grey	41	1	3	\N
643	man	41	1	1	\N
644	married	41	1	3	\N
645	mother	41	1	1	\N
646	old	41	1	3	\N
647	parent	41	1	1	\N
648	teenager	41	1	1	\N
649	woman	41	1	1	\N
650	young	41	1	3	\N
651	bad	42	1	3	\N
652	difficult	42	1	3	\N
653	friendly	42	1	3	\N
654	good	42	1	3	\N
655	nice	42	1	3	\N
656	skill	42	1	1	\N
657	sure	42	1	3	\N
658	body	43	1	1	\N
659	passport	44	1	1	\N
660	police	44	1	1	\N
661	policeman	44	1	1	\N
662	policewoman	44	1	1	\N
663	black	45	1	3	\N
664	group	45	1	1	\N
665	man	45	1	1	\N
666	poor	45	1	3	\N
667	rich	45	1	3	\N
668	white	45	1	3	\N
669	woman	45	1	1	\N
670	believe	46	1	2	\N
671	birthday	46	1	1	\N
672	Christmas	46	1	1	\N
673	new year	46	1	1	\N
674	party	46	1	1	\N
675	give	47	1	2	\N
676	help	47	1	2	\N
677	help	47	1	1	\N
678	job	47	1	1	\N
679	poor	47	1	3	\N
680	problem	47	1	1	\N
681	dangerous	48	1	3	\N
682	computer	49	1	1	\N
683	DVD	49	1	1	\N
684	language	49	1	1	\N
685	menu	49	1	1	\N
686	mouse	49	1	1	\N
687	open	49	1	2	\N
688	video	49	1	1	\N
689	break	50	1	2	\N
690	clock	50	1	1	\N
691	machine	50	1	1	\N
692	add	51	1	2	\N
693	graph	51	1	1	\N
694	hundred	51	1	9	\N
695	kilometre	51	1	1	\N
696	metre	51	1	1	\N
697	mile	51	1	1	\N
698	million	51	1	9	\N
699	number	51	1	1	\N
700	thousand	51	1	9	\N
701	light	52	1	1	\N
702	sun	52	1	1	\N
703	fact	53	1	1	\N
704	result	53	1	1	\N
705	science	53	1	1	\N
706	scientist	53	1	1	\N
707	Association football	54	1	1	\N
708	ball	54	1	1	\N
709	club	54	1	1	\N
710	football	54	1	1	\N
711	half	54	1	1	\N
712	line	54	1	1	\N
713	match	54	1	1	\N
714	play	54	1	2	\N
715	player	54	1	1	\N
716	result	54	1	1	\N
717	sport	54	1	1	\N
718	team	54	1	1	\N
719	tennis	54	1	1	\N
720	bicycle	55	1	1	\N
721	bike	55	1	1	\N
722	exercise	55	1	1	\N
723	exercise	55	1	2	\N
724	gym	55	1	1	\N
725	horse	55	1	1	\N
726	ride	55	1	1	\N
727	sport	55	1	1	\N
728	boat	56	1	1	\N
729	swim	56	1	2	\N
730	swimming	56	1	1	\N
731	swimming pool	56	1	1	\N
732	water sports	56	1	1	\N
733	farm	57	1	1	\N
734	farmer	57	1	1	\N
735	fruit	57	1	1	\N
736	grow	57	1	2	\N
737	rice	57	1	1	\N
738	vegetable	57	1	1	\N
739	Africa	58	1	1	\N
740	area	58	1	1	\N
741	Asia	58	1	1	\N
742	beach	58	1	1	\N
743	cold	58	1	3	\N
744	country	58	1	1	\N
745	east	58	1	1	\N
746	east	58	1	3	\N
747	Europe	58	1	1	\N
748	geography	58	1	1	\N
749	hot	58	1	3	\N
750	island	58	1	1	\N
751	map	58	1	1	\N
752	mountain	58	1	1	\N
753	north	58	1	1	\N
754	north	58	1	3	\N
755	North America	58	1	1	\N
756	river	58	1	1	\N
757	sea	58	1	1	\N
758	south	58	1	1	\N
759	south	58	1	3	\N
760	South America	58	1	1	\N
761	town	58	1	1	\N
762	village	58	1	1	\N
763	west	58	1	1	\N
764	west	58	1	3	\N
765	flower	59	1	1	\N
766	plant	59	1	1	\N
767	tree	59	1	1	\N
768	air	60	1	1	\N
769	clean	60	1	3	\N
770	natural	60	1	3	\N
771	air	61	1	1	\N
772	bad	61	1	3	\N
773	change	61	1	2	\N
774	change	61	1	1	\N
775	cold	61	1	3	\N
776	cool	61	1	3	\N
777	dark	61	1	3	\N
778	east	61	1	3	\N
779	good	61	1	3	\N
780	hot	61	1	3	\N
781	ice	61	1	1	\N
782	north	61	1	3	\N
783	rain	61	1	1	\N
784	snow	61	1	1	\N
785	snow	61	1	2	\N
786	south	61	1	3	\N
787	sun	61	1	1	\N
788	sunny	61	1	3	\N
789	umbrella	61	1	1	\N
790	warm	61	1	3	\N
791	weather	61	1	1	\N
792	west	61	1	3	\N
793	century	62	1	1	\N
794	date	62	1	1	\N
795	history	62	1	1	\N
796	modern	62	1	3	\N
797	past	62	1	3	\N
798	past	62	1	2	\N
799	period	62	1	1	\N
800	outer space	63	1	1	\N
801	space	63	1	1	\N
802	star	63	1	1	\N
803	sun	63	1	1	\N
804	after	64	1	4	\N
805	afternoon	64	1	1	\N
806	agoad	64	1	2	\N
807	April	64	1	1	\N
808	August	64	1	1	\N
809	autumn	64	1	1	\N
810	before	64	1	4	\N
811	century	64	1	1	\N
812	date	64	1	1	\N
813	day	64	1	1	\N
814	December	64	1	1	\N
815	during	64	1	4	\N
816	early	64	1	3	\N
817	evening	64	1	1	\N
818	February	64	1	1	\N
819	Friday	64	1	1	\N
820	half past one, two, etc.	64	1	7	\N
821	hour	64	1	1	\N
822	in	64	1	4	\N
823	in the morning	64	1	7	\N
824	January	64	1	1	\N
825	July	64	1	1	\N
826	June	64	1	1	\N
827	justad	64	1	2	\N
828	last	64	1	8	\N
829	late	64	1	3	\N
830	latead	64	1	2	\N
831	March	64	1	1	\N
832	May	64	1	1	\N
833	midnight	64	1	1	\N
834	minute	64	1	1	\N
835	moment	64	1	1	\N
836	Monday	64	1	1	\N
837	month	64	1	1	\N
838	morning	64	1	1	\N
839	neverad	64	1	2	\N
840	night	64	1	1	\N
841	November	64	1	1	\N
842	October	64	1	1	\N
843	oftenad	64	1	2	\N
844	on	64	1	4	\N
845	o’clockad	64	1	2	\N
846	past	64	1	2	\N
847	period	64	1	1	\N
848	present	64	1	3	\N
849	quarter	64	1	1	\N
850	Saturday	64	1	1	\N
851	second	64	1	1	\N
852	September	64	1	1	\N
853	sometimesad	64	1	2	\N
854	spring	64	1	1	\N
855	summer	64	1	1	\N
856	Sunday	64	1	1	\N
857	Thursday	64	1	1	\N
858	time	64	1	1	\N
859	todayad	64	1	2	\N
860	today	64	1	1	\N
861	tomorrowad	64	1	2	\N
862	tomorrow	64	1	1	\N
863	tonight	64	1	1	\N
864	Tuesday	64	1	1	\N
865	usuallyad	64	1	2	\N
866	Wednesday	64	1	1	\N
867	week	64	1	3	\N
868	weekend	64	1	1	\N
869	winter	64	1	1	\N
870	year	64	1	1	\N
871	yesterdayad	64	1	2	\N
872	yesterday	64	1	1	\N
873	apartment	65	1	1	\N
874	beach	65	1	1	\N
875	desk	65	1	1	\N
876	holiday	65	1	1	\N
877	hotel	65	1	1	\N
878	journey	65	1	1	\N
879	passport	65	1	1	\N
880	pool	65	1	1	\N
881	room	65	1	1	\N
882	sea	65	1	1	\N
883	stay	65	1	2	\N
884	tourist	65	1	1	\N
885	trip	65	1	1	\N
886	vacation	65	1	1	\N
887	visitor	65	1	1	\N
888	airplane	66	1	3	\N
889	airport	66	1	1	\N
890	flight	66	1	1	\N
891	fly	66	1	2	\N
892	passport	66	1	1	\N
893	plane	66	1	3	\N
894	sick	66	1	3	\N
895	bus	67	1	1	\N
896	bus station	67	1	1	\N
897	bus stop	67	1	1	\N
898	get	67	1	2	\N
899	office	67	1	1	\N
900	station	67	1	1	\N
901	stop	67	1	1	\N
902	take	67	1	2	\N
903	ticket	67	1	1	\N
904	train	67	1	1	\N
905	bicycle	68	1	1	\N
906	bike	68	1	1	\N
907	bus	68	1	1	\N
908	car	68	1	1	\N
909	car park	68	1	1	\N
910	drive	68	1	2	\N
911	driver	68	1	1	\N
912	park	68	1	2	\N
913	ride	68	1	2	\N
914	road	68	1	1	\N
915	stop	68	1	2	\N
916	street	68	1	1	\N
917	taxi	68	1	1	\N
918	traffic	68	1	1	\N
919	turn	68	1	2	\N
920	boat	69	1	1	\N
921	radio	69	1	1	\N
922	sea	69	1	1	\N
923	water	69	1	1	\N
924	business	70	1	1	\N
925	cost	70	1	2	\N
926	customer	70	1	1	\N
927	meeting	70	1	1	\N
928	plan	70	1	1	\N
929	price	70	1	1	\N
930	product	70	1	1	\N
931	sell	70	1	1	\N
932	actor	71	1	1	\N
933	actress	71	1	1	\N
934	artist	71	1	1	\N
935	dancer	71	1	1	\N
936	doctor	71	1	1	\N
937	driver	71	1	1	\N
938	farmer	71	1	1	\N
939	job	71	1	1	\N
940	nurse	71	1	1	\N
941	policeman	71	1	1	\N
942	policewoman	71	1	1	\N
943	scientist	71	1	1	\N
944	singer	71	1	1	\N
945	teacher	71	1	1	\N
946	waiter	71	1	1	\N
947	work	71	1	2	\N
948	work	71	1	1	\N
949	writer	71	1	1	\N
950	bank	72	1	1	\N
951	banknote	72	1	1	\N
952	buy	72	1	2	\N
953	cent	72	1	1	\N
954	change	72	1	2	\N
955	cheap	72	1	3	\N
956	cost	72	1	1	\N
957	dollar	72	1	1	\N
958	euro	72	1	1	\N
959	expensive	72	1	3	\N
960	give	72	1	2	\N
961	grow	72	1	2	\N
962	lose	72	1	2	\N
963	money	72	1	1	\N
964	pay	72	1	2	\N
965	poor	72	1	3	\N
966	pound	72	1	1	\N
967	price	72	1	1	\N
968	rich	72	1	3	\N
969	sell	72	1	1	\N
970	spend	72	1	2	\N
971	boring	73	1	3	\N
972	break	73	1	1	\N
973	business	73	1	1	\N
974	career	73	1	1	\N
975	dangerous	73	1	3	\N
976	desk	73	1	1	\N
977	easy	73	1	3	\N
978	exciting	73	1	3	\N
979	hard	73	1	3	\N
980	interview	73	1	1	\N
981	interview	73	1	2	\N
982	job	73	1	1	\N
983	meet	73	1	2	\N
984	meeting	73	1	1	\N
985	office	73	1	1	\N
986	work	73	1	2	\N
987	work	73	1	1	\N
988	worker	73	1	1	\N
989	bear	75	4	3	\N
990	family	75	4	1	\N
991	feed	75	4	2	\N
992	frog	75	4	1	\N
993	hide	75	4	1	\N
994	lamb	75	4	1	\N
995	monkey	75	4	1	\N
996	pet	75	4	1	\N
997	rabbit	75	4	1	\N
998	tiger	75	4	1	\N
999	walk	75	4	2	\N
1000	whale	75	4	2	\N
1001	wild	75	4	3	\N
1002	duck	76	4	1	\N
1003	penguin	76	4	1	\N
1004	song	76	4	1	\N
1005	shark	77	4	1	\N
1006	fly	78	4	1	\N
1007	insect	78	4	1	\N
1008	spider	78	4	1	\N
1009	web	78	4	1	\N
1010	appearance	79	4	1	\N
1011	attractive	79	4	3	\N
1012	beard	79	4	1	\N
1013	brush	79	4	2	\N
1014	curly	79	4	3	\N
1015	good-looking	79	4	3	\N
1016	hairbrush	79	4	1	\N
1017	hairdresser	79	4	1	\N
1018	handsome	79	4	3	\N
1019	heavy	79	4	3	\N
1020	height	79	4	1	\N
1021	lovely	79	4	3	\N
1022	oil	79	4	1	\N
1023	skin	79	4	1	\N
1024	slim	79	4	3	\N
1025	smile	79	4	2	\N
1026	smile	79	4	1	\N
1027	soap	79	4	1	\N
1028	straight	79	4	3	\N
1029	thin	79	4	3	\N
1030	wavy	79	4	3	\N
1031	weight	79	4	2	\N
1032	ankle	80	4	1	\N
1033	blood	80	4	1	\N
1034	bone	80	4	1	\N
1035	brain	80	4	1	\N
1036	fat	80	4	1	\N
1037	finger	80	4	1	\N
1038	heart	80	4	1	\N
1039	knee	80	4	1	\N
1040	neck	80	4	1	\N
1041	physical	80	4	3	\N
1042	shoulder	80	4	1	\N
1043	skin	80	4	1	\N
1044	stomach	80	4	1	\N
1045	belt	81	4	1	\N
1046	button	81	4	1	\N
1047	clothing	81	4	1	\N
1048	comfortable	81	4	3	\N
1049	designer	81	4	1	\N
1050	fashion	81	4	1	\N
1051	fashion designer	81	4	1	\N
1052	fit	81	4	2	\N
1053	football boot	81	4	1	\N
1054	formal	81	4	3	\N
1055	gold	81	4	1	\N
1056	handbag	81	4	1	\N
1057	informal	81	4	3	\N
1058	jewellery	81	4	1	\N
1059	knee	81	4	1	\N
1060	model	81	4	1	\N
1061	neck	81	4	1	\N
1062	necktie	81	4	1	\N
1063	pants	81	4	1	\N
1064	pocket	81	4	1	\N
1065	purse	81	4	1	\N
1066	remove	81	4	2	\N
1067	ring	81	4	1	\N
1068	scarf	81	4	1	\N
1069	shorts	81	4	1	\N
1070	shoulder	81	4	1	\N
1071	silver	81	4	1	\N
1072	size	81	4	1	\N
1073	sock	81	4	1	\N
1074	suit	81	4	1	\N
1075	sunglasses	81	4	1	\N
1076	tie	81	4	1	\N
1077	top	81	4	1	\N
1078	trainer	81	4	1	\N
1079	training shoe	81	4	1	\N
1080	uniform	81	4	1	\N
1081	wallet	81	4	1	\N
1082	bright	82	4	3	\N
1083	circle	82	4	1	\N
1084	cross	82	4	1	\N
1085	flat	82	4	3	\N
1086	gold	82	4	1	\N
1087	gold	82	4	3	\N
1088	round	82	4	3	\N
1089	shape	82	4	1	\N
1090	silver	82	4	1	\N
1091	silver	82	4	3	\N
1092	square	82	4	3	\N
1093	square	82	4	1	\N
1094	star	82	4	1	\N
1095	straight	82	4	3	\N
1096	Arabic	83	4	1	\N
1097	Chinese	83	4	1	\N
1098	collocation	83	4	1	\N
1099	comma	83	4	1	\N
1100	comparative	83	4	3	\N
1101	comparative	83	4	1	\N
1102	conditional	83	4	3	\N
1103	conditional	83	4	1	\N
1104	consonant	83	4	1	\N
1105	ending	83	4	1	\N
1106	expression	83	4	1	\N
1107	Greek	83	4	1	\N
1108	irregular	83	4	3	\N
1109	Latin	83	4	1	\N
1110	modal	83	4	1	\N
1111	participle	83	4	1	\N
1112	past participle	83	4	1	\N
1113	perfect	83	4	3	\N
1114	perfect	83	4	1	\N
1115	Polish	83	4	1	\N
1116	Portuguese	83	4	1	\N
1117	possessive	83	4	3	\N
1118	possessive	83	4	1	\N
1119	present participle	83	4	1	\N
1120	punctuation	83	4	1	\N
1121	punctuation mark	83	4	1	\N
1122	question mark	83	4	1	\N
1123	question tag	83	4	1	\N
1124	regular	83	4	3	\N
1125	Russian	83	4	1	\N
1126	the present perfect	83	4	1	\N
1127	stress	83	4	1	\N
1128	stress	83	4	2	\N
1129	stressed	83	4	3	\N
1130	superlative	83	4	3	\N
1131	superlative	83	4	1	\N
1132	syllable	83	4	1	\N
1133	vowel	83	4	1	\N
1134	be on the phone	84	4	7	\N
1135	be on the telephone	84	4	7	\N
1136	caller	84	4	1	\N
1137	chat	84	4	2	\N
1138	chat	84	4	1	\N
1139	connect	84	4	2	\N
1140	Facebook	84	4	1	\N
1141	Google	84	4	1	\N
1142	hotlink	84	4	1	\N
1143	hyperlink	84	4	1	\N
1144	line	84	4	1	\N
1145	link	84	4	1	\N
1146	mail	84	4	1	\N
1147	mail	84	4	2	\N
1148	profile	84	4	1	\N
1149	publish	84	4	2	\N
1150	ring	84	4	2	\N
1151	site	84	4	1	\N
1152	social media	84	4	1	\N
1153	social networking	84	4	1	\N
1154	text	84	4	2	\N
1155	art gallery	85	4	1	\N
1156	background	85	4	1	\N
1157	brush	85	4	1	\N
1158	collect	85	4	2	\N
1159	detail	85	4	1	\N
1160	drawing	85	4	1	\N
1161	gallery	85	4	1	\N
1162	paint	85	4	1	\N
1163	paintbrush	85	4	1	\N
1164	painter	85	4	1	\N
1165	scene	85	4	1	\N
1166	style	85	4	1	\N
1167	work	85	4	2	\N
1168	work	85	4	1	\N
1169	act	86	4	2	\N
1170	acting	86	4	1	\N
1171	audience	86	4	1	\N
1172	black and white	86	4	7	\N
1173	cartoon	86	4	1	\N
1174	character	86	4	1	\N
1175	comedy	86	4	1	\N
1176	detective story	86	4	1	\N
1177	director	86	4	1	\N
1178	drama	86	4	1	\N
1179	ending	86	4	1	\N
1180	hero	86	4	1	\N
1181	heroine	86	4	1	\N
1182	Hollywood	86	4	1	\N
1183	perform	86	4	2	\N
1184	review	86	4	1	\N
1185	review	86	4	2	\N
1186	role	86	4	1	\N
1187	scene	86	4	1	\N
1188	science fiction	86	4	1	\N
1189	screen	86	4	1	\N
1190	author	87	4	1	\N
1191	character	87	4	1	\N
1192	column	87	4	1	\N
1193	ending	87	4	1	\N
1194	fiction	87	4	1	\N
1195	hero	87	4	1	\N
1196	heroine	87	4	1	\N
1197	introduction	87	4	1	\N
1198	journalist	87	4	1	\N
1199	novel	87	4	1	\N
1200	paper	87	4	1	\N
1201	print	87	4	2	\N
1202	publish	87	4	2	\N
1203	reporter	87	4	1	\N
1204	review	87	4	1	\N
1205	review	87	4	2	\N
1206	science fiction	87	4	1	\N
1207	short story	87	4	1	\N
1208	style	87	4	1	\N
1209	work	87	4	1	\N
1210	audience	88	4	1	\N
1211	classical	88	4	3	\N
1212	dance	88	4	1	\N
1213	guitarist	88	4	1	\N
1214	hit	88	4	1	\N
1215	instrument	88	4	1	\N
1216	jazz	88	4	1	\N
1217	MP3	88	4	1	\N
1218	MP3 player	88	4	1	\N
1219	musical	88	4	3	\N
1220	musical instrument	88	4	1	\N
1221	musician	88	4	1	\N
1222	perform	88	4	2	\N
1223	pop	88	4	1	\N
1224	pop music	88	4	1	\N
1225	record	88	4	2	\N
1226	rock	88	4	1	\N
1227	rock music	88	4	1	\N
1228	tour	88	4	1	\N
1229	violin	88	4	1	\N
1230	voice	88	4	1	\N
1231	work	88	4	1	\N
1232	advert	89	4	1	\N
1233	advertise	89	4	2	\N
1234	advertisement	89	4	1	\N
1235	advertising	89	4	1	\N
1236	cartoon	89	4	1	\N
1237	celeb	89	4	1	\N
1238	celebrity	89	4	1	\N
1239	comedy	89	4	1	\N
1240	digital	89	4	3	\N
1241	drama	89	4	1	\N
1242	front page	89	4	1	\N
1243	front-page	89	4	3	\N
1244	introduce	89	4	2	\N
1245	journalist	89	4	1	\N
1246	listener	89	4	1	\N
1247	publish	89	4	2	\N
1248	quiz show	89	4	1	\N
1249	radio-combining	89	4	10	\N
1250	record	89	4	2	\N
1251	recording	89	4	1	\N
1252	report	89	4	2	\N
1253	reporter	89	4	1	\N
1254	review	89	4	1	\N
1255	schedule	89	4	1	\N
1256	screen	89	4	1	\N
1257	series	89	4	1	\N
1258	sleb	89	4	1	\N
1259	station	89	4	1	\N
1260	boil	90	4	2	\N
1261	book	90	4	2	\N
1262	bowl	90	4	1	\N
1263	check	90	4	1	\N
1264	chef	90	4	1	\N
1265	cook	90	4	1	\N
1266	cooker	90	4	1	\N
1267	dessert	90	4	2	\N
1268	dishwasher	90	4	1	\N
1269	dry	90	4	3	\N
1270	fast food	90	4	1	\N
1271	fat	90	4	1	\N
1272	fork	90	4	1	\N
1273	fresh	90	4	3	\N
1274	heat	90	4	2	\N
1275	junk food	90	4	1	\N
1276	kilo	90	4	1	\N
1277	kilogram	90	4	1	\N
1278	knife	90	4	1	\N
1279	lunchtime	90	4	1	\N
1280	order	90	4	1	\N
1281	oven	90	4	1	\N
1282	plate	90	4	1	\N
1283	recipe	90	4	1	\N
1284	salty	90	4	3	\N
1285	serve	90	4	2	\N
1286	snack	90	4	1	\N
1287	spoon	90	4	1	\N
1288	sweet	90	4	1	\N
1289	taste	90	4	1	\N
1290	taste	90	4	2	\N
1291	unhealthy	90	4	3	\N
1292	vegetarian	90	4	1	\N
1293	vegetarian	90	4	3	\N
1294	bar	91	4	1	\N
1295	drinking chocolate	91	4	1	\N
1296	hot chocolate	91	4	1	\N
1297	pub	91	4	1	\N
1298	baked potato	92	4	1	\N
1299	bean	92	4	1	\N
1300	beef	92	4	1	\N
1301	beefburger	92	4	1	\N
1302	biscuit	92	4	1	\N
1303	candy	92	4	1	\N
1304	chip	92	4	1	\N
1305	cookie	92	4	1	\N
1306	crisp	92	4	1	\N
1307	dessert	92	4	2	\N
1308	duck	92	4	1	\N
1309	fat	92	4	1	\N
1310	fish and chips	92	4	1	\N
1311	hamburger	92	4	1	\N
1312	hot dog	92	4	1	\N
1313	jam	92	4	1	\N
1314	lamb	92	4	1	\N
1315	lemon	92	4	1	\N
1316	mushroom	92	4	1	\N
1317	nut	92	4	1	\N
1318	oil	92	4	1	\N
1319	pasta	92	4	1	\N
1320	pea	92	4	1	\N
1321	peach	92	4	1	\N
1322	pie	92	4	1	\N
1323	pork	92	4	1	\N
1324	rabbit	92	4	1	\N
1325	sauce	92	4	1	\N
1326	sausage	92	4	1	\N
1327	skin	92	4	1	\N
1328	strawberry	92	4	1	\N
1329	sweet	92	4	1	\N
1330	toast	92	4	1	\N
1331	agree	93	4	2	\N
1332	all right	93	4	5	\N
1333	alright	93	4	5	\N
1334	discussion	93	4	1	\N
1335	sign	93	4	2	\N
1336	certain	94	4	3	\N
1337	check	94	4	1	\N
1338	definitely	94	4	11	\N
1339	impossible	94	4	3	\N
1340	likely	94	4	3	\N
1341	make sure (of something/that…)	94	4	7	\N
1342	maymodal	94	4	2	\N
1343	mightmodal	94	4	2	\N
1344	perhaps	94	4	11	\N
1345	possibility	94	4	1	\N
1346	predict	94	4	2	\N
1347	that depends	94	4	7	\N
1348	according to	95	4	4	\N
1349	against	95	4	4	\N
1350	ah	95	4	5	\N
1351	all right	95	4	5	\N
1352	alright	95	4	5	\N
1353	anyway	95	4	11	\N
1354	argue	95	4	2	\N
1355	argument	95	4	1	\N
1356	comment	95	4	1	\N
1357	disagree	95	4	2	\N
1358	discuss	95	4	2	\N
1359	discussion	95	4	1	\N
1360	evidence	95	4	1	\N
1361	express	95	4	2	\N
1362	feel	95	4	2	\N
1363	feeling	95	4	1	\N
1364	find	95	4	2	\N
1365	idea	95	4	1	\N
1366	I know	95	4	7	\N
1367	match	95	4	2	\N
1368	of course	95	4	7	\N
1369	perhaps	95	4	11	\N
1370	positive	95	4	3	\N
1371	review	95	4	1	\N
1372	review	95	4	2	\N
1373	shake	95	4	2	\N
1374	suggest	95	4	2	\N
1375	suggestion	95	4	1	\N
1376	suppose	95	4	2	\N
1377	survey	95	4	1	\N
1378	thinking	95	4	1	\N
1379	true	95	4	3	\N
1380	view	95	4	1	\N
1381	yes	95	4	1	\N
1382	allow	96	4	2	\N
1383	all right	96	4	3	\N
1384	alright	96	4	3	\N
1385	canmodal	96	4	2	\N
1386	law	96	4	1	\N
1387	need	96	4	1	\N
1388	permission	96	4	1	\N
1389	alternative	97	4	1	\N
1390	choice	97	4	1	\N
1391	consider	97	4	2	\N
1392	decision	97	4	1	\N
1393	either	97	4	11	\N
1394	option	97	4	1	\N
1395	pick	97	4	2	\N
1396	canmodal	98	4	2	\N
1397	follow	98	4	2	\N
1398	have tomodal	98	4	2	\N
1399	help	98	4	1	\N
1400	perhapsad	98	4	2	\N
1401	recommend	98	4	2	\N
1402	shallmodal	98	4	2	\N
1403	shouldmodal	98	4	2	\N
1404	suggest	98	4	2	\N
1405	tip	98	4	1	\N
1406	energy	99	4	1	\N
1407	fit	99	4	3	\N
1408	jog	99	4	2	\N
1409	jog	99	4	1	\N
1410	jogging	99	4	1	\N
1411	train	99	4	2	\N
1412	walking	99	4	1	\N
1413	weight	99	4	2	\N
1414	accident	100	4	1	\N
1415	ache	100	4	2	\N
1416	ache	100	4	1	\N
1417	bad	100	4	3	\N
1418	be sick	100	4	7	\N
1419	better	100	4	3	\N
1420	broken	100	4	3	\N
1421	condition	100	4	1	\N
1422	disease	100	4	1	\N
1423	earache	100	4	1	\N
1424	flu	100	4	2	\N
1425	headache	100	4	1	\N
1426	hit	100	4	2	\N
1427	hurt	100	4	2	\N
1428	hurt	100	4	3	\N
1429	ill	100	4	3	\N
1430	illness	100	4	1	\N
1431	injury	100	4	1	\N
1432	pain	100	4	1	\N
1433	rest	100	4	1	\N
1434	rest	100	4	2	\N
1435	serious	100	4	3	\N
1436	stomach ache	100	4	1	\N
1437	temperature	100	4	1	\N
1438	toothache	100	4	1	\N
1439	unhealthy	100	4	3	\N
1440	virus	100	4	1	\N
1441	weak	100	4	3	\N
1442	care	101	4	1	\N
1443	chemist	101	4	1	\N
1444	dentist	101	4	1	\N
1445	medical	101	4	3	\N
1446	patient	101	4	1	\N
1447	test	101	4	1	\N
1448	test	101	4	2	\N
1449	ancient	102	4	3	\N
1450	architecture	102	4	1	\N
1451	art gallery	102	4	1	\N
1452	board	102	4	1	\N
1453	bridge	102	4	1	\N
1454	castle	102	4	1	\N
1455	church	102	4	1	\N
1456	club	102	4	1	\N
1457	downstairs	102	4	3	\N
1458	factory	102	4	1	\N
1459	first floor	102	4	1	\N
1460	gallery	102	4	1	\N
1461	ground floor	102	4	1	\N
1462	home	102	4	1	\N
1463	lab	102	4	1	\N
1464	lift	102	4	1	\N
1465	lock	102	4	1	\N
1466	palace	102	4	1	\N
1467	police station	102	4	1	\N
1468	prison	102	4	1	\N
1469	pub	102	4	1	\N
1470	roof	102	4	1	\N
1471	shopping centre	102	4	1	\N
1472	site	102	4	1	\N
1473	sports centre	102	4	1	\N
1474	square	102	4	1	\N
1475	stair	102	4	1	\N
1476	stone	102	4	1	\N
1477	structure	102	4	1	\N
1478	tower	102	4	1	\N
1479	traditional	102	4	3	\N
1480	upstairs	102	4	3	\N
1481	gate	103	4	1	\N
1482	grass	103	4	1	\N
1483	plant	103	4	2	\N
1484	bin	104	4	1	\N
1485	borrow	104	4	2	\N
1486	brush	104	4	1	\N
1487	carpet	104	4	1	\N
1488	cooker	104	4	1	\N
1489	corner	104	4	1	\N
1490	cupboard	104	4	1	\N
1491	dishwasher	104	4	1	\N
1492	downstairs	104	4	3	\N
1493	equipment	104	4	1	\N
1494	first floor	104	4	1	\N
1495	fridge	104	4	1	\N
1496	furniture	104	4	1	\N
1497	ground floor	104	4	1	\N
1498	hall	104	4	1	\N
1499	hallway	104	4	1	\N
1500	housework	104	4	1	\N
1501	lamp	104	4	1	\N
1502	lend	104	4	2	\N
1503	level	104	4	1	\N
1504	lock	104	4	1	\N
1505	mirror	104	4	1	\N
1506	move	104	4	2	\N
1507	offer	104	4	1	\N
1508	palace	104	4	1	\N
1509	roof	104	4	1	\N
1510	sitting room	104	4	1	\N
1511	stair	104	4	1	\N
1512	upstairs	104	4	3	\N
1513	washing	104	4	1	\N
1514	washing machine	104	4	1	\N
1515	ball game	105	4	1	\N
1516	board	105	4	1	\N
1517	board game	105	4	1	\N
1518	card	105	4	1	\N
1519	card game	105	4	1	\N
1520	deal	105	4	2	\N
1521	score	105	4	2	\N
1522	score	105	4	1	\N
1523	table tennis	105	4	1	\N
1524	toy	105	4	1	\N
1525	winner	105	4	1	\N
1526	climb	106	4	2	\N
1527	climbing	106	4	1	\N
1528	drama	106	4	1	\N
1529	drawing	106	4	1	\N
1530	fish	106	4	2	\N
1531	fishing	106	4	1	\N
1532	hike	106	4	1	\N
1533	hike	106	4	2	\N
1534	hiking	106	4	1	\N
1535	jog	106	4	2	\N
1536	jogging	106	4	1	\N
1537	walking	106	4	1	\N
1538	yoga	106	4	1	\N
1539	zoo	106	4	1	\N
1540	assistant	107	4	1	\N
1541	bookshop	107	4	1	\N
1542	cash	107	4	1	\N
1543	chemist	107	4	1	\N
1544	clothing	107	4	1	\N
1545	condition	107	4	1	\N
1546	credit	107	4	1	\N
1547	credit card	107	4	1	\N
1548	department	107	4	1	\N
1549	download	107	4	2	\N
1550	electrical	107	4	3	\N
1551	free	107	4	3	\N
1552	furniture	107	4	1	\N
1553	gift	107	4	1	\N
1554	hairdresser	107	4	1	\N
1555	helpful	107	4	3	\N
1556	item	107	4	1	\N
1557	jewellery	107	4	1	\N
1558	luggage	107	4	1	\N
1559	manager	107	4	1	\N
1560	offer	107	4	1	\N
1561	order	107	4	2	\N
1562	reduce	107	4	2	\N
1563	sale	107	4	2	\N
1564	serve	107	4	2	\N
1565	shop assistant	107	4	1	\N
1566	shopping bag	107	4	1	\N
1567	shopping centre	107	4	1	\N
1568	store	107	4	1	\N
1569	store window	107	4	1	\N
1570	technology	107	4	1	\N
1571	toy	107	4	1	\N
1572	bring	108	4	2	\N
1573	cause	108	4	1	\N
1574	cause	108	4	2	\N
1575	effect	108	4	1	\N
1576	factor	108	4	1	\N
1577	fall	108	4	2	\N
1578	fall	108	4	1	\N
1579	follow	108	4	2	\N
1580	increase	108	4	2	\N
1581	increase	108	4	1	\N
1582	lead	108	4	2	\N
1583	react	108	4	2	\N
1584	reduce	108	4	2	\N
1585	rise	108	4	2	\N
1586	adventure	109	4	1	\N
1587	chance	109	4	1	\N
1588	danger	109	4	1	\N
1589	disaster	110	4	1	\N
1590	fail	110	4	2	\N
1591	miss	110	4	2	\N
1592	trouble	110	4	1	\N
1593	achieve	111	4	2	\N
1594	advantage	111	4	1	\N
1595	be (all) for the best	111	4	7	\N
1596	brilliant	111	4	3	\N
1597	congratulation	111	4	1	\N
1598	do well	111	4	7	\N
1599	dream	111	4	1	\N
1600	dream	111	4	2	\N
1601	go	111	4	2	\N
1602	goal	111	4	1	\N
1603	hit	111	4	1	\N
1604	lucky	111	4	3	\N
1605	opportunity	111	4	1	\N
1606	progress	111	4	1	\N
1607	race	111	4	2	\N
1608	record	111	4	1	\N
1609	result	111	4	1	\N
1610	succeed	111	4	2	\N
1611	successful	111	4	3	\N
1612	support	111	4	2	\N
1613	support	111	4	1	\N
1614	target	111	4	1	\N
1615	winner	111	4	1	\N
1616	assistant	112	4	1	\N
1617	attend	112	4	2	\N
1618	biology	112	4	1	\N
1619	board	112	4	1	\N
1620	chemistry	112	4	1	\N
1621	coach	112	4	1	\N
1622	degree	112	4	1	\N
1623	department	112	4	1	\N
1624	drama	112	4	1	\N
1625	education	112	4	1	\N
1626	essay	112	4	1	\N
1627	fail	112	4	2	\N
1628	holiday	112	4	1	\N
1629	instructor	112	4	1	\N
1630	knowledge	112	4	1	\N
1631	learning	112	4	1	\N
1632	lecture	112	4	1	\N
1633	lecture	112	4	2	\N
1634	mathematics	112	4	1	\N
1635	pass	112	4	2	\N
1636	physics	112	4	1	\N
1637	professor	112	4	1	\N
1638	research	112	4	1	\N
1639	research	112	4	2	\N
1640	review	112	4	1	\N
1641	review	112	4	2	\N
1642	ruler	112	4	1	\N
1643	schedule	112	4	1	\N
1644	school child	112	4	1	\N
1645	school day	112	4	1	\N
1646	school kid	112	4	1	\N
1647	score	112	4	1	\N
1648	take	112	4	2	\N
1649	task	112	4	1	\N
1650	teaching	112	4	1	\N
1651	timetable	112	4	1	\N
1652	train	112	4	2	\N
1653	training	112	4	1	\N
1654	uniform	112	4	1	\N
1655	vacation	112	4	1	\N
1656	background	113	4	1	\N
1657	care	113	4	2	\N
1658	couple	113	4	1	\N
1659	daddy	113	4	1	\N
1660	date	113	4	1	\N
1661	divorced	113	4	3	\N
1662	family name	113	4	1	\N
1663	first name	113	4	1	\N
1664	granny	113	4	1	\N
1665	home	113	4	1	\N
1666	last name	113	4	1	\N
1667	momma	113	4	1	\N
1668	mommy	113	4	1	\N
1669	mummy	113	4	1	\N
1670	nephew	113	4	1	\N
1671	niece	113	4	1	\N
1672	partner	113	4	1	\N
1673	school friend	113	4	1	\N
1674	second name	113	4	1	\N
1675	surname	113	4	1	\N
1676	twin	113	4	1	\N
1677	angrilyad	114	4	2	\N
1678	argue	114	4	2	\N
1679	argument	114	4	1	\N
1680	care	114	4	2	\N
1681	complain	114	4	2	\N
1682	crazy	114	4	3	\N
1683	cry	114	4	2	\N
1684	enjoy	114	4	2	\N
1685	feel good	114	4	7	\N
1686	hope	114	4	1	\N
1687	nervous	114	4	3	\N
1688	pain	114	4	1	\N
1689	pleased	114	4	3	\N
1690	red	114	4	3	\N
1691	sadlyad	114	4	2	\N
1692	scared	114	4	3	\N
1693	smile	114	4	2	\N
1694	smile	114	4	1	\N
1695	stress	114	4	1	\N
1696	surprise	114	4	1	\N
1697	surprise	114	4	2	\N
1698	surprised	114	4	3	\N
1699	surprising	114	4	3	\N
1700	unhappy	114	4	3	\N
1701	worried	114	4	3	\N
1702	worry	114	4	2	\N
1703	be expecting (a baby/child)	115	4	7	\N
1704	birth	115	4	1	\N
1705	care	115	4	1	\N
1706	dead	115	4	3	\N
1707	death	115	4	1	\N
1708	kid	115	4	1	\N
1709	marry	115	4	2	\N
1710	partner	115	4	1	\N
1711	ring	115	4	1	\N
1712	teenage	115	4	3	\N
1713	wedding	115	4	1	\N
1714	wedding cake	115	4	1	\N
1715	wedding dress	115	4	1	\N
1716	wedding ring	115	4	1	\N
1717	brilliant	116	4	3	\N
1718	careful	116	4	3	\N
1719	clever	116	4	3	\N
1720	crazy	116	4	3	\N
1721	creative	116	4	3	\N
1722	hard-working	116	4	3	\N
1723	helpful	116	4	3	\N
1724	hero	116	4	1	\N
1725	heroine	116	4	1	\N
1726	intelligent	116	4	3	\N
1727	lazy	116	4	3	\N
1728	lovely	116	4	3	\N
1729	polite	116	4	3	\N
1730	rude	116	4	3	\N
1731	strange	116	4	3	\N
1732	stupid	116	4	3	\N
1733	attack	117	4	1	\N
1734	attack	117	4	2	\N
1735	catch	117	4	2	\N
1736	crime	117	4	1	\N
1737	criminal	117	4	1	\N
1738	detective	117	4	1	\N
1739	evidence	117	4	1	\N
1740	identify	117	4	2	\N
1741	kill	117	4	2	\N
1742	prison	117	4	1	\N
1743	question	117	4	2	\N
1744	report	117	4	2	\N
1745	scene	117	4	1	\N
1746	serious	117	4	3	\N
1747	solve	117	4	2	\N
1748	steal	117	4	2	\N
1749	thief	117	4	1	\N
1750	detective	118	4	1	\N
1751	document	118	4	1	\N
1752	evidence	118	4	1	\N
1753	law	118	4	1	\N
1754	lawyer	118	4	1	\N
1755	officer	118	4	1	\N
1756	police officer	118	4	1	\N
1757	police station	118	4	1	\N
1758	process	118	4	1	\N
1759	sign	118	4	2	\N
1760	station	118	4	1	\N
1761	uniform	118	4	1	\N
1762	African	119	4	3	\N
1763	African	119	4	1	\N
1764	Asian	119	4	1	\N
1765	Asian	119	4	3	\N
1766	boss	119	4	1	\N
1767	color	119	4	1	\N
1768	colour	119	4	1	\N
1769	community	119	4	1	\N
1770	European	119	4	3	\N
1771	European	119	4	1	\N
1772	female	119	4	3	\N
1773	head	119	4	1	\N
1774	king	119	4	1	\N
1775	leader	119	4	1	\N
1776	male	119	4	1	\N
1777	organization	119	4	1	\N
1778	president	119	4	1	\N
1779	public	119	4	3	\N
1780	public	119	4	1	\N
1781	queen	119	4	1	\N
1782	society	119	4	1	\N
1783	department	120	4	1	\N
1784	foreign	120	4	3	\N
1785	government	120	4	1	\N
1786	independent	120	4	3	\N
1787	international	120	4	3	\N
1788	king	120	4	1	\N
1789	law	120	4	1	\N
1790	leader	120	4	1	\N
1791	office	120	4	1	\N
1792	power	120	4	1	\N
1793	president	120	4	1	\N
1794	queen	120	4	1	\N
1795	relationship	120	4	1	\N
1796	speech	120	4	1	\N
1797	state	120	4	1	\N
1798	support	120	4	2	\N
1799	celebrate	121	4	2	\N
1800	church	121	4	1	\N
1801	festival	121	4	1	\N
1802	god	121	4	1	\N
1803	holiday	121	4	1	\N
1804	marry	121	4	2	\N
1805	tower	121	4	1	\N
1806	tradition	121	4	1	\N
1807	wedding	121	4	1	\N
1808	camp	122	4	1	\N
1809	charity	122	4	1	\N
1810	cigarette	122	4	1	\N
1811	drink	122	4	1	\N
1812	drink	122	4	2	\N
1813	drug	122	4	1	\N
1814	medicine	122	4	1	\N
1815	smoke	122	4	2	\N
1816	smoking	122	4	1	\N
1817	army	123	4	1	\N
1818	attack	123	4	1	\N
1819	attack	123	4	2	\N
1820	danger	123	4	1	\N
1821	gun	123	4	1	\N
1822	officer	123	4	1	\N
1823	peace	123	4	1	\N
1824	soldier	123	4	1	\N
1825	war	123	4	1	\N
1826	biology	124	4	1	\N
1827	female	124	4	3	\N
1828	female	124	4	1	\N
1829	male	124	4	3	\N
1830	male	124	4	1	\N
1831	virus	124	4	1	\N
1832	app	125	4	1	\N
1833	button	125	4	1	\N
1834	connect	125	4	2	\N
1835	data	125	4	1	\N
1836	digital	125	4	3	\N
1837	document	125	4	1	\N
1838	download	125	4	2	\N
1839	download	125	4	1	\N
1840	laptop	125	4	1	\N
1841	memory	125	4	1	\N
1842	mobile device	125	4	1	\N
1843	MP3 player	125	4	1	\N
1844	network	125	4	1	\N
1845	option	125	4	1	\N
1846	personal computer	125	4	1	\N
1847	print	125	4	2	\N
1848	printer	125	4	1	\N
1849	program	125	4	1	\N
1850	save	125	4	2	\N
1851	screen	125	4	1	\N
1852	search	125	4	1	\N
1853	tablet	125	4	1	\N
1854	upload	125	4	2	\N
1855	upload	125	4	1	\N
1856	user	125	4	1	\N
1857	virus	125	4	1	\N
1858	button	126	4	1	\N
1859	connect	126	4	2	\N
1860	device	126	4	1	\N
1861	electric	126	4	3	\N
1862	electrical	126	4	3	\N
1863	electricity	126	4	1	\N
1864	electronic	126	4	3	\N
1865	engineer	126	4	1	\N
1866	average	127	4	3	\N
1867	average	127	4	1	\N
1868	billion	127	4	9	\N
1869	centimetre	127	4	1	\N
1870	count	127	4	2	\N
1871	degree	127	4	1	\N
1872	doublepro	127	4	1	\N
1873	double	127	4	2	\N
1874	figure	127	4	1	\N
1875	foot	127	4	1	\N
1876	g	127	4	12	\N
1877	height	127	4	1	\N
1878	hundredth ordinal	127	4	9	\N
1879	kg	127	4	12	\N
1880	kilo	127	4	1	\N
1881	kilogram	127	4	1	\N
1882	km	127	4	12	\N
1883	m	127	4	12	\N
1884	mathematics	127	4	1	\N
1885	maths	127	4	1	\N
1886	ruler	127	4	1	\N
1887	size	127	4	1	\N
1888	solution	127	4	1	\N
1889	solve	127	4	2	\N
1890	symbol	127	4	1	\N
1891	thousandth ordinal	127	4	9	\N
1892	weight	127	4	2	\N
1893	electric	128	4	3	\N
1894	electrical	128	4	3	\N
1895	electricity	128	4	1	\N
1896	gas	128	4	1	\N
1897	gold	128	4	1	\N
1898	heat	128	4	1	\N
1899	light	128	4	3	\N
1900	material	128	4	1	\N
1901	metal	128	4	1	\N
1902	petrol	128	4	1	\N
1903	physics	128	4	1	\N
1904	plastic	128	4	1	\N
1905	plastic	128	4	3	\N
1906	silver	128	4	1	\N
1907	stone	128	4	1	\N
1908	wood	128	4	1	\N
1909	biology	129	4	1	\N
1910	chemistry	129	4	1	\N
1911	data	129	4	1	\N
1912	develop	129	4	2	\N
1913	discover	129	4	2	\N
1914	discovery	129	4	1	\N
1915	equipment	129	4	1	\N
1916	evidence	129	4	1	\N
1917	lab	129	4	1	\N
1918	medicine	129	4	1	\N
1919	method	129	4	1	\N
1920	physics	129	4	1	\N
1921	research	129	4	1	\N
1922	research	129	4	2	\N
1923	survey	129	4	1	\N
1924	symbol	129	4	1	\N
1925	technology	129	4	1	\N
1926	test	129	4	1	\N
1927	test	129	4	2	\N
1928	American football	130	4	1	\N
1929	baseball	130	4	1	\N
1930	basketball	130	4	1	\N
1931	catch	130	4	2	\N
1932	cricket	130	4	1	\N
1933	cup	130	4	1	\N
1934	end	130	4	1	\N
1935	fan	130	4	1	\N
1936	field	130	4	1	\N
1937	football boot	130	4	1	\N
1938	game	130	4	1	\N
1939	goal	130	4	1	\N
1940	golf	130	4	1	\N
1941	hockey	130	4	1	\N
1942	kick	130	4	2	\N
1943	net	130	4	1	\N
1944	park	130	4	1	\N
1945	point	130	4	1	\N
1946	score	130	4	2	\N
1947	score	130	4	1	\N
1948	side	130	4	1	\N
1949	soccer	130	4	1	\N
1950	stick	130	4	1	\N
1951	table tennis	130	4	1	\N
1952	throw	130	4	2	\N
1953	volleyball	130	4	1	\N
1954	athlete	131	4	1	\N
1955	climb	131	4	2	\N
1956	climbing	131	4	1	\N
1957	coach	131	4	1	\N
1958	compete	131	4	2	\N
1959	competition	131	4	1	\N
1960	cycle	131	4	1	\N
1961	cycle	131	4	2	\N
1962	cycling	131	4	1	\N
1963	fight	131	4	2	\N
1964	fight	131	4	1	\N
1965	final	131	4	1	\N
1966	gold	131	4	1	\N
1967	hockey	131	4	1	\N
1968	jump	131	4	2	\N
1969	jump	131	4	1	\N
1970	motorbike	131	4	1	\N
1971	race	131	4	1	\N
1972	race	131	4	2	\N
1973	record	131	4	1	\N
1974	runner	131	4	1	\N
1975	running	131	4	1	\N
1976	ski	131	4	1	\N
1977	ski	131	4	3	\N
1978	ski	131	4	2	\N
1979	skiing	131	4	1	\N
1980	train	131	4	2	\N
1981	training	131	4	1	\N
1982	winter sports	131	4	1	\N
1983	diving	132	4	1	\N
1984	sail	132	4	2	\N
1985	sailing	132	4	1	\N
1986	swimmer	132	4	1	\N
1987	farming	133	4	1	\N
1988	feed	133	4	2	\N
1989	field	133	4	1	\N
1990	plant	133	4	2	\N
1991	produce	133	4	2	\N
1992	bottom	134	4	1	\N
1993	bridge	134	4	1	\N
1994	coast	134	4	1	\N
1995	continent	134	4	1	\N
1996	desert	134	4	1	\N
1997	dry	134	4	3	\N
1998	flat	134	4	3	\N
1999	forest	134	4	1	\N
2000	ground	134	4	1	\N
2001	hill	134	4	1	\N
2002	lake	134	4	1	\N
2003	north-east	134	4	3	\N
2004	north-east	134	4	1	\N
2005	north-west	134	4	3	\N
2006	north-west	134	4	1	\N
2007	ocean	134	4	1	\N
2008	pool	134	4	1	\N
2009	rainforest	134	4	1	\N
2010	region	134	4	1	\N
2011	rock	134	4	1	\N
2012	sea level	134	4	1	\N
2013	south-east	134	4	3	\N
2014	south-east	134	4	1	\N
2015	south-west	134	4	3	\N
2016	south-west	134	4	1	\N
2017	valley	134	4	1	\N
2018	wood	134	4	1	\N
2019	grass	135	4	1	\N
2020	mushroom	135	4	1	\N
2021	wild	135	4	3	\N
2022	air quality	136	4	1	\N
2023	climate	136	4	1	\N
2024	climate change	136	4	1	\N
2025	electricity	136	4	1	\N
2026	energy	136	4	1	\N
2027	environment	136	4	1	\N
2028	garbage	136	4	1	\N
2029	gas	136	4	1	\N
2030	natural disaster	136	4	1	\N
2031	nature	136	4	1	\N
2032	oil	136	4	1	\N
2033	petrol	136	4	1	\N
2034	plastic	136	4	1	\N
2035	pollution	136	4	1	\N
2036	power	136	4	1	\N
2037	protect	136	4	2	\N
2038	recycle	136	4	2	\N
2039	recycling	136	4	1	\N
2040	rubbish	136	4	1	\N
2041	smoke	136	4	1	\N
2042	storm	136	4	1	\N
2043	trash	136	4	1	\N
2044	awful	137	4	3	\N
2045	blow	137	4	2	\N
2046	clear	137	4	3	\N
2047	cloud	137	4	1	\N
2048	fall	137	4	1	\N
2049	gray	137	4	3	\N
2050	grey	137	4	3	\N
2051	heat	137	4	1	\N
2052	rainy	137	4	3	\N
2053	sky	137	4	1	\N
2054	snowy	137	4	3	\N
2055	storm	137	4	1	\N
2056	temperature	137	4	1	\N
2057	wet	137	4	3	\N
2058	wind	137	4	1	\N
2059	windy	137	4	3	\N
2060	ancient	138	4	3	\N
2061	castle	138	4	1	\N
2062	invention	138	4	1	\N
2063	king	138	4	1	\N
2064	palace	138	4	1	\N
2065	queen	138	4	1	\N
2066	Roman	138	4	3	\N
2067	time	138	4	1	\N
2068	earth	139	4	1	\N
2069	land	139	4	2	\N
2070	moon	139	4	1	\N
2071	planet	139	4	1	\N
2072	rise	139	4	2	\N
2073	afternoons	140	4	11	\N
2074	all the time	140	4	7	\N
2075	before	140	4	6	\N
2076	before	140	4	11	\N
2077	daily	140	4	3	\N
2078	fall	140	4	1	\N
2079	immediately	140	4	11	\N
2080	last	140	4	2	\N
2081	later	140	4	3	\N
2082	lunchtime	140	4	1	\N
2083	on time	140	4	7	\N
2084	recent	140	4	3	\N
2085	recently	140	4	11	\N
2086	regular	140	4	3	\N
2087	season	140	4	1	\N
2088	since	140	4	4	\N
2089	since	140	4	6	\N
2090	suddenly	140	4	11	\N
2091	through	140	4	11	\N
2092	yet	140	4	11	\N
2093	abroad	141	4	11	\N
2094	adventure	141	4	1	\N
2095	book	141	4	2	\N
2096	camp	141	4	2	\N
2097	camping	141	4	1	\N
2098	double room	141	4	1	\N
2099	floor	141	4	1	\N
2100	foreign	141	4	3	\N
2101	guest	141	4	1	\N
2102	guide	141	4	1	\N
2103	hiking	141	4	1	\N
2104	luggage	141	4	1	\N
2105	pack	141	4	2	\N
2106	postcard	141	4	1	\N
2107	reception	141	4	1	\N
2108	receptionist	141	4	1	\N
2109	sightseeing	141	4	1	\N
2110	single	141	4	1	\N
2111	souvenir	141	4	1	\N
2112	star	141	4	1	\N
2113	stay	141	4	1	\N
2114	suitcase	141	4	1	\N
2115	tour	141	4	1	\N
2116	tourism	141	4	1	\N
2117	traveller	141	4	1	\N
2118	twin	141	4	1	\N
2119	walking	141	4	1	\N
2120	airline	142	4	1	\N
2121	baggage	142	4	1	\N
2122	book	142	4	2	\N
2123	catch	142	4	2	\N
2124	change	142	4	2	\N
2125	gate	142	4	1	\N
2126	international	142	4	3	\N
2127	land	142	4	2	\N
2128	passenger	142	4	1	\N
2129	pilot	142	4	1	\N
2130	seat	142	4	1	\N
2131	book	143	4	2	\N
2132	catch	143	4	2	\N
2133	change	143	4	2	\N
2134	coach	143	4	1	\N
2135	engine	143	4	1	\N
2136	line	143	4	1	\N
2137	metro	143	4	1	\N
2138	passenger	143	4	1	\N
2139	platform	143	4	1	\N
2140	public transport	143	4	1	\N
2141	railway	143	4	1	\N
2142	route	143	4	1	\N
2143	schedule	143	4	1	\N
2144	seat	143	4	1	\N
2145	single	143	4	3	\N
2146	single	143	4	1	\N
2147	subway	143	4	1	\N
2148	through	143	4	11	\N
2149	timetable	143	4	1	\N
2150	track	143	4	1	\N
2151	underground	143	4	1	\N
2152	waiting room	143	4	1	\N
2153	accident	144	4	1	\N
2154	coach	144	4	1	\N
2155	corner	144	4	1	\N
2156	cycle	144	4	1	\N
2157	drive	144	4	1	\N
2158	engine	144	4	1	\N
2159	gas	144	4	1	\N
2160	inside	144	4	3	\N
2161	instructor	144	4	1	\N
2162	learner	144	4	1	\N
2163	motorbike	144	4	1	\N
2164	motor car	144	4	1	\N
2165	motorcycle	144	4	1	\N
2166	motorway	144	4	1	\N
2167	oil	144	4	1	\N
2168	parking	144	4	1	\N
2169	passenger	144	4	1	\N
2170	petrol	144	4	1	\N
2171	repair	144	4	2	\N
2172	road map	144	4	1	\N
2173	roof	144	4	1	\N
2174	truck	144	4	1	\N
2175	turn	144	4	1	\N
2176	van	144	4	1	\N
2177	vehicle	144	4	1	\N
2178	wheel	144	4	1	\N
2179	land	145	4	2	\N
2180	passenger	145	4	1	\N
2181	sail	145	4	2	\N
2182	sailing	145	4	1	\N
2183	ship	145	4	1	\N
2184	accept	146	4	2	\N
2185	advert	146	4	1	\N
2186	advertise	146	4	2	\N
2187	advertisement	146	4	1	\N
2188	boss	146	4	1	\N
2189	businessman	146	4	1	\N
2190	business person	146	4	1	\N
2191	business woman	146	4	1	\N
2192	department	146	4	1	\N
2193	director	146	4	1	\N
2194	employ	146	4	2	\N
2195	employer	146	4	1	\N
2196	factory	146	4	1	\N
2197	industry	146	4	1	\N
2198	leader	146	4	1	\N
2199	manage	146	4	2	\N
2200	manager	146	4	1	\N
2201	network	146	4	1	\N
2202	offer	146	4	2	\N
2203	offer	146	4	1	\N
2204	office worker	146	4	1	\N
2205	poster	146	4	1	\N
2206	sale	146	4	1	\N
2207	secretary	146	4	1	\N
2208	service	146	4	1	\N
2209	tourism	146	4	1	\N
2210	architect	147	4	1	\N
2211	assistant	147	4	1	\N
2212	assistant	147	4	3	\N
2213	boss	147	4	1	\N
2214	builder	147	4	1	\N
2215	businessman	147	4	1	\N
2216	business person	147	4	1	\N
2217	businesswoman	147	4	1	\N
2218	chef	147	4	1	\N
2219	chemist	147	4	1	\N
2220	cleaner	147	4	1	\N
2221	cook	147	4	1	\N
2222	creative	147	4	3	\N
2223	dentist	147	4	1	\N
2224	designer	147	4	1	\N
2225	detective	147	4	1	\N
2226	director	147	4	1	\N
2227	employ	147	4	2	\N
2228	engineer	147	4	1	\N
2229	fashion designer	147	4	1	\N
2230	hairdresser	147	4	1	\N
2231	head	147	4	1	\N
2232	instructor	147	4	1	\N
2233	journalist	147	4	1	\N
2234	lawyer	147	4	1	\N
2235	manager	147	4	1	\N
2236	medical	147	4	3	\N
2237	model	147	4	1	\N
2238	musician	147	4	1	\N
2239	officer	147	4	1	\N
2240	painter	147	4	1	\N
2241	pilot	147	4	1	\N
2242	police officer	147	4	1	\N
2243	professor	147	4	1	\N
2244	receptionist	147	4	1	\N
2245	researcher	147	4	1	\N
2246	secretary	147	4	1	\N
2247	shop assistant	147	4	1	\N
2248	soldier	147	4	1	\N
2249	train	147	4	2	\N
2250	training	147	4	1	\N
2251	working	147	4	3	\N
2252	amount	148	4	1	\N
2253	billion	148	4	9	\N
2254	borrow	148	4	2	\N
2255	cash	148	4	1	\N
2256	credit	148	4	1	\N
2257	credit card	148	4	1	\N
2258	earn	148	4	2	\N
2259	fall	148	4	2	\N
2260	free	148	4	3	\N
2261	increase	148	4	2	\N
2262	increase	148	4	1	\N
2263	lend	148	4	2	\N
2264	make	148	4	2	\N
2265	pay	148	4	1	\N
2266	penny	148	4	1	\N
2267	per cent	148	4	1	\N
2268	per centa	148	4	3	\N
2269	purse	148	4	1	\N
2270	reduce	148	4	2	\N
2271	rise	148	4	2	\N
2272	salary	148	4	1	\N
2273	save	148	4	2	\N
2274	wallet	148	4	1	\N
2275	achieve	149	4	2	\N
2276	apply	149	4	2	\N
2277	attend	149	4	2	\N
2278	boss	149	4	1	\N
2279	colleague	149	4	1	\N
2280	creative	149	4	3	\N
2281	department	149	4	1	\N
2282	diary	149	4	1	\N
2283	employee	149	4	1	\N
2284	employer	149	4	1	\N
2285	experience	149	4	1	\N
2286	industry	149	4	1	\N
2287	interviewer	149	4	1	\N
2288	manage	149	4	2	\N
2289	offad	149	4	2	\N
2290	pay	149	4	1	\N
2291	physical	149	4	3	\N
2292	question	149	4	2	\N
2293	reception	149	4	1	\N
2294	salary	149	4	1	\N
2295	schedule	149	4	1	\N
2296	target	149	4	1	\N
2297	task	149	4	1	\N
2298	big cat	150	5	1	\N
2299	bull	150	5	1	\N
2300	camel	150	5	1	\N
2301	crocodile	150	5	1	\N
2302	dolphin	150	5	1	\N
2303	endangered	150	5	3	\N
2304	fox	150	5	1	\N
2305	fur	150	5	1	\N
2306	goat	150	5	1	\N
2307	guide dog	150	5	1	\N
2308	guinea pig	150	5	1	\N
2309	hamster	150	5	1	\N
2310	police dog	150	5	1	\N
2311	sheepdog	150	5	1	\N
2312	shell	150	5	1	\N
2313	tail	150	5	1	\N
2314	wolf	150	5	1	\N
2315	wool	150	5	1	\N
2316	seabird	151	5	1	\N
2317	tail	151	5	1	\N
2318	turkey	151	5	1	\N
2319	wing	151	5	1	\N
2320	fishbowl	152	5	1	\N
2321	salmon	152	5	1	\N
2322	sea fish	152	5	1	\N
2323	shell	152	5	1	\N
2324	tail	152	5	1	\N
2325	ant	153	5	1	\N
2326	bee	153	5	1	\N
2327	butterfly	153	5	1	\N
2328	mosquito	153	5	1	\N
2329	cut	154	5	1	\N
2330	expression	154	5	1	\N
2331	fair	154	5	3	\N
2332	fair-haired	154	5	3	\N
2333	figure	154	5	1	\N
2334	grey-haired	154	5	3	\N
2335	haircut	154	5	1	\N
2336	hairdryer	154	5	1	\N
2337	hairstyle	154	5	1	\N
2338	moustache	154	5	1	\N
2339	pale	154	5	3	\N
2340	scissors	154	5	1	\N
2341	shampoo	154	5	1	\N
2342	shampoo	154	5	2	\N
2343	shave	154	5	2	\N
2344	shaver	154	5	1	\N
2345	shiny	154	5	3	\N
2346	spot	154	5	1	\N
2347	thick	154	5	3	\N
2348	toothpaste	154	5	1	\N
2349	ugly	154	5	3	\N
2350	unattractive	154	5	3	\N
2351	well dressed	154	5	3	\N
2352	backbone	155	5	1	\N
2353	bottom	155	5	1	\N
2354	chest	155	5	1	\N
2355	false teeth	155	5	1	\N
2356	lip	155	5	1	\N
2357	muscle	155	5	1	\N
2358	nail	155	5	1	\N
2359	physically	155	5	11	\N
2360	throat	155	5	1	\N
2361	toe	155	5	1	\N
2362	tongue	155	5	1	\N
2363	baggy	156	5	3	\N
2364	blouse	156	5	1	\N
2365	bra	156	5	1	\N
2366	cap	156	5	1	\N
2367	chain	156	5	1	\N
2368	cloth	156	5	1	\N
2369	costume	156	5	1	\N
2370	cotton	156	5	1	\N
2371	denim	156	5	1	\N
2372	designer	156	5	3	\N
2373	diamond	156	5	1	\N
2374	earring	156	5	1	\N
2375	fashionable	156	5	3	\N
2376	fasten	156	5	2	\N
2377	fur	156	5	1	\N
2378	glove	156	5	1	\N
2379	jewel	156	5	1	\N
2380	jogging suit	156	5	1	\N
2381	label	156	5	1	\N
2382	leather	156	5	1	\N
2383	material	156	5	1	\N
2384	model	156	5	2	\N
2385	necklace	156	5	1	\N
2386	panties	156	5	1	\N
2387	pattern	156	5	1	\N
2388	photographer	156	5	1	\N
2389	pyjamas	156	5	1	\N
2390	raincoat	156	5	1	\N
2391	smart	156	5	3	\N
2392	smartly	156	5	11	\N
2393	stripe	156	5	1	\N
2394	sun hat	156	5	1	\N
2395	supermodel	156	5	1	\N
2396	sweatshirt	156	5	1	\N
2397	swimming costume	156	5	1	\N
2398	swimming trunks	156	5	1	\N
2399	swimsuit	156	5	1	\N
2400	tee shirt	156	5	1	\N
2401	tennis shoe	156	5	1	\N
2402	tight	156	5	3	\N
2403	tights	156	5	1	\N
2404	trendy	156	5	3	\N
2405	trouser	156	5	3	\N
2406	uncomfortable	156	5	3	\N
2407	underpants	156	5	1	\N
2408	underwear	156	5	1	\N
2409	undress	156	5	2	\N
2410	unfashionable	156	5	3	\N
2411	unfasten	156	5	2	\N
2412	wool	156	5	1	\N
2413	colored	157	5	3	\N
2414	colour	157	5	2	\N
2415	coloured	157	5	3	\N
2416	cream	157	5	1	\N
2417	cream	157	5	3	\N
2418	diamond	157	5	1	\N
2419	pale	157	5	3	\N
2420	surface	157	5	1	\N
2421	abbreviation	158	5	1	\N
2422	active	158	5	3	\N
2423	active	158	5	1	\N
2424	advanced	158	5	3	\N
2425	adverbial	158	5	3	\N
2426	apostrophe	158	5	1	\N
2427	argument	158	5	1	\N
2428	article	158	5	1	\N
2429	auxiliary	158	5	1	\N
2430	beginner	158	5	1	\N
2431	clause	158	5	1	\N
2432	communication	158	5	1	\N
2433	conjunction	158	5	1	\N
2434	continuous	158	5	3	\N
2435	contraction	158	5	1	\N
2436	defining	158	5	3	\N
2437	definite article	158	5	1	\N
2438	determiner	158	5	1	\N
2439	direct object	158	5	1	\N
2440	direct speech	158	5	1	\N
2441	exclamation	158	5	1	\N
2442	exclamation mark	158	5	1	\N
2443	fluent	158	5	3	\N
2444	gerund	158	5	1	\N
2445	grammatical	158	5	3	\N
2446	imperative	158	5	3	\N
2447	imperative	158	5	1	\N
2448	indefinite article	158	5	1	\N
2449	indirect object	158	5	1	\N
2450	indirect speech	158	5	1	\N
2451	interrogative	158	5	3	\N
2452	intonation	158	5	1	\N
2453	Irish	158	5	1	\N
2454	main clause	158	5	1	\N
2455	native speaker	158	5	1	\N
2456	object	158	5	1	\N
2457	part of speech	158	5	1	\N
2458	passive	158	5	3	\N
2459	passive	158	5	1	\N
2460	period	158	5	1	\N
2461	point	158	5	1	\N
2462	prefix	158	5	1	\N
2463	prepositional	158	5	3	\N
2464	progressive	158	5	3	\N
2465	proper noun	158	5	1	\N
2466	quotation marks	158	5	1	\N
2467	quote	158	5	2	\N
2468	reflexive	158	5	3	\N
2469	relative	158	5	3	\N
2470	reported speech	158	5	1	\N
2471	saying	158	5	1	\N
2472	the past perfect	158	5	1	\N
2473	suffix	158	5	1	\N
2474	tag question	158	5	1	\N
2475	transitive	158	5	3	\N
2476	Welsh	158	5	1	\N
2477	answering machine	159	5	1	\N
2478	answerphone	159	5	1	\N
2479	attach	159	5	2	\N
2480	blog	159	5	2	\N
2481	blogger	159	5	1	\N
2482	blogging	159	5	1	\N
2483	blog post	159	5	1	\N
2484	communication	159	5	1	\N
2485	connection	159	5	1	\N
2486	contact	159	5	2	\N
2487	google	159	5	2	\N
2488	like	159	5	2	\N
2489	like	159	5	1	\N
2490	local call	159	5	1	\N
2491	message	159	5	2	\N
2492	phone box	159	5	1	\N
2493	podcast	159	5	1	\N
2494	search engine	159	5	1	\N
2495	surf	159	5	2	\N
2496	telephone banking	159	5	1	\N
2497	telephone box	159	5	1	\N
2498	text-message	159	5	2	\N
2499	text-messaging	159	5	1	\N
2500	tweet	159	5	1	\N
2501	tweet	159	5	2	\N
2502	Twitter™	159	5	1	\N
2503	user group	159	5	1	\N
2504	voicemail	159	5	1	\N
2505	cave painting	160	5	1	\N
2506	collection	160	5	1	\N
2507	decorate	160	5	2	\N
2508	exhibition	160	5	1	\N
2509	fake	160	5	1	\N
2510	frame	160	5	1	\N
2511	frame	160	5	2	\N
2512	graffiti	160	5	1	\N
2513	portrait	160	5	1	\N
2514	printing	160	5	1	\N
2515	represent	160	5	2	\N
2516	sculpture	160	5	1	\N
2517	statue	160	5	1	\N
2518	studio	160	5	1	\N
2519	action film	161	5	1	\N
2520	action movie	161	5	1	\N
2521	agent	161	5	1	\N
2522	cameraman	161	5	1	\N
2523	camerawoman	161	5	1	\N
2524	costume	161	5	1	\N
2525	curtain	161	5	1	\N
2526	direct	161	5	2	\N
2527	home cinema	161	5	1	\N
2528	home theater	161	5	1	\N
2529	horror	161	5	1	\N
2530	line	161	5	1	\N
2531	location	161	5	1	\N
2532	musical	161	5	1	\N
2533	part	161	5	1	\N
2534	performance	161	5	1	\N
2535	performer	161	5	1	\N
2536	plot	161	5	1	\N
2537	preview	161	5	2	\N
2538	producer	161	5	1	\N
2539	scenery	161	5	1	\N
2540	script	161	5	1	\N
2541	set	161	5	2	\N
2542	setting	161	5	1	\N
2543	special effects	161	5	1	\N
2544	speech	161	5	1	\N
2545	stage	161	5	1	\N
2546	studio	161	5	1	\N
2547	superhero	161	5	1	\N
2548	superstar	161	5	1	\N
2549	thriller	161	5	1	\N
2550	western	161	5	1	\N
2551	blogger	162	5	1	\N
2552	chapter	162	5	1	\N
2553	conclusion	162	5	1	\N
2554	cover	162	5	1	\N
2555	direct speech	162	5	1	\N
2556	editor	162	5	1	\N
2557	entry	162	5	1	\N
2558	episode	162	5	1	\N
2559	excerpt	162	5	1	\N
2560	fairy tale	162	5	1	\N
2561	ghost story	162	5	1	\N
2562	glossary	162	5	1	\N
2563	historical	162	5	3	\N
2564	horror story	162	5	1	\N
2565	indirect speech	162	5	1	\N
2566	journal	162	5	1	\N
2567	literature	162	5	1	\N
2568	message	162	5	1	\N
2569	mystery	162	5	1	\N
2570	narrative	162	5	1	\N
2571	original	162	5	3	\N
2572	plot	162	5	1	\N
2573	poem	162	5	1	\N
2574	poet	162	5	1	\N
2575	poetry	162	5	1	\N
2576	publisher	162	5	1	\N
2577	quotation	162	5	1	\N
2578	quote	162	5	2	\N
2579	reviewer	162	5	1	\N
2580	setting	162	5	1	\N
2581	songwriter	162	5	1	\N
2582	superhero	162	5	1	\N
2583	theme	162	5	1	\N
2584	thriller	162	5	1	\N
2585	album	163	5	1	\N
2586	B	163	5	1	\N
2587	C	163	5	1	\N
2588	D	163	5	1	\N
2589	disco	163	5	1	\N
2590	drum	163	5	1	\N
2591	drummer	163	5	1	\N
2592	E	163	5	1	\N
2593	F	163	5	1	\N
2594	folk song	163	5	1	\N
2595	G	163	5	1	\N
2596	iPod™	163	5	1	\N
2597	keyboard	163	5	1	\N
2598	live	163	5	3	\N
2599	musical	163	5	1	\N
2600	performance	163	5	1	\N
2601	performer	163	5	1	\N
2602	record	163	5	1	\N
2603	songwriter	163	5	1	\N
2604	tape	163	5	1	\N
2605	tour	163	5	2	\N
2606	trumpet	163	5	1	\N
2607	ad	164	5	1	\N
2608	advice column	164	5	1	\N
2609	break	164	5	1	\N
2610	camerawoman	164	5	1	\N
2611	channel	164	5	1	\N
2612	commercial	164	5	1	\N
2613	digital television	164	5	1	\N
2614	documentary	164	5	1	\N
2615	editor	164	5	1	\N
2616	episode	164	5	1	\N
2617	evening paper	164	5	1	\N
2618	flat-screen	164	5	3	\N
2619	game show	164	5	1	\N
2620	guest	164	5	1	\N
2621	headline	164	5	1	\N
2622	home cinema	164	5	1	\N
2623	home theater	164	5	1	\N
2624	host	164	5	1	\N
2625	item	164	5	1	\N
2626	journal	164	5	1	\N
2627	live	164	5	3	\N
2628	network	164	5	1	\N
2629	newsreader	164	5	1	\N
2630	photographer	164	5	1	\N
2631	podcast	164	5	1	\N
2632	presenter	164	5	1	\N
2633	press	164	5	1	\N
2634	preview	164	5	1	\N
2635	preview	164	5	2	\N
2636	producer	164	5	1	\N
2637	repeat	164	5	1	\N
2638	show	164	5	2	\N
2639	soap opera	164	5	1	\N
2640	source	164	5	1	\N
2641	studio	164	5	1	\N
2642	talk show	164	5	1	\N
2643	view	164	5	2	\N
2644	viewer	164	5	1	\N
2645	weather forecast	164	5	1	\N
2646	wireless	164	5	1	\N
2647	bake	165	5	2	\N
2648	barbecue	165	5	1	\N
2649	barbecue	165	5	2	\N
2650	butter knife	165	5	1	\N
2651	cafeteria	165	5	1	\N
2652	calorie	165	5	1	\N
2653	cookbook	165	5	1	\N
2654	cookery	165	5	1	\N
2655	cookery book	165	5	1	\N
2656	course	165	5	1	\N
2657	diet	165	5	2	\N
2658	dieter	165	5	1	\N
2659	fry	165	5	2	\N
2660	host	165	5	1	\N
2661	hot	165	5	3	\N
2662	ingredient	165	5	1	\N
2663	kettle	165	5	1	\N
2664	light	165	5	3	\N
2665	liquid	165	5	1	\N
2666		165	5	13	\N
2667	lunch	165	5	2	\N
2668	main course	165	5	1	\N
2669	measure	165	5	2	\N
2670	microwave	165	5	1	\N
2671	microwave	165	5	2	\N
2672	mild	165	5	3	\N
2673	mix	165	5	2	\N
2674	packed lunch	165	5	1	\N
2675	pan	165	5	1	\N
2676	paper towel	165	5	1	\N
2677	picnic	165	5	1	\N
2678	pot	165	5	1	\N
2679	pound	165	5	1	\N
2680	reservation	165	5	1	\N
2681	roast	165	5	2	\N
2682	saucepan	165	5	1	\N
2683	service	165	5	1	\N
2684	slice	165	5	2	\N
2685	spicy	165	5	3	\N
2686	starter	165	5	1	\N
2687	strong	165	5	3	\N
2688	tasty	165	5	3	\N
2689	thick	165	5	3	\N
2690	thin	165	5	3	\N
2691	tin	165	5	1	\N
2692	tip	165	5	1	\N
2693	tip	165	5	2	\N
2694	toast	165	5	2	\N
2695	waitress	165	5	1	\N
2696	warm	165	5	2	\N
2697	washing-up	165	5	1	\N
2698	weigh	165	5	2	\N
2699	wine bar	165	5	1	\N
2700	wine list	165	5	1	\N
2701	wine waiter	165	5	1	\N
2702	alcohol	166	5	1	\N
2703	alcoholic	166	5	3	\N
2704	champagne	166	5	1	\N
2705	fizzy	166	5	3	\N
2706	kettle	166	5	1	\N
2707	lemonade	166	5	1	\N
2708	milky	166	5	3	\N
2709	non-alcoholic	166	5	3	\N
2710	pour	166	5	2	\N
2711	soda	166	5	1	\N
2712	teapot	166	5	1	\N
2713	bacon	167	5	1	\N
2714	black pepper	167	5	1	\N
2715	bread roll	167	5	1	\N
2716	burger	167	5	1	\N
2717	cabbage	167	5	1	\N
2718	cheeseburger	167	5	1	\N
2719	corn	167	5	1	\N
2720	curry	167	5	1	\N
2721	flour	167	5	1	\N
2722	fruit salad	167	5	1	\N
2723	garlic	167	5	1	\N
2724	grain	167	5	1	\N
2725	grape	167	5	1	\N
2726	green	167	5	1	\N
2727	green bean	167	5	1	\N
2728	honey	167	5	1	\N
2729	lettuce	167	5	1	\N
2730	loaf	167	5	1	\N
2731	mint	167	5	1	\N
2732	olive	167	5	1	\N
2733	olive oil	167	5	1	\N
2734	pancake	167	5	1	\N
2735	peanut	167	5	1	\N
2736	peanut butter	167	5	1	\N
2737	pear	167	5	1	\N
2738	pineapple	167	5	1	\N
2739	red meat	167	5	1	\N
2740	roll	167	5	1	\N
2741	sausage meat	167	5	1	\N
2742	seafood	167	5	1	\N
2743	shoulder	167	5	1	\N
2744	spaghetti	167	5	1	\N
2745	steak	167	5	1	\N
2746	turkey	167	5	1	\N
2747	white	167	5	1	\N
2748	white flour	167	5	1	\N
2749	white meat	167	5	1	\N
2750	wing	167	5	1	\N
2751	yogurt	167	5	1	\N
2752	accept	168	5	2	\N
2753	agreement	168	5	1	\N
2754	argue	168	5	2	\N
2755	commit	168	5	2	\N
2756	condition	168	5	1	\N
2757	convince	168	5	2	\N
2758	deal	168	5	1	\N
2759	encourage	168	5	2	\N
2760	persuade	168	5	2	\N
2761	pressure	168	5	1	\N
2762	surely	168	5	11	\N
2763	united	168	5	3	\N
2764	as likely as not	169	5	7	\N
2765	canmodal	169	5	2	\N
2766	confident	169	5	3	\N
2767	confidently	169	5	11	\N
2768	couldmodal	169	5	2	\N
2769	definite	169	5	3	\N
2770	doubt	169	5	1	\N
2771	doubt	169	5	2	\N
2772	expected	169	5	3	\N
2773	imagine	169	5	2	\N
2774	judge	169	5	2	\N
2775	look	169	5	2	\N
2776	not necessarily	169	5	7	\N
2777	or somebody/something/somewhere	169	5	7	\N
2778	possibly	169	5	11	\N
2779	prediction	169	5	1	\N
2780	sure	169	5	3	\N
2781	surely	169	5	11	\N
2782	truth	169	5	1	\N
2783	uncertain	169	5	3	\N
2784	unclear	169	5	3	\N
2785	unlikely	169	5	3	\N
2786	unsure	169	5	3	\N
2787	willmodal	169	5	2	\N
2788	absolutely	170	5	11	\N
2789	advise	170	5	2	\N
2790	attitude	170	5	1	\N
2791	badly	170	5	11	\N
2792	battle	170	5	1	\N
2793	belief	170	5	1	\N
2794	change your/somebody’s mind	170	5	7	\N
2795	claim	170	5	2	\N
2796	claim	170	5	1	\N
2797	comment	170	5	2	\N
2798	exactly	170	5	11	\N
2799	examine	170	5	2	\N
2800	expression	170	5	1	\N
2801	fight	170	5	2	\N
2802	fight	170	5	1	\N
2803	fighting	170	5	1	\N
2804	gap	170	5	1	\N
2805	if	170	5	6	\N
2806	if you like	170	5	7	\N
2807	impression	170	5	1	\N
2808	in favour (of somebody/something)	170	5	7	\N
2809	issue	170	5	1	\N
2810	judge	170	5	1	\N
2811	judge	170	5	2	\N
2812	like	170	5	2	\N
2813	like	170	5	1	\N
2814	negative	170	5	3	\N
2815	nor	170	5	6	\N
2816	personally	170	5	11	\N
2817	point of view	170	5	1	\N
2818	positively	170	5	11	\N
2819	protest	170	5	1	\N
2820	protest	170	5	2	\N
2821	prove	170	5	2	\N
2822	respect	170	5	2	\N
2823	reviewer	170	5	1	\N
2824	revise	170	5	2	\N
2825	say	170	5	2	\N
2826	see	170	5	2	\N
2827	strongly	170	5	11	\N
2828	support	170	5	2	\N
2829	theory	170	5	1	\N
2830	while	170	5	6	\N
2831	ban	171	5	2	\N
2832	ban	171	5	1	\N
2833	be supposed to do/be something	171	5	7	\N
2834	condition	171	5	1	\N
2835	illegal	171	5	3	\N
2836	illegally	171	5	11	\N
2837	legal	171	5	3	\N
2838	legally	171	5	11	\N
2839	non-smoking	171	5	3	\N
2840	no-smoking	171	5	3	\N
2841	order	171	5	2	\N
2842	award	172	5	2	\N
2843	change your/somebody’s mind	172	5	7	\N
2844	determined	172	5	3	\N
2845	dislike	172	5	2	\N
2846	dislike	172	5	1	\N
2847	enemy	172	5	1	\N
2848	hate	172	5	1	\N
2849	judge	172	5	1	\N
2850	keen	172	5	3	\N
2851	like	172	5	1	\N
2852	mad	172	5	3	\N
2853	passion	172	5	1	\N
2854	vote	172	5	1	\N
2855	whether	172	5	1	\N
2856	advice column	173	5	1	\N
2857	advise	173	5	2	\N
2858	adviser	173	5	1	\N
2859	better	173	5	11	\N
2860	couldmodal	173	5	2	\N
2861	if I were you	173	5	7	\N
2862	I know	173	5	7	\N
2863	mustmodal	173	5	2	\N
2864	opinion	173	5	1	\N
2865	ought tomodal	173	5	2	\N
2866	recommendation	173	5	1	\N
2867	rule	173	5	1	\N
2868	warn	173	5	2	\N
2869	why not?	173	5	7	\N
2870	athlete	174	5	1	\N
2871	exercise bike	174	5	1	\N
2872	fitness	174	5	1	\N
2873	health club	174	5	1	\N
2874	jogger	174	5	1	\N
2875	PE	174	5	1	\N
2876	physical education	174	5	1	\N
2877	strength	174	5	1	\N
2878	walker	174	5	1	\N
2879	alcoholic	175	5	3	\N
2880	attack	175	5	1	\N
2881	bite	175	5	1	\N
2882	break	175	5	2	\N
2883	break	175	5	1	\N
2884	burnt	175	5	3	\N
2885	catch	175	5	2	\N
2886	cough	175	5	2	\N
2887	cough	175	5	1	\N
2888	cut	175	5	1	\N
2889	develop	175	5	2	\N
2890	drunk	175	5	3	\N
2891	injure	175	5	2	\N
2892	injured	175	5	3	\N
2893	knock	175	5	2	\N
2894	mental	175	5	3	\N
2895	mentally	175	5	11	\N
2896	painful	175	5	3	\N
2897	painfully	175	5	11	\N
2898	pale	175	5	3	\N
2899	poor	175	5	3	\N
2900	pull	175	5	2	\N
2901	react	175	5	2	\N
2902	reject	175	5	2	\N
2903	seasick	175	5	3	\N
2904	spot	175	5	1	\N
2905	spre	175	5	11	\N
2906	suffer	175	5	2	\N
2907	sufferer	175	5	1	\N
2908	symptom	175	5	1	\N
2909	trouble	175	5	1	\N
2910	unwell	175	5	3	\N
2911	upset	175	5	3	\N
2912	upset	175	5	2	\N
2913	upset	175	5	1	\N
2914	victim	175	5	1	\N
2915	wheelchair	175	5	1	\N
2916	appointment	176	5	1	\N
2917	blood test	176	5	1	\N
2918	examine	176	5	2	\N
2919	family doctor	176	5	1	\N
2920	mental health	176	5	1	\N
2921	needle	176	5	1	\N
2922	op	176	5	1	\N
2923	operation	176	5	1	\N
2924	private	176	5	3	\N
2925	quit	176	5	2	\N
2926	reject	176	5	2	\N
2927	tape	176	5	2	\N
2928	treat	176	5	2	\N
2929	treatment	176	5	1	\N
2930	wheelchair	176	5	1	\N
2931	apartment block	177	5	1	\N
2932	balcony	177	5	1	\N
2933	block	177	5	1	\N
2934	campus	177	5	1	\N
2935	cathedral	177	5	1	\N
2936	cottage	177	5	1	\N
2937	court	177	5	1	\N
2938	elevator	177	5	1	\N
2939	entrance	177	5	1	\N
2940	face	177	5	2	\N
2941	farm	177	5	1	\N
2942	frame	177	5	1	\N
2943	garage	177	5	1	\N
2944	hall	177	5	1	\N
2945	hostel	177	5	1	\N
2946	impressive	177	5	3	\N
2947	indoor	177	5	3	\N
2948	indoors	177	5	11	\N
2949	level	177	5	3	\N
2950	location	177	5	1	\N
2951	luxury	177	5	3	\N
2952	mall	177	5	1	\N
2953	next door	177	5	11	\N
2954	office block	177	5	1	\N
2955	outdoor	177	5	3	\N
2956	plan	177	5	1	\N
2957	power station	177	5	1	\N
2958	private	177	5	3	\N
2959	shopping mall	177	5	1	\N
2960	skyscraper	177	5	1	\N
2961	stadium	177	5	1	\N
2962	town hall	177	5	1	\N
2963	barbecue	178	5	1	\N
2964	fence	178	5	1	\N
2965	gardener	178	5	1	\N
2966	path	178	5	1	\N
2967	pot	178	5	1	\N
2968	seed	178	5	1	\N
2969	soil	178	5	1	\N
2970	water	178	5	2	\N
2971	yard	178	5	1	\N
2972	accommodation	179	5	1	\N
2973	alarm	179	5	1	\N
2974	armchair	179	5	1	\N
2975	back door	179	5	1	\N
2976	balcony	179	5	1	\N
2977	burglar alarm	179	5	1	\N
2978	buyer	179	5	1	\N
2979	ceiling	179	5	1	\N
2980	chore	179	5	1	\N
2981	cleaning	179	5	1	\N
2982	cottage	179	5	1	\N
2983	curtain	179	5	1	\N
2984	decorate	179	5	2	\N
2985	entrance	179	5	1	\N
2986	farm	179	5	1	\N
2987	fire alarm	179	5	1	\N
2988	first-floor	179	5	3	\N
2989	freezer	179	5	1	\N
2990	front door	179	5	1	\N
2991	furniture van	179	5	1	\N
2992	gadget	179	5	1	\N
2993	garage	179	5	1	\N
2994	heater	179	5	1	\N
2995	heating	179	5	1	\N
2996	indoor	179	5	3	\N
2997	indoors	179	5	11	\N
2998	iron	179	5	1	\N
2999	iron	179	5	2	\N
3000	ironing	179	5	1	\N
3001	move	179	5	1	\N
3002	outdoor	179	5	3	\N
3003	outdoors	179	5	11	\N
3004	pattern	179	5	1	\N
3005	refrigerator	179	5	1	\N
3006	rent	179	5	1	\N
3007	rent	179	5	2	\N
3008	rug	179	5	1	\N
3009	shelf	179	5	1	\N
3010	sink	179	5	1	\N
3011	solar panel	179	5	1	\N
3012	studio	179	5	1	\N
3013	study	179	5	1	\N
3014	(up) for sale	179	5	7	\N
3015	vase	179	5	1	\N
3016	wardrobe	179	5	1	\N
3017	washing-up	179	5	1	\N
3018	cheat	180	5	2	\N
3019	cheat	180	5	1	\N
3020	chess	180	5	1	\N
3021	crossword	180	5	1	\N
3022	doll	180	5	1	\N
3023	doll’s house	180	5	1	\N
3024	go	180	5	1	\N
3025	level	180	5	1	\N
3026	loser	180	5	1	\N
3027	move	180	5	1	\N
3028	play	180	5	1	\N
3029	playground	180	5	1	\N
3030	skateboard	180	5	1	\N
3031	winning	180	5	3	\N
3032	cookery	181	5	1	\N
3033	explore	181	5	2	\N
3034	gardening	181	5	1	\N
3035	horseback riding	181	5	1	\N
3036	horse riding	181	5	1	\N
3037	jogger	181	5	1	\N
3038	leisure	181	5	1	\N
3039	national park	181	5	1	\N
3040	photography	181	5	1	\N
3041	poetry	181	5	1	\N
3042	riding	181	5	1	\N
3043	sculpture	181	5	1	\N
3044	stamp collecting	181	5	1	\N
3045	track	181	5	1	\N
3046	afford	182	5	2	\N
3047	baker	182	5	1	\N
3048	buyer	182	5	1	\N
3049	chain	182	5	1	\N
3050	change	182	5	1	\N
3051	charge	182	5	2	\N
3052	cheque	182	5	1	\N
3053	coin	182	5	1	\N
3054	currency	182	5	1	\N
3055	deliver	182	5	2	\N
3056	department store	182	5	1	\N
3057	discount	182	5	1	\N
3058	gadget	182	5	1	\N
3059	goods	182	5	1	\N
3060	main street	182	5	1	\N
3061	mall	182	5	1	\N
3062	note	182	5	1	\N
3063	order	182	5	1	\N
3064	packaging	182	5	1	\N
3065	payment	182	5	1	\N
3066	queue	182	5	1	\N
3067	rate	182	5	1	\N
3068	receipt	182	5	1	\N
3069	return	182	5	2	\N
3070	sales slip	182	5	1	\N
3071	seller	182	5	1	\N
3072	service	182	5	1	\N
3073	shelf	182	5	1	\N
3074	shopper	182	5	1	\N
3075	shopping mall	182	5	1	\N
3076	tax	182	5	1	\N
3077	total	182	5	1	\N
3078	trade	182	5	1	\N
3079	unhelpful	182	5	3	\N
3080	value	182	5	1	\N
3081	consequence	183	5	1	\N
3082	develop	183	5	2	\N
3083	development	183	5	1	\N
3084	drop	183	5	2	\N
3085	due	183	5	1	\N
3086	effective	183	5	3	\N
3087	effectively	183	5	11	\N
3088	expand	183	5	2	\N
3089	growing	183	5	3	\N
3090	growth	183	5	1	\N
3091	improvement	183	5	1	\N
3092	increased	183	5	3	\N
3093	indirect	183	5	3	\N
3094	indirectly	183	5	11	\N
3095	mean	183	5	2	\N
3096	produce	183	5	2	\N
3097	raise	183	5	2	\N
3098	reaction	183	5	1	\N
3099	result	183	5	2	\N
3100	rise	183	5	1	\N
3101	therefore	183	5	11	\N
3102	trend	183	5	1	\N
3103	alarm	184	5	1	\N
3104	at risk	184	5	7	\N
3105	dangerously	184	5	11	\N
3106	emergency	184	5	1	\N
3107	escape	184	5	2	\N
3108	escape	184	5	1	\N
3109	guard	184	5	2	\N
3110	mind	184	5	2	\N
3111	risk	184	5	1	\N
3112	risk	184	5	2	\N
3113	safety measure	184	5	1	\N
3114	badly	185	5	11	\N
3115	battle	185	5	1	\N
3116	cost	185	5	2	\N
3117	difficulty	185	5	1	\N
3118	disadvantage	185	5	1	\N
3119	disappointing	185	5	3	\N
3120	disappointingly	185	5	11	\N
3121	unambitious	185	5	3	\N
3122	unsuccessful	185	5	3	\N
3123	unsuccessfully	185	5	11	\N
3124	achievement	186	5	1	\N
3125	aim	186	5	2	\N
3126	aim	186	5	1	\N
3127	ambition	186	5	1	\N
3128	ambitious	186	5	3	\N
3129	ambitiously	186	5	11	\N
3130	battle	186	5	1	\N
3131	bright	186	5	3	\N
3132	brilliantly	186	5	11	\N
3133	compete	186	5	2	\N
3134	effective	186	5	3	\N
3135	effectively	186	5	11	\N
3136	effort	186	5	1	\N
3137	fight	186	5	2	\N
3138	fight	186	5	1	\N
3139	fighting	186	5	1	\N
3140	future	186	5	1	\N
3141	leading	186	5	3	\N
3142	manage	186	5	2	\N
3143	management	186	5	1	\N
3144	positive	186	5	3	\N
3145	practical	186	5	3	\N
3146	promote	186	5	2	\N
3147	respect	186	5	1	\N
3148	respect	186	5	2	\N
3149	secret	186	5	1	\N
3150	successfully	186	5	11	\N
3151	academic	187	5	3	\N
3152	adult education	187	5	1	\N
3153	application	187	5	1	\N
3154	assignment	187	5	1	\N
3155	bell	187	5	1	\N
3156	blackboard	187	5	1	\N
3157	business school	187	5	1	\N
3158	business studies	187	5	1	\N
3159	campus	187	5	1	\N
3160	candidate	187	5	1	\N
3161	canteen	187	5	1	\N
3162	coach	187	5	2	\N
3163	diploma	187	5	1	\N
3164	doctor	187	5	1	\N
3165	Dr	187	5	12	\N
3166	educate	187	5	2	\N
3167	educated	187	5	3	\N
3168	educational	187	5	3	\N
3169	engineering	187	5	1	\N
3170	evening class	187	5	1	\N
3171	exchange	187	5	1	\N
3172	grad	187	5	1	\N
3173	grade	187	5	1	\N
3174	graduate	187	5	1	\N
3175	graduate	187	5	2	\N
3176	graduation	187	5	1	\N
3177	gymnastics	187	5	1	\N
3178	hall	187	5	1	\N
3179	higher education	187	5	1	\N
3180	information technology	187	5	1	\N
3181	laboratory	187	5	1	\N
3182	law	187	5	1	\N
3183	lecturer	187	5	1	\N
3184	mark	187	5	2	\N
3185	mark	187	5	1	\N
3186	medical school	187	5	1	\N
3187	memorize	187	5	2	\N
3188	night school	187	5	1	\N
3189	pass	187	5	1	\N
3190	PE	187	5	1	\N
3191	physical education	187	5	1	\N
3192	place	187	5	1	\N
3193	playground	187	5	1	\N
3194	politics	187	5	1	\N
3195	president	187	5	1	\N
3196	primary	187	5	3	\N
3197	primary school	187	5	1	\N
3198	private school	187	5	1	\N
3199	programme	187	5	1	\N
3200	qualification	187	5	1	\N
3201	qualified	187	5	3	\N
3202	qualify	187	5	2	\N
3203	report	187	5	1	\N
3204	revise	187	5	2	\N
3205	school-leaver	187	5	1	\N
3206	score	187	5	2	\N
3207	secondary school	187	5	1	\N
3208	semester	187	5	1	\N
3209	set	187	5	2	\N
3210	sports day	187	5	1	\N
3211	teaching assistant	187	5	1	\N
3212	term	187	5	1	\N
3213	tutor	187	5	1	\N
3214	whiteboard	187	5	1	\N
3215	written	187	5	3	\N
3216	brother-in-law	188	5	1	\N
3217	close	188	5	3	\N
3218	daughter-in-law	188	5	1	\N
3219	family tree	188	5	1	\N
3220	fancy	188	5	2	\N
3221	father-in-law	188	5	1	\N
3222	friendship	188	5	1	\N
3223	generation	188	5	1	\N
3224	kiss	188	5	2	\N
3225	kiss	188	5	1	\N
3226	love letter	188	5	1	\N
3227	love life	188	5	1	\N
3228	lover	188	5	1	\N
3229	middle name	188	5	1	\N
3230	mother-in-law	188	5	1	\N
3231	nickname	188	5	1	\N
3232	only child	188	5	1	\N
3233	parents-in-law	188	5	1	\N
3234	passion	188	5	1	\N
3235	related	188	5	3	\N
3236	relation	188	5	1	\N
3237	relationship	188	5	1	\N
3238	relative	188	5	1	\N
3239	romantic	188	5	3	\N
3240	separate	188	5	2	\N
3241	single-parent family	188	5	1	\N
3242	sister-in-law	188	5	1	\N
3243	sociable	188	5	3	\N
3244	son-in-law	188	5	1	\N
3245	alone	189	5	3	\N
3246	amaze	189	5	2	\N
3247	amazed	189	5	3	\N
3248	annoy	189	5	2	\N
3249	annoyed	189	5	3	\N
3250	annoying	189	5	3	\N
3251	attraction	189	5	1	\N
3252	bad	189	5	3	\N
3253	belong	189	5	2	\N
3254	cheerful	189	5	3	\N
3255	disappointed	189	5	3	\N
3256	disappointing	189	5	3	\N
3257	embarrassed	189	5	3	\N
3258	embarrassing	189	5	3	\N
3259	emotion	189	5	1	\N
3260	excitement	189	5	1	\N
3261	exhausted	189	5	3	\N
3262	fancy	189	5	2	\N
3263	fear	189	5	2	\N
3264	fed up	189	5	3	\N
3265	frightened	189	5	3	\N
3266	glad	189	5	3	\N
3267	grateful	189	5	3	\N
3268	guilty	189	5	3	\N
3269	happiness	189	5	1	\N
3270	hate	189	5	1	\N
3271	heart	189	5	1	\N
3272	horror	189	5	1	\N
3273	jealous	189	5	3	\N
3274	jump	189	5	2	\N
3275	keen	189	5	3	\N
3276	lonely	189	5	3	\N
3277	mad	189	5	3	\N
3278	painful	189	5	3	\N
3279	passion	189	5	1	\N
3280	phobia	189	5	1	\N
3281	pleasure	189	5	1	\N
3282	proud	189	5	3	\N
3283	red-faced	189	5	3	\N
3284	routine	189	5	1	\N
3285	sadness	189	5	1	\N
3286	shy	189	5	3	\N
3287	stressed	189	5	3	\N
3288	tiredness	189	5	1	\N
3289	trouble	189	5	1	\N
3290	unhappiness	189	5	1	\N
3291	upset	189	5	3	\N
3292	upset	189	5	2	\N
3293	wonder	189	5	1	\N
3294	wonderful	189	5	3	\N
3295	worry	189	5	1	\N
3296	bride	190	5	1	\N
3297	bury	190	5	2	\N
3298	ceremony	190	5	1	\N
3299	childhood	190	5	1	\N
3300	engaged	190	5	3	\N
3301	groom	190	5	1	\N
3302	housewife	190	5	1	\N
3303	marriage	190	5	1	\N
3304	old age	190	5	1	\N
3305	playground	190	5	1	\N
3306	reception	190	5	1	\N
3307	retire	190	5	2	\N
3308	school day	190	5	1	\N
3309	single-parent family	190	5	1	\N
3310	unmarried	190	5	3	\N
3311	youth	190	5	1	\N
3312	academic	191	5	3	\N
3313	ambitious	191	5	3	\N
3314	annoying	191	5	3	\N
3315	brave	191	5	3	\N
3316	calm	191	5	3	\N
3317	character	191	5	1	\N
3318	cheat	191	5	2	\N
3319	comfortable	191	5	3	\N
3320	confident	191	5	3	\N
3321	criminal	191	5	3	\N
3322	cruel	191	5	3	\N
3323	duty	191	5	1	\N
3324	experienced	191	5	3	\N
3325	fake	191	5	1	\N
3326	fool	191	5	2	\N
3327	generous	191	5	3	\N
3328	gentle	191	5	3	\N
3329	grateful	191	5	3	\N
3330	honest	191	5	3	\N
3331	horrible	191	5	3	\N
3332	independent	191	5	3	\N
3333	invent	191	5	2	\N
3334	jealous	191	5	3	\N
3335	keen	191	5	3	\N
3336	kind	191	5	3	\N
3337	kindness	191	5	1	\N
3338	lie	191	5	2	\N
3339	loud	191	5	3	\N
3340	mad	191	5	3	\N
3341	nervous	191	5	3	\N
3342	organized	191	5	3	\N
3343	outgoing	191	5	3	\N
3344	pleasant	191	5	3	\N
3345	positive	191	5	3	\N
3346	pretend	191	5	2	\N
3347	professional	191	5	3	\N
3348	proud	191	5	3	\N
3349	quality	191	5	1	\N
3350	relaxed	191	5	3	\N
3351	reliable	191	5	3	\N
3352	selfish	191	5	3	\N
3353	sensible	191	5	3	\N
3354	shy	191	5	3	\N
3355	silly	191	5	3	\N
3356	slow	191	5	3	\N
3357	smart	191	5	3	\N
3358	sociable	191	5	3	\N
3359	strong	191	5	3	\N
3360	talented	191	5	3	\N
3361	trick	191	5	2	\N
3362	understanding	191	5	3	\N
3363	unfriendly	191	5	3	\N
3364	warm	191	5	3	\N
3365	welcoming	191	5	3	\N
3366	wrong	191	5	3	\N
3367	arrest	192	5	2	\N
3368	arrest	192	5	1	\N
3369	attacker	192	5	1	\N
3370	bomb	192	5	2	\N
3371	bomber	192	5	1	\N
3372	break	192	5	2	\N
3373	burglar	192	5	1	\N
3374	burglary	192	5	1	\N
3375	burgle	192	5	2	\N
3376	case	192	5	1	\N
3377	clue	192	5	1	\N
3378	commit	192	5	2	\N
3379	criminal	192	5	3	\N
3380	guard	192	5	1	\N
3381	hang	192	5	2	\N
3382	illegal	192	5	3	\N
3383	illegally	192	5	11	\N
3384	investigate	192	5	2	\N
3385	killer	192	5	1	\N
3386	killing	192	5	1	\N
3387	murder	192	5	1	\N
3388	murder	192	5	2	\N
3389	murderer	192	5	1	\N
3390	mystery	192	5	1	\N
3391	prisoner	192	5	1	\N
3392	punish	192	5	2	\N
3393	punishment	192	5	1	\N
3394	robber	192	5	1	\N
3395	shoot	192	5	2	\N
3396	victim	192	5	1	\N
3397	violent	192	5	3	\N
3398	weapon	192	5	1	\N
3399	wrong	192	5	1	\N
3400	act	193	5	1	\N
3401	agreement	193	5	1	\N
3402	case	193	5	1	\N
3403	claim	193	5	2	\N
3404	court	193	5	1	\N
3405	criminal	193	5	3	\N
3406	guilty	193	5	3	\N
3407	illegal	193	5	3	\N
3408	illegally	193	5	11	\N
3409	innocent	193	5	3	\N
3410	judge	193	5	1	\N
3411	legal	193	5	3	\N
3412	legally	193	5	11	\N
3413	marriage	193	5	1	\N
3414	order	193	5	1	\N
3415	police department	193	5	1	\N
3416	police dog	193	5	1	\N
3417	police force	193	5	1	\N
3418	represent	193	5	2	\N
3419	respect	193	5	2	\N
3420	right	193	5	1	\N
3421	security	193	5	1	\N
3422	statement	193	5	1	\N
3423	captain	194	5	1	\N
3424	class	194	5	1	\N
3425	generation	194	5	1	\N
3426	global	194	5	3	\N
3427	he	194	5	11	\N
3428	lower class	194	5	3	\N
3429	prince	194	5	1	\N
3430	princess	194	5	1	\N
3431	race	194	5	1	\N
3432	represent	194	5	2	\N
3433	social	194	5	3	\N
3434	the upper class	194	5	1	\N
3435	the working class	194	5	1	\N
3436	upper class	194	5	3	\N
3437	working class	194	5	3	\N
3438	act	195	5	1	\N
3439	border	195	5	1	\N
3440	campaign	195	5	1	\N
3441	economy	195	5	1	\N
3442	election	195	5	1	\N
3443	EU	195	5	12	\N
3444	green	195	5	3	\N
3445	internationally	195	5	11	\N
3446	left	195	5	1	\N
3447	Member of Parliament	195	5	1	\N
3448	movement	195	5	1	\N
3449	MP	195	5	1	\N
3450	party	195	5	1	\N
3451	policy	195	5	1	\N
3452	political	195	5	3	\N
3453	politically	195	5	11	\N
3454	politician	195	5	1	\N
3455	politics	195	5	1	\N
3456	prime minister	195	5	1	\N
3457	relation	195	5	1	\N
3458	rule	195	5	2	\N
3459	ruler	195	5	1	\N
3460	state	195	5	3	\N
3461	the European Union	195	5	1	\N
3462	the United Nations	195	5	1	\N
3463	supporter	195	5	1	\N
3464	town hall	195	5	1	\N
3465	trade	195	5	1	\N
3466	vote	195	5	1	\N
3467	vote	195	5	2	\N
3468	voter	195	5	1	\N
3469	belief	196	5	1	\N
3470	bury	196	5	2	\N
3471	cathedral	196	5	1	\N
3472	celebration	196	5	1	\N
3473	ceremony	196	5	1	\N
3474	custom	196	5	1	\N
3475	Easter	196	5	1	\N
3476	marriage	196	5	1	\N
3477	pray	196	5	1	\N
3478	prayer	196	5	1	\N
3479	priest	196	5	1	\N
3480	religion	196	5	1	\N
3481	religious	196	5	3	\N
3482	thanksgiving	196	5	1	\N
3483	accept	197	5	2	\N
3484	alcohol	197	5	1	\N
3485	alcoholic	197	5	3	\N
3486	assist	197	5	2	\N
3487	donate	197	5	2	\N
3488	drinking	197	5	1	\N
3489	drunk	197	5	3	\N
3490	equal	197	5	3	\N
3491	fire	197	5	2	\N
3492	helper	197	5	1	\N
3493	immigrant	197	5	1	\N
3494	issue	197	5	1	\N
3495	movement	197	5	1	\N
3496	poverty	197	5	1	\N
3497	protest	197	5	1	\N
3498	protest	197	5	2	\N
3499	quit	197	5	2	\N
3500	raise	197	5	2	\N
3501	reaction	197	5	1	\N
3502	right	197	5	1	\N
3503	smoke	197	5	1	\N
3504	smoker	197	5	1	\N
3505	social	197	5	3	\N
3506	tablet	197	5	1	\N
3507	unemployed	197	5	3	\N
3508	unemployment	197	5	1	\N
3509	victim	197	5	1	\N
3510	volunteer	197	5	1	\N
3511	volunteer	197	5	2	\N
3512	agreement	198	5	1	\N
3513	base	198	5	1	\N
3514	battle	198	5	1	\N
3515	bomb	198	5	1	\N
3516	bomb	198	5	2	\N
3517	captain	198	5	1	\N
3518	damage	198	5	2	\N
3519	deal	198	5	1	\N
3520	enemy	198	5	1	\N
3521	explode	198	5	2	\N
3522	explosion	198	5	1	\N
3523	fire	198	5	2	\N
3524	force	198	5	1	\N
3525	guard	198	5	1	\N
3526	guard	198	5	2	\N
3527	nuclear	198	5	3	\N
3528	order	198	5	1	\N
3529	order	198	5	2	\N
3530	sailor	198	5	1	\N
3531	shoot	198	5	1	\N
3532	sink	198	5	2	\N
3533	take	198	5	2	\N
3534	target	198	5	1	\N
3535	weapon	198	5	1	\N
3536	biologist	199	5	1	\N
3537	cycle	199	5	1	\N
3538	divide	199	5	2	\N
3539	access	200	5	2	\N
3540	chip	200	5	1	\N
3541	click	200	5	2	\N
3542	click	200	5	1	\N
3543	computing	200	5	1	\N
3544	error message	200	5	1	\N
3545	file	200	5	1	\N
3546	flat-screen	200	5	3	\N
3547	information technology	200	5	1	\N
3548	iPod™	200	5	1	\N
3549	IT	200	5	1	\N
3550	key	200	5	1	\N
3551	keyboard	200	5	1	\N
3552	login	200	5	1	\N
3553	program	200	5	2	\N
3554	programmer	200	5	1	\N
3555	quit	200	5	2	\N
3556	software	200	5	1	\N
3557	system	200	5	1	\N
3558	type	200	5	2	\N
3559	username	200	5	1	\N
3560	Wi-Fi™	200	5	1	\N
3561	window	200	5	1	\N
3562	wireless	200	5	3	\N
3563	battery	201	5	1	\N
3564	engineering	201	5	1	\N
3565	gadget	201	5	1	\N
3566	high-tech	201	5	3	\N
3567	hi-tech	201	5	3	\N
3568	press	201	5	2	\N
3569	robot	201	5	1	\N
3570	technical	201	5	3	\N
3571	turbine	201	5	1	\N
3572	addition	202	5	1	\N
3573	calorie	202	5	1	\N
3574	count	202	5	1	\N
3575	divide	202	5	2	\N
3576	equallinking	202	5	2	\N
3577	length	202	5	1	\N
3578		202	5	13	\N
3579	measure	202	5	2	\N
3580	milligram	202	5	1	\N
3581	millilitre	202	5	1	\N
3582	millimetre	202	5	1	\N
3583	minus	202	5	4	\N
3584	minus	202	5	1	\N
3585	ml	202	5	12	\N
3586	mm	202	5	12	\N
3587	percentage	202	5	1	\N
3588	plus	202	5	4	\N
3589	point	202	5	1	\N
3590	pound	202	5	1	\N
3591	sign	202	5	1	\N
3592	statistic	202	5	1	\N
3593	stats	202	5	1	\N
3594	times	202	5	4	\N
3595	total	202	5	1	\N
3596	weighlinking	202	5	2	\N
3597	yard	202	5	1	\N
3598	alcohol	203	5	1	\N
3599	bend	203	5	2	\N
3600	block	203	5	1	\N
3601	charge	203	5	2	\N
3602	chemical	203	5	3	\N
3603	chemical	203	5	1	\N
3604	chemist	203	5	1	\N
3605	expand	203	5	2	\N
3606	force	203	5	1	\N
3607	iron	203	5	1	\N
3608	liquid	203	5	1	\N
3609	nuclear	203	5	3	\N
3610	nuclear energy	203	5	1	\N
3611	nuclear power	203	5	1	\N
3612	physicist	203	5	1	\N
3613	pull	203	5	1	\N
3614	reaction	203	5	1	\N
3615	reflect	203	5	2	\N
3616	sand	203	5	1	\N
3617	sheet	203	5	1	\N
3618	solid	203	5	1	\N
3619	stick	203	5	2	\N
3620	substance	203	5	1	\N
3621	wave	203	5	1	\N
3622	analyse	204	5	2	\N
3623	analysis	204	5	1	\N
3624	conclude	204	5	2	\N
3625	conclusion	204	5	1	\N
3626	confirm	204	5	2	\N
3627	determine	204	5	2	\N
3628	development	204	5	1	\N
3629	engineering	204	5	1	\N
3630	experiment	204	5	2	\N
3631	journal	204	5	1	\N
3632	laboratory	204	5	1	\N
3633	prove	204	5	2	\N
3634	scientific	204	5	3	\N
3635	statistic	204	5	1	\N
3636	stats	204	5	1	\N
3637	study	204	5	1	\N
3638	study	204	5	2	\N
3639	theory	204	5	1	\N
3640	captain	205	5	1	\N
3641	competing	205	5	3	\N
3642	course	205	5	1	\N
3643	court	205	5	1	\N
3644	cricketer	205	5	1	\N
3645	flag	205	5	1	\N
3646	footballer	205	5	1	\N
3647	footballing	205	5	3	\N
3648	friendly	205	5	3	\N
3649	goalkeeper	205	5	1	\N
3650	golfer	205	5	1	\N
3651	half-time	205	5	1	\N
3652	hole	205	5	1	\N
3653	pass	205	5	2	\N
3654	play	205	5	1	\N
3655	qualification	205	5	1	\N
3656	qualify	205	5	2	\N
3657	racket	205	5	1	\N
3658	rugby	205	5	1	\N
3659	save	205	5	2	\N
3660	save	205	5	1	\N
3661	stadium	205	5	1	\N
3662	tennis racket	205	5	1	\N
3663	athletic	206	5	3	\N
3664	athletics	206	5	1	\N
3665	bicycle	206	5	2	\N
3666	bike	206	5	2	\N
3667	champion	206	5	1	\N
3668	climber	206	5	1	\N
3669	coach	206	5	2	\N
3670	competitive	206	5	3	\N
3671	competitor	206	5	1	\N
3672	cyclist	206	5	1	\N
3673	enter	206	5	2	\N
3674	event	206	5	1	\N
3675	extreme sport	206	5	1	\N
3676	gold medal	206	5	1	\N
3677	gymnastics	206	5	1	\N
3678	high jump	206	5	1	\N
3679	horseback riding	206	5	1	\N
3680	horse racing	206	5	1	\N
3681	horse riding	206	5	1	\N
3682	hunt	206	5	2	\N
3683	ice skate	206	5	1	\N
3684	ice-skate	206	5	2	\N
3685	ice skating	206	5	1	\N
3686	karate	206	5	1	\N
3687	lead	206	5	1	\N
3688	leader	206	5	1	\N
3689	long jump	206	5	1	\N
3690	Olympic	206	5	3	\N
3691	racehorse	206	5	1	\N
3692	racing	206	5	1	\N
3693	record holder	206	5	1	\N
3694	rider	206	5	1	\N
3695	riding	206	5	1	\N
3696	rock climbing	206	5	1	\N
3697	silver medal	206	5	1	\N
3698	skate	206	5	2	\N
3699	skating	206	5	1	\N
3700	skier	206	5	1	\N
3701	snowboarding	206	5	1	\N
3702	sportsman	206	5	1	\N
3703	sportswoman	206	5	1	\N
3704	the Olympic Games	206	5	1	\N
3705	tire	206	5	1	\N
3706	track	206	5	1	\N
3707	trainer	206	5	1	\N
3708	tyre	206	5	1	\N
3709	water jump	206	5	1	\N
3710	deep-sea	207	5	3	\N
3711	deep-water	207	5	3	\N
3712	diver	207	5	1	\N
3713	diving board	207	5	1	\N
3714	sailor	207	5	1	\N
3715	surf	207	5	2	\N
3716	surfboard	207	5	1	\N
3717	surfer	207	5	1	\N
3718	surfing	207	5	1	\N
3719	swimming cap	207	5	1	\N
3720	swimming costume	207	5	1	\N
3721	swimming trunks	207	5	1	\N
3722	swimsuit	207	5	1	\N
3723	bean	208	5	1	\N
3724	corn	208	5	1	\N
3725	cotton	208	5	1	\N
3726	earth	208	5	1	\N
3727	fence	208	5	1	\N
3728	fish farm	208	5	1	\N
3729	grain	208	5	1	\N
3730	pick	208	5	2	\N
3731	producer	208	5	1	\N
3732	ranch	208	5	1	\N
3733	seed	208	5	1	\N
3734	soil	208	5	1	\N
3735	water	208	5	2	\N
3736	Antarctic	209	5	3	\N
3737	Antarctica	209	5	1	\N
3738	Arctic	209	5	3	\N
3739	Arctic	209	5	1	\N
3740	bank	209	5	1	\N
3741	bend	209	5	1	\N
3742	coastline	209	5	1	\N
3743	countryside	209	5	1	\N
3744	eastern	209	5	3	\N
3745	farmland	209	5	1	\N
3746	flood	209	5	1	\N
3747	flood	209	5	2	\N
3748	geographical	209	5	3	\N
3749	grassland	209	5	1	\N
3750	jungle	209	5	1	\N
3751	mud	209	5	1	\N
3752	north-eastern	209	5	3	\N
3753	northern	209	5	3	\N
3754	north-western	209	5	3	\N
3755	port	209	5	1	\N
3756	sand	209	5	1	\N
3757	seaside	209	5	1	\N
3758	seaside	209	5	3	\N
3759	south-eastern	209	5	3	\N
3760	southern	209	5	3	\N
3761	south-western	209	5	3	\N
3762	volcano	209	5	1	\N
3763	waterfall	209	5	1	\N
3764	western	209	5	3	\N
3765	woodland	209	5	1	\N
3766	branch	210	5	1	\N
3767	leaf	210	5	1	\N
3768	mint	210	5	1	\N
3769	ring	210	5	1	\N
3770	seed	210	5	1	\N
3771	nuclear	211	5	3	\N
3772	nuclear energy	211	5	1	\N
3773	nuclear power	211	5	1	\N
3774	poisonous	211	5	3	\N
3775	pollute	211	5	2	\N
3776	power station	211	5	1	\N
3777	renewable	211	5	3	\N
3778	resource	211	5	1	\N
3779	sandstorm	211	5	1	\N
3780	solar panel	211	5	1	\N
3781	tornado	211	5	1	\N
3782	turbine	211	5	1	\N
3783	volcano	211	5	1	\N
3784	waste	211	5	1	\N
3785	windstorm	211	5	1	\N
3786	wind turbine	211	5	1	\N
3787	atmosphere	212	5	1	\N
3788	calm	212	5	3	\N
3789	cloudy	212	5	3	\N
3790	cold	212	5	1	\N
3791	cool	212	5	1	\N
3792	fine	212	5	3	\N
3793	flood	212	5	1	\N
3794	flood	212	5	2	\N
3795	freeze	212	5	2	\N
3796	freezing	212	5	3	\N
3797	horrible	212	5	3	\N
3798	hurricane	212	5	1	\N
3799	lightning	212	5	1	\N
3800	mild	212	5	3	\N
3801	pour	212	5	2	\N
3802	powder	212	5	1	\N
3803	rainfall	212	5	1	\N
3804	rainstorm	212	5	1	\N
3805	rainwater	212	5	1	\N
3806	shower	212	5	1	\N
3807	snowfall	212	5	1	\N
3808	snowstorm	212	5	1	\N
3809	strong	212	5	3	\N
3810	sunshine	212	5	1	\N
3811	tornado	212	5	1	\N
3812	warm	212	5	2	\N
3813	weather forecast	212	5	1	\N
3814	art history	213	5	1	\N
3815	battle	213	5	1	\N
3816	costume	213	5	1	\N
3817	day	213	5	1	\N
3818	explorer	213	5	1	\N
3819	generation	213	5	1	\N
3820	historic	213	5	3	\N
3821	historical	213	5	3	\N
3822	historically	213	5	11	\N
3823	astronaut	214	5	1	\N
3824	atmosphere	214	5	1	\N
3825	Mars	214	5	1	\N
3826	moonlight	214	5	1	\N
3827	shine	214	5	2	\N
3828	spaceship	214	5	1	\N
3829	space station	214	5	1	\N
3830	sunlight	214	5	1	\N
3831	continuous	215	5	3	\N
3832	continuously	215	5	11	\N
3833	daily	215	5	11	\N
3834	daylight	215	5	1	\N
3835	daytime	215	5	1	\N
3836	decade	215	5	1	\N
3837	eventually	215	5	11	\N
3838	far	215	5	11	\N
3839	half hour	215	5	1	\N
3840	immediate	215	5	3	\N
3841	in future	215	5	7	\N
3842	in time (for something/to do something)	215	5	7	\N
3843	midday	215	5	1	\N
3844	near	215	5	4	\N
3845	night-time	215	5	1	\N
3846	rare	215	5	3	\N
3847	semester	215	5	1	\N
3848	springtime	215	5	1	\N
3849	sudden	215	5	3	\N
3850	summertime	215	5	1	\N
3851	term	215	5	1	\N
3852	throughout	215	5	4	\N
3853	weekday	215	5	1	\N
3854	while	215	5	1	\N
3855	wintertime	215	5	1	\N
3856	accommodation	216	5	1	\N
3857	backpack	216	5	1	\N
3858	break	216	5	1	\N
3859	brochure	216	5	1	\N
3860	campfire	216	5	1	\N
3861	campsite	216	5	1	\N
3862	check-in	216	5	1	\N
3863	cottage	216	5	1	\N
3864	currency	216	5	1	\N
3865	day out	216	5	1	\N
3866	day trip	216	5	1	\N
3867	destination	216	5	1	\N
3868	double	216	5	1	\N
3869	exchange	216	5	1	\N
3870	explore	216	5	2	\N
3871	family room	216	5	1	\N
3872	front desk	216	5	1	\N
3873	holiday camp	216	5	1	\N
3874	hostel	216	5	1	\N
3875	reservation	216	5	1	\N
3876	road trip	216	5	1	\N
3877	safari	216	5	1	\N
3878	sand	216	5	1	\N
3879	seaside	216	5	1	\N
3880	seaside	216	5	3	\N
3881	sight	216	5	1	\N
3882	sleeping bag	216	5	1	\N
3883	sunbathe	216	5	2	\N
3884	tent	216	5	1	\N
3885	theme park	216	5	1	\N
3886	unpack	216	5	2	\N
3887	youth hostel	216	5	1	\N
3888	airfare	217	5	1	\N
3889	airsick	217	5	3	\N
3890	airsickness	217	5	1	\N
3891	arrival	217	5	1	\N
3892	board	217	5	1	\N
3893	business class	217	5	1	\N
3894	business class	217	5	11	\N
3895	captain	217	5	1	\N
3896	check-in	217	5	1	\N
3897	class	217	5	1	\N
3898	departure	217	5	1	\N
3899	engineer	217	5	1	\N
3900	first-class	217	5	3	\N
3901	first class	217	5	1	\N
3902	first class	217	5	11	\N
3903	flight attendant	217	5	1	\N
3904	hand baggage	217	5	1	\N
3905	hand luggage	217	5	1	\N
3906	helicopter	217	5	1	\N
3907	nose	217	5	1	\N
3908	reservation	217	5	1	\N
3909	safety belt	217	5	1	\N
3910	seaplane	217	5	1	\N
3911	seat belt	217	5	1	\N
3912	security	217	5	1	\N
3913	spaceship	217	5	1	\N
3914	tail	217	5	1	\N
3915	travel-sick	217	5	3	\N
3916	travel sickness	217	5	1	\N
3917	wing	217	5	1	\N
3918	board	218	5	1	\N
3919	bus pass	218	5	1	\N
3920	class	218	5	1	\N
3921	commute	218	5	2	\N
3922	commute	218	5	1	\N
3923	departure	218	5	1	\N
3924	express	218	5	1	\N
3925	first class	218	5	1	\N
3926	first class	218	5	11	\N
3927	non-stop	218	5	3	\N
3928	one-way	218	5	3	\N
3929	pass	218	5	1	\N
3930	railroad	218	5	1	\N
3931	reservation	218	5	1	\N
3932	return	218	5	1	\N
3933	return ticket	218	5	1	\N
3934	run	218	5	2	\N
3935	second class	218	5	1	\N
3936	stopping train	218	5	1	\N
3937	third class	218	5	11	\N
3938	truck	218	5	1	\N
3939	battery	219	5	1	\N
3940	bend	219	5	1	\N
3941	bike	219	5	2	\N
3942	block	219	5	1	\N
3943	block	219	5	2	\N
3944	car seat	219	5	1	\N
3945	carsick	219	5	3	\N
3946	carsickness	219	5	1	\N
3947	car wash	219	5	1	\N
3948	commute	219	5	2	\N
3949	company car	219	5	1	\N
3950	cyclist	219	5	1	\N
3951	divide	219	5	2	\N
3952	driverless	219	5	3	\N
3953	driving test	219	5	1	\N
3954	furniture van	219	5	1	\N
3955	garage	219	5	1	\N
3956	gas station	219	5	1	\N
3957	main street	219	5	1	\N
3958	passenger seat	219	5	1	\N
3959	petrol station	219	5	1	\N
3960	queue	219	5	1	\N
3961	race car	219	5	1	\N
3962	racing car	219	5	1	\N
3963	red light	219	5	1	\N
3964	repair	219	5	1	\N
3965	rider	219	5	1	\N
3966	road sign	219	5	1	\N
3967	road trip	219	5	1	\N
3968	safety belt	219	5	1	\N
3969	seat belt	219	5	1	\N
3970	signal	219	5	1	\N
3971	slow	219	5	2	\N
3972	speed camera	219	5	1	\N
3973	speed limit	219	5	1	\N
3974	sports car	219	5	1	\N
3975	street light	219	5	1	\N
3976	surface	219	5	1	\N
3977	tire	219	5	1	\N
3978	track	219	5	1	\N
3979	traffic light	219	5	1	\N
3980	tram	219	5	1	\N
3981	travel-sick	219	5	3	\N
3982	travel sickness	219	5	1	\N
3983	tyre	219	5	1	\N
3984	used	219	5	3	\N
3985	at sea	220	5	7	\N
3986	board	220	5	1	\N
3987	bottom	220	5	1	\N
3988	captain	220	5	1	\N
3989	engineer	220	5	1	\N
3990	ferry	220	5	1	\N
3991	ferry boat	220	5	1	\N
3992	port	220	5	1	\N
3993	sailor	220	5	1	\N
3994	seasick	220	5	3	\N
3995	second-class	220	5	3	\N
3996	third class	220	5	1	\N
3997	third-class	220	5	3	\N
3998	wheel	220	5	1	\N
3999	ad	221	5	1	\N
4000	agent	221	5	1	\N
4001	agreement	221	5	1	\N
4002	brand	221	5	1	\N
4003	campaign	221	5	1	\N
4004	client	221	5	1	\N
4005	commercial	221	5	3	\N
4006	compete	221	5	2	\N
4007	competition	221	5	1	\N
4008	competitive	221	5	3	\N
4009	competitor	221	5	1	\N
4010	consumer	221	5	1	\N
4011	deal	221	5	1	\N
4012	discount	221	5	1	\N
4013	expand	221	5	2	\N
4014	financial	221	5	3	\N
4015	goods	221	5	1	\N
4016	group	221	5	1	\N
4017	invest	221	5	2	\N
4018	labor union	221	5	1	\N
4019	management	221	5	1	\N
4020	market	221	5	2	\N
4021	marketing	221	5	1	\N
4022	order	221	5	1	\N
4023	partner	221	5	1	\N
4024	plant	221	5	1	\N
4025	pressure	221	5	1	\N
4026	production	221	5	1	\N
4027	profit	221	5	1	\N
4028	promote	221	5	2	\N
4029	receipt	221	5	1	\N
4030	reject	221	5	2	\N
4031	robot	221	5	1	\N
4032	run	221	5	2	\N
4033	sales slip	221	5	1	\N
4034	shift	221	5	1	\N
4035	staff	221	5	1	\N
4036	trader	221	5	1	\N
4037	trade union	221	5	1	\N
4038	union	221	5	1	\N
4039	academic	222	5	3	\N
4040	adviser	222	5	1	\N
4041	agent	222	5	1	\N
4042	astronaut	222	5	1	\N
4043	attendant	222	5	1	\N
4044	baker	222	5	1	\N
4045	diver	222	5	1	\N
4046	editor	222	5	1	\N
4047	employment	222	5	1	\N
4048	engineering	222	5	1	\N
4049	flight attendant	222	5	1	\N
4050	garbage man	222	5	1	\N
4051	gardener	222	5	1	\N
4052	guard	222	5	1	\N
4053	housewife	222	5	1	\N
4054	judge	222	5	1	\N
4055	lecturer	222	5	1	\N
4056	mailman	222	5	1	\N
4057	marketing	222	5	1	\N
4058	Member of Parliament	222	5	1	\N
4059	MP	222	5	1	\N
4060	newsreader	222	5	1	\N
4061	partner	222	5	1	\N
4062	photographer	222	5	1	\N
4063	politician	222	5	1	\N
4064	postman	222	5	1	\N
4065	presenter	222	5	1	\N
4066	president	222	5	1	\N
4067	producer	222	5	1	\N
4068	profession	222	5	1	\N
4069	professional	222	5	3	\N
4070	programmer	222	5	1	\N
4071	promote	222	5	2	\N
4072	qualified	222	5	3	\N
4073	retire	222	5	2	\N
4074	retired	222	5	3	\N
4075	sailor	222	5	1	\N
4076	scientific	222	5	3	\N
4077	secret agent	222	5	1	\N
4078	servant	222	5	1	\N
4079	songwriter	222	5	1	\N
4080	sportsman	222	5	1	\N
4081	sportswoman	222	5	1	\N
4082	supermodel	222	5	1	\N
4083	title	222	5	1	\N
4084	trader	222	5	1	\N
4085	translator	222	5	1	\N
4086	tutor	222	5	1	\N
4087	unqualified	222	5	3	\N
4088	unskilled	222	5	3	\N
4089	waitress	222	5	1	\N
4090	window cleaner	222	5	1	\N
4091	workman	222	5	1	\N
4092	account	223	5	1	\N
4093	adviser	223	5	1	\N
4094	balance	223	5	1	\N
4095	bank account	223	5	1	\N
4096	banking	223	5	1	\N
4097	borrower	223	5	1	\N
4098	cash machine	223	5	1	\N
4099	change	223	5	1	\N
4100	charge	223	5	1	\N
4101	charge	223	5	2	\N
4102	check	223	5	1	\N
4103	cheque	223	5	1	\N
4104	coin	223	5	1	\N
4105	currency	223	5	1	\N
4106	cut	223	5	2	\N
4107	cut	223	5	1	\N
4108	cycle	223	5	1	\N
4109	developing	223	5	3	\N
4110	discount	223	5	1	\N
4111	donate	223	5	2	\N
4112	economic	223	5	3	\N
4113	economy	223	5	1	\N
4114	employment	223	5	1	\N
4115	exchange	223	5	1	\N
4116	exchange	223	5	2	\N
4117	expand	223	5	2	\N
4118	export	223	5	1	\N
4119	export	223	5	2	\N
4120	financial	223	5	3	\N
4121	fixed	223	5	3	\N
4122	generous	223	5	3	\N
4123	global	223	5	3	\N
4124	growth	223	5	1	\N
4125	import	223	5	1	\N
4126	import	223	5	2	\N
4127	interest	223	5	1	\N
4128	invest	223	5	2	\N
4129	lender	223	5	1	\N
4130	market	223	5	1	\N
4131	millionaire	223	5	1	\N
4132	note	223	5	1	\N
4133	payment	223	5	1	\N
4134	pocket money	223	5	1	\N
4135	poverty	223	5	1	\N
4136	raise	223	5	2	\N
4137	rate	223	5	1	\N
4138	receipt	223	5	1	\N
4139	rent	223	5	1	\N
4140	rent	223	5	2	\N
4141	rise	223	5	1	\N
4142	sales slip	223	5	1	\N
4143	saver	223	5	1	\N
4144	spending	223	5	1	\N
4145	support	223	5	2	\N
4146	tax	223	5	1	\N
4147	tax	223	5	2	\N
4148	tip	223	5	1	\N
4149	tip	223	5	2	\N
4150	trade	223	5	1	\N
4151	trade	223	5	2	\N
4152	trend	223	5	1	\N
4153	valuable	223	5	3	\N
4154	value	223	5	1	\N
4155	weak	223	5	3	\N
4156	win	223	5	2	\N
4157	worth	223	5	3	\N
4158	worth	223	5	1	\N
4159	application	224	5	1	\N
4160	appointment	224	5	1	\N
4161	call	224	5	2	\N
4162	candidate	224	5	1	\N
4163	competitive	224	5	3	\N
4164	condition	224	5	1	\N
4165	CV	224	5	1	\N
4166	file	224	5	1	\N
4167	hire	224	5	2	\N
4168	hold	224	5	2	\N
4169	labor union	224	5	1	\N
4170	light	224	5	3	\N
4171	lunch hour	224	5	1	\N
4172	professional	224	5	3	\N
4173	qualification	224	5	1	\N
4174	qualified	224	5	3	\N
4175	stressful	224	5	3	\N
4179	trade union	224	5	1	\N
4180	union	224	5	1	\N
4181	work day	224	5	1	\N
4182	work experience	224	5	1	\N
\.


--
-- Name: administrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrators_id_seq', 1, false);


--
-- Name: audios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audios_id_seq', 1, false);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_id_seq', 5, true);


--
-- Name: subthemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subthemes_id_seq', 225, true);


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 58, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: word_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.word_types_id_seq', 14, true);


--
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_id_seq', 4182, true);


--
-- Name: administrators administrators_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_user_id_key UNIQUE (user_id);


--
-- Name: audios audios_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_id_key UNIQUE (id);


--
-- Name: audios audios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audios
    ADD CONSTRAINT audios_pkey PRIMARY KEY (audio_id);


--
-- Name: levels levels_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_id_key UNIQUE (id);


--
-- Name: subthemes themes_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subthemes
    ADD CONSTRAINT themes_id_key UNIQUE (id);


--
-- Name: themes themes_id_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_id_key1 UNIQUE (id);


--
-- Name: users users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- Name: word_types word_types_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_types
    ADD CONSTRAINT word_types_id_key UNIQUE (id);


--
-- Name: word_types word_types_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_types
    ADD CONSTRAINT word_types_type_key UNIQUE (type);


--
-- Name: words words_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_id_key UNIQUE (id);


--
-- Name: subthemes fk_audio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subthemes
    ADD CONSTRAINT fk_audio FOREIGN KEY (audio_id) REFERENCES public.audios(id) ON DELETE RESTRICT;


--
-- Name: subthemes fk_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subthemes
    ADD CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE RESTRICT;


--
-- Name: words fk_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE RESTRICT;


--
-- Name: themes fk_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES public.levels(id);


--
-- Name: words fk_subtheme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT fk_subtheme FOREIGN KEY (subtheme_id) REFERENCES public.subthemes(id) ON DELETE RESTRICT;


--
-- Name: subthemes fk_theme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subthemes
    ADD CONSTRAINT fk_theme FOREIGN KEY (theme_id) REFERENCES public.themes(id) ON DELETE RESTRICT;


--
-- Name: words fk_types; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT fk_types FOREIGN KEY (type_id) REFERENCES public.word_types(id) ON DELETE RESTRICT;


--
-- Name: TABLE administrators; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.administrators TO wordbankbot;


--
-- Name: SEQUENCE administrators_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.administrators_id_seq TO wordbankbot;


--
-- Name: TABLE audios; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.audios TO wordbankbot;


--
-- Name: SEQUENCE audios_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.audios_id_seq TO wordbankbot;


--
-- Name: TABLE levels; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.levels TO wordbankbot;


--
-- Name: SEQUENCE levels_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.levels_id_seq TO wordbankbot;


--
-- Name: TABLE subthemes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subthemes TO wordbankbot;


--
-- Name: SEQUENCE subthemes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.subthemes_id_seq TO wordbankbot;


--
-- Name: TABLE themes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.themes TO wordbankbot;


--
-- Name: SEQUENCE themes_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.themes_id_seq TO wordbankbot;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO wordbankbot;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO wordbankbot;


--
-- Name: TABLE word_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.word_types TO wordbankbot;


--
-- Name: SEQUENCE word_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.word_types_id_seq TO wordbankbot;


--
-- Name: TABLE words; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.words TO wordbankbot;


--
-- Name: SEQUENCE words_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.words_id_seq TO wordbankbot;


--
-- PostgreSQL database dump complete
--

