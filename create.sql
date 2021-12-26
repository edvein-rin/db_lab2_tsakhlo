-- Author
CREATE TABLE author
(
    id      integer         UNIQUE NOT NULL,
    name    character(50)   NULL,
    CONSTRAINT "Author_pkey" PRIMARY KEY (id)
)

-- Ramen
CREATE TABLE ramen
(
    id      integer         UNIQUE NOT NULL,
    name    character(50)   NULL,
    style   character(50)   NULL,
    CONSTRAINT "Ramen_pkey" PRIMARY KEY (id)
)

-- Review
CREATE TABLE review
(
    id          integer         UNIQUE NOT NULL,
    stars       integer         NOT NULL,
    author_id   integer         NOT NULL,
    ramen_id    integer         NOT NULL,
    CONSTRAINT review_pkey PRIMARY KEY (id),
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES author (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT ramen_id FOREIGN KEY (ramen_id)
        REFERENCES ramen (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
