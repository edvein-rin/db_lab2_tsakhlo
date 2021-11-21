select trim(author.name), count(review.id) 
from author inner join review on author.id = review.id
group by author.name

select trim(review.name), count(ramen.id) from review inner join ramen
on review.id = ramen.id or review.id = ramen.id
group by review.name

select trim(author.name), count(ramen.id) 
from author inner join ramen on author.id = ramen.id
group by author.name