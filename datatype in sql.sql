🆚 Quick Side-by-Side Comparison
Feature	           CHAR          	       VARCHAR	                 TEXT
Storage	          Fixed size               Variable	                Large external storage
Speed	          Fastest	                Fast	                Slowest
Max Length	          255	                 65,535	                 Up to 4GB (LONGTEXT)
Default Value	     Yes	                     Yes	                 ❌ No
Indexing	         Fast	                    Fast	             Slow (prefix needed)
Use Case	       Fixed data	                Variable data	         Large text

Datatype in MySQL defines what kind of data a column can store
Common MySQL Datatype




'12345' → number stored as text
'A@1#' → text with special characters
'91-98765-43210' → phone number (best as VARCHAR)

CHAR(10)  max 255
CHAR stores character data with a fixed length; it always uses the defined size, even if the value is shorter.
Always uses 10 bytes, even if you store only "abc"


VARCHAR(50) VARCHAR stores text data with variable length, max=65,535 
VARCHAR is good when the length varies

'Ravi' → uses 4 characters
'Alexandra' → uses 10 characters
 Space is not wasted, unlike CHAR


CHAR is good when the number length is fixed 
Use CHAR only when all values have the same length (e.g., country code, gender,pin,year,product code like "A111",otp).

Use VARCHAR for most normal strings (name, email, address,phoneno,).
VARCHAR is good when the length varies
Use TEXT only when storing large text (comments, descriptions, articles).  up to 4GB

 5. Example Table
CREATE TABLE UserData (
    user_id INT PRIMARY KEY,
    phone VARCHAR(15),     -- variable
    pin_code CHAR(6),      -- fixed length
    card_number VARCHAR(20)
);



-- INT
-- int range:-  −2,147,483,648 to 2,147,483,647   2 bilion
CREATE TABLE accounts (
    account_id INT,
    balance INT
);

INSERT INTO accounts VALUES (1, -250); 

INSERT INTO test1 VALUES (3000000000);  -- error  3 bilion

-- int unsigned(0 and positive)
-- Range: 0 to 4,294,967,295
CREATE TABLE products (
    quantity INT UNSIGNED
);
INSERT INTO products (quantity) VALUES (3000000000);
select * from products;


-- NOTE 
 Numbers that SHOULD NOT be stored in INT
 These should be stored in VARCHAR, NOT numeric types:

Phone numbers
Aadhaar numbers / SSN
Credit card numbers
Zip codes
Product codes
Employee codes (E101, A77)
Anything with leading zeroes

Because they are identifiers, not mathematical values.







-- DECIMAL range: (65,30-65)
-- price DECIMAL(10, 2)  Max: 99999999.99
10 → Total number of digits (precision)
2 → Digits after the decimal point (scale)
Best for salary, price, tax, amount

FLOAT Stores approximate decimal(When small storage is more important than perfect accuracy)4 byte
 DOUBLE Stores approximate decimal numbers((more accurate than FLOAT) 8 byte
Do NOT use them for money/price values

-- EXAMPLE 

create database demo2;
use demo2;
drop database demo2;



create table student1(stuname char(5));
insert into student1 values('amitfrt'); -- error


insert into student1 values('amit'),('aman');






CREATE TABLE UserData (
    user_id INT ,
    phone VARCHAR(15),     -- variable
    pin_code CHAR(6),      -- fixed length
    card_number VARCHAR(20)
);

insert into userdata values (1,'8529-150','133001','123ertd');

CREATE TABLE articles (
    id INT ,
    title VARCHAR(255),
    content TEXT
);
INSERT INTO articles (id,title, content)
VALUES (1,'My First Article', 'This is some long text content that can contain many characters...');
SELECT content FROM articles WHERE id = 1;




CREATE TABLE accounts (
    account_id INT,
    balance INT
);





