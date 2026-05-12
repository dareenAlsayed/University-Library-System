:- consult(library_data).

% Task 1:-
books_borrowed_by_student(Student,L):-
    collect_books(Student,[],L),
    !.

collect_books(Student,Visited,[Book|Remaining]):-
    borrowed(Student,Book),
    not_in(Book,Visited),
    !,
    collect_books(Student,[Book|Visited],Remaining).

collect_books(_,_,[]).

% Task 2:-
borrowers_count(Book,N):-
    build_list(Book,[],L),
    count(L,N).

build_list(Book,Visited,[Student|OtherStudents]):-
    borrowed(Student,Book),
    not_in(Student,Visited),
    !,
    build_list(Book,[Student|Visited],OtherStudents).

build_list(_,_,[]).

not_in(_,[]).
not_in(X,[H|T]):-
    X \= H,
    not_in(X,T).

count([],0).
count([_|T],N):-
    count(T,N1),
    N is N1+1.

% Task 3:-
most_borrowed_book(B):-
    book(B,_),
    borrowers_count(B,N),
    not((book(B2,_),borrowers_count(B2,N2),N2 > N)),
    !.

% Task 4:-
ratings_of_book(Book,L):-
    collect_ratings(Book,[],L),
    !.

collect_ratings(Book,Checked,[(Student,Score)|Remaining]):-
    rating(Student,Book,Score),
    not_in(Student,Checked),
    !,
    collect_ratings(Book,[Student|Checked],Remaining).
collect_ratings(_,_,[]).

% Task 5:-
top_reviewer(Student):-
    max_score(Max),
    rating(Student,_,Max),
    !.

max_score(Max):-
    rating(_,_,Max),
    not((rating(_,_,S),S > Max)).

% Task 6:-
most_common_topic_for_student(Student,no_common_topic):-
    books_borrowed_by_student(Student,Books),
    gather_topics(Books,Topics),
    all_once(Topics),
    !.
most_common_topic_for_student(Student,Topic):-
    books_borrowed_by_student(Student,Books),
    gather_topics(Books,Topics),
    find_most_common(Topics,Topic),
    !.
all_once([]).
all_once([H|T]):-
    topics_count(H,[H|T],1),
    all_once(T).
%Collect all topics of these books
gather_topics([],[]).
gather_topics([CurrentBook|OtherBooks],AllTopics):-
    topics(CurrentBook,BookTopics),
    gather_topics(OtherBooks,OtherTopics),
    combine(BookTopics,OtherTopics,AllTopics).

%Merge them into one big list
combine([],L,L).
combine([H|T],L,[H|R]):-
    combine(T,L,R).

%Find the most frequent topic
find_most_common([X],X).
find_most_common([H|T],Topic):-
    topics_count(H,[H|T],C1),
    find_most_common(T,Temp),
    topics_count(Temp,[H|T],C2),
     (C1 >= C2 -> Topic = H; Topic = Temp).

%Count occurences
topics_count(_,[],0).
topics_count(X,[X|T],N):-
    topics_count(X,T,N1),
    N is N1+1.
topics_count(X,[Y|T],N):-
    X \= Y,
    topics_count(X,T,N).
