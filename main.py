import mysql.connector
import tkinter as tk
from tkinter import ttk
import tkinter.messagebox as messagebox

mydb = mysql.connector.connect(host="localhost", user="root", passwd="Specialized0-", database="students_management")

mycursor = mydb.cursor()
mycursor.execute("CREATE TABLE IF NOT EXISTS students_info(Student_no int(9),Name char(45),Age int(2),Email varchar(45),Phone int(11))")
mydb.commit()

def add_student():
    def save_student():
        var1 = sch_entry.get()
        var2 = name_entry.get()
        var3 = age_entry.get()
        var4 = email_entry.get()
        var5 = phone_entry.get()

        mycursor.execute("SELECT Student_no FROM students_info WHERE Student_no = %s", (var1,))
        existing_record = mycursor.fetchone()
        if existing_record:
            messagebox.showerror("Error", "School number already exists!")
            return

        mycursor.execute(
            "INSERT INTO students_info VALUES (%s, %s, %s, %s, %s)",
            (var1, var2, var3, var4, var5)
        )
        mydb.commit()
        messagebox.showinfo("Success", "Data saved successfully!")
        clear_entries()
        close_window()
        add_student()

    def clear_entries():
        sch_entry.delete(0, tk.END)
        name_entry.delete(0, tk.END)
        age_entry.delete(0, tk.END)
        email_entry.delete(0, tk.END)
        phone_entry.delete(0, tk.END)

    def close_window():
        add_window.destroy()

    add_window = tk.Toplevel(root)
    add_window.title("Add Student")
    add_window.geometry("400x245")

    sch_label = tk.Label(add_window, text="Student No:")
    sch_label.pack()
    sch_entry = tk.Entry(add_window)
    sch_entry.pack()

    name_label = tk.Label(add_window, text="Name:")
    name_label.pack()
    name_entry = tk.Entry(add_window)
    name_entry.pack()

    age_label = tk.Label(add_window, text="Age:")
    age_label.pack()
    age_entry = tk.Entry(add_window)
    age_entry.pack()

    email_label = tk.Label(add_window, text="Email:")
    email_label.pack()
    email_entry = tk.Entry(add_window)
    email_entry.pack()

    phone_label = tk.Label(add_window, text="Phone:")
    phone_label.pack()
    phone_entry = tk.Entry(add_window)
    phone_entry.pack()

    save_button = tk.Button(add_window, text="Save", command=save_student)
    save_button.place(x=155, y=210)

    back_button = tk.Button(add_window, text="Back", command=close_window)
    back_button.place(x=205, y=210)

def view_students():
    view_window = tk.Toplevel(root)
    view_window.title("View Students")
    view_window.geometry("1025x260")

    mycursor.execute("SELECT * FROM students_info")
    result = mycursor.fetchall()

    table_frame = tk.Frame(view_window)
    table_frame.pack()

    table = ttk.Treeview(table_frame, columns=('Student_no', 'Name', 'Age', 'Email', 'Phone'), show='headings')

    table.heading('Student_no', text='Student No')
    table.heading('Name', text='Name')
    table.heading('Age', text='Age')
    table.heading('Email', text='Email')
    table.heading('Phone', text='Phone')

    for row in result:
        table.insert('', 'end', values=row)

    def edit_record():
        selected_item = table.focus()
        if selected_item:
            item_values = table.item(selected_item)['values']
            student_no = item_values[0]

            edit_window = tk.Toplevel(view_window)
            edit_window.title("Edit Record")
            edit_window.geometry("400x245")

            def update_record():
                var1 = sch_entry.get()
                var2 = name_entry.get()
                var3 = age_entry.get()
                var4 = email_entry.get()
                var5 = phone_entry.get()

                mycursor.execute("SELECT * FROM students_info WHERE Student_no = %s", (var1,))
                existing_record = mycursor.fetchone()
                if existing_record and existing_record[0] != student_no:
                    messagebox.showerror("Error", "Student number already exists!")
                    return

                mycursor.execute(
                    "UPDATE students_info SET Student_no = %s, Name = %s, Age = %s, Email = %s, Phone = %s WHERE Student_no = %s",
                    (var1, var2, var3, var4, var5, student_no))
                mydb.commit()
                messagebox.showinfo("Success", "Record updated successfully!")
                edit_window.destroy()
                view_window.destroy()
                view_students()

            sch_label = tk.Label(edit_window, text="Student No:")
            sch_label.pack()
            sch_entry = tk.Entry(edit_window)
            sch_entry.insert(tk.END, item_values[0])
            sch_entry.pack()

            name_label = tk.Label(edit_window, text="Name:")
            name_label.pack()
            name_entry = tk.Entry(edit_window)
            name_entry.insert(tk.END, item_values[1])
            name_entry.pack()

            age_label = tk.Label(edit_window, text="Age:")
            age_label.pack()
            age_entry = tk.Entry(edit_window)
            age_entry.insert(tk.END, item_values[2])
            age_entry.pack()

            email_label = tk.Label(edit_window, text="Email:")
            email_label.pack()
            email_entry = tk.Entry(edit_window)
            email_entry.insert(tk.END, item_values[3])
            email_entry.pack()

            phone_label = tk.Label(edit_window, text="Phone:")
            phone_label.pack()
            phone_entry = tk.Entry(edit_window)
            phone_entry.insert(tk.END, item_values[4])
            phone_entry.pack()

            update_button = tk.Button(edit_window, text="Update", command=update_record)
            update_button.place(x=145, y=210)

            cancel_button = tk.Button(edit_window, text="Cancel", command=edit_window.destroy)
            cancel_button.place(x=205, y=210)

    edit_button = tk.Button(view_window, text="Edit Record", command=edit_record)
    edit_button.place(x=380, y=230)

    table.pack(side='left', fill='y')

    scrollbar = ttk.Scrollbar(table_frame, orient="vertical", command=table.yview)
    scrollbar.pack(side='right', fill='y')
    table.configure(yscrollcommand=scrollbar.set)

    def close_window():
        view_window.destroy()

    back_button = tk.Button(view_window, text="Back", command=close_window)
    back_button.place(x=553,y=230)

    def delete_record():
        selected_item = table.focus()
        if selected_item:
            item_values = table.item(selected_item)['values']
            student_no = item_values[0]
            mycursor.execute("DELETE FROM students_info WHERE Student_no = %s", (student_no,))
            mydb.commit()
            print("Record deleted successfully!")
            table.delete(selected_item)
        else:
            print("No record selected.")

    delete_button = tk.Button(view_window, text="Delete Record", command=delete_record)
    delete_button.place(x=460,y=230)

root = tk.Tk()
root.title("Student Management System")

background_image = tk.PhotoImage(file="svbldg.png")
background_label = tk.Label(root, image=background_image)
background_label.place(x=0, y=0, relwidth=1, relheight=1)

root.geometry(f"{background_image.width()}x{background_image.height()}")

def display_menu():
    menu_label = tk.Label(root, text="Adamson University Student Management System", font=("Arial", 14, "bold"))
    menu_label.place(x=180, y=10)

    add_button = tk.Button(root, text="Add New Student", command=add_student)
    add_button.place(x=340, y=250)

    view_button = tk.Button(root, text="View Students", command=view_students)
    view_button.place(x=350, y=285)

    quit_button = tk.Button(root, text="Quit", command=root.quit)
    quit_button.place(x=375, y=320)

display_menu()
root.mainloop()


