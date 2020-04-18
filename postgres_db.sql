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
-- Name: themes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.themes (
    id integer NOT NULL,
    theme text,
    translation text,
    level_id integer,
    audio_id integer
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
    theme_id integer NOT NULL,
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
-- Name: audios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audios ALTER COLUMN id SET DEFAULT nextval('public.audios_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: themes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes ALTER COLUMN id SET DEFAULT nextval('public.themes_id_seq'::regclass);


--
-- Name: word_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_types ALTER COLUMN id SET DEFAULT nextval('public.word_types_id_seq'::regclass);


--
-- Name: words id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words ALTER COLUMN id SET DEFAULT nextval('public.words_id_seq'::regclass);


--
-- Data for Name: audios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.levels VALUES (1, 'A1');
INSERT INTO public.levels VALUES (2, 'A2');
INSERT INTO public.levels VALUES (3, 'B1');
INSERT INTO public.levels VALUES (4, 'B2');
INSERT INTO public.levels VALUES (5, 'C1');
INSERT INTO public.levels VALUES (6, 'C2');


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.themes VALUES (1, 'ANIMALS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (2, 'BIRDS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (3, 'FISH AND SHELLFISH', NULL, 1, NULL);
INSERT INTO public.themes VALUES (4, 'INSECTS, WORMS, ETC', NULL, 1, NULL);
INSERT INTO public.themes VALUES (5, 'APPEARANCE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (6, 'BODY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (7, 'CLOTHES AND FASHION', NULL, 1, NULL);
INSERT INTO public.themes VALUES (8, 'COLORS AND SHAPES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (9, 'LANGUAGE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (10, 'PHONES, EMAIL AND THE INTERNET', NULL, 1, NULL);
INSERT INTO public.themes VALUES (11, 'ART', NULL, 1, NULL);
INSERT INTO public.themes VALUES (12, 'FILM AND THEATRE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (13, 'LITERATURE AND WRITING', NULL, 1, NULL);
INSERT INTO public.themes VALUES (14, 'MUSIC', NULL, 1, NULL);
INSERT INTO public.themes VALUES (15, 'TV, RADIO AND NEWS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (16, 'COOKING AND EATING', NULL, 1, NULL);
INSERT INTO public.themes VALUES (17, 'DRINKS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (18, 'FOOD', NULL, 1, NULL);
INSERT INTO public.themes VALUES (19, 'FUNCTIONS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (20, 'DISCUSSION AND AGREEMENT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (21, 'DOUBT, GUESSING AND CERTAINTY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (22, 'OPINION AND ARGUMENT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (23, 'PERMISSION AND OBLIGATION', NULL, 1, NULL);
INSERT INTO public.themes VALUES (24, 'PREFERENCES AND DECISIONS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (25, 'SUGGESTIONS AND ADVICE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (26, 'HEALTH', NULL, 1, NULL);
INSERT INTO public.themes VALUES (27, 'HEALTH AND FITNESS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (28, 'ILLNESS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (29, 'MEDICINE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (30, 'BUILDINGS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (31, 'GARDENS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (32, 'HOUSE AND HOMES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (33, 'GAMES AND TOYS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (34, 'HOBBIES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (35, 'SHOPPING', NULL, 1, NULL);
INSERT INTO public.themes VALUES (36, 'CHANGE, CAUSE AND EFFECT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (37, 'DANGER', NULL, 1, NULL);
INSERT INTO public.themes VALUES (38, 'DIFFICULTY AND FAILURE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (39, 'SUCCESS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (40, 'EDUCATION', NULL, 1, NULL);
INSERT INTO public.themes VALUES (41, 'FAMILY AND RELATIONSHIPS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (42, 'FEELINGS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (43, 'LIFE STAGES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (44, 'PERSONAL QUALITIES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (45, 'POLITICS AND SOCIETY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (46, 'CRIME AND PUNISHMENT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (47, 'LAW AND JUSTICE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (48, 'PEOPLE IN SOCIETY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (49, 'RELIGION AND FESTIVALS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (50, 'SOCIAL ISSUES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (51, 'WAR AND CONFLICT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (52, 'SCIENCE AND TECHNOLOGY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (53, 'BIOLOGY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (54, 'COMPUTERS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (55, 'ENGINEERING', NULL, 1, NULL);
INSERT INTO public.themes VALUES (56, 'MATH AND MEASUREMENT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (57, 'PHYSICS AND CHEMISTRY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (58, 'SCIENTIFIC RESEARCH', NULL, 1, NULL);
INSERT INTO public.themes VALUES (59, 'SPORT: BALL AND RACKET SPORTS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (60, 'SPORTS: OTHER SPORTS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (61, 'SPORTS: WATER SPORTS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (62, 'FARMING', NULL, 1, NULL);
INSERT INTO public.themes VALUES (63, 'GEOGRAPHY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (64, 'PLANTS AND TREES', NULL, 1, NULL);
INSERT INTO public.themes VALUES (65, 'THE ENVIRONMENT', NULL, 1, NULL);
INSERT INTO public.themes VALUES (66, 'WEATHER', NULL, 1, NULL);
INSERT INTO public.themes VALUES (67, 'TIME AND SPACE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (68, 'HISTORY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (69, 'SPACE', NULL, 1, NULL);
INSERT INTO public.themes VALUES (70, 'TIME', NULL, 1, NULL);
INSERT INTO public.themes VALUES (71, 'TRAVEL HOLIDAYS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (72, 'TRANSPORT BY AIR', NULL, 1, NULL);
INSERT INTO public.themes VALUES (73, 'TRANSPORT BY BUS AND TRAIN', NULL, 1, NULL);
INSERT INTO public.themes VALUES (74, 'TRANSPORT BY CAR OR LORRY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (75, 'TRANSPORT BY WATER', NULL, 1, NULL);
INSERT INTO public.themes VALUES (76, 'WORK AND BUSINESS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (77, 'BUSINESS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (78, 'JOBS', NULL, 1, NULL);
INSERT INTO public.themes VALUES (79, 'MONEY', NULL, 1, NULL);
INSERT INTO public.themes VALUES (80, 'WORKING LIFE', NULL, 1, NULL);


--
-- Data for Name: word_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.word_types VALUES (1, 'adjective');
INSERT INTO public.word_types VALUES (2, 'noun');
INSERT INTO public.word_types VALUES (3, 'verb');
INSERT INTO public.word_types VALUES (4, 'idiom');
INSERT INTO public.word_types VALUES (5, 'form');
INSERT INTO public.word_types VALUES (6, 'exclamation');
INSERT INTO public.word_types VALUES (7, 'adverb');
INSERT INTO public.word_types VALUES (8, 'preposition');
INSERT INTO public.word_types VALUES (9, 'number');
INSERT INTO public.word_types VALUES (10, 'abbreviation');
INSERT INTO public.word_types VALUES (11, 'conjunction');
INSERT INTO public.word_types VALUES (12, 'determiner');


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.words VALUES (1, 'animal', 1, 1, 2, 'Номер');
INSERT INTO public.words VALUES (2, 'cat', 1, 1, 2, 'Кошка');
INSERT INTO public.words VALUES (3, 'cow', 1, 1, 2, 'Корова');
INSERT INTO public.words VALUES (4, 'dog', 1, 1, 2, 'Собака');
INSERT INTO public.words VALUES (5, 'elephant', 1, 1, 2, 'Слон');
INSERT INTO public.words VALUES (6, 'horse', 1, 1, 2, 'Лошадь');
INSERT INTO public.words VALUES (7, 'lion', 1, 1, 2, 'Лев');
INSERT INTO public.words VALUES (8, 'mouse', 1, 1, 2, 'Мышь');
INSERT INTO public.words VALUES (9, 'pig', 1, 1, 2, 'Свинья');
INSERT INTO public.words VALUES (10, 'sheep', 1, 1, 2, 'Овца');
INSERT INTO public.words VALUES (11, 'snake', 1, 1, 2, 'Змея');
INSERT INTO public.words VALUES (12, 'bird', 2, 1, 2, 'Птица');
INSERT INTO public.words VALUES (13, 'chicken', 2, 1, 2, 'Курица');
INSERT INTO public.words VALUES (14, 'egg', 2, 1, 2, 'Яйцо');
INSERT INTO public.words VALUES (15, 'egg', 3, 1, 2, 'Яйцо');
INSERT INTO public.words VALUES (16, 'fish', 3, 1, 2, 'Рыба');
INSERT INTO public.words VALUES (17, 'swim', 3, 1, 3, 'Плавать');
INSERT INTO public.words VALUES (18, 'egg', 4, 1, 2, 'Яйцо');
INSERT INTO public.words VALUES (19, 'beautiful', 5, 1, 1, 'Красиво');
INSERT INTO public.words VALUES (20, 'blonde', 5, 1, 1, 'Блондинка');
INSERT INTO public.words VALUES (21, 'dark', 5, 1, 1, 'Темный');
INSERT INTO public.words VALUES (22, 'fat', 5, 1, 1, 'Жир');
INSERT INTO public.words VALUES (23, 'gray', 5, 1, 1, 'Серый');
INSERT INTO public.words VALUES (24, 'grey', 5, 1, 1, 'Серые');
INSERT INTO public.words VALUES (25, 'hair', 5, 1, 2, 'Волосы');
INSERT INTO public.words VALUES (26, 'long', 5, 1, 1, 'Длинный');
INSERT INTO public.words VALUES (27, 'pretty', 5, 1, 1, 'Довольно');
INSERT INTO public.words VALUES (28, 'red', 5, 1, 1, 'Красный');
INSERT INTO public.words VALUES (29, 'short', 5, 1, 1, 'Короткий');
INSERT INTO public.words VALUES (30, 'tall', 5, 1, 1, 'Высокий');
INSERT INTO public.words VALUES (31, 'arm', 6, 1, 2, 'Рука');
INSERT INTO public.words VALUES (32, 'back', 6, 1, 2, 'Задняя часть');
INSERT INTO public.words VALUES (33, 'body', 6, 1, 2, 'Корпус');
INSERT INTO public.words VALUES (34, 'ear', 6, 1, 2, 'Ушная');
INSERT INTO public.words VALUES (35, 'eye', 6, 1, 2, 'Eye');
INSERT INTO public.words VALUES (36, 'face', 6, 1, 2, 'грань');
INSERT INTO public.words VALUES (37, 'foot', 6, 1, 2, 'Стопа');
INSERT INTO public.words VALUES (38, 'hair', 6, 1, 2, 'Волосы');
INSERT INTO public.words VALUES (39, 'hand', 6, 1, 2, 'Рука');
INSERT INTO public.words VALUES (40, 'head', 6, 1, 2, 'Головка');
INSERT INTO public.words VALUES (41, 'leg', 6, 1, 2, 'Нога');
INSERT INTO public.words VALUES (42, 'mouth', 6, 1, 2, 'Рот');
INSERT INTO public.words VALUES (43, 'nose', 6, 1, 3, 'Носовая часть');
INSERT INTO public.words VALUES (44, 'tooth', 6, 1, 2, 'Зуб');
INSERT INTO public.words VALUES (45, 'bag', 7, 1, 2, 'Сумка');
INSERT INTO public.words VALUES (46, 'boot', 7, 1, 2, 'Загрузка');
INSERT INTO public.words VALUES (47, 'clothes', 7, 1, 2, 'Одежда');
INSERT INTO public.words VALUES (48, 'coat', 7, 1, 2, 'Покрытие');
INSERT INTO public.words VALUES (49, 'dress', 7, 1, 2, 'Одежда');
INSERT INTO public.words VALUES (50, 'dress', 7, 1, 3, 'Одежда');
INSERT INTO public.words VALUES (51, 'glass', 7, 1, 2, 'Бокал');
INSERT INTO public.words VALUES (52, 'hat', 7, 1, 2, 'Шляпа');
INSERT INTO public.words VALUES (53, 'jacket', 7, 1, 2, 'Оболочка');
INSERT INTO public.words VALUES (54, 'jeans', 7, 1, 2, 'Джинсы');
INSERT INTO public.words VALUES (55, 'leg', 7, 1, 2, 'Нога');
INSERT INTO public.words VALUES (56, 'pair', 7, 1, 2, 'Сопряжение');
INSERT INTO public.words VALUES (57, 'shirt', 7, 1, 2, 'Рубашка');
INSERT INTO public.words VALUES (58, 'shoe', 7, 1, 2, 'Обувь');
INSERT INTO public.words VALUES (59, 'skirt', 7, 1, 2, 'защитное ограждение');
INSERT INTO public.words VALUES (60, 'specs', 7, 1, 2, 'Характеристика');
INSERT INTO public.words VALUES (61, 'style', 7, 1, 2, 'Стиль');
INSERT INTO public.words VALUES (62, 'sweater', 7, 1, 2, 'Свитер');
INSERT INTO public.words VALUES (63, 'trousers', 7, 1, 2, 'Штаны');
INSERT INTO public.words VALUES (64, 'T-shirt', 7, 1, 2, 'Футболка');
INSERT INTO public.words VALUES (65, 'watch', 7, 1, 2, 'Отслеживать');
INSERT INTO public.words VALUES (66, 'wear', 7, 1, 2, 'Износ');
INSERT INTO public.words VALUES (67, 'black', 8, 1, 1, 'Черный');
INSERT INTO public.words VALUES (68, 'black', 8, 1, 2, 'Черный');
INSERT INTO public.words VALUES (69, 'blonde', 8, 1, 1, 'Блондинка');
INSERT INTO public.words VALUES (70, 'blue', 8, 1, 3, 'Синий');
INSERT INTO public.words VALUES (71, 'brown', 8, 1, 1, 'Коричневый');
INSERT INTO public.words VALUES (72, 'brown', 8, 1, 2, 'Коричневый');
INSERT INTO public.words VALUES (73, 'color', 8, 1, 2, 'Цвет');
INSERT INTO public.words VALUES (74, 'color', 8, 1, 3, 'Цвет');
INSERT INTO public.words VALUES (75, 'colour', 8, 1, 2, 'Цвет');
INSERT INTO public.words VALUES (76, 'dark', 8, 1, 1, 'Темный');
INSERT INTO public.words VALUES (77, 'gray', 8, 1, 1, 'Серый');
INSERT INTO public.words VALUES (78, 'green', 8, 1, 1, 'Зелёный');
INSERT INTO public.words VALUES (79, 'green', 8, 1, 2, 'Зелёный');
INSERT INTO public.words VALUES (80, 'grey', 8, 1, 1, 'Серые');
INSERT INTO public.words VALUES (81, 'grey', 8, 1, 2, 'Серые');
INSERT INTO public.words VALUES (82, 'light', 8, 1, 1, 'Светлая');
INSERT INTO public.words VALUES (83, 'line', 8, 1, 2, 'Поз.');
INSERT INTO public.words VALUES (84, 'orange', 8, 1, 2, 'Orange');
INSERT INTO public.words VALUES (85, 'orange', 8, 1, 1, 'Orange');
INSERT INTO public.words VALUES (86, 'pink', 8, 1, 1, 'Розовый');
INSERT INTO public.words VALUES (87, 'pink', 8, 1, 2, 'Розовый');
INSERT INTO public.words VALUES (88, 'purple', 8, 1, 1, 'Фиолетовый');
INSERT INTO public.words VALUES (89, 'purple', 8, 1, 2, 'Фиолетовый');
INSERT INTO public.words VALUES (90, 'red', 8, 1, 3, 'Красный');
INSERT INTO public.words VALUES (91, 'white', 8, 1, 1, 'Белый');
INSERT INTO public.words VALUES (92, 'white', 8, 1, 2, 'Белый');
INSERT INTO public.words VALUES (93, 'yellow', 8, 1, 1, 'Жёлтый');
INSERT INTO public.words VALUES (94, 'yellow', 8, 1, 2, 'Жёлтый');
INSERT INTO public.words VALUES (95, 'adjective', 9, 1, 2, 'Прилагательное');
INSERT INTO public.words VALUES (96, 'adverb', 9, 1, 2, 'Наречие');
INSERT INTO public.words VALUES (97, 'alphabet', 9, 1, 2, 'Алфавит');
INSERT INTO public.words VALUES (98, 'countable', 9, 1, 1, 'Счетные');
INSERT INTO public.words VALUES (99, 'count noun', 9, 1, 2, 'РАСЧЕТ');
INSERT INTO public.words VALUES (100, 'English', 9, 1, 2, 'Английский');
INSERT INTO public.words VALUES (101, 'form', 9, 1, 2, 'Форма');
INSERT INTO public.words VALUES (102, 'form', 9, 1, 3, 'Форма');
INSERT INTO public.words VALUES (103, 'French', 9, 1, 2, 'Французский');
INSERT INTO public.words VALUES (104, 'future', 9, 1, 2, 'Будущие');
INSERT INTO public.words VALUES (105, 'German', 9, 1, 2, 'Немецкий');
INSERT INTO public.words VALUES (106, 'infinitive', 9, 1, 2, 'неопределено');
INSERT INTO public.words VALUES (107, 'Italian', 9, 1, 2, 'Итальянский');
INSERT INTO public.words VALUES (108, 'language', 9, 1, 2, 'Язык');
INSERT INTO public.words VALUES (109, 'negative', 9, 1, 1, 'Отрицательный');
INSERT INTO public.words VALUES (110, 'noun', 9, 1, 2, 'Существительное');
INSERT INTO public.words VALUES (111, 'paragraph', 9, 1, 2, 'Параграф');
INSERT INTO public.words VALUES (112, 'past', 9, 1, 1, 'Прошлое');
INSERT INTO public.words VALUES (113, 'past', 9, 1, 2, 'Прошлое');
INSERT INTO public.words VALUES (114, 'phrasal verb', 9, 1, 2, 'Фразовый глагол');
INSERT INTO public.words VALUES (115, 'phrase', 9, 1, 2, 'Фаза');
INSERT INTO public.words VALUES (116, 'plural', 9, 1, 2, 'Множественное число');
INSERT INTO public.words VALUES (117, 'plural', 9, 1, 1, 'Множественное число');
INSERT INTO public.words VALUES (118, 'positive', 9, 1, 1, 'Положительный');
INSERT INTO public.words VALUES (119, 'practise', 9, 1, 3, 'Практика');
INSERT INTO public.words VALUES (120, 'preposition', 9, 1, 2, 'Предлог');
INSERT INTO public.words VALUES (121, 'present', 9, 1, 2, 'Сейчас');
INSERT INTO public.words VALUES (122, 'pronoun', 9, 1, 2, 'Местоимение');
INSERT INTO public.words VALUES (123, 'pronunciation', 9, 1, 2, 'Произношение');
INSERT INTO public.words VALUES (124, 'sentence', 9, 1, 2, 'Предложение');
INSERT INTO public.words VALUES (125, 'singular', 9, 1, 2, 'Одиночный');
INSERT INTO public.words VALUES (126, 'singular', 9, 1, 1, 'Одиночный');
INSERT INTO public.words VALUES (127, 'Spanish', 9, 1, 2, 'Испанский');
INSERT INTO public.words VALUES (128, 'spell', 9, 1, 3, 'Произношение');
INSERT INTO public.words VALUES (129, 'spelling', 9, 1, 2, 'Орфография');
INSERT INTO public.words VALUES (130, 'the present tense', 9, 1, 2, 'настоящее время');
INSERT INTO public.words VALUES (131, 'subject', 9, 1, 2, 'Тема');
INSERT INTO public.words VALUES (132, 'tense', 9, 1, 2, 'Напряженный');
INSERT INTO public.words VALUES (133, 'uncountable', 9, 1, 1, 'Несчетный');
INSERT INTO public.words VALUES (134, 'uncount noun', 9, 1, 2, 'Неисчисляемое существительное');
INSERT INTO public.words VALUES (135, 'verb', 9, 1, 2, 'Глагол(ьная форма)');
INSERT INTO public.words VALUES (136, 'word', 9, 1, 2, 'Word');
INSERT INTO public.words VALUES (137, 'address', 10, 1, 2, 'Адрес');
INSERT INTO public.words VALUES (138, 'at', 10, 1, 8, 'В');
INSERT INTO public.words VALUES (139, 'blog', 10, 1, 2, 'Блог');
INSERT INTO public.words VALUES (140, 'call', 10, 1, 3, 'Вызов');
INSERT INTO public.words VALUES (141, 'call', 10, 1, 2, 'Вызов');
INSERT INTO public.words VALUES (142, 'car phone', 10, 1, 2, 'Рабочий телефон');
INSERT INTO public.words VALUES (143, 'cell phone', 10, 1, 2, 'Мобильный тел');
INSERT INTO public.words VALUES (144, 'email', 10, 1, 2, 'Электронная почта');
INSERT INTO public.words VALUES (145, 'favourite', 10, 1, 2, 'Избранное');
INSERT INTO public.words VALUES (146, 'internet', 10, 1, 2, 'Интернетeу');
INSERT INTO public.words VALUES (147, 'message', 10, 1, 2, 'Сообщение');
INSERT INTO public.words VALUES (148, 'number', 10, 1, 2, 'Количество вопросов');
INSERT INTO public.words VALUES (149, 'online', 10, 1, 1, 'В сети');
INSERT INTO public.words VALUES (150, 'page', 10, 1, 2, 'Страница');
INSERT INTO public.words VALUES (151, 'phone', 10, 1, 2, 'Телефон');
INSERT INTO public.words VALUES (152, 'phone', 10, 1, 3, 'Телефон');
INSERT INTO public.words VALUES (153, 'phone call', 10, 1, 2, 'Телефонный звонок');
INSERT INTO public.words VALUES (154, 'phone number', 10, 1, 2, 'Телефонный номер');
INSERT INTO public.words VALUES (155, 'send', 10, 1, 2, 'Отправить');
INSERT INTO public.words VALUES (156, 'telephone', 10, 1, 2, 'Телефон');
INSERT INTO public.words VALUES (157, 'telephone', 10, 1, 3, 'Телефон');
INSERT INTO public.words VALUES (158, 'telephone call', 10, 1, 2, 'Звонок по телефону');
INSERT INTO public.words VALUES (159, 'telephone number', 10, 1, 2, 'Номер телефона');
INSERT INTO public.words VALUES (160, 'text', 10, 1, 2, 'Текст');
INSERT INTO public.words VALUES (161, 'text message', 10, 1, 2, 'Текстовое сообщение@ item: inlistbox');
INSERT INTO public.words VALUES (162, 'visit', 10, 1, 3, 'Посетить');
INSERT INTO public.words VALUES (163, 'visit', 10, 1, 2, 'Посетить');
INSERT INTO public.words VALUES (164, 'website', 10, 1, 2, 'Номер телефона');
INSERT INTO public.words VALUES (165, 'art', 11, 1, 2, 'Art');
INSERT INTO public.words VALUES (166, 'artist', 11, 1, 2, 'Исполнитель');
INSERT INTO public.words VALUES (167, 'design', 11, 1, 2, 'Исполнение');
INSERT INTO public.words VALUES (168, 'draw', 11, 1, 3, 'Нарисовать');
INSERT INTO public.words VALUES (169, 'paint', 11, 1, 3, 'Покраска');
INSERT INTO public.words VALUES (170, 'painting', 11, 1, 2, 'Покраска');
INSERT INTO public.words VALUES (171, 'actor', 12, 1, 2, 'Актеры');
INSERT INTO public.words VALUES (172, 'actress', 12, 1, 2, 'Актриса');
INSERT INTO public.words VALUES (173, 'camera', 12, 1, 2, 'Камера');
INSERT INTO public.words VALUES (174, 'cinema', 12, 1, 2, 'Кинематография');
INSERT INTO public.words VALUES (175, 'dialogue', 12, 1, 2, 'Диалог');
INSERT INTO public.words VALUES (176, 'DVD', 12, 1, 2, 'Dvd плеер');
INSERT INTO public.words VALUES (177, 'film', 12, 1, 2, 'Фильм');
INSERT INTO public.words VALUES (178, 'film star', 12, 1, 2, 'Кинозвезда');
INSERT INTO public.words VALUES (179, 'movie', 12, 1, 2, 'Фильм');
INSERT INTO public.words VALUES (180, 'movie star', 12, 1, 2, 'Звезда кино');
INSERT INTO public.words VALUES (181, 'movie theater', 12, 1, 2, 'Кинотеатр');
INSERT INTO public.words VALUES (182, 'play', 12, 1, 2, 'Воспроизвести');
INSERT INTO public.words VALUES (183, 'sound', 12, 1, 2, 'Звук');
INSERT INTO public.words VALUES (184, 'star', 12, 1, 2, 'Звездная');
INSERT INTO public.words VALUES (185, 'theatre', 12, 1, 2, 'Театр');
INSERT INTO public.words VALUES (186, 'beginning', 13, 1, 2, 'Начало');
INSERT INTO public.words VALUES (187, 'book', 13, 1, 2, 'Книга');
INSERT INTO public.words VALUES (188, 'description', 13, 1, 2, 'Краткое описание');
INSERT INTO public.words VALUES (189, 'dialogue', 13, 1, 2, 'Диалог');
INSERT INTO public.words VALUES (190, 'end', 13, 1, 2, 'Конец документа');
INSERT INTO public.words VALUES (191, 'letter', 13, 1, 2, 'Письмо');
INSERT INTO public.words VALUES (192, 'line', 13, 1, 2, 'Поз.');
INSERT INTO public.words VALUES (193, 'magazine', 13, 1, 2, 'Журнал');
INSERT INTO public.words VALUES (194, 'page', 13, 1, 2, 'Страница');
INSERT INTO public.words VALUES (195, 'report', 13, 1, 2, 'Отчет');
INSERT INTO public.words VALUES (196, 'story', 13, 1, 2, 'История');
INSERT INTO public.words VALUES (197, 'text', 13, 1, 2, 'Текст');
INSERT INTO public.words VALUES (198, 'title', 13, 1, 2, 'Название');
INSERT INTO public.words VALUES (199, 'write', 13, 1, 3, 'Почта');
INSERT INTO public.words VALUES (200, 'writer', 13, 1, 2, 'Писатель');
INSERT INTO public.words VALUES (201, 'writing', 13, 1, 2, 'Письмо');
INSERT INTO public.words VALUES (202, 'band', 14, 1, 2, 'Диапазон');
INSERT INTO public.words VALUES (203, 'CD', 14, 1, 2, 'Cd');
INSERT INTO public.words VALUES (204, 'concert', 14, 1, 2, 'Концерт');
INSERT INTO public.words VALUES (205, 'festival', 14, 1, 2, 'Фестиваль');
INSERT INTO public.words VALUES (206, 'group', 14, 1, 2, 'Группа');
INSERT INTO public.words VALUES (207, 'guitar', 14, 1, 2, 'Гитара');
INSERT INTO public.words VALUES (208, 'listen', 14, 1, 3, 'Слушать');
INSERT INTO public.words VALUES (209, 'music', 14, 1, 2, 'Музыка');
INSERT INTO public.words VALUES (210, 'piano', 14, 1, 2, 'Фортепиано');
INSERT INTO public.words VALUES (211, 'piece', 14, 1, 2, 'Шт.');
INSERT INTO public.words VALUES (212, 'play', 14, 1, 3, 'Воспроизвести');
INSERT INTO public.words VALUES (213, 'player', 14, 1, 2, 'Плеер');
INSERT INTO public.words VALUES (214, 'practice', 14, 1, 2, 'Тренировка');
INSERT INTO public.words VALUES (215, 'practise', 14, 1, 3, 'Практика');
INSERT INTO public.words VALUES (216, 'radio', 14, 1, 2, 'Радиосвязь');
INSERT INTO public.words VALUES (217, 'sing', 14, 1, 3, 'Петь');
INSERT INTO public.words VALUES (218, 'singer', 14, 1, 2, 'Певец');
INSERT INTO public.words VALUES (219, 'song', 14, 1, 2, 'Песня');
INSERT INTO public.words VALUES (220, 'write', 14, 1, 3, 'Почта');
INSERT INTO public.words VALUES (221, 'article', 15, 1, 2, 'Вид товара');
INSERT INTO public.words VALUES (222, 'camera', 15, 1, 2, 'Камера');
INSERT INTO public.words VALUES (223, 'film', 15, 1, 2, 'Фильм');
INSERT INTO public.words VALUES (224, 'interview', 15, 1, 2, 'Собеседования');
INSERT INTO public.words VALUES (225, 'interview', 15, 1, 3, 'Собеседования');
INSERT INTO public.words VALUES (226, 'listen', 15, 1, 3, 'Слушать');
INSERT INTO public.words VALUES (227, 'magazine', 15, 1, 2, 'Журнал');
INSERT INTO public.words VALUES (228, 'news', 15, 1, 2, 'Новости');
INSERT INTO public.words VALUES (229, 'newspaper', 15, 1, 2, 'Газета');
INSERT INTO public.words VALUES (230, 'picture', 15, 1, 2, 'Картинка');
INSERT INTO public.words VALUES (231, 'play', 15, 1, 2, 'Воспроизвести');
INSERT INTO public.words VALUES (232, 'programme', 15, 1, 2, 'Программа');
INSERT INTO public.words VALUES (233, 'quiz', 15, 1, 2, 'Викторина');
INSERT INTO public.words VALUES (234, 'radio', 15, 1, 2, 'Радиосвязь');
INSERT INTO public.words VALUES (235, 'reader', 15, 1, 2, 'Ридер');
INSERT INTO public.words VALUES (236, 'report', 15, 1, 2, 'Отчет');
INSERT INTO public.words VALUES (237, 'show', 15, 1, 2, 'Показать');
INSERT INTO public.words VALUES (238, 'star', 15, 1, 2, 'Звездная');
INSERT INTO public.words VALUES (239, 'television', 15, 1, 2, 'Телевидение');
INSERT INTO public.words VALUES (240, 'TV', 15, 1, 2, 'Тв');
INSERT INTO public.words VALUES (241, 'video', 15, 1, 2, 'Видео');
INSERT INTO public.words VALUES (242, 'watch', 15, 1, 3, 'Отслеживать');
INSERT INTO public.words VALUES (243, 'weather', 15, 1, 2, 'Погода');
INSERT INTO public.words VALUES (244, 'bill', 16, 1, 2, 'Счет');
INSERT INTO public.words VALUES (245, 'bottle', 16, 1, 2, 'Бутылка');
INSERT INTO public.words VALUES (246, 'breakfast', 16, 1, 2, 'Завтрак');
INSERT INTO public.words VALUES (247, 'cafe', 16, 1, 2, 'Кафе');
INSERT INTO public.words VALUES (248, 'Christmas', 16, 1, 2, 'Кристмас');
INSERT INTO public.words VALUES (249, 'cook', 16, 1, 3, 'Cook');
INSERT INTO public.words VALUES (250, 'cooking', 16, 1, 2, 'Приготовление пищи');
INSERT INTO public.words VALUES (251, 'delicious', 16, 1, 1, 'Delicious');
INSERT INTO public.words VALUES (252, 'diet', 16, 1, 2, 'Питание');
INSERT INTO public.words VALUES (253, 'dinner', 16, 1, 2, 'Обед');
INSERT INTO public.words VALUES (254, 'dish', 16, 1, 2, 'Посуда');
INSERT INTO public.words VALUES (255, 'eat', 16, 1, 3, 'Есть');
INSERT INTO public.words VALUES (256, 'eating', 16, 1, 2, 'Еда');
INSERT INTO public.words VALUES (257, 'food', 16, 1, 2, 'Общественное питание');
INSERT INTO public.words VALUES (258, 'glass', 16, 1, 2, 'Бокал');
INSERT INTO public.words VALUES (259, 'healthy', 16, 1, 1, 'Безопасно');
INSERT INTO public.words VALUES (260, 'kitchen', 16, 1, 2, 'Кухня');
INSERT INTO public.words VALUES (261, 'lunch', 16, 1, 2, 'Обед');
INSERT INTO public.words VALUES (262, 'main', 16, 1, 1, 'Главная');
INSERT INTO public.words VALUES (263, 'meal', 16, 1, 2, 'Еда');
INSERT INTO public.words VALUES (264, 'menu', 16, 1, 2, 'Меню');
INSERT INTO public.words VALUES (265, 'order', 16, 1, 3, 'Cортировать');
INSERT INTO public.words VALUES (266, 'prepare', 16, 1, 3, 'Подготовка');
INSERT INTO public.words VALUES (267, 'restaurant', 16, 1, 2, 'Ресторан');
INSERT INTO public.words VALUES (268, 'tea', 16, 1, 2, 'Чай');
INSERT INTO public.words VALUES (269, 'waiter', 16, 1, 2, 'Официант');
INSERT INTO public.words VALUES (270, 'beer', 17, 1, 2, 'Пиво');
INSERT INTO public.words VALUES (271, 'Coca-Cola™', 17, 1, 2, 'Кока-кола');
INSERT INTO public.words VALUES (272, 'coffee', 17, 1, 2, 'Кофе');
INSERT INTO public.words VALUES (273, 'drink', 17, 1, 2, 'Напиток');
INSERT INTO public.words VALUES (274, 'drink', 17, 1, 3, 'Напиток');
INSERT INTO public.words VALUES (275, 'ice', 17, 1, 2, 'Лёд');
INSERT INTO public.words VALUES (276, 'juice', 17, 1, 2, 'Сок');
INSERT INTO public.words VALUES (277, 'milk', 17, 1, 2, 'Молоко');
INSERT INTO public.words VALUES (278, 'orange', 17, 1, 2, 'Orange');
INSERT INTO public.words VALUES (279, 'tea', 17, 1, 2, 'Чай');
INSERT INTO public.words VALUES (280, 'thirsty', 17, 1, 1, 'Жажда');
INSERT INTO public.words VALUES (281, 'water', 17, 1, 2, 'Жидкость');
INSERT INTO public.words VALUES (282, 'wine', 17, 1, 3, 'Вино');
INSERT INTO public.words VALUES (283, 'apple', 18, 1, 2, 'Яблоки');
INSERT INTO public.words VALUES (284, 'banana', 18, 1, 2, 'Банан');
INSERT INTO public.words VALUES (285, 'bread', 18, 1, 2, 'Хлеб');
INSERT INTO public.words VALUES (286, 'butter', 18, 1, 2, 'Масло сливочное');
INSERT INTO public.words VALUES (287, 'cake', 18, 1, 2, 'Торт');
INSERT INTO public.words VALUES (288, 'carrot', 18, 1, 2, 'Морковь');
INSERT INTO public.words VALUES (289, 'cheese', 18, 1, 2, 'Сыр');
INSERT INTO public.words VALUES (290, 'chicken', 18, 1, 2, 'Курица');
INSERT INTO public.words VALUES (291, 'chocolate', 18, 1, 2, 'Шоколад');
INSERT INTO public.words VALUES (292, 'cream', 18, 1, 2, 'Сливки');
INSERT INTO public.words VALUES (293, 'egg', 18, 1, 2, 'Яйцо');
INSERT INTO public.words VALUES (294, 'fish', 18, 1, 2, 'Рыба');
INSERT INTO public.words VALUES (295, 'fruit', 18, 1, 2, 'Содержание');
INSERT INTO public.words VALUES (296, 'green vegetable', 18, 1, 2, 'Зеленый овощ');
INSERT INTO public.words VALUES (297, 'ham', 18, 1, 2, 'Ветчина');
INSERT INTO public.words VALUES (298, 'ice cream', 18, 1, 2, 'Мороженое');
INSERT INTO public.words VALUES (299, 'meat', 18, 1, 2, 'Мясо');
INSERT INTO public.words VALUES (300, 'onion', 18, 1, 2, 'Лук');
INSERT INTO public.words VALUES (301, 'pepper', 18, 1, 2, 'Перец');
INSERT INTO public.words VALUES (302, 'pizza', 18, 1, 2, 'Пицца');
INSERT INTO public.words VALUES (303, 'potato', 18, 1, 2, 'Картофель');
INSERT INTO public.words VALUES (304, 'rice', 18, 1, 2, 'Рис');
INSERT INTO public.words VALUES (305, 'salad', 18, 1, 2, 'Салат');
INSERT INTO public.words VALUES (306, 'salt', 18, 1, 2, 'Соль');
INSERT INTO public.words VALUES (307, 'sandwich', 18, 1, 2, 'Сэндвич');
INSERT INTO public.words VALUES (308, 'soup', 18, 1, 2, 'Суп');
INSERT INTO public.words VALUES (309, 'sugar', 18, 1, 2, 'Сахар');
INSERT INTO public.words VALUES (310, 'tomato', 18, 1, 2, 'Помидор');
INSERT INTO public.words VALUES (311, 'vegetable', 18, 1, 2, 'Овощи');
INSERT INTO public.words VALUES (312, 'white bread', 18, 1, 2, 'Белый хлеб');
INSERT INTO public.words VALUES (313, 'discuss', 20, 1, 3, 'Обсуждать');
INSERT INTO public.words VALUES (314, 'OK', 20, 1, 6, 'Одноклассники');
INSERT INTO public.words VALUES (315, 'believe', 21, 1, 3, 'Верить');
INSERT INTO public.words VALUES (316, 'guess', 21, 1, 3, 'Угадай');
INSERT INTO public.words VALUES (317, 'guess', 21, 1, 2, 'Угадай');
INSERT INTO public.words VALUES (318, 'know', 21, 1, 3, 'Знать');
INSERT INTO public.words VALUES (319, 'maybead', 21, 1, 3, 'Maybead');
INSERT INTO public.words VALUES (320, 'possible', 21, 1, 1, 'Возможно');
INSERT INTO public.words VALUES (321, 'probablyad', 21, 1, 3, 'Probablyad');
INSERT INTO public.words VALUES (322, 'true', 21, 1, 1, 'Правда');
INSERT INTO public.words VALUES (323, 'advice', 22, 1, 2, 'Информация');
INSERT INTO public.words VALUES (324, 'agree', 22, 1, 3, 'Согласен');
INSERT INTO public.words VALUES (325, 'believe', 22, 1, 3, 'Верить');
INSERT INTO public.words VALUES (326, 'but', 22, 1, 11, 'Однако,');
INSERT INTO public.words VALUES (327, 'cool', 22, 1, 1, 'Круто');
INSERT INTO public.words VALUES (328, 'difference', 22, 1, 2, 'Различие');
INSERT INTO public.words VALUES (329, 'different', 22, 1, 1, 'Разный');
INSERT INTO public.words VALUES (330, 'excuse me', 22, 1, 4, 'Прошу прощения.');
INSERT INTO public.words VALUES (331, 'guess', 22, 1, 3, 'Угадай');
INSERT INTO public.words VALUES (332, 'guess', 22, 1, 2, 'Угадай');
INSERT INTO public.words VALUES (333, 'I’m sorry', 22, 1, 4, 'Простите');
INSERT INTO public.words VALUES (334, 'like', 22, 1, 8, 'Нравится');
INSERT INTO public.words VALUES (335, 'maybead', 22, 1, 3, 'Maybead');
INSERT INTO public.words VALUES (336, 'mistake', 22, 1, 2, 'ошибка');
INSERT INTO public.words VALUES (337, 'no', 22, 1, 2, '№');
INSERT INTO public.words VALUES (338, 'of', 22, 1, 8, 'ВУЛФ');
INSERT INTO public.words VALUES (451, 'shower', 32, 1, 2, 'Душ');
INSERT INTO public.words VALUES (339, 'OK', 22, 1, 6, 'Одноклассники');
INSERT INTO public.words VALUES (340, 'opinion', 22, 1, 2, 'Заключение');
INSERT INTO public.words VALUES (341, 'point', 22, 1, 2, 'Баллы');
INSERT INTO public.words VALUES (342, 'reallyad', 22, 1, 3, 'Reallyad');
INSERT INTO public.words VALUES (343, 'right', 22, 1, 1, 'Справа');
INSERT INTO public.words VALUES (344, 'statement', 22, 1, 2, '(IFU)');
INSERT INTO public.words VALUES (345, 'think', 22, 1, 3, 'Подумайте');
INSERT INTO public.words VALUES (346, 'well', 22, 1, 6, 'Лунка');
INSERT INTO public.words VALUES (347, 'yeah', 22, 1, 6, 'Вот именно');
INSERT INTO public.words VALUES (348, 'yes', 22, 1, 6, 'Да');
INSERT INTO public.words VALUES (349, 'have tomodal', 23, 1, 3, 'Есть томодал');
INSERT INTO public.words VALUES (350, 'mustmodal', 23, 1, 3, 'Mustmodal');
INSERT INTO public.words VALUES (351, 'no', 23, 1, 12, '№');
INSERT INTO public.words VALUES (352, 'OK', 23, 1, 6, 'Одноклассники');
INSERT INTO public.words VALUES (353, 'rule', 23, 1, 2, 'Правило');
INSERT INTO public.words VALUES (354, 'choose', 24, 1, 3, 'Выберите');
INSERT INTO public.words VALUES (355, 'decide', 24, 1, 3, 'Решать');
INSERT INTO public.words VALUES (356, 'hate', 24, 1, 3, 'Ненавидеть');
INSERT INTO public.words VALUES (357, 'like', 24, 1, 3, 'Нравится');
INSERT INTO public.words VALUES (358, 'love', 24, 1, 3, 'Любовь');
INSERT INTO public.words VALUES (359, 'prefer', 24, 1, 3, 'Выше');
INSERT INTO public.words VALUES (360, 'wouldmodal', 24, 1, 3, 'Wouldmodal');
INSERT INTO public.words VALUES (361, 'advice', 25, 1, 2, 'Информация');
INSERT INTO public.words VALUES (362, 'how about…?', 25, 1, 4, 'Как насчет');
INSERT INTO public.words VALUES (363, 'how/what about…?', 25, 1, 4, 'Как / как насчет ...?');
INSERT INTO public.words VALUES (364, 'idea', 25, 1, 2, 'اندیشه');
INSERT INTO public.words VALUES (365, 'let', 25, 1, 3, 'Позволять');
INSERT INTO public.words VALUES (366, 'maybead', 25, 1, 3, 'Maybead');
INSERT INTO public.words VALUES (367, 'what about…?', 25, 1, 4, 'What about….');
INSERT INTO public.words VALUES (368, 'exercise', 27, 1, 2, 'Упражнение');
INSERT INTO public.words VALUES (369, 'exercise', 27, 1, 3, 'Упражнение');
INSERT INTO public.words VALUES (370, 'fine', 27, 1, 1, 'Точно');
INSERT INTO public.words VALUES (371, 'good', 27, 1, 1, 'Хорошо');
INSERT INTO public.words VALUES (372, 'gym', 27, 1, 2, 'Тренажерный зал');
INSERT INTO public.words VALUES (373, 'health', 27, 1, 2, 'Здоровье');
INSERT INTO public.words VALUES (374, 'healthy', 27, 1, 1, 'Безопасно');
INSERT INTO public.words VALUES (375, 'run', 27, 1, 3, 'Цикл');
INSERT INTO public.words VALUES (376, 'strong', 27, 1, 1, 'Надежный');
INSERT INTO public.words VALUES (377, 'walk', 27, 1, 3, 'Ходьба');
INSERT INTO public.words VALUES (378, 'well', 27, 1, 1, 'Лунка');
INSERT INTO public.words VALUES (379, 'cold', 28, 1, 2, 'Низкая температура');
INSERT INTO public.words VALUES (380, 'cut', 28, 1, 3, 'Вырезать');
INSERT INTO public.words VALUES (381, 'get', 28, 1, 3, 'Получайте');
INSERT INTO public.words VALUES (382, 'give', 28, 1, 3, 'پرداخت کنید');
INSERT INTO public.words VALUES (383, 'have', 28, 1, 3, 'Расположите');
INSERT INTO public.words VALUES (384, 'improve', 28, 1, 3, 'Улучшать');
INSERT INTO public.words VALUES (385, 'sick', 28, 1, 1, 'Sick');
INSERT INTO public.words VALUES (386, 'terrible', 28, 1, 1, 'Жахливо');
INSERT INTO public.words VALUES (387, 'doctor', 29, 1, 2, 'Доктор');
INSERT INTO public.words VALUES (388, 'hospital', 29, 1, 2, 'Е.О. Мухина»');
INSERT INTO public.words VALUES (389, 'nurse', 29, 1, 2, 'Медсестра');
INSERT INTO public.words VALUES (390, 'build', 30, 1, 3, 'Сборка');
INSERT INTO public.words VALUES (391, 'building', 30, 1, 2, 'Здание');
INSERT INTO public.words VALUES (392, 'center', 30, 1, 2, 'По центру');
INSERT INTO public.words VALUES (393, 'centre', 30, 1, 2, 'Центр');
INSERT INTO public.words VALUES (394, 'cinema', 30, 1, 2, 'Кинематография');
INSERT INTO public.words VALUES (395, 'design', 30, 1, 2, 'Исполнение');
INSERT INTO public.words VALUES (396, 'design', 30, 1, 3, 'Исполнение');
INSERT INTO public.words VALUES (397, 'downstairsad', 30, 1, 3, 'Downstairsad');
INSERT INTO public.words VALUES (398, 'downstairs', 30, 1, 2, 'Вниз');
INSERT INTO public.words VALUES (399, 'flat', 30, 1, 2, 'Плоский');
INSERT INTO public.words VALUES (400, 'floor', 30, 1, 2, 'Этаж');
INSERT INTO public.words VALUES (401, 'glass', 30, 1, 2, 'Бокал');
INSERT INTO public.words VALUES (402, 'hospital', 30, 1, 2, 'Е.О. Мухина»');
INSERT INTO public.words VALUES (403, 'hotel', 30, 1, 2, 'Отели');
INSERT INTO public.words VALUES (404, 'house', 30, 1, 2, 'Дом');
INSERT INTO public.words VALUES (405, 'library', 30, 1, 2, 'Библиотека');
INSERT INTO public.words VALUES (406, 'modern', 30, 1, 1, 'Навин');
INSERT INTO public.words VALUES (407, 'movie theater', 30, 1, 2, 'Кинотеатр');
INSERT INTO public.words VALUES (408, 'museum', 30, 1, 2, 'Музей');
INSERT INTO public.words VALUES (409, 'post office', 30, 1, 2, 'Почтовое отделение');
INSERT INTO public.words VALUES (410, 'school', 30, 1, 2, 'Школа');
INSERT INTO public.words VALUES (411, 'station', 30, 1, 2, 'Станция');
INSERT INTO public.words VALUES (412, 'street', 30, 1, 2, 'Адрес');
INSERT INTO public.words VALUES (413, 'swimming pool', 30, 1, 2, 'Плавательный бассейн');
INSERT INTO public.words VALUES (414, 'theatre', 30, 1, 2, 'Театр');
INSERT INTO public.words VALUES (415, 'upstairsad', 30, 1, 3, 'Upstairsad');
INSERT INTO public.words VALUES (416, 'upstairs', 30, 1, 2, 'Лестница');
INSERT INTO public.words VALUES (417, 'wall', 30, 1, 2, 'Стена');
INSERT INTO public.words VALUES (418, 'window', 30, 1, 2, 'Окно');
INSERT INTO public.words VALUES (419, 'garden', 31, 1, 2, 'Сад');
INSERT INTO public.words VALUES (420, 'garden', 31, 1, 3, 'Сад');
INSERT INTO public.words VALUES (421, 'grow', 31, 1, 3, 'Рост');
INSERT INTO public.words VALUES (422, 'swimming pool', 31, 1, 2, 'Плавательный бассейн');
INSERT INTO public.words VALUES (423, 'apartment', 32, 1, 2, 'Квартира');
INSERT INTO public.words VALUES (424, 'bath', 32, 1, 2, 'Ванна');
INSERT INTO public.words VALUES (425, 'bathroom', 32, 1, 2, 'Санузел');
INSERT INTO public.words VALUES (426, 'bed', 32, 1, 2, 'Постель');
INSERT INTO public.words VALUES (427, 'bedroom', 32, 1, 2, 'Спальня');
INSERT INTO public.words VALUES (428, 'buy', 32, 1, 3, 'Купить');
INSERT INTO public.words VALUES (429, 'chair', 32, 1, 2, 'Chair');
INSERT INTO public.words VALUES (430, 'clean', 32, 1, 3, 'Очистка');
INSERT INTO public.words VALUES (431, 'desk', 32, 1, 2, 'Пульт');
INSERT INTO public.words VALUES (432, 'dining room', 32, 1, 2, 'Столовая');
INSERT INTO public.words VALUES (433, 'door', 32, 1, 2, 'Створка');
INSERT INTO public.words VALUES (434, 'downstairsad', 32, 1, 3, 'Downstairsad');
INSERT INTO public.words VALUES (435, 'downstairs', 32, 1, 2, 'Вниз');
INSERT INTO public.words VALUES (436, 'flat', 32, 1, 2, 'Плоский');
INSERT INTO public.words VALUES (437, 'floor', 32, 1, 2, 'Этаж');
INSERT INTO public.words VALUES (438, 'front', 32, 1, 2, 'Передняя часть');
INSERT INTO public.words VALUES (439, 'home', 32, 1, 2, 'На главную');
INSERT INTO public.words VALUES (440, 'house', 32, 1, 2, 'Дом');
INSERT INTO public.words VALUES (441, 'kitchen', 32, 1, 2, 'Кухня');
INSERT INTO public.words VALUES (442, 'library', 32, 1, 2, 'Библиотека');
INSERT INTO public.words VALUES (443, 'light', 32, 1, 2, 'Светлая');
INSERT INTO public.words VALUES (444, 'living room', 32, 1, 2, 'Гостиная');
INSERT INTO public.words VALUES (445, 'office', 32, 1, 2, 'Офис');
INSERT INTO public.words VALUES (446, 'paint', 32, 1, 2, 'Покраска');
INSERT INTO public.words VALUES (447, 'paint', 32, 1, 3, 'Покраска');
INSERT INTO public.words VALUES (448, 'picture', 32, 1, 2, 'Картинка');
INSERT INTO public.words VALUES (449, 'room', 32, 1, 2, 'Номер');
INSERT INTO public.words VALUES (450, 'sell', 32, 1, 2, 'Продажа');
INSERT INTO public.words VALUES (452, 'sofa', 32, 1, 2, 'Диван');
INSERT INTO public.words VALUES (453, 'table', 32, 1, 2, 'Стол');
INSERT INTO public.words VALUES (454, 'telephone', 32, 1, 2, 'Телефон');
INSERT INTO public.words VALUES (455, 'television', 32, 1, 2, 'Телевидение');
INSERT INTO public.words VALUES (456, 'toilet', 32, 1, 2, 'Туалет');
INSERT INTO public.words VALUES (457, 'upstairsad', 32, 1, 3, 'Upstairsad');
INSERT INTO public.words VALUES (458, 'upstairs', 32, 1, 2, 'Лестница');
INSERT INTO public.words VALUES (459, 'wall', 32, 1, 2, 'Стена');
INSERT INTO public.words VALUES (460, 'wash', 32, 1, 3, 'Промывка');
INSERT INTO public.words VALUES (461, 'window', 32, 1, 2, 'Окно');
INSERT INTO public.words VALUES (462, 'ball', 33, 1, 2, 'Шаровая опора');
INSERT INTO public.words VALUES (463, 'computer game', 33, 1, 2, 'Компьютерная игра');
INSERT INTO public.words VALUES (464, 'fun', 33, 1, 2, 'Веселье');
INSERT INTO public.words VALUES (465, 'game', 33, 1, 2, 'Игра');
INSERT INTO public.words VALUES (466, 'lose', 33, 1, 3, 'Поражений');
INSERT INTO public.words VALUES (467, 'play', 33, 1, 3, 'Воспроизвести');
INSERT INTO public.words VALUES (468, 'player', 33, 1, 2, 'Плеер');
INSERT INTO public.words VALUES (469, 'quiz', 33, 1, 2, 'Викторина');
INSERT INTO public.words VALUES (470, 'rule', 33, 1, 2, 'Правило');
INSERT INTO public.words VALUES (471, 'team', 33, 1, 2, 'Команда');
INSERT INTO public.words VALUES (472, 'turn', 33, 1, 2, 'Поворот');
INSERT INTO public.words VALUES (473, 'video game', 33, 1, 2, 'Видеоигра');
INSERT INTO public.words VALUES (474, 'win', 33, 1, 3, 'Выигрыш');
INSERT INTO public.words VALUES (475, 'activity', 34, 1, 2, 'Мероприятие');
INSERT INTO public.words VALUES (476, 'art', 34, 1, 2, 'Art');
INSERT INTO public.words VALUES (477, 'cooking', 34, 1, 2, 'Приготовление пищи');
INSERT INTO public.words VALUES (478, 'dance', 34, 1, 2, 'Танцы');
INSERT INTO public.words VALUES (479, 'dance', 34, 1, 3, 'Танцы');
INSERT INTO public.words VALUES (480, 'dancer', 34, 1, 2, 'Натяжной валик');
INSERT INTO public.words VALUES (481, 'dancing', 34, 1, 2, 'Танец');
INSERT INTO public.words VALUES (482, 'hobby', 34, 1, 2, 'Хобби');
INSERT INTO public.words VALUES (483, 'interest', 34, 1, 2, 'Проценты');
INSERT INTO public.words VALUES (484, 'music', 34, 1, 2, 'Музыка');
INSERT INTO public.words VALUES (485, 'painting', 34, 1, 2, 'Покраска');
INSERT INTO public.words VALUES (486, 'reading', 34, 1, 2, 'Чтение');
INSERT INTO public.words VALUES (487, 'relax', 34, 1, 3, 'Релакс');
INSERT INTO public.words VALUES (488, 'shopping', 34, 1, 2, 'Шоппинг');
INSERT INTO public.words VALUES (489, 'writing', 34, 1, 2, 'Письмо');
INSERT INTO public.words VALUES (490, 'bag', 35, 1, 2, 'Сумка');
INSERT INTO public.words VALUES (491, 'banknote', 35, 1, 2, 'Банкнота');
INSERT INTO public.words VALUES (492, 'bill', 35, 1, 2, 'Счет');
INSERT INTO public.words VALUES (493, 'book', 35, 1, 2, 'Книга');
INSERT INTO public.words VALUES (494, 'buy', 35, 1, 3, 'Купить');
INSERT INTO public.words VALUES (495, 'center', 35, 1, 2, 'По центру');
INSERT INTO public.words VALUES (496, 'centre', 35, 1, 2, 'Центр');
INSERT INTO public.words VALUES (497, 'cheap', 35, 1, 1, 'Дешево');
INSERT INTO public.words VALUES (498, 'close', 35, 1, 3, 'Закрыть');
INSERT INTO public.words VALUES (499, 'cost', 35, 1, 3, 'Стоимость');
INSERT INTO public.words VALUES (500, 'customer', 35, 1, 2, 'Клиент');
INSERT INTO public.words VALUES (501, 'expensive', 35, 1, 1, 'Дорогой');
INSERT INTO public.words VALUES (502, 'game', 35, 1, 2, 'Игра');
INSERT INTO public.words VALUES (503, 'internet', 35, 1, 2, 'Интернетeу');
INSERT INTO public.words VALUES (504, 'list', 35, 1, 2, 'Список');
INSERT INTO public.words VALUES (505, 'market', 35, 1, 2, 'მარკეტი');
INSERT INTO public.words VALUES (506, 'music', 35, 1, 2, 'Музыка');
INSERT INTO public.words VALUES (507, 'online', 35, 1, 1, 'В сети');
INSERT INTO public.words VALUES (508, 'pay', 35, 1, 3, 'Оплатить');
INSERT INTO public.words VALUES (509, 'price', 35, 1, 2, 'Цена');
INSERT INTO public.words VALUES (510, 'product', 35, 1, 2, 'Продукт');
INSERT INTO public.words VALUES (511, 'sell', 35, 1, 2, 'Продажа');
INSERT INTO public.words VALUES (512, 'shoe', 35, 1, 2, 'Обувь');
INSERT INTO public.words VALUES (513, 'shop', 35, 1, 2, 'Магазин');
INSERT INTO public.words VALUES (514, 'shopping', 35, 1, 2, 'Шоппинг');
INSERT INTO public.words VALUES (515, 'shop window', 35, 1, 2, 'витрина');
INSERT INTO public.words VALUES (516, 'spend', 35, 1, 3, 'Осталось');
INSERT INTO public.words VALUES (517, 'supermarket', 35, 1, 2, 'Супермакет');
INSERT INTO public.words VALUES (518, 'window', 35, 1, 2, 'Окно');
INSERT INTO public.words VALUES (519, 'because', 36, 1, 11, 'Из-за');
INSERT INTO public.words VALUES (520, 'because of', 36, 1, 8, 'Because of');
INSERT INTO public.words VALUES (521, 'change', 36, 1, 3, 'Изменить');
INSERT INTO public.words VALUES (522, 'change', 36, 1, 2, 'Изменить');
INSERT INTO public.words VALUES (523, 'grow', 36, 1, 3, 'Рост');
INSERT INTO public.words VALUES (524, 'happen', 36, 1, 3, 'learned');
INSERT INTO public.words VALUES (525, 'improve', 36, 1, 3, 'Улучшать');
INSERT INTO public.words VALUES (526, 'reason', 36, 1, 2, 'Причина');
INSERT INTO public.words VALUES (527, 'result', 36, 1, 2, 'Результат');
INSERT INTO public.words VALUES (528, 'afraid', 37, 1, 1, 'Боящийся');
INSERT INTO public.words VALUES (529, 'dangerous', 37, 1, 1, 'Рискованный');
INSERT INTO public.words VALUES (530, 'help', 37, 1, 2, 'Помощь+');
INSERT INTO public.words VALUES (531, 'difficult', 38, 1, 1, 'Сложно');
INSERT INTO public.words VALUES (532, 'hard', 38, 1, 1, 'Трудный');
INSERT INTO public.words VALUES (533, 'hardad', 38, 1, 3, 'Hardad');
INSERT INTO public.words VALUES (534, 'lose', 38, 1, 3, 'Поражений');
INSERT INTO public.words VALUES (535, 'mistake', 38, 1, 2, 'ошибка');
INSERT INTO public.words VALUES (536, 'problem', 38, 1, 2, 'Проблема');
INSERT INTO public.words VALUES (537, 'do', 39, 1, 3, 'Действие');
INSERT INTO public.words VALUES (538, 'success', 39, 1, 2, 'Успех');
INSERT INTO public.words VALUES (539, 'win', 39, 1, 3, 'Выигрыш');
INSERT INTO public.words VALUES (540, 'answer', 40, 1, 2, 'Ответ');
INSERT INTO public.words VALUES (541, 'art', 40, 1, 2, 'Art');
INSERT INTO public.words VALUES (542, 'book', 40, 1, 2, 'Книга');
INSERT INTO public.words VALUES (543, 'class', 40, 1, 2, 'Кабинет');
INSERT INTO public.words VALUES (544, 'classmate', 40, 1, 2, 'Одноклассники');
INSERT INTO public.words VALUES (545, 'classroom', 40, 1, 2, 'Класс');
INSERT INTO public.words VALUES (546, 'college', 40, 1, 2, 'Колледж');
INSERT INTO public.words VALUES (547, 'course', 40, 1, 1, 'Курс');
INSERT INTO public.words VALUES (548, 'desk', 40, 1, 2, 'Пульт');
INSERT INTO public.words VALUES (549, 'dictionary', 40, 1, 2, 'Словарь');
INSERT INTO public.words VALUES (550, 'English', 40, 1, 2, 'Английский');
INSERT INTO public.words VALUES (551, 'exam', 40, 1, 2, 'диагностики');
INSERT INTO public.words VALUES (552, 'exercise', 40, 1, 2, 'Упражнение');
INSERT INTO public.words VALUES (553, 'geography', 40, 1, 2, 'География');
INSERT INTO public.words VALUES (554, 'gym', 40, 1, 2, 'Тренажерный зал');
INSERT INTO public.words VALUES (555, 'high school', 40, 1, 2, 'Средняя школа');
INSERT INTO public.words VALUES (556, 'history', 40, 1, 2, 'История');
INSERT INTO public.words VALUES (557, 'homework', 40, 1, 2, 'домашнего задания');
INSERT INTO public.words VALUES (558, 'learn', 40, 1, 3, 'Учите');
INSERT INTO public.words VALUES (559, 'learner', 40, 1, 2, 'Слушатель');
INSERT INTO public.words VALUES (560, 'lesson', 40, 1, 2, 'Урок');
INSERT INTO public.words VALUES (561, 'library', 40, 1, 2, 'Библиотека');
INSERT INTO public.words VALUES (562, 'music', 40, 1, 2, 'Музыка');
INSERT INTO public.words VALUES (563, 'practise', 40, 1, 3, 'Практика');
INSERT INTO public.words VALUES (564, 'project', 40, 1, 2, 'Проект');
INSERT INTO public.words VALUES (565, 'result', 40, 1, 2, 'Результат');
INSERT INTO public.words VALUES (566, 'school', 40, 1, 2, 'Школа');
INSERT INTO public.words VALUES (567, 'science', 40, 1, 2, 'Наука');
INSERT INTO public.words VALUES (568, 'student', 40, 1, 2, 'Студент');
INSERT INTO public.words VALUES (569, 'study', 40, 1, 2, 'Исследование');
INSERT INTO public.words VALUES (570, 'study', 40, 1, 3, 'Исследование');
INSERT INTO public.words VALUES (571, 'subject', 40, 1, 2, 'Тема');
INSERT INTO public.words VALUES (572, 'teach', 40, 1, 3, 'Учить');
INSERT INTO public.words VALUES (573, 'teacher', 40, 1, 2, 'Учитель');
INSERT INTO public.words VALUES (574, 'test', 40, 1, 2, 'Испытание');
INSERT INTO public.words VALUES (575, 'test', 40, 1, 3, 'Испытание');
INSERT INTO public.words VALUES (576, 'text', 40, 1, 2, 'Текст');
INSERT INTO public.words VALUES (577, 'university', 40, 1, 2, 'Университет');
INSERT INTO public.words VALUES (578, 'year', 40, 1, 2, 'Год');
INSERT INTO public.words VALUES (579, 'aunt', 41, 1, 2, 'Тетя');
INSERT INTO public.words VALUES (580, 'boyfriend', 41, 1, 2, 'Бойфренд');
INSERT INTO public.words VALUES (581, 'brother', 41, 1, 2, 'Брат');
INSERT INTO public.words VALUES (582, 'cousin', 41, 1, 2, 'Двоюродный брат');
INSERT INTO public.words VALUES (583, 'dad', 41, 1, 2, 'Папа');
INSERT INTO public.words VALUES (584, 'daughter', 41, 1, 2, 'Дочь');
INSERT INTO public.words VALUES (585, 'family', 41, 1, 2, 'Фамилия');
INSERT INTO public.words VALUES (586, 'father', 41, 1, 2, 'Отец');
INSERT INTO public.words VALUES (587, 'first cousin', 41, 1, 2, 'Двоюродный брат');
INSERT INTO public.words VALUES (588, 'friend', 41, 1, 2, 'Друг');
INSERT INTO public.words VALUES (589, 'girlfriend', 41, 1, 2, 'Подруга');
INSERT INTO public.words VALUES (590, 'grandad', 41, 1, 2, 'дедушка');
INSERT INTO public.words VALUES (591, 'grandchild', 41, 1, 2, 'Семья');
INSERT INTO public.words VALUES (592, 'granddaughter', 41, 1, 2, 'Семья');
INSERT INTO public.words VALUES (593, 'grandfather', 41, 1, 2, 'Дед');
INSERT INTO public.words VALUES (594, 'grandma', 41, 1, 2, 'Бабушка');
INSERT INTO public.words VALUES (595, 'grandmother', 41, 1, 2, 'Бабушка');
INSERT INTO public.words VALUES (596, 'grandpa', 41, 1, 2, 'Дедушка');
INSERT INTO public.words VALUES (597, 'grandparent', 41, 1, 2, 'Дед');
INSERT INTO public.words VALUES (598, 'grandson', 41, 1, 2, 'Внук');
INSERT INTO public.words VALUES (599, 'husband', 41, 1, 2, 'Муж');
INSERT INTO public.words VALUES (600, 'leave', 41, 1, 3, 'Отпуск');
INSERT INTO public.words VALUES (601, 'love', 41, 1, 2, 'Любовь');
INSERT INTO public.words VALUES (602, 'mom', 41, 1, 2, 'Мама');
INSERT INTO public.words VALUES (603, 'mother', 41, 1, 2, 'Мать');
INSERT INTO public.words VALUES (604, 'mum', 41, 1, 2, 'Мама');
INSERT INTO public.words VALUES (605, 'name', 41, 1, 2, 'Название');
INSERT INTO public.words VALUES (606, 'neighbour', 41, 1, 2, 'сосед');
INSERT INTO public.words VALUES (607, 'sister', 41, 1, 2, 'Сестра');
INSERT INTO public.words VALUES (608, 'son', 41, 1, 2, 'Сын');
INSERT INTO public.words VALUES (609, 'togetherad', 41, 1, 3, 'Togetherad');
INSERT INTO public.words VALUES (610, 'uncle', 41, 1, 2, 'Дядя');
INSERT INTO public.words VALUES (611, 'wife', 41, 1, 2, 'Жена');
INSERT INTO public.words VALUES (612, 'afraid', 42, 1, 1, 'Боящийся');
INSERT INTO public.words VALUES (613, 'angry', 42, 1, 1, 'Разгневанный');
INSERT INTO public.words VALUES (614, 'bored', 42, 1, 2, 'Скука');
INSERT INTO public.words VALUES (615, 'feellinking', 42, 1, 3, 'Feellinking');
INSERT INTO public.words VALUES (616, 'feeling', 42, 1, 2, 'Чувство');
INSERT INTO public.words VALUES (617, 'fun', 42, 1, 2, 'Веселье');
INSERT INTO public.words VALUES (618, 'happy', 42, 1, 1, 'Счастливый');
INSERT INTO public.words VALUES (619, 'hate', 42, 1, 3, 'Ненавидеть');
INSERT INTO public.words VALUES (620, 'hope', 42, 1, 3, 'Надежда');
INSERT INTO public.words VALUES (621, 'hungry', 42, 1, 1, 'Голод');
INSERT INTO public.words VALUES (622, 'interest', 42, 1, 2, 'Проценты');
INSERT INTO public.words VALUES (623, 'laugh', 42, 1, 3, 'Смешно');
INSERT INTO public.words VALUES (624, 'laugh', 42, 1, 2, 'Смешно');
INSERT INTO public.words VALUES (625, 'love', 42, 1, 2, 'Любовь');
INSERT INTO public.words VALUES (626, 'love', 42, 1, 3, 'Любовь');
INSERT INTO public.words VALUES (627, 'OK', 42, 1, 1, 'Одноклассники');
INSERT INTO public.words VALUES (628, 'sad', 42, 1, 1, 'Грустный');
INSERT INTO public.words VALUES (629, 'sorry', 42, 1, 1, 'Извините');
INSERT INTO public.words VALUES (630, 'terrible', 42, 1, 1, 'Жахливо');
INSERT INTO public.words VALUES (631, 'thirsty', 42, 1, 1, 'Жажда');
INSERT INTO public.words VALUES (632, 'tired', 42, 1, 1, 'Уставший');
INSERT INTO public.words VALUES (633, 'adult', 43, 1, 2, 'Взрослый');
INSERT INTO public.words VALUES (634, 'baby', 43, 1, 2, 'Ребенок');
INSERT INTO public.words VALUES (635, 'born', 43, 1, 3, 'Дата рождения');
INSERT INTO public.words VALUES (636, 'boy', 43, 1, 2, 'Мальчик');
INSERT INTO public.words VALUES (637, 'child', 43, 1, 2, 'Ребенок');
INSERT INTO public.words VALUES (638, 'die', 43, 1, 3, 'Шаблон');
INSERT INTO public.words VALUES (639, 'family', 43, 1, 2, 'Фамилия');
INSERT INTO public.words VALUES (640, 'father', 43, 1, 2, 'Отец');
INSERT INTO public.words VALUES (641, 'girl', 43, 1, 2, 'Девочка');
INSERT INTO public.words VALUES (642, 'gray', 43, 1, 1, 'Серый');
INSERT INTO public.words VALUES (643, 'grey', 43, 1, 1, 'Серые');
INSERT INTO public.words VALUES (644, 'man', 43, 1, 2, 'Мужчина');
INSERT INTO public.words VALUES (645, 'married', 43, 1, 1, 'В браке');
INSERT INTO public.words VALUES (646, 'mother', 43, 1, 2, 'Мать');
INSERT INTO public.words VALUES (647, 'old', 43, 1, 1, 'Старый');
INSERT INTO public.words VALUES (648, 'parent', 43, 1, 2, 'Родитель');
INSERT INTO public.words VALUES (649, 'teenager', 43, 1, 2, 'Подросток');
INSERT INTO public.words VALUES (650, 'woman', 43, 1, 2, 'Женщина');
INSERT INTO public.words VALUES (651, 'young', 43, 1, 1, 'Молодой');
INSERT INTO public.words VALUES (652, 'bad', 44, 1, 1, 'Плохо');
INSERT INTO public.words VALUES (653, 'difficult', 44, 1, 1, 'Сложно');
INSERT INTO public.words VALUES (654, 'friendly', 44, 1, 1, 'Товарищеский');
INSERT INTO public.words VALUES (655, 'good', 44, 1, 1, 'Хорошо');
INSERT INTO public.words VALUES (656, 'nice', 44, 1, 1, 'Мило');
INSERT INTO public.words VALUES (657, 'skill', 44, 1, 2, 'Квалификация');
INSERT INTO public.words VALUES (658, 'sure', 44, 1, 1, 'Конечно.');
INSERT INTO public.words VALUES (659, 'body', 46, 1, 2, 'Корпус');
INSERT INTO public.words VALUES (660, 'passport', 47, 1, 2, 'Паспорт');
INSERT INTO public.words VALUES (661, 'police', 47, 1, 2, 'Полиция');
INSERT INTO public.words VALUES (662, 'policeman', 47, 1, 2, 'Полицейский');
INSERT INTO public.words VALUES (663, 'policewoman', 47, 1, 2, 'Женщина полицейский');
INSERT INTO public.words VALUES (664, 'black', 48, 1, 1, 'Черный');
INSERT INTO public.words VALUES (665, 'group', 48, 1, 2, 'Группа');
INSERT INTO public.words VALUES (666, 'man', 48, 1, 2, 'Мужчина');
INSERT INTO public.words VALUES (667, 'poor', 48, 1, 1, 'Плохое');
INSERT INTO public.words VALUES (668, 'rich', 48, 1, 1, 'Богач');
INSERT INTO public.words VALUES (669, 'white', 48, 1, 1, 'Белый');
INSERT INTO public.words VALUES (670, 'woman', 48, 1, 2, 'Женщина');
INSERT INTO public.words VALUES (671, 'believe', 49, 1, 3, 'Верить');
INSERT INTO public.words VALUES (672, 'birthday', 49, 1, 2, 'День рождения');
INSERT INTO public.words VALUES (673, 'Christmas', 49, 1, 2, 'Кристмас');
INSERT INTO public.words VALUES (674, 'new year', 49, 1, 2, 'Новый год');
INSERT INTO public.words VALUES (675, 'party', 49, 1, 2, 'Сторона');
INSERT INTO public.words VALUES (676, 'give', 50, 1, 3, 'پرداخت کنید');
INSERT INTO public.words VALUES (677, 'help', 50, 1, 3, 'Помощь+');
INSERT INTO public.words VALUES (678, 'help', 50, 1, 2, 'Помощь+');
INSERT INTO public.words VALUES (679, 'job', 50, 1, 2, 'Вакансию');
INSERT INTO public.words VALUES (680, 'poor', 50, 1, 1, 'Плохое');
INSERT INTO public.words VALUES (681, 'problem', 50, 1, 2, 'Проблема');
INSERT INTO public.words VALUES (682, 'dangerous', 51, 1, 1, 'Рискованный');
INSERT INTO public.words VALUES (683, 'computer', 54, 1, 2, 'Компьютер');
INSERT INTO public.words VALUES (684, 'DVD', 54, 1, 2, 'Dvd плеер');
INSERT INTO public.words VALUES (685, 'language', 54, 1, 2, 'Язык');
INSERT INTO public.words VALUES (686, 'menu', 54, 1, 2, 'Меню');
INSERT INTO public.words VALUES (687, 'mouse', 54, 1, 2, 'Мышь');
INSERT INTO public.words VALUES (688, 'open', 54, 1, 3, 'Открыто');
INSERT INTO public.words VALUES (689, 'video', 54, 1, 2, 'Видео');
INSERT INTO public.words VALUES (690, 'break', 55, 1, 3, 'Разрыв');
INSERT INTO public.words VALUES (691, 'clock', 55, 1, 2, 'Часы');
INSERT INTO public.words VALUES (692, 'machine', 55, 1, 2, 'Оборудование');
INSERT INTO public.words VALUES (693, 'add', 56, 1, 3, 'Добавить');
INSERT INTO public.words VALUES (694, 'graph', 56, 1, 2, 'Граф');
INSERT INTO public.words VALUES (695, 'hundred', 56, 1, 9, 'сто');
INSERT INTO public.words VALUES (696, 'kilometre', 56, 1, 2, 'Километр');
INSERT INTO public.words VALUES (697, 'metre', 56, 1, 2, 'Метр');
INSERT INTO public.words VALUES (698, 'mile', 56, 1, 2, 'Мили');
INSERT INTO public.words VALUES (699, 'million', 56, 1, 9, 'млн.');
INSERT INTO public.words VALUES (700, 'number', 56, 1, 2, 'Количество вопросов');
INSERT INTO public.words VALUES (701, 'thousand', 56, 1, 9, 'Тысяча');
INSERT INTO public.words VALUES (702, 'light', 57, 1, 2, 'Светлая');
INSERT INTO public.words VALUES (703, 'sun', 57, 1, 2, 'Вс');
INSERT INTO public.words VALUES (704, 'fact', 58, 1, 2, 'Факт');
INSERT INTO public.words VALUES (705, 'result', 58, 1, 2, 'Результат');
INSERT INTO public.words VALUES (706, 'science', 58, 1, 2, 'Наука');
INSERT INTO public.words VALUES (707, 'scientist', 58, 1, 2, 'Научный работник');
INSERT INTO public.words VALUES (708, 'Association football', 59, 1, 2, 'Футбол');
INSERT INTO public.words VALUES (709, 'ball', 59, 1, 2, 'Шаровая опора');
INSERT INTO public.words VALUES (710, 'club', 59, 1, 2, 'Клуб');
INSERT INTO public.words VALUES (711, 'football', 59, 1, 2, 'Футбол');
INSERT INTO public.words VALUES (712, 'half', 59, 1, 2, 'Половина');
INSERT INTO public.words VALUES (713, 'line', 59, 1, 2, 'Поз.');
INSERT INTO public.words VALUES (714, 'match', 59, 1, 2, 'Совпадает');
INSERT INTO public.words VALUES (715, 'play', 59, 1, 3, 'Воспроизвести');
INSERT INTO public.words VALUES (716, 'player', 59, 1, 2, 'Плеер');
INSERT INTO public.words VALUES (717, 'result', 59, 1, 2, 'Результат');
INSERT INTO public.words VALUES (718, 'sport', 59, 1, 2, 'Спорт');
INSERT INTO public.words VALUES (719, 'team', 59, 1, 2, 'Команда');
INSERT INTO public.words VALUES (720, 'tennis', 59, 1, 2, 'Теннис');
INSERT INTO public.words VALUES (721, 'bicycle', 60, 1, 2, 'Велосипед');
INSERT INTO public.words VALUES (722, 'bike', 60, 1, 2, 'Байк');
INSERT INTO public.words VALUES (723, 'exercise', 60, 1, 2, 'Упражнение');
INSERT INTO public.words VALUES (724, 'exercise', 60, 1, 3, 'Упражнение');
INSERT INTO public.words VALUES (725, 'gym', 60, 1, 2, 'Тренажерный зал');
INSERT INTO public.words VALUES (726, 'horse', 60, 1, 2, 'Лошадь');
INSERT INTO public.words VALUES (727, 'ride', 60, 1, 2, 'Поездка');
INSERT INTO public.words VALUES (728, 'sport', 60, 1, 2, 'Спорт');
INSERT INTO public.words VALUES (729, 'boat', 61, 1, 2, 'Лодка');
INSERT INTO public.words VALUES (730, 'swim', 61, 1, 3, 'Плавать');
INSERT INTO public.words VALUES (731, 'swimming', 61, 1, 2, 'Плавание');
INSERT INTO public.words VALUES (732, 'swimming pool', 61, 1, 2, 'Плавательный бассейн');
INSERT INTO public.words VALUES (733, 'water sports', 61, 1, 2, 'Water sports');
INSERT INTO public.words VALUES (734, 'farm', 62, 1, 2, 'Ферма');
INSERT INTO public.words VALUES (735, 'farmer', 62, 1, 2, 'Фермер');
INSERT INTO public.words VALUES (736, 'fruit', 62, 1, 2, 'Содержание');
INSERT INTO public.words VALUES (737, 'grow', 62, 1, 3, 'Рост');
INSERT INTO public.words VALUES (738, 'rice', 62, 1, 2, 'Рис');
INSERT INTO public.words VALUES (739, 'vegetable', 62, 1, 2, 'Овощи');
INSERT INTO public.words VALUES (740, 'Africa', 63, 1, 2, 'Африка');
INSERT INTO public.words VALUES (741, 'area', 63, 1, 2, 'Площадь');
INSERT INTO public.words VALUES (742, 'Asia', 63, 1, 2, 'Азия');
INSERT INTO public.words VALUES (743, 'beach', 63, 1, 2, 'Пляж');
INSERT INTO public.words VALUES (744, 'cold', 63, 1, 1, 'Низкая температура');
INSERT INTO public.words VALUES (745, 'country', 63, 1, 2, 'Страна');
INSERT INTO public.words VALUES (746, 'east', 63, 1, 2, 'Восток');
INSERT INTO public.words VALUES (747, 'east', 63, 1, 1, 'Восток');
INSERT INTO public.words VALUES (748, 'Europe', 63, 1, 2, 'Европа');
INSERT INTO public.words VALUES (749, 'geography', 63, 1, 2, 'География');
INSERT INTO public.words VALUES (750, 'hot', 63, 1, 1, 'Топ продаж');
INSERT INTO public.words VALUES (751, 'island', 63, 1, 2, 'Остров');
INSERT INTO public.words VALUES (752, 'map', 63, 1, 2, 'Карта');
INSERT INTO public.words VALUES (753, 'mountain', 63, 1, 2, 'Горы');
INSERT INTO public.words VALUES (754, 'north', 63, 1, 2, 'Север');
INSERT INTO public.words VALUES (755, 'north', 63, 1, 1, 'Север');
INSERT INTO public.words VALUES (756, 'North America', 63, 1, 2, 'Северная Америка');
INSERT INTO public.words VALUES (757, 'river', 63, 1, 2, 'Река');
INSERT INTO public.words VALUES (758, 'sea', 63, 1, 2, 'Море');
INSERT INTO public.words VALUES (759, 'south', 63, 1, 2, 'Юг');
INSERT INTO public.words VALUES (760, 'south', 63, 1, 1, 'Юг');
INSERT INTO public.words VALUES (761, 'South America', 63, 1, 2, 'Южная Америка');
INSERT INTO public.words VALUES (762, 'town', 63, 1, 2, 'Поселение');
INSERT INTO public.words VALUES (763, 'village', 63, 1, 2, 'Деревня');
INSERT INTO public.words VALUES (764, 'west', 63, 1, 2, 'Запад');
INSERT INTO public.words VALUES (765, 'west', 63, 1, 1, 'Запад');
INSERT INTO public.words VALUES (766, 'flower', 64, 1, 2, 'Цветок');
INSERT INTO public.words VALUES (767, 'plant', 64, 1, 2, 'Завод');
INSERT INTO public.words VALUES (768, 'tree', 64, 1, 2, 'Дерево опорных точек');
INSERT INTO public.words VALUES (769, 'air', 65, 1, 2, 'Воздух');
INSERT INTO public.words VALUES (770, 'clean', 65, 1, 1, 'Очистка');
INSERT INTO public.words VALUES (771, 'natural', 65, 1, 1, 'Натуральный');
INSERT INTO public.words VALUES (772, 'air', 66, 1, 2, 'Воздух');
INSERT INTO public.words VALUES (773, 'bad', 66, 1, 1, 'Плохо');
INSERT INTO public.words VALUES (774, 'change', 66, 1, 3, 'Изменить');
INSERT INTO public.words VALUES (775, 'change', 66, 1, 2, 'Изменить');
INSERT INTO public.words VALUES (776, 'cold', 66, 1, 1, 'Низкая температура');
INSERT INTO public.words VALUES (777, 'cool', 66, 1, 1, 'Круто');
INSERT INTO public.words VALUES (778, 'dark', 66, 1, 1, 'Темный');
INSERT INTO public.words VALUES (779, 'east', 66, 1, 1, 'Восток');
INSERT INTO public.words VALUES (780, 'good', 66, 1, 1, 'Хорошо');
INSERT INTO public.words VALUES (781, 'hot', 66, 1, 1, 'Топ продаж');
INSERT INTO public.words VALUES (782, 'ice', 66, 1, 2, 'Лёд');
INSERT INTO public.words VALUES (783, 'north', 66, 1, 1, 'Север');
INSERT INTO public.words VALUES (784, 'rain', 66, 1, 2, 'Дождь');
INSERT INTO public.words VALUES (785, 'snow', 66, 1, 2, 'Снег');
INSERT INTO public.words VALUES (786, 'snow', 66, 1, 3, 'Снег');
INSERT INTO public.words VALUES (787, 'south', 66, 1, 1, 'Юг');
INSERT INTO public.words VALUES (788, 'sun', 66, 1, 2, 'Вс');
INSERT INTO public.words VALUES (789, 'sunny', 66, 1, 1, 'Солнечно');
INSERT INTO public.words VALUES (790, 'umbrella', 66, 1, 2, 'Зонт');
INSERT INTO public.words VALUES (791, 'warm', 66, 1, 1, 'Поддержание');
INSERT INTO public.words VALUES (792, 'weather', 66, 1, 2, 'Погода');
INSERT INTO public.words VALUES (793, 'west', 66, 1, 1, 'Запад');
INSERT INTO public.words VALUES (794, 'century', 68, 1, 2, 'Век');
INSERT INTO public.words VALUES (795, 'date', 68, 1, 2, 'Дата');
INSERT INTO public.words VALUES (796, 'history', 68, 1, 2, 'История');
INSERT INTO public.words VALUES (797, 'modern', 68, 1, 1, 'Навин');
INSERT INTO public.words VALUES (798, 'past', 68, 1, 1, 'Прошлое');
INSERT INTO public.words VALUES (799, 'past', 68, 1, 3, 'Прошлое');
INSERT INTO public.words VALUES (800, 'period', 68, 1, 2, 'Точка');
INSERT INTO public.words VALUES (801, 'outer space', 69, 1, 2, '♦ космическое пространство');
INSERT INTO public.words VALUES (802, 'space', 69, 1, 2, 'Отопление');
INSERT INTO public.words VALUES (803, 'star', 69, 1, 2, 'Звездная');
INSERT INTO public.words VALUES (804, 'sun', 69, 1, 2, 'Вс');
INSERT INTO public.words VALUES (805, 'after', 70, 1, 8, 'После');
INSERT INTO public.words VALUES (806, 'afternoon', 70, 1, 2, 'После полудня');
INSERT INTO public.words VALUES (807, 'agoad', 70, 1, 3, 'Agoad');
INSERT INTO public.words VALUES (808, 'April', 70, 1, 2, 'Апрель');
INSERT INTO public.words VALUES (809, 'August', 70, 1, 2, 'август');
INSERT INTO public.words VALUES (810, 'autumn', 70, 1, 2, 'Осень');
INSERT INTO public.words VALUES (811, 'before', 70, 1, 8, 'Перед');
INSERT INTO public.words VALUES (812, 'century', 70, 1, 2, 'Век');
INSERT INTO public.words VALUES (813, 'date', 70, 1, 2, 'Дата');
INSERT INTO public.words VALUES (814, 'day', 70, 1, 2, 'День');
INSERT INTO public.words VALUES (815, 'December', 70, 1, 2, 'Декабрь');
INSERT INTO public.words VALUES (816, 'during', 70, 1, 8, 'Во время');
INSERT INTO public.words VALUES (817, 'early', 70, 1, 1, 'Рано');
INSERT INTO public.words VALUES (818, 'evening', 70, 1, 2, 'Вечер');
INSERT INTO public.words VALUES (819, 'February', 70, 1, 2, 'февраль');
INSERT INTO public.words VALUES (820, 'Friday', 70, 1, 2, 'пятница');
INSERT INTO public.words VALUES (821, 'half past one, two, etc.', 70, 1, 4, 'Половина первого, два и т. Д.');
INSERT INTO public.words VALUES (822, 'hour', 70, 1, 2, 'Час.');
INSERT INTO public.words VALUES (823, 'in', 70, 1, 8, 'В');
INSERT INTO public.words VALUES (824, 'in the morning', 70, 1, 4, 'The Pessimist');
INSERT INTO public.words VALUES (825, 'January', 70, 1, 2, 'январь');
INSERT INTO public.words VALUES (826, 'July', 70, 1, 2, 'Июль');
INSERT INTO public.words VALUES (827, 'June', 70, 1, 2, 'Июнь');
INSERT INTO public.words VALUES (828, 'justad', 70, 1, 3, 'Justad');
INSERT INTO public.words VALUES (829, 'last', 70, 1, 12, 'Последний');
INSERT INTO public.words VALUES (830, 'late', 70, 1, 1, 'Опоздание');
INSERT INTO public.words VALUES (831, 'latead', 70, 1, 3, 'Latead');
INSERT INTO public.words VALUES (832, 'March', 70, 1, 2, 'Березень');
INSERT INTO public.words VALUES (833, 'May', 70, 1, 2, 'Май');
INSERT INTO public.words VALUES (834, 'midnight', 70, 1, 2, 'полночь');
INSERT INTO public.words VALUES (835, 'minute', 70, 1, 2, 'Минут');
INSERT INTO public.words VALUES (836, 'moment', 70, 1, 2, 'Момент');
INSERT INTO public.words VALUES (837, 'Monday', 70, 1, 2, 'Понедельник');
INSERT INTO public.words VALUES (838, 'month', 70, 1, 2, 'Месяц');
INSERT INTO public.words VALUES (839, 'morning', 70, 1, 2, 'Утро');
INSERT INTO public.words VALUES (840, 'neverad', 70, 1, 3, 'Neverad');
INSERT INTO public.words VALUES (841, 'night', 70, 1, 2, 'Ночь');
INSERT INTO public.words VALUES (842, 'November', 70, 1, 2, 'Ноябрь');
INSERT INTO public.words VALUES (843, 'October', 70, 1, 2, 'октябрь');
INSERT INTO public.words VALUES (844, 'oftenad', 70, 1, 3, 'Oftenad');
INSERT INTO public.words VALUES (845, 'on', 70, 1, 8, 'Вкл');
INSERT INTO public.words VALUES (846, 'o’clockad', 70, 1, 3, 'O&#39;clockad');
INSERT INTO public.words VALUES (847, 'past', 70, 1, 3, 'Прошлое');
INSERT INTO public.words VALUES (848, 'period', 70, 1, 2, 'Точка');
INSERT INTO public.words VALUES (849, 'present', 70, 1, 1, 'Сейчас');
INSERT INTO public.words VALUES (850, 'quarter', 70, 1, 2, 'Квартал');
INSERT INTO public.words VALUES (851, 'Saturday', 70, 1, 2, 'Суббота');
INSERT INTO public.words VALUES (852, 'second', 70, 1, 2, 'Секунда');
INSERT INTO public.words VALUES (853, 'September', 70, 1, 2, 'сентябрь');
INSERT INTO public.words VALUES (854, 'sometimesad', 70, 1, 3, 'Sometimesad');
INSERT INTO public.words VALUES (855, 'spring', 70, 1, 2, 'Пружина');
INSERT INTO public.words VALUES (856, 'summer', 70, 1, 2, 'Лето');
INSERT INTO public.words VALUES (857, 'Sunday', 70, 1, 2, 'воскресенье');
INSERT INTO public.words VALUES (858, 'Thursday', 70, 1, 2, 'четверг');
INSERT INTO public.words VALUES (859, 'time', 70, 1, 2, 'Время');
INSERT INTO public.words VALUES (860, 'todayad', 70, 1, 3, 'Todayad');
INSERT INTO public.words VALUES (861, 'today', 70, 1, 2, 'Сегодня');
INSERT INTO public.words VALUES (862, 'tomorrowad', 70, 1, 3, 'Tomorrowad');
INSERT INTO public.words VALUES (863, 'tomorrow', 70, 1, 2, 'Завтра');
INSERT INTO public.words VALUES (864, 'tonight', 70, 1, 2, 'Tonight');
INSERT INTO public.words VALUES (865, 'Tuesday', 70, 1, 2, 'Вторник');
INSERT INTO public.words VALUES (866, 'usuallyad', 70, 1, 3, 'Usuallyad');
INSERT INTO public.words VALUES (867, 'Wednesday', 70, 1, 2, 'Среда');
INSERT INTO public.words VALUES (868, 'week', 70, 1, 1, 'Неделя');
INSERT INTO public.words VALUES (869, 'weekend', 70, 1, 2, 'Выходные');
INSERT INTO public.words VALUES (870, 'winter', 70, 1, 2, 'Зима');
INSERT INTO public.words VALUES (871, 'year', 70, 1, 2, 'Год');
INSERT INTO public.words VALUES (872, 'yesterdayad', 70, 1, 3, 'Yesterdayad');
INSERT INTO public.words VALUES (873, 'yesterday', 70, 1, 2, 'Вчера');
INSERT INTO public.words VALUES (874, 'apartment', 71, 1, 2, 'Квартира');
INSERT INTO public.words VALUES (875, 'beach', 71, 1, 2, 'Пляж');
INSERT INTO public.words VALUES (876, 'desk', 71, 1, 2, 'Пульт');
INSERT INTO public.words VALUES (877, 'holiday', 71, 1, 2, 'Отпуск');
INSERT INTO public.words VALUES (878, 'hotel', 71, 1, 2, 'Отели');
INSERT INTO public.words VALUES (879, 'journey', 71, 1, 2, 'Трансфер');
INSERT INTO public.words VALUES (880, 'passport', 71, 1, 2, 'Паспорт');
INSERT INTO public.words VALUES (881, 'pool', 71, 1, 2, 'Бассейн');
INSERT INTO public.words VALUES (882, 'room', 71, 1, 2, 'Номер');
INSERT INTO public.words VALUES (883, 'sea', 71, 1, 2, 'Море');
INSERT INTO public.words VALUES (884, 'stay', 71, 1, 3, 'Пребывание');
INSERT INTO public.words VALUES (885, 'tourist', 71, 1, 2, 'Направление:');
INSERT INTO public.words VALUES (886, 'trip', 71, 1, 2, 'Поездка');
INSERT INTO public.words VALUES (887, 'vacation', 71, 1, 2, 'отпуск');
INSERT INTO public.words VALUES (888, 'visitor', 71, 1, 2, 'Посетитель');
INSERT INTO public.words VALUES (889, 'airplane', 72, 1, 1, 'Самолёт');
INSERT INTO public.words VALUES (890, 'airport', 72, 1, 2, 'Аэропорт');
INSERT INTO public.words VALUES (891, 'flight', 72, 1, 2, 'Рейс');
INSERT INTO public.words VALUES (892, 'fly', 72, 1, 3, 'Полёт');
INSERT INTO public.words VALUES (893, 'passport', 72, 1, 2, 'Паспорт');
INSERT INTO public.words VALUES (894, 'plane', 72, 1, 1, 'Плоскость');
INSERT INTO public.words VALUES (895, 'sick', 72, 1, 1, 'Sick');
INSERT INTO public.words VALUES (896, 'bus', 73, 1, 2, 'Автобус');
INSERT INTO public.words VALUES (897, 'bus station', 73, 1, 2, 'Terminal bus');
INSERT INTO public.words VALUES (898, 'bus stop', 73, 1, 2, 'Halte bus');
INSERT INTO public.words VALUES (899, 'get', 73, 1, 3, 'Получайте');
INSERT INTO public.words VALUES (900, 'office', 73, 1, 2, 'Офис');
INSERT INTO public.words VALUES (901, 'station', 73, 1, 2, 'Станция');
INSERT INTO public.words VALUES (902, 'stop', 73, 1, 2, 'Хватит');
INSERT INTO public.words VALUES (903, 'take', 73, 1, 3, 'Доводят');
INSERT INTO public.words VALUES (904, 'ticket', 73, 1, 2, 'Билет');
INSERT INTO public.words VALUES (905, 'train', 73, 1, 2, 'Обучение');
INSERT INTO public.words VALUES (906, 'bicycle', 74, 1, 2, 'Велосипед');
INSERT INTO public.words VALUES (907, 'bike', 74, 1, 2, 'Байк');
INSERT INTO public.words VALUES (908, 'bus', 74, 1, 2, 'Автобус');
INSERT INTO public.words VALUES (909, 'car', 74, 1, 2, 'Машина');
INSERT INTO public.words VALUES (910, 'car park', 74, 1, 2, 'Car park');
INSERT INTO public.words VALUES (911, 'drive', 74, 1, 3, 'Drive');
INSERT INTO public.words VALUES (912, 'driver', 74, 1, 2, 'Привод');
INSERT INTO public.words VALUES (913, 'park', 74, 1, 3, 'Положение');
INSERT INTO public.words VALUES (914, 'ride', 74, 1, 3, 'Поездка');
INSERT INTO public.words VALUES (915, 'road', 74, 1, 2, 'Автодорога');
INSERT INTO public.words VALUES (916, 'stop', 74, 1, 3, 'Хватит');
INSERT INTO public.words VALUES (917, 'street', 74, 1, 2, 'Адрес');
INSERT INTO public.words VALUES (918, 'taxi', 74, 1, 2, 'Такси');
INSERT INTO public.words VALUES (919, 'traffic', 74, 1, 2, 'Трафик');
INSERT INTO public.words VALUES (920, 'turn', 74, 1, 3, 'Поворот');
INSERT INTO public.words VALUES (921, 'boat', 75, 1, 2, 'Лодка');
INSERT INTO public.words VALUES (922, 'radio', 75, 1, 2, 'Радиосвязь');
INSERT INTO public.words VALUES (923, 'sea', 75, 1, 2, 'Море');
INSERT INTO public.words VALUES (924, 'water', 75, 1, 2, 'Жидкость');
INSERT INTO public.words VALUES (925, 'business', 77, 1, 2, 'Компания');
INSERT INTO public.words VALUES (926, 'cost', 77, 1, 3, 'Стоимость');
INSERT INTO public.words VALUES (927, 'customer', 77, 1, 2, 'Клиент');
INSERT INTO public.words VALUES (928, 'meeting', 77, 1, 2, 'собрания');
INSERT INTO public.words VALUES (929, 'plan', 77, 1, 2, 'План');
INSERT INTO public.words VALUES (930, 'price', 77, 1, 2, 'Цена');
INSERT INTO public.words VALUES (931, 'product', 77, 1, 2, 'Продукт');
INSERT INTO public.words VALUES (932, 'sell', 77, 1, 2, 'Продажа');
INSERT INTO public.words VALUES (933, 'actor', 78, 1, 2, 'Актеры');
INSERT INTO public.words VALUES (934, 'actress', 78, 1, 2, 'Актриса');
INSERT INTO public.words VALUES (935, 'artist', 78, 1, 2, 'Исполнитель');
INSERT INTO public.words VALUES (936, 'dancer', 78, 1, 2, 'Натяжной валик');
INSERT INTO public.words VALUES (937, 'doctor', 78, 1, 2, 'Доктор');
INSERT INTO public.words VALUES (938, 'driver', 78, 1, 2, 'Привод');
INSERT INTO public.words VALUES (939, 'farmer', 78, 1, 2, 'Фермер');
INSERT INTO public.words VALUES (940, 'job', 78, 1, 2, 'Вакансию');
INSERT INTO public.words VALUES (941, 'nurse', 78, 1, 2, 'Медсестра');
INSERT INTO public.words VALUES (942, 'policeman', 78, 1, 2, 'Полицейский');
INSERT INTO public.words VALUES (943, 'policewoman', 78, 1, 2, 'Женщина полицейский');
INSERT INTO public.words VALUES (944, 'scientist', 78, 1, 2, 'Научный работник');
INSERT INTO public.words VALUES (945, 'singer', 78, 1, 2, 'Певец');
INSERT INTO public.words VALUES (946, 'teacher', 78, 1, 2, 'Учитель');
INSERT INTO public.words VALUES (947, 'waiter', 78, 1, 2, 'Официант');
INSERT INTO public.words VALUES (948, 'work', 78, 1, 3, 'Исполнитель');
INSERT INTO public.words VALUES (949, 'work', 78, 1, 2, 'Исполнитель');
INSERT INTO public.words VALUES (950, 'writer', 78, 1, 2, 'Писатель');
INSERT INTO public.words VALUES (951, 'bank', 79, 1, 2, 'Bank');
INSERT INTO public.words VALUES (952, 'banknote', 79, 1, 2, 'Банкнота');
INSERT INTO public.words VALUES (953, 'buy', 79, 1, 3, 'Купить');
INSERT INTO public.words VALUES (954, 'cent', 79, 1, 2, 'Цент');
INSERT INTO public.words VALUES (955, 'change', 79, 1, 3, 'Изменить');
INSERT INTO public.words VALUES (956, 'cheap', 79, 1, 1, 'Дешево');
INSERT INTO public.words VALUES (957, 'cost', 79, 1, 2, 'Стоимость');
INSERT INTO public.words VALUES (958, 'dollar', 79, 1, 2, 'Доллар');
INSERT INTO public.words VALUES (959, 'euro', 79, 1, 2, 'Евро');
INSERT INTO public.words VALUES (960, 'expensive', 79, 1, 1, 'Дорогой');
INSERT INTO public.words VALUES (961, 'give', 79, 1, 3, 'پرداخت کنید');
INSERT INTO public.words VALUES (962, 'grow', 79, 1, 3, 'Рост');
INSERT INTO public.words VALUES (963, 'lose', 79, 1, 3, 'Поражений');
INSERT INTO public.words VALUES (964, 'money', 79, 1, 2, 'Деньги');
INSERT INTO public.words VALUES (965, 'pay', 79, 1, 3, 'Оплатить');
INSERT INTO public.words VALUES (966, 'poor', 79, 1, 1, 'Плохое');
INSERT INTO public.words VALUES (967, 'pound', 79, 1, 2, 'Pound');
INSERT INTO public.words VALUES (968, 'price', 79, 1, 2, 'Цена');
INSERT INTO public.words VALUES (969, 'rich', 79, 1, 1, 'Богач');
INSERT INTO public.words VALUES (970, 'sell', 79, 1, 2, 'Продажа');
INSERT INTO public.words VALUES (971, 'spend', 79, 1, 3, 'Осталось');
INSERT INTO public.words VALUES (972, 'boring', 80, 1, 1, '讨厌的');
INSERT INTO public.words VALUES (973, 'break', 80, 1, 2, 'Разрыв');
INSERT INTO public.words VALUES (974, 'business', 80, 1, 2, 'Компания');
INSERT INTO public.words VALUES (975, 'career', 80, 1, 2, 'Карьера');
INSERT INTO public.words VALUES (976, 'dangerous', 80, 1, 1, 'Рискованный');
INSERT INTO public.words VALUES (977, 'desk', 80, 1, 2, 'Пульт');
INSERT INTO public.words VALUES (978, 'easy', 80, 1, 1, 'Легко');
INSERT INTO public.words VALUES (979, 'exciting', 80, 1, 1, 'Захватывающий');
INSERT INTO public.words VALUES (980, 'hard', 80, 1, 1, 'Трудный');
INSERT INTO public.words VALUES (981, 'interview', 80, 1, 2, 'Собеседования');
INSERT INTO public.words VALUES (982, 'interview', 80, 1, 3, 'Собеседования');
INSERT INTO public.words VALUES (983, 'job', 80, 1, 2, 'Вакансию');
INSERT INTO public.words VALUES (984, 'meet', 80, 1, 3, 'Соответствует');
INSERT INTO public.words VALUES (985, 'meeting', 80, 1, 2, 'собрания');
INSERT INTO public.words VALUES (986, 'office', 80, 1, 2, 'Офис');
INSERT INTO public.words VALUES (987, 'work', 80, 1, 3, 'Исполнитель');
INSERT INTO public.words VALUES (988, 'work', 80, 1, 2, 'Исполнитель');
INSERT INTO public.words VALUES (989, 'worker', 80, 1, 2, 'Работник');


--
-- Name: audios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audios_id_seq', 1, false);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_id_seq', 6, true);


--
-- Name: themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.themes_id_seq', 1, false);


--
-- Name: word_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.word_types_id_seq', 1, false);


--
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_id_seq', 1, false);


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
-- Name: themes themes_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_id_key UNIQUE (id);


--
-- Name: themes themes_theme_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_theme_key UNIQUE (theme);


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
-- Name: themes fk_audio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_audio FOREIGN KEY (audio_id) REFERENCES public.audios(id) ON DELETE RESTRICT;


--
-- Name: themes fk_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE RESTRICT;


--
-- Name: words fk_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT fk_level FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE RESTRICT;


--
-- Name: words fk_themes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT fk_themes FOREIGN KEY (theme_id) REFERENCES public.themes(id) ON DELETE RESTRICT;


--
-- Name: words fk_types; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT fk_types FOREIGN KEY (type_id) REFERENCES public.word_types(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

