call mvn -B -s settings.xml -DskipTests=true clean install
call java -DDATABASE_URL="postgres://user:user@localhost:5432/topjava02" -jar target/dependency/webapp-runner.jar target/*.war