call mvn -B -s settings.xml -DskipTests=true clean install
call java -DDATABASE_URL="postgres://vedwpiboemvani:nb2ETLU_1TvazRrTw5kdXCRDn7@ec2-54-243-204-74.compute-1.amazonaws.com:5432/delcoaulrgb9kd" -jar target/dependency/webapp-runner.jar target/*.war