import smtplib
from email.mime.text import MIMEText

def send_sms_via_email(phone_number, message, smtp_server, smtp_port, smtp_user, smtp_password):
    carrier_gateway = f'{phone_number}@vtext.com'  # Replace with the recipient's carrier gateway
    msg = MIMEText(message)
    msg['Subject'] = 'Name'
    msg['From'] = smtp_user
    msg['To'] = carrier_gateway

    try:
        with smtplib.SMTP(smtp_server, smtp_port) as server:
            server.starttls()  # For TLS
            server.login(smtp_user, smtp_password)
            server.send_message(msg)
        print("Message sent successfully!")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    smtp_server = 'cclmsit.com'
    smtp_port = 587
    smtp_user = 'canteen@cclmsit.com'
    smtp_password = 'canteen123@'  # Use an app-specific password if 2FA is enabled

    phone_number = '7047981602'
    message = 'Hello from Python!'
    send_sms_via_email(phone_number, message, smtp_server, smtp_port, smtp_user, smtp_password)
