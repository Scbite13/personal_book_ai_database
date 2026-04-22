## Example Queries

```markdown
```sql
-- Get all books in a series
SELECT title
FROM books
WHERE series_id = 1
ORDER BY series_order;

-- Get all books with a specific tag
SELECT b.title
FROM books b
JOIN book_tags bt ON b.id = bt.book_id
JOIN tags t ON t.id = bt.tag_id
WHERE t.name = 'trauma';

-- Get user reading history
SELECT b.title, ub.status, ub.rating
FROM user_books ub
JOIN books b ON ub.book_id = b.id
WHERE ub.user_id = 1
ORDER BY b.id;
```