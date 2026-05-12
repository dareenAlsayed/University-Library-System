# 📚 Prolog Library Knowledge System

> A rule-based library management and querying system implemented in Prolog using logical inference and custom predicate construction.

This project models a university library environment containing students, books, borrowing records, topics, and ratings.  
The system answers complex queries using declarative programming techniques without relying on built-in predicates.

<br>

## 🧠 Core Functionality

The knowledge base supports logical queries related to:

- Borrowed books
- Book popularity
- Student ratings
- Topic analysis
- Reviewer evaluation
- Topic frequency inference

<br>

## 🔍 Implemented Predicates

| Predicate | Description |
|---|---|
| `books_borrowed_by_student` | Retrieves all books borrowed by a student |
| `borrowers_count` | Counts how many students borrowed a book |
| `most_borrowed_book` | Finds the most borrowed book |
| `ratings_of_book` | Returns all ratings for a book |
| `top_reviewer` | Finds the student with the highest rating |
| `most_common_topic_for_student` | Determines the most frequent topic across borrowed books |

<br>

## ⚙️ Features

- Logical rule-based querying
- Recursive predicate implementation
- Knowledge base traversal
- Topic frequency analysis
- Duplicate prevention
- Backtracking control using cuts (`!`)
- Custom list processing without built-in predicates

<br>

## 📂 Knowledge Base Structure

```prolog
student(Name, Year).
book(Title, Author).
borrowed(Student, Book).
topics(Book, TopicsList).
rating(Student, Book, Score).
```

<br>

## 💡 Example Queries

```prolog
?- books_borrowed_by_student(mona, L).

L = [prolog_fundamentals,
     recursion_in_depth,
     list_programming]
```

```prolog
?- most_borrowed_book(B).

B = recursion_in_depth
```

```prolog
?- most_common_topic_for_student(mona, Topic).

Topic = tracing
```

<br>

## 🛠️ Technologies

```text
Prolog
Logic Programming
Knowledge Representation
Recursive Predicates
Rule-Based Inference
```
