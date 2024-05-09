FROM python:3.8
# Install Git
RUN apt-get update && apt-get install -y git
EXPOSE 8080
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . ./
RUN cd data && tar -xvf cocoput_table.tsv.tar.gz && cd ..
ENTRYPOINT ["streamlit", "run", "1streamlit.py", "--server.port=8080", "--server.address=0.0.0.0"]
