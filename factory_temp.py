import time

import Adafruit_BMP.BMP085 as BMP085
import pymysql
import RPi.GPIO as GPIO

# 사용 핀 설정
blueled_pin = 4
redled_pin = 23
sound_pin = 18

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

GPIO.setup(redled_pin, GPIO.OUT, initial=GPIO.LOW)
GPIO.setup(blueled_pin, GPIO.OUT, initial=GPIO.LOW)
GPIO.setup(sound_pin, GPIO.OUT)

p = GPIO.PWM(sound_pin,100)
 
red_frq = [466,493]

blue_frq = [233,246]


# 데이터 베이스 연결
conn = pymysql.connect(host='localhost', user='root', password='1234', db='Supplier', charset='utf8')
cursor = conn.cursor()

# 필요시 데이터 테이블 생성해서 
# cursor.execute('''
#     CREATE TABLE IF NOT EXISTS sensor_data (
#         id INT AUTO_INCREMENT PRIMARY KEY,
#         timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
#         temperature FLOAT,
#         pressure FLOAT,
#         altitude FLOAT
#     )
# ''')
conn.commit()


# 사용 센서 지정
sensor = BMP085.BMP085(busnum=1)



last_temp = 0.0
while True:
    
    # 라즈베리 파이 센서 데이터 받아옴
    now_temp = sensor.read_temperature()
    
    print('Temp = {0:0.10f} *C'.format(now_temp))


    # 조건에 따라 다른 값 입력
    if now_temp != last_temp:
        if now_temp < 25:
            cursor.execute('''
                INSERT INTO Factory_temp (now_temp,state)
                VALUES (%s, "low")
            ''', (now_temp))
            conn.commit()

            GPIO.output(blueled_pin, 1)
            p.start(10)
            for fr in blue_frq:
                p.ChangeFrequency(fr)
                time.sleep(0.8)

            

    
            
        elif now_temp > 29:
            cursor.execute('''
                INSERT INTO Factory_temp (now_temp,state)
                VALUES (%s, "high")
            ''', (now_temp))
            conn.commit()
            
            GPIO.output(redled_pin, 1)
            p.start(10)
            for fr in red_frq:
                p.ChangeFrequency(fr)
                time.sleep(0.8)

        
        else:
            cursor.execute('''
                INSERT INTO Factory_temp (now_temp,state)
                VALUES (%s,"normal")
            ''', (now_temp))
            conn.commit()
            GPIO.output(redled_pin, 0)
            GPIO.output(blueled_pin, 0)
            p.stop()
                        

            
        last_temp = now_temp

    
    time.sleep(1)


conn.close()

GPIO.cleanup()