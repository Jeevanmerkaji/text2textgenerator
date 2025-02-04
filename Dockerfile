## Use the python 3.9 image 
FROM python:3.9

## Set the working directory to ./code
WORKDIR /code

## Copy the current working directory content in the container at /code 
COPY ./requirements.txt /code/requirements.txt

## Install the requirements.txt 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt


## Setup a new user named "user"
RUN useradd user 

## Switch to the "user" user
USER user 

# Set the home to the users home directory 
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

## Set the working directory to the users home directory 
WORKDIR $HOME/app

## Copy the current directory contents into the container at $HOME/app setting the owner to the user home directory 
COPY --chown=user . $HOME/app


## Start the FASTApi app on the the port 7860
CMD ["uvicorn", "app:app", "--host" , "0.0.0.0" , "--port" , "7860"]





