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

# Example Query
## Get all books in a series
```sql
SELECT title
FROM books
WHERE series_id = 1
ORDER BY series_order;

