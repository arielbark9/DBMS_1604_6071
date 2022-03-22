from faker import *

faker = Faker()

with open("Equipment_inserts.sql","w") as sqlfile:
    result = ""
    for i in range(1, 20001):
        equipmentName = faker.bothify(text='????-########')
        result += f"insert into Equipment values({i}, '{equipmentName}')\n"
    sqlfile.write(result)

with open("Renewing_Equipment_inserts.sql","w") as sqlfile:
    result = ""
    for i in range(1, 10001):
        lastRenew = faker.date_object().strftime("%d/%m/%Y")
        branchID = faker.random_int(1, 1001)
        equipmentID = faker.random_int(1, 20001)
        result += f"insert into Renewing_Equipment values({i}, TO_DATE('{lastRenew}','dd/mm/yyyy'), {branchID}, {equipmentID})\n"
    sqlfile.write(result)

with open("Permanent_Equipment_inserts.sql","w") as sqlfile:
    result = ""
    for i in range(1, 10001):
        lastMaintenance = faker.date_object().strftime("%d/%m/%Y")
        branchID = faker.random_int(1, 1001)
        equipmentID = faker.random_int(1, 20001)
        result += f"insert into Permanent_Equipment values({i}, TO_DATE('{lastMaintenance}','dd/mm/yyyy'), {branchID}, {equipmentID})\n"
    sqlfile.write(result)
