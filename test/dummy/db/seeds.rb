u=User.create
u.name = 'Eddie Gonzales'
u.email = 'eddiemgonzales@gmail.com'
u.password = 'testing_old_sql_12345'
u.password_confirmation = 'testing_old_sql_12345'
u.old_sql_admin=true
u.save
