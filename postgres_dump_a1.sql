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
\.


--
-- Data for Name: subthemes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subthemes (id, subtheme, translation, level_id, audio_id, theme_id) FROM stdin;
1	ANIMALS	\N	1	\N	1
2	BIRDS	\N	1	\N	1
3	FISH AND SHELLFISH	\N	1	\N	1
4	INSECTS, WORMS, ETC	\N	1	\N	1
5	APPEARANCE	\N	1	\N	2
6	BODY	\N	1	\N	2
7	CLOTHES AND FASHION	\N	1	\N	2
8	COLORS AND SHAPES	\N	1	\N	2
9	LANGUAGE	\N	1	\N	2
10	PHONES, EMAIL AND THE INTERNET	\N	1	\N	2
11	ART	\N	1	\N	2
12	FILM AND THEATRE	\N	1	\N	2
13	LITERATURE AND WRITING	\N	1	\N	2
14	MUSIC	\N	1	\N	2
15	TV, RADIO AND NEWS	\N	1	\N	2
16	COOKING AND EATING	\N	1	\N	2
17	DRINKS	\N	1	\N	2
18	FOOD	\N	1	\N	2
19	DISCUSSION AND AGREEMENT	\N	1	\N	3
20	DOUBT, GUESSING AND CERTAINTY	\N	1	\N	3
21	OPINION AND ARGUMENT	\N	1	\N	3
22	PERMISSION AND OBLIGATION	\N	1	\N	3
23	PREFERENCES AND DECISIONS	\N	1	\N	3
24	SUGGESTIONS AND ADVICE	\N	1	\N	3
25	HEALTH AND FITNESS	\N	1	\N	4
26	ILLNESS	\N	1	\N	4
27	MEDICINE	\N	1	\N	4
28	BUILDINGS	\N	1	\N	4
29	GARDENS	\N	1	\N	4
30	HOUSE AND HOMES	\N	1	\N	4
31	GAMES AND TOYS	\N	1	\N	4
32	HOBBIES	\N	1	\N	4
33	SHOPPING	\N	1	\N	4
34	CHANGE, CAUSE AND EFFECT	\N	1	\N	4
35	DANGER	\N	1	\N	4
36	DIFFICULTY AND FAILURE	\N	1	\N	4
37	SUCCESS	\N	1	\N	4
38	EDUCATION	\N	1	\N	4
39	FAMILY AND RELATIONSHIPS	\N	1	\N	4
40	FEELINGS	\N	1	\N	4
41	LIFE STAGES	\N	1	\N	4
42	PERSONAL QUALITIES	\N	1	\N	4
43	CRIME AND PUNISHMENT	\N	1	\N	5
44	LAW AND JUSTICE	\N	1	\N	5
45	PEOPLE IN SOCIETY	\N	1	\N	5
46	RELIGION AND FESTIVALS	\N	1	\N	5
47	SOCIAL ISSUES	\N	1	\N	5
48	WAR AND CONFLICT	\N	1	\N	5
49	BIOLOGY	\N	1	\N	6
50	ENGINEERING	\N	1	\N	6
51	MATH AND MEASUREMENT	\N	1	\N	6
52	PHYSICS AND CHEMISTRY	\N	1	\N	6
53	SCIENTIFIC RESEARCH	\N	1	\N	6
54	SPORT: BALL AND RACKET SPORTS	\N	1	\N	6
55	SPORTS: OTHER SPORTS	\N	1	\N	6
56	SPORTS: WATER SPORTS	\N	1	\N	6
57	FARMING	\N	1	\N	6
58	GEOGRAPHY	\N	1	\N	6
59	PLANTS AND TREES	\N	1	\N	6
60	THE ENVIRONMENT	\N	1	\N	6
61	WEATHER	\N	1	\N	6
62	HISTORY	\N	1	\N	7
63	SPACE	\N	1	\N	7
64	TIME	\N	1	\N	7
65	TRAVEL HOLIDAYS	\N	1	\N	7
66	TRANSPORT BY AIR	\N	1	\N	7
67	TRANSPORT BY BUS AND TRAIN	\N	1	\N	7
68	TRANSPORT BY CAR OR LORRY	\N	1	\N	7
69	TRANSPORT BY WATER	\N	1	\N	7
70	BUSINESS	\N	1	\N	8
71	JOBS	\N	1	\N	8
72	MONEY	\N	1	\N	8
73	WORKING LIFE	\N	1	\N	8
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.themes (id, theme, level_id) FROM stdin;
1	ANIMALS	1
2	APPEARANCE	1
3	FUNCTIONS	1
4	HEALTH	1
5	POLITICS AND SOCIETY	1
6	SCIENCE AND TECHNOLOGY	1
7	TIME AND SPACE	1
8	WORK AND BUSINESS	1
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
422	swimming pool	29	1	1	\N
423	apartment	30	1	1	\N
424	bath	30	1	1	\N
425	bathroom	30	1	1	\N
426	bed	30	1	1	\N
427	bedroom	30	1	1	\N
428	buy	30	1	2	\N
429	chair	30	1	1	\N
430	clean	30	1	2	\N
431	desk	30	1	1	\N
432	dining room	30	1	1	\N
433	door	30	1	1	\N
434	downstairsad	30	1	2	\N
435	downstairs	30	1	1	\N
436	flat	30	1	1	\N
437	floor	30	1	1	\N
438	front	30	1	1	\N
439	home	30	1	1	\N
440	house	30	1	1	\N
441	kitchen	30	1	1	\N
442	library	30	1	1	\N
443	light	30	1	1	\N
444	living room	30	1	1	\N
445	office	30	1	1	\N
446	paint	30	1	1	\N
447	paint	30	1	2	\N
448	picture	30	1	1	\N
449	room	30	1	1	\N
450	sell	30	1	1	\N
451	shower	30	1	1	\N
452	sofa	30	1	1	\N
453	table	30	1	1	\N
454	telephone	30	1	1	\N
455	television	30	1	1	\N
456	toilet	30	1	1	\N
457	upstairsad	30	1	2	\N
458	upstairs	30	1	1	\N
459	wall	30	1	1	\N
460	wash	30	1	2	\N
461	window	30	1	1	\N
462	ball	31	1	1	\N
463	computer game	31	1	1	\N
464	fun	31	1	1	\N
465	game	31	1	1	\N
466	lose	31	1	2	\N
467	play	31	1	2	\N
468	player	31	1	1	\N
469	quiz	31	1	1	\N
470	rule	31	1	1	\N
471	team	31	1	1	\N
472	turn	31	1	1	\N
473	video game	31	1	1	\N
474	win	31	1	2	\N
475	activity	32	1	1	\N
476	art	32	1	1	\N
477	cooking	32	1	1	\N
478	dance	32	1	1	\N
479	dance	32	1	2	\N
480	dancer	32	1	1	\N
481	dancing	32	1	1	\N
482	hobby	32	1	1	\N
483	interest	32	1	1	\N
484	music	32	1	1	\N
485	painting	32	1	1	\N
486	reading	32	1	1	\N
487	relax	32	1	2	\N
488	shopping	32	1	1	\N
489	writing	32	1	1	\N
490	bag	33	1	1	\N
491	banknote	33	1	1	\N
492	bill	33	1	1	\N
493	book	33	1	1	\N
494	buy	33	1	2	\N
495	center	33	1	1	\N
496	centre	33	1	1	\N
497	cheap	33	1	3	\N
498	close	33	1	2	\N
499	cost	33	1	2	\N
500	customer	33	1	1	\N
501	expensive	33	1	3	\N
502	game	33	1	1	\N
503	internet	33	1	1	\N
504	list	33	1	1	\N
505	market	33	1	1	\N
506	music	33	1	1	\N
507	online	33	1	3	\N
508	pay	33	1	2	\N
509	price	33	1	1	\N
510	product	33	1	1	\N
511	sell	33	1	1	\N
512	shoe	33	1	1	\N
513	shop	33	1	1	\N
514	shopping	33	1	1	\N
515	shop window	33	1	1	\N
516	spend	33	1	2	\N
517	supermarket	33	1	1	\N
518	window	33	1	1	\N
519	because	34	1	6	\N
520	because of	34	1	4	\N
521	change	34	1	2	\N
522	change	34	1	1	\N
523	grow	34	1	2	\N
524	happen	34	1	2	\N
525	improve	34	1	2	\N
526	reason	34	1	1	\N
527	result	34	1	1	\N
528	afraid	35	1	3	\N
529	dangerous	35	1	3	\N
530	help	35	1	1	\N
531	difficult	36	1	3	\N
532	hard	36	1	3	\N
533	hardad	36	1	2	\N
534	lose	36	1	2	\N
535	mistake	36	1	1	\N
536	problem	36	1	1	\N
537	do	37	1	2	\N
538	success	37	1	1	\N
539	win	37	1	2	\N
540	answer	38	1	1	\N
541	art	38	1	1	\N
542	book	38	1	1	\N
543	class	38	1	1	\N
544	classmate	38	1	1	\N
545	classroom	38	1	1	\N
546	college	38	1	1	\N
547	course	38	1	3	\N
548	desk	38	1	1	\N
549	dictionary	38	1	1	\N
550	English	38	1	1	\N
551	exam	38	1	1	\N
552	exercise	38	1	1	\N
553	geography	38	1	1	\N
554	gym	38	1	1	\N
555	high school	38	1	1	\N
556	history	38	1	1	\N
557	homework	38	1	1	\N
558	learn	38	1	2	\N
559	learner	38	1	1	\N
560	lesson	38	1	1	\N
561	library	38	1	1	\N
562	music	38	1	1	\N
563	practise	38	1	2	\N
564	project	38	1	1	\N
565	result	38	1	1	\N
566	school	38	1	1	\N
567	science	38	1	1	\N
568	student	38	1	1	\N
569	study	38	1	1	\N
570	study	38	1	2	\N
571	subject	38	1	1	\N
572	teach	38	1	2	\N
573	teacher	38	1	1	\N
574	test	38	1	1	\N
575	test	38	1	2	\N
576	text	38	1	1	\N
577	university	38	1	1	\N
578	year	38	1	1	\N
579	aunt	39	1	1	\N
580	boyfriend	39	1	1	\N
581	brother	39	1	1	\N
582	cousin	39	1	1	\N
583	dad	39	1	1	\N
584	daughter	39	1	1	\N
585	family	39	1	1	\N
586	father	39	1	1	\N
587	first cousin	39	1	1	\N
588	friend	39	1	1	\N
589	girlfriend	39	1	1	\N
590	grandad	39	1	1	\N
591	grandchild	39	1	1	\N
592	granddaughter	39	1	1	\N
593	grandfather	39	1	1	\N
594	grandma	39	1	1	\N
595	grandmother	39	1	1	\N
596	grandpa	39	1	1	\N
597	grandparent	39	1	1	\N
598	grandson	39	1	1	\N
599	husband	39	1	1	\N
600	leave	39	1	2	\N
601	love	39	1	1	\N
602	mom	39	1	1	\N
603	mother	39	1	1	\N
604	mum	39	1	1	\N
605	name	39	1	1	\N
606	neighbour	39	1	1	\N
607	sister	39	1	1	\N
608	son	39	1	1	\N
609	togetherad	39	1	2	\N
610	uncle	39	1	1	\N
611	wife	39	1	1	\N
612	afraid	40	1	3	\N
613	angry	40	1	3	\N
614	bored	40	1	1	\N
615	feellinking	40	1	2	\N
616	feeling	40	1	1	\N
617	fun	40	1	1	\N
618	happy	40	1	3	\N
619	hate	40	1	2	\N
620	hope	40	1	2	\N
621	hungry	40	1	3	\N
622	interest	40	1	1	\N
623	laugh	40	1	2	\N
624	laugh	40	1	1	\N
625	love	40	1	1	\N
626	love	40	1	2	\N
627	OK	40	1	3	\N
628	sad	40	1	3	\N
629	sorry	40	1	3	\N
630	terrible	40	1	3	\N
631	thirsty	40	1	3	\N
632	tired	40	1	3	\N
633	adult	41	1	1	\N
634	baby	41	1	1	\N
635	born	41	1	2	\N
636	boy	41	1	1	\N
637	child	41	1	1	\N
638	die	41	1	2	\N
639	family	41	1	1	\N
640	father	41	1	1	\N
641	girl	41	1	1	\N
642	gray	41	1	3	\N
643	grey	41	1	3	\N
644	man	41	1	1	\N
645	married	41	1	3	\N
646	mother	41	1	1	\N
647	old	41	1	3	\N
648	parent	41	1	1	\N
649	teenager	41	1	1	\N
650	woman	41	1	1	\N
651	young	41	1	3	\N
652	bad	42	1	3	\N
653	difficult	42	1	3	\N
654	friendly	42	1	3	\N
655	good	42	1	3	\N
656	nice	42	1	3	\N
657	skill	42	1	1	\N
658	sure	42	1	3	\N
659	body	43	1	1	\N
660	passport	44	1	1	\N
661	police	44	1	1	\N
662	policeman	44	1	1	\N
663	policewoman	44	1	1	\N
664	black	45	1	3	\N
665	group	45	1	1	\N
666	man	45	1	1	\N
667	poor	45	1	3	\N
668	rich	45	1	3	\N
669	white	45	1	3	\N
670	woman	45	1	1	\N
671	believe	46	1	2	\N
672	birthday	46	1	1	\N
673	Christmas	46	1	1	\N
674	new year	46	1	1	\N
675	party	46	1	1	\N
676	give	47	1	2	\N
677	help	47	1	2	\N
678	help	47	1	1	\N
679	job	47	1	1	\N
680	poor	47	1	3	\N
681	problem	47	1	1	\N
682	dangerous	48	1	3	\N
683	computer	49	1	1	\N
684	DVD	49	1	1	\N
685	language	49	1	1	\N
686	menu	49	1	1	\N
687	mouse	49	1	1	\N
688	open	49	1	2	\N
689	video	49	1	1	\N
690	break	50	1	2	\N
691	clock	50	1	1	\N
692	machine	50	1	1	\N
693	add	51	1	2	\N
694	graph	51	1	1	\N
695	hundred	51	1	9	\N
696	kilometre	51	1	1	\N
697	metre	51	1	1	\N
698	mile	51	1	1	\N
699	million	51	1	9	\N
700	number	51	1	1	\N
701	thousand	51	1	9	\N
702	light	52	1	1	\N
703	sun	52	1	1	\N
704	fact	53	1	1	\N
705	result	53	1	1	\N
706	science	53	1	1	\N
707	scientist	53	1	1	\N
708	Association football	54	1	1	\N
709	ball	54	1	1	\N
710	club	54	1	1	\N
711	football	54	1	1	\N
712	half	54	1	1	\N
713	line	54	1	1	\N
714	match	54	1	1	\N
715	play	54	1	2	\N
716	player	54	1	1	\N
717	result	54	1	1	\N
718	sport	54	1	1	\N
719	team	54	1	1	\N
720	tennis	54	1	1	\N
721	bicycle	55	1	1	\N
722	bike	55	1	1	\N
723	exercise	55	1	1	\N
724	exercise	55	1	2	\N
725	gym	55	1	1	\N
726	horse	55	1	1	\N
727	ride	55	1	1	\N
728	sport	55	1	1	\N
729	boat	56	1	1	\N
730	swim	56	1	2	\N
731	swimming	56	1	1	\N
732	swimming pool	56	1	1	\N
733	water sports	56	1	1	\N
734	farm	57	1	1	\N
735	farmer	57	1	1	\N
736	fruit	57	1	1	\N
737	grow	57	1	2	\N
738	rice	57	1	1	\N
739	vegetable	57	1	1	\N
740	Africa	58	1	1	\N
741	area	58	1	1	\N
742	Asia	58	1	1	\N
743	beach	58	1	1	\N
744	cold	58	1	3	\N
745	country	58	1	1	\N
746	east	58	1	1	\N
747	east	58	1	3	\N
748	Europe	58	1	1	\N
749	geography	58	1	1	\N
750	hot	58	1	3	\N
751	island	58	1	1	\N
752	map	58	1	1	\N
753	mountain	58	1	1	\N
754	north	58	1	1	\N
755	north	58	1	3	\N
756	North America	58	1	1	\N
757	river	58	1	1	\N
758	sea	58	1	1	\N
759	south	58	1	1	\N
760	south	58	1	3	\N
761	South America	58	1	1	\N
762	town	58	1	1	\N
763	village	58	1	1	\N
764	west	58	1	1	\N
765	west	58	1	3	\N
766	flower	59	1	1	\N
767	plant	59	1	1	\N
768	tree	59	1	1	\N
769	air	60	1	1	\N
770	clean	60	1	3	\N
771	natural	60	1	3	\N
772	air	61	1	1	\N
773	bad	61	1	3	\N
774	change	61	1	2	\N
775	change	61	1	1	\N
776	cold	61	1	3	\N
777	cool	61	1	3	\N
778	dark	61	1	3	\N
779	east	61	1	3	\N
780	good	61	1	3	\N
781	hot	61	1	3	\N
782	ice	61	1	1	\N
783	north	61	1	3	\N
784	rain	61	1	1	\N
785	snow	61	1	1	\N
786	snow	61	1	2	\N
787	south	61	1	3	\N
788	sun	61	1	1	\N
789	sunny	61	1	3	\N
790	umbrella	61	1	1	\N
791	warm	61	1	3	\N
792	weather	61	1	1	\N
793	west	61	1	3	\N
794	century	62	1	1	\N
795	date	62	1	1	\N
796	history	62	1	1	\N
797	modern	62	1	3	\N
798	past	62	1	3	\N
799	past	62	1	2	\N
800	period	62	1	1	\N
801	outer space	63	1	1	\N
802	space	63	1	1	\N
803	star	63	1	1	\N
804	sun	63	1	1	\N
805	after	64	1	4	\N
806	afternoon	64	1	1	\N
807	agoad	64	1	2	\N
808	April	64	1	1	\N
809	August	64	1	1	\N
810	autumn	64	1	1	\N
811	before	64	1	4	\N
812	century	64	1	1	\N
813	date	64	1	1	\N
814	day	64	1	1	\N
815	December	64	1	1	\N
816	during	64	1	4	\N
817	early	64	1	3	\N
818	evening	64	1	1	\N
819	February	64	1	1	\N
820	Friday	64	1	1	\N
821	half past one, two, etc.	64	1	7	\N
822	hour	64	1	1	\N
823	in	64	1	4	\N
824	in the morning	64	1	7	\N
825	January	64	1	1	\N
826	July	64	1	1	\N
827	June	64	1	1	\N
828	justad	64	1	2	\N
829	last	64	1	8	\N
830	late	64	1	3	\N
831	latead	64	1	2	\N
832	March	64	1	1	\N
833	May	64	1	1	\N
834	midnight	64	1	1	\N
835	minute	64	1	1	\N
836	moment	64	1	1	\N
837	Monday	64	1	1	\N
838	month	64	1	1	\N
839	morning	64	1	1	\N
840	neverad	64	1	2	\N
841	night	64	1	1	\N
842	November	64	1	1	\N
843	October	64	1	1	\N
844	oftenad	64	1	2	\N
845	on	64	1	4	\N
846	o’clockad	64	1	2	\N
847	past	64	1	2	\N
848	period	64	1	1	\N
849	present	64	1	3	\N
850	quarter	64	1	1	\N
851	Saturday	64	1	1	\N
852	second	64	1	1	\N
853	September	64	1	1	\N
854	sometimesad	64	1	2	\N
855	spring	64	1	1	\N
856	summer	64	1	1	\N
857	Sunday	64	1	1	\N
858	Thursday	64	1	1	\N
859	time	64	1	1	\N
860	todayad	64	1	2	\N
861	today	64	1	1	\N
862	tomorrowad	64	1	2	\N
863	tomorrow	64	1	1	\N
864	tonight	64	1	1	\N
865	Tuesday	64	1	1	\N
866	usuallyad	64	1	2	\N
867	Wednesday	64	1	1	\N
868	week	64	1	3	\N
869	weekend	64	1	1	\N
870	winter	64	1	1	\N
871	year	64	1	1	\N
872	yesterdayad	64	1	2	\N
873	yesterday	64	1	1	\N
874	apartment	65	1	1	\N
875	beach	65	1	1	\N
876	desk	65	1	1	\N
877	holiday	65	1	1	\N
878	hotel	65	1	1	\N
879	journey	65	1	1	\N
880	passport	65	1	1	\N
881	pool	65	1	1	\N
882	room	65	1	1	\N
883	sea	65	1	1	\N
884	stay	65	1	2	\N
885	tourist	65	1	1	\N
886	trip	65	1	1	\N
887	vacation	65	1	1	\N
888	visitor	65	1	1	\N
889	airplane	66	1	3	\N
890	airport	66	1	1	\N
891	flight	66	1	1	\N
892	fly	66	1	2	\N
893	passport	66	1	1	\N
894	plane	66	1	3	\N
895	sick	66	1	3	\N
896	bus	67	1	1	\N
897	bus station	67	1	1	\N
898	bus stop	67	1	1	\N
899	get	67	1	2	\N
900	office	67	1	1	\N
901	station	67	1	1	\N
902	stop	67	1	1	\N
903	take	67	1	2	\N
904	ticket	67	1	1	\N
905	train	67	1	1	\N
906	bicycle	68	1	1	\N
907	bike	68	1	1	\N
908	bus	68	1	1	\N
909	car	68	1	1	\N
910	car park	68	1	1	\N
911	drive	68	1	2	\N
912	driver	68	1	1	\N
913	park	68	1	2	\N
914	ride	68	1	2	\N
915	road	68	1	1	\N
916	stop	68	1	2	\N
917	street	68	1	1	\N
918	taxi	68	1	1	\N
919	traffic	68	1	1	\N
920	turn	68	1	2	\N
921	boat	69	1	1	\N
922	radio	69	1	1	\N
923	sea	69	1	1	\N
924	water	69	1	1	\N
925	business	70	1	1	\N
926	cost	70	1	2	\N
927	customer	70	1	1	\N
928	meeting	70	1	1	\N
929	plan	70	1	1	\N
930	price	70	1	1	\N
931	product	70	1	1	\N
932	sell	70	1	1	\N
933	actor	71	1	1	\N
934	actress	71	1	1	\N
935	artist	71	1	1	\N
936	dancer	71	1	1	\N
937	doctor	71	1	1	\N
938	driver	71	1	1	\N
939	farmer	71	1	1	\N
940	job	71	1	1	\N
941	nurse	71	1	1	\N
942	policeman	71	1	1	\N
943	policewoman	71	1	1	\N
944	scientist	71	1	1	\N
945	singer	71	1	1	\N
946	teacher	71	1	1	\N
947	waiter	71	1	1	\N
948	work	71	1	2	\N
949	work	71	1	1	\N
950	writer	71	1	1	\N
951	bank	72	1	1	\N
952	banknote	72	1	1	\N
953	buy	72	1	2	\N
954	cent	72	1	1	\N
955	change	72	1	2	\N
956	cheap	72	1	3	\N
957	cost	72	1	1	\N
958	dollar	72	1	1	\N
959	euro	72	1	1	\N
960	expensive	72	1	3	\N
961	give	72	1	2	\N
962	grow	72	1	2	\N
963	lose	72	1	2	\N
964	money	72	1	1	\N
965	pay	72	1	2	\N
966	poor	72	1	3	\N
967	pound	72	1	1	\N
968	price	72	1	1	\N
969	rich	72	1	3	\N
970	sell	72	1	1	\N
971	spend	72	1	2	\N
972	boring	73	1	3	\N
973	break	73	1	1	\N
974	business	73	1	1	\N
975	career	73	1	1	\N
976	dangerous	73	1	3	\N
977	desk	73	1	1	\N
978	easy	73	1	3	\N
979	exciting	73	1	3	\N
980	hard	73	1	3	\N
981	interview	73	1	1	\N
982	interview	73	1	2	\N
983	job	73	1	1	\N
984	meet	73	1	2	\N
985	meeting	73	1	1	\N
986	office	73	1	1	\N
987	work	73	1	2	\N
988	work	73	1	1	\N
989	worker	73	1	1	\N
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

SELECT pg_catalog.setval('public.levels_id_seq', 1, true);


--
-- Name: subthemes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subthemes_id_seq', 73, true);


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: word_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.word_types_id_seq', 9, true);


--
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_id_seq', 989, true);


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

