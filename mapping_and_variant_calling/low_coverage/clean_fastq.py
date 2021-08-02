"""
from https://sourceforge.net/projects/bbmap/, version 38.35 feb 2019
submission script for usage on rackham.uppmax.uu.se / slurm

author: tilman.ronneburg@imbim.uu.se
"""

import argparse
import os

def cli_parser():
    '''Parse command line input'''
    parser_main = argparse.ArgumentParser(prog='clean_fastq.py')
    parser_main.add_argument("-i","--listfile",help="list of files,forward & reverse tab delimited.")
    parser_main.add_argument("-d","--indir",help="optional: directory files in list are in.")
    parser_main.add_argument("-o","--outdir",help="optional: output directory")
    parser_main.add_argument("-n","--cores",help="number of cores to use.",default=1)
    parser_main.add_argument("-t","--time",help="time in hours:minutes:seconds",default="01:00:00")
    parser_main.add_argument("-A","--project",help="Project ID")
    parser_main.add_argument("-x","--execute",help="submit jobs, else just create files", action="store_true")
    args = parser_main.parse_args()
    return args


def read_filelist( list_file, indir=None):
    ''' Read in fastq-files as list. '''
    with open(list_file, "r") as handle:
        lines = [ line.rstrip("\n").split("\t") for line in handle.readlines()]
    if not indir==None:
        lines = [os.paths.join(indir, line) for line in lines]
    
    return lines

def construct_command(line, cores=1, time="01:00:00", project="", name="clean", outdir=None):
    ''' Construct command based on forward&reverse and job specs. CURRENTLY UNUSED '''
    reverse=line[1]
    reverse_out=reverse.rsplit(".",2)[0]+"_repaired.fastq.gz"
    mem = str(int(0.7*6*int(cores)))+"G"
    if not outdir==None:
        forward_out = os.path.join(outdir, forward_out.rsplit("/",1)[1])
        reverse_out = os.path.join(outdir, reverse_out.rsplit("/",1)[1])

    toolpath="/home/tilman/bin/bbmap/repair.sh"
    shell = " {toolpath} in={forward} in2={reverse} -Xmx {mem} repair=t out={forward_out} out2={reverse_out}".format(toolpath=toolpath,
                                                                                                                 forward=forward,
                                                                                                                 reverse=reverse,
                                                                                                                 forward_out=forward_out,
                                                                                                                 reverse_out=reverse_out,
                                                                                                                 mem=mem) 
    cmd="sbatch -A {project} -p core -n {cores} -t {time} -J {name} {shell}".format(project=project,
                                                                                    cores=cores,
                                                                                    time=time,
                                                                                    name=name,
                                                                                    shell=shell)
    return cmd

def construct_file(line, cores=1, time="01:00:00", project="", name="clean", outdir=None):
    ''' Construct batch submission file based on forward&reverse and job specs. '''
    forward=line[0]
    reverse=line[1]
    forward_out=forward.rsplit(".",2)[0]+"_repaired.fastq.gz"
    reverse_out=reverse.rsplit(".",2)[0]+"_repaired.fastq.gz"
    mem = str(int(0.7*6*int(cores)))+"G"
    if not outdir==None:
        forward_out = os.path.join(outdir, forward_out.rsplit("/",1)[1])
        reverse_out = os.path.join(outdir, reverse_out.rsplit("/",1)[1])

    
    cmd_lines = []
    cmd_lines.append("#!/bin/bash -l")
    cmd_lines.append("#SBATCH -t {time} ".format(time=time))
    cmd_lines.append("#SBATCH -p core -n {cores} ".format(cores=cores))
    cmd_lines.append("#SBATCH -J  {name} ".format(name=name))
    cmd_lines.append("#SBATCH -o  {name}_%j.out ".format(name=name))
    cmd_lines.append("#SBATCH -e  {name}_%j.error ".format(name=name))
    cmd_lines.append("#SBATCH --get-user-env")
    cmd_lines.append("#SBATCH -A {project}".format(project=project))

    toolpath="/home/tilman/bin/bbmap/repair.sh"    
    
    shell_lines = []
    shell_lines.append("#### shell command below this ####")
    shell_lines.append(" module load bioinfo-tools")
    shell_lines.append("module load bbmap")
    shell_lines.append(" {toolpath} in={forward} in2={reverse} -Xmx{mem} repair=t out={forward_out} out2={reverse_out}".format(toolpath=toolpath,
                                                                                                                                forward=forward,
                                                                                                                                reverse=reverse,
                                                                                                                                forward_out=forward_out,
                                                                                                                                reverse_out=reverse_out,
                                                                                                                                mem=mem))    
    file_all = cmd_lines+shell_lines
    filename = "sbatch_{name}.sh".format(name=name)
    with open(filename , "w") as handle:
        handle.write("\n".join(file_all))
    
    return filename


def main():
    ''' Execute workflow. '''
    args=cli_parser()
    lines = read_filelist(list_file=args.listfile, indir=args.indir)
    for line in lines:
        name = "repair_"+line[0].rsplit(".",2)[0].rsplit("/",1)[1]
        f = construct_file(line,
                           cores=args.cores,
                           time=args.time,
                           project=args.project,
                           name=name,
                           outdir=args.outdir)
        if args.execute == True:
                     os.system("sbatch {sbatch_script}".format(sbatch_script=f))
        

if __name__ == "__main__" :
    main()
