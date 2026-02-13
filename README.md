ACTIVITY NO. 1 MATLAB Programming
Exercise 1.1
Cases and Deaths for the period from October 1, 2021, to January 12, 2022.
(a)	Use the Create an automated geobubble plot and animation of COVID-19 Daily New dataset provided in the following link: https://1drv.ms/x/c/3A97EEDCC1E56AEC/IQDKLubmrPpHTodb6qyLTMIGAU6Qd-rrXbbGnJqJIGyK0Jw?e=onGohq
(b)	Generate a geobubble plot where:
•	The size of the bubbles represents the number of daily new cases.
•	The color intensity represents the number of daily deaths.
(c)	Create an animation over the specified date range to visualize the trendof daily cases and deaths over time.

Exercise 1.2
Develop well-structured programs to:
(a)	Compute the Euclidean norm of each row of a two-dimensional array A of size 12 × 10 (i.e., 12 rows and 10 columns) and store the results in a vector.
(b)	Normalize each row by dividing its elements by the row norm so that the Euclidean norm of every row becomes 1.
(c)	Compute the maximum absolute value of each column of the normalized matrix.
(d)	Conditionally scale each column by dividing all its elements by the column maximum if the maximum is greater than 0.8; leave it unchanged otherwise.
(e)	Compute a weighted sum of the resulting matrix by multiplying each column by a given weight vector of size 10 × 1 and summing the results to produce a single output vector of size 12 × 1.
Excercise 1.3
Piecewise functions are often used when a single equation cannot fully describe a phenomenon. For example, the temperature of a chemical reactor over time might be modeled as:
5t2 + 20,
100 − 2t,
T(t) =	50 + 3(t − 16)2,
800, e−0.1(t−24),	0 ≤ t ≤ 8,
8 < t ≤ 16, 16 < t ≤ 24, t > 24, otherwise.
(a)	Develop a well-structured function to compute T as a function of t.
(b)	Use this function to generate a table of T versus t for t = 0 to 30 at increments of 0.5.
(c)	Plot T versus t to visualize the temperature profile of the reactor.
