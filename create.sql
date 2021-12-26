-- Author
CREATE TABLE IF NOT EXISTS public.author
(
    id integer NOT NULL DEFAULT nextval('"Author_id_seq"'::regclass),
    name character(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Author_pkey" PRIMARY KEY (id)
)

-- Ramen
CREATE TABLE IF NOT EXISTS public.ramen
(
    id integer NOT NULL DEFAULT nextval('"Ramen_id_seq"'::regclass),
    name character(50) COLLATE pg_catalog."default" NOT NULL,
    style character(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Ramen_pkey" PRIMARY KEY (id)
)

-- Review
CREATE TABLE IF NOT EXISTS public.review
(
    id integer NOT NULL DEFAULT nextval('review_id_seq'::regclass),
    stars integer NOT NULL,
    author_id integer NOT NULL,
    ramen_id integer NOT NULL,
    CONSTRAINT review_pkey PRIMARY KEY (id),
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES public.author (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ramen_id FOREIGN KEY (ramen_id)
        REFERENCES public.ramen (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
