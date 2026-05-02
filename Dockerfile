FROM jupyter/base-notebook:latest

# Switch to root to install system packages if needed
USER root

# Install any OS-level dependencies here (e.g. apt-get install -y ...)

# Switch back to the default notebook user
USER ${NB_UID}

# Copy and install Python dependencies
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy notebooks and startup script into the working directory
COPY --chown=${NB_UID}:${NB_GID} . /home/${NB_USER}/work/

WORKDIR /home/${NB_USER}/work

# Make startup script executable
USER root
RUN chmod +x /home/${NB_USER}/work/start.sh
USER ${NB_UID}

# Expose the default Jupyter port
EXPOSE 8888

# Execute the notebook on start, then launch the Jupyter server
CMD ["/home/jovyan/work/start.sh"]
