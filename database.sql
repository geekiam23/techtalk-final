--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO will_larry;

--
-- Name: following_relationships; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE following_relationships (
    id integer NOT NULL,
    follower_id integer,
    followed_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE following_relationships OWNER TO will_larry;

--
-- Name: following_relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE following_relationships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE following_relationships_id_seq OWNER TO will_larry;

--
-- Name: following_relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE following_relationships_id_seq OWNED BY following_relationships.id;


--
-- Name: guests; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE guests (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE guests OWNER TO will_larry;

--
-- Name: guests_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE guests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE guests_id_seq OWNER TO will_larry;

--
-- Name: guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE guests_id_seq OWNED BY guests.id;


--
-- Name: job_posts; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE job_posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    body text NOT NULL,
    link character varying NOT NULL,
    salary integer,
    location character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying DEFAULT 'JobPost'::character varying
);


ALTER TABLE job_posts OWNER TO will_larry;

--
-- Name: job_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE job_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE job_posts_id_seq OWNER TO will_larry;

--
-- Name: job_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE job_posts_id_seq OWNED BY job_posts.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE likes (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE likes OWNER TO will_larry;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE likes_id_seq OWNER TO will_larry;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: meeting_posts; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE meeting_posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    body text NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying DEFAULT 'MeetingPost'::character varying
);


ALTER TABLE meeting_posts OWNER TO will_larry;

--
-- Name: meeting_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE meeting_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meeting_posts_id_seq OWNER TO will_larry;

--
-- Name: meeting_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE meeting_posts_id_seq OWNED BY meeting_posts.id;


--
-- Name: pic_posts; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE pic_posts (
    id integer NOT NULL,
    image_file_name character varying NOT NULL,
    image_content_type character varying NOT NULL,
    image_file_size integer NOT NULL,
    image_updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying DEFAULT 'PicPost'::character varying
);


ALTER TABLE pic_posts OWNER TO will_larry;

--
-- Name: pic_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE pic_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pic_posts_id_seq OWNER TO will_larry;

--
-- Name: pic_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE pic_posts_id_seq OWNED BY pic_posts.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE posts (
    id integer NOT NULL,
    content_type character varying,
    content_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE posts OWNER TO will_larry;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO will_larry;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: project_posts; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE project_posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    body text NOT NULL,
    link character varying,
    repo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying DEFAULT 'ProjectPost'::character varying
);


ALTER TABLE project_posts OWNER TO will_larry;

--
-- Name: project_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE project_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_posts_id_seq OWNER TO will_larry;

--
-- Name: project_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE project_posts_id_seq OWNED BY project_posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO will_larry;

--
-- Name: text_posts; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE text_posts (
    id integer NOT NULL,
    body character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying DEFAULT 'TextPost'::character varying
);


ALTER TABLE text_posts OWNER TO will_larry;

--
-- Name: text_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE text_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE text_posts_id_seq OWNER TO will_larry;

--
-- Name: text_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE text_posts_id_seq OWNED BY text_posts.id;


--
-- Name: timelines; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE timelines (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE timelines OWNER TO will_larry;

--
-- Name: timelines_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE timelines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE timelines_id_seq OWNER TO will_larry;

--
-- Name: timelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE timelines_id_seq OWNED BY timelines.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: will_larry
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    followed_users_count integer DEFAULT 0 NOT NULL,
    followers_count integer DEFAULT 0 NOT NULL,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    uid character varying DEFAULT ''::character varying NOT NULL,
    tokens text
);


ALTER TABLE users OWNER TO will_larry;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: will_larry
--

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO will_larry;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: will_larry
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: following_relationships id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY following_relationships ALTER COLUMN id SET DEFAULT nextval('following_relationships_id_seq'::regclass);


--
-- Name: guests id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY guests ALTER COLUMN id SET DEFAULT nextval('guests_id_seq'::regclass);


--
-- Name: job_posts id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY job_posts ALTER COLUMN id SET DEFAULT nextval('job_posts_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: meeting_posts id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY meeting_posts ALTER COLUMN id SET DEFAULT nextval('meeting_posts_id_seq'::regclass);


--
-- Name: pic_posts id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY pic_posts ALTER COLUMN id SET DEFAULT nextval('pic_posts_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: project_posts id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY project_posts ALTER COLUMN id SET DEFAULT nextval('project_posts_id_seq'::regclass);


--
-- Name: text_posts id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY text_posts ALTER COLUMN id SET DEFAULT nextval('text_posts_id_seq'::regclass);


--
-- Name: timelines id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY timelines ALTER COLUMN id SET DEFAULT nextval('timelines_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-03-20 22:36:32.962977	2018-03-20 22:36:32.962977
\.


--
-- Data for Name: following_relationships; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY following_relationships (id, follower_id, followed_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: guests; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY guests (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job_posts; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY job_posts (id, title, body, link, salary, location, created_at, updated_at, content_type) FROM stdin;
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY likes (id, user_id, post_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: meeting_posts; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY meeting_posts (id, title, body, date, "time", created_at, updated_at, content_type) FROM stdin;
\.


--
-- Data for Name: pic_posts; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY pic_posts (id, image_file_name, image_content_type, image_file_size, image_updated_at, created_at, updated_at, content_type) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY posts (id, content_type, content_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: project_posts; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY project_posts (id, title, body, link, repo, created_at, updated_at, content_type) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY schema_migrations (version) FROM stdin;
20180320222932
20180312140518
20180310154420
20180310041423
20180310035005
20180320165731
20180310043940
20180310165927
20180310050324
20180310182055
20180310181230
20180310180053
20180310151142
20180312142346
20180320220103
20180310055102
20180312142318
20180312142337
20180312142329
20180310051454
\.


--
-- Data for Name: text_posts; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY text_posts (id, body, created_at, updated_at, content_type) FROM stdin;
\.


--
-- Data for Name: timelines; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY timelines (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: will_larry
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, username, followed_users_count, followers_count, provider, uid, tokens) FROM stdin;
\.


--
-- Name: following_relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('following_relationships_id_seq', 1, false);


--
-- Name: guests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('guests_id_seq', 1, false);


--
-- Name: job_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('job_posts_id_seq', 1, false);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('likes_id_seq', 1, false);


--
-- Name: meeting_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('meeting_posts_id_seq', 1, false);


--
-- Name: pic_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('pic_posts_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Name: project_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('project_posts_id_seq', 1, false);


--
-- Name: text_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('text_posts_id_seq', 1, false);


--
-- Name: timelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('timelines_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: will_larry
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: following_relationships following_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY following_relationships
    ADD CONSTRAINT following_relationships_pkey PRIMARY KEY (id);


--
-- Name: guests guests_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY guests
    ADD CONSTRAINT guests_pkey PRIMARY KEY (id);


--
-- Name: job_posts job_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY job_posts
    ADD CONSTRAINT job_posts_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: meeting_posts meeting_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY meeting_posts
    ADD CONSTRAINT meeting_posts_pkey PRIMARY KEY (id);


--
-- Name: pic_posts pic_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY pic_posts
    ADD CONSTRAINT pic_posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: project_posts project_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY project_posts
    ADD CONSTRAINT project_posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: text_posts text_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY text_posts
    ADD CONSTRAINT text_posts_pkey PRIMARY KEY (id);


--
-- Name: timelines timelines_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY timelines
    ADD CONSTRAINT timelines_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_following_relationships_on_followed_user_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE INDEX index_following_relationships_on_followed_user_id ON following_relationships USING btree (followed_user_id);


--
-- Name: index_following_relationships_on_follower_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE INDEX index_following_relationships_on_follower_id ON following_relationships USING btree (follower_id);


--
-- Name: index_likes_on_post_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE INDEX index_likes_on_post_id ON likes USING btree (post_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE INDEX index_likes_on_user_id ON likes USING btree (user_id);


--
-- Name: index_likes_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE UNIQUE INDEX index_likes_on_user_id_and_post_id ON likes USING btree (user_id, post_id);


--
-- Name: index_posts_on_content_type_and_content_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE INDEX index_posts_on_content_type_and_content_id ON posts USING btree (content_type, content_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE INDEX index_posts_on_user_id ON posts USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_uid_and_provider; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE UNIQUE INDEX index_users_on_uid_and_provider ON users USING btree (uid, provider);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: will_larry
--

CREATE UNIQUE INDEX index_users_on_username ON users USING btree (username);


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: likes fk_rails_87a8aac469; Type: FK CONSTRAINT; Schema: public; Owner: will_larry
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT fk_rails_87a8aac469 FOREIGN KEY (post_id) REFERENCES posts(id);


--
-- PostgreSQL database dump complete
--

