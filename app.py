from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/health')
def health_check():
    return jsonify({'status': 'healthy'})

@app.route('/')
def index():
    return 'Container deployment successful'


@app.route('/api/products')
def get_products():
    return jsonify([
        {"id": 1, "title": "Widget", "price": 9.99},
        {"id": 2, "title": "Gadget", "price": 19.99}
    ])


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8000))
    app.run(host='0.0.0.0', port=port)