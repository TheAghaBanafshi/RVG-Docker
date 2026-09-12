FROM python:3.11-slim

WORKDIR /app

# نصب git و ابزارهای لازم
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

# کلون کردن ریپو به صورت مستقیم داخل ایمیج
RUN git clone https://github.com/arvin341az-glitch/RVG.git .

# نصب وابستگی‌ها
RUN pip install --no-cache-dir -r requirements.txt

# Railway پورت رو از متغیر PORT می‌خونه
ENV PORT=8000
EXPOSE 8000

# اجرای پروژه
CMD ["python", "main.py"]
