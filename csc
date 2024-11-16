import random
from multiprocessing.managers import Value

letter_grade_to_gpa_dictionary = { 'A+': 4.0 , 'A': 4.0 , 'A-': 3.7,
                                   'B+': 3.3 , 'B': 3.0 , 'B-': 2.7,
                                   'C+': 2.3 , 'C': 2.0 , 'C-': 1.7,
                                   'D+': 1.3 , 'D': 1.0}

class Course:
    def __init__(self, name, credit_hours, letter_grade):
        self.name = name
        self.credit_hours = credit_hours
        self.letter_grade = letter_grade

    def __str__(self):
        course_gpa = letter_grade_to_gpa_dictionary.get(self.letter_grade.upper(), 0.0)
        return f'{self.name}, {self.credit_hours} Credits, Grade: {self.letter_grade}. GPA: {course_gpa:.1f}'
    

class Student:
    def __init__(self, full_name, email, major, student_id):
        self.full_name = full_name
        self.email = email
        self.major = major
        self.id = student_id
        self.courses = []

    def add_course(self, course):
        if isinstance(course, Course):
            self.courses.append(course)
        else:
            print("The provided object is not a Course")


    def calculate_final_gpa(self):
        total_credit_hours = 0
        total_quality_points = 0

        for course in self.courses:
            course_gpa = letter_grade_to_gpa_dictionary.get(course.letter_grade.upper(), 0.0)
            quality_points = course_gpa * course.credit_hours
            total_quality_points += quality_points
            total_credit_hours += course.credit_hours

        if total_credit_hours == 0:
            return 0.0

        overall_gpa = total_quality_points /total_credit_hours

        return overall_gpa

    def print_transcript(self):
        final_gpa = self.calculate_final_gpa()
        file_name = f'{self.full_name.replace(" ", "_")}.txt'

        with open(file_name, 'w') as file:
            file.write(f"Student Transcript for {self.full_name}\n")
            file.write(f"Student ID: {self.id}\n")
            file.write(f"Major: {self.major}\n")
            file.write(f"Email: {self.email}\n\n")

            file.write("Course Information:\n")

            for course in self.courses:
                file.write(str(course) + "\n")

            file.write(f"\nFinal GPA: {final_gpa:.2f}\n")

        print("-" * 50)
        print(f"Student Transcript for {self.full_name}")
        print("-" * 50)
        print(f"Student ID: {self.id}")
        print(f"Major: {self.major}")
        print(f"Email: {self.email}\n")
        print("Courses:")

        for course in self.courses:
            print(course)

        print(f"\nFinal GPA: {final_gpa:.2f}")

        print("-" * 50)
        print(f'{self.full_name} TRANSCRIPT COMPLETED')
        print("-" * 50)


def student_record():
    try:
        student_information = input("Enter Full Name, Email, Major, ID: ")
        full_name, email, major, student_id = [x.strip() for x in student_information.split(',')]

        if not full_name or not email or not major or not student_id:
            raise ValueError ("Provide all fields (Full Name, Email, Major, and Student ID).")

    except ValueError as error:
        print(f'Invalid student information: {error}')
        print('Restarting program.')
        return

    my_student = Student(full_name, email, major, student_id)

    number_of_courses = input("How many courses do you want to add (2-6): ")
    while (not number_of_courses.isdigit() or int(number_of_courses) < 2 or int(number_of_courses) > 6):
        number_of_courses = input("Invalid input. How many courses do you want to add (2-6):")

    number_of_courses = int(number_of_courses)

    for courses in range(number_of_courses ):
        print(f"For course {courses + 1}:")

        try:
            input_string = input("Enter course name, credit hours, and letter grade (Separated by commas): ")
            name, credit_hours, letter_grade = [x.strip() for x in input_string.split(',')]

            if not name or not letter_grade or not credit_hours:
                raise ValueError("Must include course name, credit hours, and letter grade.")

            credit_hours = int(credit_hours)

            if credit_hours <=0:
                raise ValueError("Error. Credit hours must be a positive number.")

            if letter_grade not in letter_grade_to_gpa_dictionary:
                raise ValueError("Invalid letter grade. Please enter a valid letter grade")

            course = Course(name, credit_hours, letter_grade)
            my_student.add_course(course)

        except ValueError as error:
            print(f"Invalid course input:{error}")
            continue

    my_student.print_transcript()

def lottery_number_generator ():
    return

def pig_latin():
    return

def rock_paper_scissors():
    return

def main():
    menu = ("Welcome to the CSC115 final project.\n"
                 "Enter 1 to Student Record \n"
                 "Enter 2 for Lotter Number Generator \n"
                 "Enter 3 for Pig Latin \n"
                 "Enter 4 for Rock, Paper, Scissors \n")

    print(menu)
    input_choice = input("Enter menu option 1,2,3,4, or 9 to exit: ")

    while (input_choice != "9"):
        #If option 1, display student record
        if (input_choice == "1"):
            student_record()
        #If option 2, generate random lottery number
        elif (input_choice == "2"):
            lottery_number_generator()
        #If option 3, read pig latin
        elif (input_choice == "3"):
            pig_latin()
        #If option 4, execute rock paper scissors game
        elif (input_choice == "4"):
            rock_paper_scissors()
        #If an invalid option is entered, re-enter input.
        else:
            print(f"User select option: {input_choice} which is an INVALID option. Please re-enter:")

        #Display the menu again and ask for new input.
        print("-" * 50)
        print(menu)
        input_choice = input("Enter your choice: ")

    #Exit program once option 9 is elected.
    print("User selection option 9: which is an Exit Program."
      "\nCSC115- Final Project Ended."
      "\nHope you enjoy this Python program."
      "\nGoodbye.")
    print("*" * 50)



if __name__ == '__main__':
    main()
