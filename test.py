import requests

try:
    response = requests.post('http://localhost:11434/api/chat', json={"data": "test"})
    print(response.status_code, response.text)
except requests.ConnectionError as e:
    print(f"Connection error: {e}")
