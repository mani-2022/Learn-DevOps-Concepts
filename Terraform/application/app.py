## This is a sample python application used for testing purpose. The contentin the file was taken from CHATGPT

from flask import Flask
import os
import psycopg2

app = Flask(__name__)


@app.route("/")
def home():
    try:
        conn = psycopg2.connect(
            host=os.environ["DB_HOST"],
            port=os.environ.get("DB_PORT", "5432"),
            database=os.environ["DB_NAME"],
            user=os.environ["DB_USER"],
            password=os.environ["DB_PASSWORD"],
        )

        conn.close()

        return """
        <h1>Hello from the DevOps application!</h1>
        <p>Application is running successfully.</p>
        <p>Database: Connected</p>
        """

    except Exception as e:
        return f"""
        <h1>Hello from the DevOps application!</h1>
        <p>Application is running.</p>
        <p>Database: Connection failed</p>
        <p>Error: {e}</p>
        """, 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
