void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(A0));
  Serial.println(" ");
  Serial.print(analogRead(A1));
  Serial.println(" ");
  delay(0.1);
}
