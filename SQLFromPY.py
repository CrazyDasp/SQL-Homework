import psycopg2

def create(conn):
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client_info (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        second_name VARCHAR(50) NOT NULL,
        email VARCHAR(60) NOT NULL
        )
        """)

        cur.execute("""
        CREATE TABLE IF NOT EXISTS phone (
        id SERIAL PRIMARY KEY,
        number VARCHAR(20) UNIQUE,
        client_info_id INT,
        FOREIGN KEY (client_info_id) REFERENCES client_info(id)    
        )
        """)
        conn.commit()
    pass

def add_client(name, second_name, email):
    with conn.cursor() as cur:
        cur.execute("""
        INSERT INTO client_info(name, second_name, email)
        VALUES (%s, %s, %s);
        """, (name, second_name, email))
        conn.commit()
    pass

def add_number(client_info_id, numbers):   
    with conn.cursor() as cur:
        cur.execute("""
        SELECT id FROM client_info
        WHERE id = %s
        """, (client_info_id, ))
        check_client = cur.fetchone()

        if check_client:
            if type(numbers) == list:
                for number in numbers:
                    cur.execute("""
                    INSERT INTO phone (client_info_id, number)
                    VALUES (%s, %s)            
                    """, (client_info_id, number))
                    conn.commit()
            else:
                cur.execute("""
                INSERT INTO phone (client_info_id, number)
                VALUES (%s, %s)            
                """, (client_info_id, numbers))
                conn.commit()
        else:
            print(f'Клиент с id {client_info_id} не найден!')
    pass

def change_info(client_id, name, second_name, email):
    with conn.cursor() as cur:
        cur.execute("""
        UPDATE client_info
        SET name = %s, second_name = %s, email = %s
        WHERE id = %s
        """, (name, second_name, email, client_id))
        conn.commit()
    pass

def delete_phone(phone_id):
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM phone
        WHERE id = %s
        """, (phone_id,))
        conn.commit()
    pass

def delete_client(client_id):
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM phone
        WHERE client_info_id = %s
        """, (client_id,))

        cur.execute("""
        DELETE FROM client_info
        WHERE id = %s
        """, (client_id,))
        conn.commit()
    pass

def find_client(word):
    with conn.cursor() as cur:
        cur.execute("""
        SELECT * FROM client_info
        WHERE name LIKE %s OR second_name LIKE %s OR email LIKE %s
        """, (f'%{word}%', f'%{word}%', f'%{word}%'))
        result = cur.fetchall()
    return result



conn = psycopg2.connect(database='SQLPy', user='postgres', password='postgres')

name = 'Питер'
second_name = 'Паркер'
email = 'SpiderMan@dbugle.com'
numbers = [89650122334, 89219876543]

create(conn)

add_client(name, second_name, email)
add_number(1, numbers)
print(find_client('Питер'))

change_info(1, 'Майлз', 'Моралез', 'NewSpiderMan@dbugle.com')
print(find_client('Майлз'))

delete_phone(1)
print(find_client('Майлз'))

delete_client(1)
print(find_client('Майлз'))