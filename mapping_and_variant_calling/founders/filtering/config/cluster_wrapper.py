#!/usr/bin/env python
import os
import sys
import subprocess

from snakemake.utils import read_job_properties

jobscript = sys.argv[1]
job_properties = read_job_properties(jobscript)
print(job_properties)

jobname = job_properties['rule']

compute_type = job_properties["cluster"]["compute_type"]
compute_num = job_properties["cluster"]["compute_num"]
time = str(job_properties["cluster"]["days"])+"-"+str(job_properties["cluster"]["hours"])+":"+str(job_properties["cluster"]["minutes"])+":00"
project = job_properties["cluster"]["project"]
mail = job_properties["cluster"]["mail"]
outfile = "snek_"+jobname+"_%j.out"
errorfile = "snek_"+jobname+"_%j.error"

if compute_type == "core":
    threads = str(min(int(compute_num), int(job_properties["threads"])))
else:
    threads = compute_num

jobstring = """sbatch
-A {project} \
-J {jobname} \
-p {compute_type} \
-n {threads} \
-t {time} \
--mail-type=all \
--get-user-env \
--mail-user={mail} \
-o {outfile} \
-e {errorfile} \
{script}""".format(threads=threads,
                   script=jobscript,
                   project=project,
                   compute_type=compute_type,
                   compute_num=compute_num,
                   time=time,
                   mail=mail,
                   jobname=jobname,
                   outfile=outfile,
                   errorfile=errorfile,
                   )
print(jobstring)
os.system(str(jobstring))
