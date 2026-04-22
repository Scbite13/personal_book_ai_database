-- Table: public.authors

-- DROP TABLE IF EXISTS public.authors;

CREATE TABLE IF NOT EXISTS public.authors
(
    id integer NOT NULL DEFAULT nextval('authors_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    country text COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    CONSTRAINT authors_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.authors
    OWNER to postgres;

-- Table: public.book_tags

-- DROP TABLE IF EXISTS public.book_tags;

CREATE TABLE IF NOT EXISTS public.book_tags
(
    book_id integer NOT NULL,
    tag_id integer NOT NULL,
    CONSTRAINT book_tags_pkey PRIMARY KEY (book_id, tag_id),
    CONSTRAINT book_tags_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT book_tags_tag_id_fkey FOREIGN KEY (tag_id)
        REFERENCES public.tags (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.book_tags
    OWNER to postgres;

-- Table: public.books

-- DROP TABLE IF EXISTS public.books;

CREATE TABLE IF NOT EXISTS public.books
(
    id integer NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    title text COLLATE pg_catalog."default" NOT NULL,
    subtitle text COLLATE pg_catalog."default",
    author_id integer,
    published_year integer,
    description text COLLATE pg_catalog."default",
    page_count integer,
    series_name text COLLATE pg_catalog."default",
    series_order integer,
    isbn text COLLATE pg_catalog."default",
    cover_url text COLLATE pg_catalog."default",
    series_id integer,
    CONSTRAINT books_pkey PRIMARY KEY (id),
    CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id)
        REFERENCES public.authors (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE SET NULL,
    CONSTRAINT books_series_id_fkey FOREIGN KEY (series_id)
        REFERENCES public.series (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.books
    OWNER to postgres;

-- Table: public.series

-- DROP TABLE IF EXISTS public.series;

CREATE TABLE IF NOT EXISTS public.series
(
    id integer NOT NULL DEFAULT nextval('series_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT series_pkey PRIMARY KEY (id),
    CONSTRAINT series_name_key UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.series
    OWNER to postgres;

-- Table: public.tags

-- DROP TABLE IF EXISTS public.tags;

CREATE TABLE IF NOT EXISTS public.tags
(
    id integer NOT NULL DEFAULT nextval('tags_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    type text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tags_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tags
    OWNER to postgres;

-- Table: public.user_books

-- DROP TABLE IF EXISTS public.user_books;

CREATE TABLE IF NOT EXISTS public.user_books
(
    id integer NOT NULL DEFAULT nextval('user_books_id_seq'::regclass),
    user_id integer,
    book_id integer,
    status text COLLATE pg_catalog."default" NOT NULL,
    rating numeric(2,1),
    started_at date,
    finished_at date,
    notes text COLLATE pg_catalog."default",
    CONSTRAINT user_books_pkey PRIMARY KEY (id),
    CONSTRAINT user_books_user_book_unique UNIQUE (user_id, book_id),
    CONSTRAINT user_books_book_id_fkey FOREIGN KEY (book_id)
        REFERENCES public.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT user_books_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_books
    OWNER to postgres;

-- Table: public.user_preferences

-- DROP TABLE IF EXISTS public.user_preferences;

CREATE TABLE IF NOT EXISTS public.user_preferences
(
    id integer NOT NULL DEFAULT nextval('user_preferences_id_seq'::regclass),
    user_id integer,
    tag_id integer,
    preference_score numeric(4,3),
    source text COLLATE pg_catalog."default",
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT user_preferences_pkey PRIMARY KEY (id),
    CONSTRAINT user_preferences_tag_id_fkey FOREIGN KEY (tag_id)
        REFERENCES public.tags (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT user_preferences_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_preferences
    OWNER to postgres;

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;