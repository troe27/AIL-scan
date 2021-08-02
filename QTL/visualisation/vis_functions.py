import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


chr_ranks_file="/home/tilman/nas/stripes_AIL_gg6a/F2/stripes_data/input_aux/Index_fastq_contig_chr.txt"
name_dict = {line.split("\t")[2]:line.split("\t")[0] for line in open(chr_ranks_file).read().split("\n") if not line=="" }

a = """Chromosome 1	CM000093.5	=	NC_006088.5	7
Chromosome 2	CM000094.5	=	NC_006089.5	0
Chromosome 3	CM000095.5	=	NC_006090.5	4
Chromosome 4	CM000096.5	=	NC_006091.5	0
Chromosome 5	CM000097.5	=	NC_006092.5	0
Chromosome 6	CM000098.5	=	NC_006093.5	6
Chromosome 7	CM000099.5	=	NC_006094.5	0
Chromosome 8	CM000100.5	=	NC_006095.5	0
Chromosome 9	CM000101.5	=	NC_006096.5	1
Chromosome 10	CM000102.5	=	NC_006097.5	0
Chromosome 11	CM000103.5	=	NC_006098.5	0
Chromosome 12	CM000104.5	=	NC_006099.5	0
Chromosome 13	CM000105.5	=	NC_006100.5	1
Chromosome 14	CM000106.5	=	NC_006101.5	1
Chromosome 15	CM000107.5	=	NC_006102.5	1
Chromosome 16	CM000108.5	=	NC_006103.5	1
Chromosome 17	CM000109.5	=	NC_006104.5	0
Chromosome 18	CM000110.5	=	NC_006105.5	0
Chromosome 19	CM000111.5	=	NC_006106.5	1
Chromosome 20	CM000112.5	=	NC_006107.5	0
Chromosome 21	CM000113.5	=	NC_006108.5	0
Chromosome 22	CM000114.5	=	NC_006109.5	1
Chromosome 23	CM000115.5	=	NC_006110.5	6
Chromosome 24	CM000116.5	=	NC_006111.5	0
Chromosome 25	CM000124.5	=	NC_006112.4	1
Chromosome 26	CM000117.5	=	NC_006113.5	0
Chromosome 27	CM000118.5	=	NC_006114.5	0
Chromosome 28	CM000119.5	=	NC_006115.5	1
Chromosome 30	CM003637.2	=	NC_028739.2	0
Chromosome 31	CM003638.2	=	NC_028740.2	3
Chromosome 32	CM000120.4	=	NC_006119.4	0
Chromosome 33	CM000123.5	=	NC_008465.4	1
Chromosome W	CM000121.5	=	NC_006126.5	52
Chromosome Z	CM000122.5	=	NC_006127.5	1
"""

a = a.split("\n")
a = [i.split("\t") for i in a if not i==""]
name2dict = {i[3]:i[0] for i in a}

rev_name_dict = {line.split("\t")[0]:line.split("\t")[2] for line in open(chr_ranks_file).read().split("\n") if not line=="" }


def make_all_plots_simple(df,filename):
    num_plots = len(set(df.chr))
    fig, axes = plt.subplots(ncols=1, nrows=num_plots, figsize=(20,2*num_plots))
    for i,k in enumerate(list(set(df.chr))):
        curr_df = df[df.chr==k]
        axes[i].plot(curr_df["pos"], curr_df["lod"], color="black")
        axes[i].set_xlim(0,max(curr_df["pos"]))
        axes[i].set_ylim(0,5)
        axes[i].axhline(3, color='red', lw=2)
        axes[i].set_xlabel("chromosome {}".format(k))
    plt.tight_layout()
    plt.savefig(filename)
    plt.show()


def make_all_plots(df,filename,name2dict=name2dict, name_dict=name_dict, lod_thresh=None):
    if lod_thresh:
        num_plots = 0
        for i,k in enumerate(list(set(df.chr))):
            curr_df = df[df.chr==k]
            if np.max(curr_df.lod)>=lod_thresh:
                num_plots+=1
        fig, axes = plt.subplots(ncols=1, nrows=num_plots, figsize=(20,2*num_plots))
        curr_plot = 0
        #print(curr_plot)
        for i,k in enumerate(list(set(df.chr))):
            curr_df = df[df.chr==k]
            if np.max(curr_df.lod)>=lod_thresh:
                #print("plotting chr {} on axis {}".format(k,curr_plot) )
                axes[curr_plot].plot(curr_df["pos"], curr_df["lod"], color="black")
                axes[curr_plot].set_xlim(0,max(curr_df["pos"]))
                axes[curr_plot].set_ylim(0,5)
                axes[curr_plot].axhline(lod_thresh, color='red', lw=2)
                axes[curr_plot].set_xlabel("NAME: {name}\n  NAME: {name2}\nRANK : {rank}                    ".format(name=name_dict[str(k)],rank=k, name2=name2dict[name_dict[str(k)]]))
                axes[curr_plot].set_ylabel("lod")

                curr_plot+=1
    else:
        num_plots = len(set(df.chr))
        fig, axes = plt.subplots(ncols=1, nrows=num_plots, figsize=(20,2*num_plots))
        for i,k in enumerate(list(set(df.chr))):
            curr_df = df[df.chr==k]
            axes[i].plot(curr_df["pos"], curr_df["lod"], color="black")
            axes[i].set_xlim(0,max(curr_df["pos"]))
            axes[i].set_ylim(0,5)
            axes[i].set_xlabel("NAME: {name}\n  NAME: {name2}\n RANK : {rank}                  ".format(name=name_dict[str(k)],rank=k, name2=name2dict[name_dict[str(k)]]))
            axes[i].set_ylabel("lod")


    plt.tight_layout()
    plt.savefig(filename)
    plt.show()


def read_qtl_out(f):
    df = pd.read_csv(f)
    df.columns = ["marker", "chr", "pos", "lod"]
    return df


def make_all_plots_F2_F3(df,df2, filename,name2dict=name2dict, name_dict=name_dict, lod_thresh=None):
    if lod_thresh:
        num_plots = 0
        for i,k in enumerate(list(set(df.chr))):
            curr_df = df[df.chr==k]
            curr_df2 = df2[df2.chr==k]
            if np.max(curr_df.lod)>=lod_thresh or np.max(curr_df2.lod)>=lod_thresh:

                num_plots+=1

        print(num_plots)
        fig, axes = plt.subplots(ncols=1, nrows=num_plots, figsize=(20,10*num_plots))
        curr_plot = 0
        #print(curr_plot)
        for i,k in enumerate(list(set(df.chr))):
            curr_df = df[df.chr==k]
            curr_df2 = df2[df2.chr==k]
            if np.max(curr_df.lod)>=lod_thresh or np.max(curr_df2.lod)>=lod_thresh:
                #print("plotting chr {} on axis {}".format(k,curr_plot) )
                axes[curr_plot].plot(curr_df["pos"], curr_df["lod"], color="black", label="F2")
                axes[curr_plot].plot(curr_df2["pos"], curr_df2["lod"], color="blue", label="F3")
                axes[curr_plot].set_xlim(-1,max(curr_df["pos"])+1)
                axes[curr_plot].set_ylim(0,6)
                axes[curr_plot].axhline(lod_thresh, color='red', lw=2)
                axes[curr_plot].set_xlabel("NAME: {name}\n  NAME: {name2}\nRANK : {rank}                    ".format(name=name_dict[str(k)],rank=k, name2=name2dict[name_dict[str(k)]]))
                axes[curr_plot].set_ylabel("lod")
                axes[curr_plot].legend()
                curr_plot+=1
    else:
        num_plots = len(set(df.chr))
        fig, axes = plt.subplots(ncols=1, nrows=num_plots, figsize=(20,5*num_plots))
        for i,k in enumerate(list(set(df.chr))):
            curr_df = df[df.chr==k]
            axes[i].plot(curr_df["pos"], curr_df["lod"], color="black")
            axes[i].set_xlim(0,max(curr_df["pos"]))
            axes[i].set_ylim(0,5)
            axes[i].set_xlabel("NAME: {name}\n  NAME: {name2}\n RANK : {rank}                  ".format(name=name_dict[str(k)],rank=k, name2=name2dict[name_dict[str(k)]]))
            axes[i].set_ylabel("lod")
            axes[i].legend()

    plt.tight_layout()
    plt.savefig(filename)
    plt.show()
