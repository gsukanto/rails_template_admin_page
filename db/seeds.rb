User.create(email: 'gregory.sukanto@gmail.com', password: 'sudahlupa') unless User.find_by_email('gregory.sukanto@gmail.com')
Role.create(name: 'admin') unless Role.find_by_name('admin')
User.find_by_email('gregory.sukanto@gmail.com').add_role('admin')