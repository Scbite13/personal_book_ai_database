# personal_book_ai_database
A PostgreSQL database that tracks books, series order, tags, and reading history. Designed as the core backend for a future Book AI system with automated book ingestion and personalized recommendations.

# Features

- Fully normalized PostgreSQL schema  
- Structured tables for books, series, tags, and user reading history  
- Many‑to‑many tagging system for themes, tropes, tones, and genres  
- Series tracking with reading order  
- User book status (read, want to read, rating)  
- Clean relational design prepared for AI automation  

# Database Schema Overview

## **books**
Stores core metadata for each book:
- title  
- description  
- page_count  
- isbn  
- series_id  
- series_order  

## **series**
Normalized table for book series:
- id  
- name  

## **tags**
Custom taxonomy for themes, tropes, tones, and genres.

## **book_tags**
Many‑to‑many link between books and tags.

## **user_books**
Tracks user reading activity:
- status (read, want_to_read)  
- rating  
- notes  

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

# How to Run
- Install PostgreSQL
- Run schema.sql to create all tables
- Run seed.sql to insert initial data
- Use the example queries or build your own

# Roadmap
- Planned future development includes:
- API integration for automatic book metadata
- Natural‑language command processing
- Automated tagging using a custom taxonomy
- Series detection and auto‑linking
- Recommendation engine based on themes, tones, and reading history
- Full Book AI assistant for managing and exploring the library

# Skills Demonstrated
- SQL (DDL, DML, joins, constraints)
- Database normalization and relational modeling
- Metadata design for AI systems
- System architecture planning
- Automation‑ready schema design
