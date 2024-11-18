Create view CartSummary as 
select 
	c.CartID,
	c.UserID,
	c.CreatedAt as CartCreatedAt,
	c.UpdatedAt as CartUpdatedAt,
	ci.ProductID,
	ci.BrandID,
	p.name as ProductName,
	ci.Quantity as CartQuantity,
	b.Name as BrandName
from
	Cart c
join
	CartItem ci on c.CartID = ci.CartID
join
	Product p ON ci.ProductID = p.ProductID and ci.BrandID = p.BrandID
join
	Brand b on p.BrandID = b.BrandID;

select * from CartSummary;