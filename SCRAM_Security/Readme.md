## SCRAM - Salted Challenge Response Authentication Mechanism
### About SCRAM
Salted Challenge Response Authentication Mechanism (SCRAM) is a password-based mutual authentication protocol designed to make an eavesdropping attack (i.e. man-in-the-middle) more difficult. Using cryptographic hashing techniques, a client can prove to a server that the user knows a secret derived from the user’s password without sending the password itself. The server can prove to the client that it knows a secret derived from the user’s password also without having to send the actual password.

Using a hash function, the secret information (i.e. the password), in addition to a cryptographically secure random value, is used to compute another value at each end of the communication channel. It is this computed value that is transmitted. On receipt of the transmitted value, the communicating parties compare their computed value to the received value. If these values match then the authentication process is successful, otherwise, it fails.

Though SCRAM provides additional security against eavesdropping, it is recommended to use SCRAM over a secure communications channel (i.e. TLS).

### About This Directory
This Directory contains SCRAM Security in Apache Kafka. We use SCRAM for Authentication Machanism for clients to server.
