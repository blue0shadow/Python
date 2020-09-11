import pymysql

host = "localhost"
id = "root"
pw = "system"
db_name = "mydb"

conn = pymysql.connect(host=host, user=id, password=pw,db=db_name, charset='utf8')
curs = conn.cursor()
print('DB connected')
"""
### 과제 준비를 위한 연습 코드임 ####
try:
    curs = conn.cursor()

    print("*** 학생 성적 검색하기 ***")
    student_id = input("학번 : ")
    sql = "select * from score where st_id = " + student_id
    curs.execute(sql)
    rows = curs.fetchall()

    for r in rows:
        print("학번 : " + str(r[0]))
        print("이름 : " + str(r[1]))
        print("국어 : " + str(r[2]))
        print("영어 : " + str(r[3]))
        print("수학 : " + str(r[4]))

    print("\n")
    print("*** 학생 성적 추가하기 ***")

    s_id = input("학번 : ")
    s_name = input("이름 : ")
    kor = input("국어 : ")
    eng = input("영어 : ")
    math = input("수학 : ")

    sql = "insert into score values(" + s_id + ", '" + s_name + "', " + kor + ", " + eng + ", " + math + ", null, null)"
    curs.execute(sql)

except:
    print('Error')
finally:
    print('Test ended')
"""
### 본 실습 과제 : 학생들의 성적을 처리하는 프로그램 작성하기 ####
try:
    while (True):
        print("<<< Select Menu>>>")
        print("1 : 전체 목록 출력")
        print("2 : 성적 검색")
        print("3 : 성적 추가")
        print("4 : 성적 수정")
        print("5 : 성적 삭제")
        print("9 : 프로그램 종료")
        choice = int(input("입력 : "))

        if choice == 1:
            print("전체 목록 출력을 선택하셨습니다 !!")
            curs.execute("select * from score")
            rows = curs.fetchall()
            print("<<전체 목록 출력>>")
            for r in rows:
                print(r)

        if choice == 2:
            print("성적 검색을 선택하셨습니다 !!")
            student_id = input("학번 : ")
            sql = "select * from score where st_id = " + student_id
            curs.execute(sql)
            rows = curs.fetchall()

            for r in rows:
                print("학번 : " + str(r[0]))
                print("이름 : " + str(r[1]))
                print("국어 : " + str(r[2]))
                print("영어 : " + str(r[3]))
                print("수학 : " + str(r[4]))

            print("\n")

        if choice == 3:
            print("*** 학생 성적 추가하기 ***")
            s_id = input("학번 : ")
            s_name = input("이름 : ")
            kor = input("국어 : ")
            eng = input("영어 : ")
            math = input("수학 : ")

            sql = "insert into score values(" + s_id + ", '" + s_name + "', " + kor + ", " + eng + ", " + math + ", null, null)"
            curs.execute(sql)

            sql = "select * from score where st_id = " + s_id
            curs.execute(sql)
            rows = curs.fetchall()

            for r in rows:
                print("학번 : " + str(r[0]))
                print("이름 : " + str(r[1]))
                print("국어 : " + str(r[2]))
                print("영어 : " + str(r[3]))
                print("수학 : " + str(r[4]))

            print("\n")

        if choice == 4:
            print("성적 수정을 선택하셨습니다 !!")
            print("수정 대상의 학번을 입력하시오.")
            ID = input("학번 : ")
            sql = "select * from score where st_id = " + ID
            curs.execute(sql)
            rows = curs.fetchall()
            print("\n")

            for r in rows:
                print("####수정 대상인 정보 ####")
                print("학번 : " + str(r[0]))
                print("이름 : " + str(r[1]))
                print("국어 : " + str(r[2]))
                print("영어 : " + str(r[3]))
                print("수학 : " + str(r[4]))

            print("\n")

            print("어떤 항목을 수정하시겠습니까 ??")
            print("1. 이름")
            print("2. 국어")
            print("3. 영어")
            print("4. 수학")

            choice2 = int(input("입력 : "))

            if choice2 == 1:
                print("수정할 값을 입력하시오.")
                modify_name = input("이름 : ")
                sql = "UPDATE score SET st_name = %s WHERE st_id = %s"
                curs.execute(sql, (modify_name, ID))
                conn.commit()

            if choice2 == 2:
                print("수정할 값을 입력하시오.")
                lan = int(input("국어 : "))
                sql = "UPDATE score SET kor = %s WHERE st_id = %s"
                curs.execute(sql, (lan,ID))
                conn.commit()

            if choice2 == 3:
                print("수정할 값을 입력하시오.")
                lan2 = int(input("영어 : "))
                sql = "UPDATE score SET eng = %s WHERE st_id = %s"
                curs.execute(sql, (lan2,ID))
                conn.commit()

            if choice2 == 4:
                print("수정할 값을 입력하시오.")
                lan3 = int(input("수학 : "))
                sql = "UPDATE score SET math = %s WHERE st_id = %s"
                curs.execute(sql, (lan3,ID))
                conn.commit()

        if choice == 5:
            print("성적 삭제를 선택하셨습니다 !!")
            print("삭제할 데이터의 학번을 입력하시오.")
            ID2 = input("학번 : ")
            sql = "delete from score WHERE st_id = %s"
            curs.execute(sql, (ID2))
            conn.commit()

        if choice == 9:
            print("프로그램 종료를 선택하셨습니다 !!")
            break;

        if choice not in [1,2,3,4,5,9]:
            print("잘못된 메뉴를 선택하셨습니다 !!")

        input("계속하기 (Enter 키 누름) >>")

except:
    print("ERROR: 실행 오류가 발생했습니다.")
finally:
    print("프로그램 실행이 완료됐습니다")