Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E6BF5CCF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 12:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:From:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NllTix+tWEzzA5zd5cxNEPVsTE+VxFwutPyuznmGN3s=; b=V9/svwwyPSloIT43MAPCfrwrIK
	sk1Zm5uDsYnatJjJlNmwPYosC4OeEdXI2xBiL08xO//V7vpTzfZ/REJ1x3laIDbrOy2GIDad83mcy
	Xxdi1rlPGT5QDIg009uyQ70F0UmsFAbWS6/5+NFR+aVP/3bMo5an7MURAVlI+wtd8DIY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB9jO-0006tA-3z;
	Tue, 21 Oct 2025 10:36:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vB9jM-0006t3-Kk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 10:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HsQCI8iew+pHyZGlqcgByv/CbFDTHT7k4bxRlb4DRbo=; b=d+F68PV3X7//DdJtY1a2vXQhI+
 ZBTWCxf8wDjUsu9YyXg0Dk4Yi+9LIsAB+ItjvtEwdhJUauKDOh5BKwLqe8A+MGeOqlmoEVgUqHJFf
 DAyduq9ElnL6Me/kaGw/rIb5xIySd/vfWQe3QQaYDnjfUe5HW8ojPVaqglmLYPDG4rno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HsQCI8iew+pHyZGlqcgByv/CbFDTHT7k4bxRlb4DRbo=; b=MGGIZaR+d26+njkUv8BIhz6TXJ
 CRMpBvIAuaX7yjynjWKYc2IFXSlqRDZDsRFYXLR8wCpsDkqkzQH7OBDu5tpwrhk25bsdwOT1fd8Jm
 5QuiJINwvx0raHPA5zTwkC/2A4GO0IeYO1O66UFEnxQPNEQlXMvFotuLZUH9n8FCNrgc=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB9jL-0007pN-01 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 10:36:40 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20251021103631epoutp02c0753c9ddf384abcdaf930045d5c314c~we0UzhpWv2934929349epoutp02d
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Oct 2025 10:36:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20251021103631epoutp02c0753c9ddf384abcdaf930045d5c314c~we0UzhpWv2934929349epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1761042991;
 bh=HsQCI8iew+pHyZGlqcgByv/CbFDTHT7k4bxRlb4DRbo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=lqVTJzjiViwLvtPEinPu/Xjuq/K9X0k8qNsAWIo0X0IBiUFYLsSClONg3/gM5D7eB
 UvdqM5ywKtjfZfUzKdqaaOkEXaKVNl85+7TelDN5CE+TOP+mioideD3b04/1hfy+mg
 KW7BTGGy19cfbK0DtBSrmoropHMgbDFIea4xhdDU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20251021103630epcas5p435dae0ee9578598211e7066cedc621c2~we0TrEpWD0288102881epcas5p47;
 Tue, 21 Oct 2025 10:36:30 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4crTHK1zMHz6B9m7; Tue, 21 Oct
 2025 10:36:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20251021103628epcas5p1b7baecd88baf9cf66127e17613f268e4~we0RnAWVC2779827798epcas5p1e;
 Tue, 21 Oct 2025 10:36:28 +0000 (GMT)
Received: from [107.111.86.57] (unknown [107.111.86.57]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251021103622epsmtip11f8ba67056c7c576fea39dc357410495~we0M5IZcp2042120421epsmtip1P;
 Tue, 21 Oct 2025 10:36:22 +0000 (GMT)
Message-ID: <6fe26b74-beb9-4a6a-93af-86edcbde7b68@samsung.com>
Date: Tue, 21 Oct 2025 16:06:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
From: Kundan Kumar <kundan.kumar@samsung.com>
In-Reply-To: <aPa7xozr7YbZX0W4@dread.disaster.area>
X-CMS-MailID: 20251021103628epcas5p1b7baecd88baf9cf66127e17613f268e4
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/21/2025 4:16 AM, Dave Chinner wrote: Thanks Dave for
 the detailed feedback. > On Tue, Oct 14, 2025 at 05:38:29PM +0530, Kundan
 Kumar wrote: >> Number of writeback contexts >> ============================
 >> We've implemented two interfaces to manage the number of writeback >>
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [203.254.224.25 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB9jL-0007pN-01
Subject: Re: [f2fs-dev] [PATCH v2 00/16] Parallelizing filesystem writeback
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, hch@lst.de, dave@stgolabs.net,
 agruenba@redhat.com, miklos@szeredi.hu, gost.dev@samsung.com,
 willy@infradead.org, anuj20.g@samsung.com, linux-nfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/21/2025 4:16 AM, Dave Chinner wrote:

Thanks Dave for the detailed feedback.

> On Tue, Oct 14, 2025 at 05:38:29PM +0530, Kundan Kumar wrote:
>> Number of writeback contexts
>> ============================
>> We've implemented two interfaces to manage the number of writeback
>> contexts:
>> 1) Sysfs Interface: As suggested by Christoph, we've added a sysfs
>>     interface to allow users to adjust the number of writeback contexts
>>     dynamically.
>> 2) Filesystem Superblock Interface: We've also introduced a filesystem
>>     superblock interface to retrieve the filesystem-specific number of
>>     writeback contexts. For XFS, this count is set equal to the
>>     allocation group count. When mounting a filesystem, we automatically
>>     increase the number of writeback threads to match this count.
> 
> This is dangerous. What happens when we mount a filesystem with
> millions of AGs?
> 

Good point. How about adding an upper bound e.g. limiting the number
of writeback contexts to something like nr_cpus * k and mapping AGs
dynamically to that bounded pool.

> 
>> Resolving the Issue with Multiple Writebacks
>> ============================================
>> For XFS, affining inodes to writeback threads resulted in a decline
>> in IOPS for certain devices. The issue was caused by AG lock contention
>> in xfs_end_io, where multiple writeback threads competed for the same
>> AG lock.
>> To address this, we now affine writeback threads to the allocation
>> group, resolving the contention issue. In best case allocation happens
>> from the same AG where inode metadata resides, avoiding lock contention.
> 
> Not necessarily. The allocator can (and will) select different AGs
> for an inode as the file grows and the AGs run low on space. Once
> they select a different AG for an inode, they don't tend to return
> to the original AG because allocation targets are based on
> contiguous allocation w.r.t. existing adjacent extents, not the AG
> the inode is located in.
> 

The tests were conducted under ideal conditions, where the Allocation
Groups (AGs) had sufficient space. The design for affining writeback
threads to AGs is based on the assumption that allocations typically
occur within the same AG, unless it's low on space. To predict the AG
from which the allocation will happen, additional logic would be
required. This enhancement can be considered for a future phase, with
the get_inode_wb_ctx() function being the suitable location for
implementation.

> Indeed, if a user selects the inode32 mount option, there is
> absolutely no relationship between the AG the inode is located in
> and the AG it's data extents are allocated in. In these cases,
> using the inode resident AG is guaranteed to end up with a random
> mix of target AGs for the inodes queued in that AG.  Worse yet,
> there may only be one AG that can have inodes allocated in it, so
> all the writeback contexts for the other hundreds of AGs in the
> filesystem go completely unused...
> 
For inode32 mounts, does it make sense to restricting to single-threaded
writeback, or you have other thoughts for same ?

>> Similar IOPS decline was observed with other filesystems under different
>> workloads. To avoid similar issues, we have decided to limit
>> parallelism to XFS only. Other filesystems can introduce parallelism
>> and distribute inodes as per their geometry.
> 
> I suspect that the issues with XFS lock contention are related to
> the fragmentation behaviour observed (see below) massively
> increasing the frequency of allocation work for a given amount of
> data being written rather than increasing writeback concurrency...
> 
>>
>> IOPS and throughput
>> ===================
>> With the affinity to allocation group we see significant improvement in
>> XFS when we write to multiple files in different directories(AGs).
>>
>> Performance gains:
>>    A) Workload 12 files each of 1G in 12 directories(AGs) - numjobs = 12
>>      - NVMe device BM1743 SSD
> 
> So, 80-100k random 4kB write IOPS, ~2GB/s write bandwidth.
> 
>>          Base XFS                : 243 MiB/s
>>          Parallel Writeback XFS  : 759 MiB/s  (+212%)
> 
> As such, the baseline result doesn't feel right - it doesn't match
> my experience with concurrent sequential buffered write workloads on
> SSDs. My expectation is that they'd get close to device bandwidth or
> run out of copy-in CPU at somewhere over 3GB/s.
> 
> So what are you actually doing to get these numbers? What is the
> benchmark (CLI and conf files details, please!), what is the
> mkfs.xfs output, and how many CPUs/RAM do you have on the machines
> you are testing?  i.e. please document them sufficiently so that
> other people can verify your results.
> 

All tests were done with random writes. I am sharing complete test
script and config details.

mkfs output
===========
meta-data=/dev/nvme2n1           isize=512    agcount=128, 
agsize=117188604 blks
          =                       sectsz=4096  attr=2, projid32bit=1
          =                       crc=1        finobt=1, sparse=1, rmapbt=1
          =                       reflink=1    bigtime=1 inobtcount=1 
nrext64=1
          =                       exchange=0   metadir=0
data     =                       bsize=4096   blocks=15000141312, imaxpct=1
          =                       sunit=4      swidth=32 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1, parent=0
log      =internal log           bsize=4096   blocks=521728, version=2
          =                       sectsz=4096  sunit=1 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
          =                       rgcount=0    rgsize=0 extents
          =                       zoned=0      start=0 reserved=0

Script to issue the IO
======================
mkfs.xfs -f /dev/nvme2n1
mount /dev/nvme2n1 /mnt

sync
echo 3 > /proc/sys/vm/drop_caches

for i in {1..12}; do
         mkdir -p /mnt/dir$i
done

fio job_nvme.fio

umount /mnt
echo 3 > /proc/sys/vm/drop_caches
sync

File job_nvme.fio
=================
[global]
bs=4k
iodepth=32
rw=randwrite
ioengine=io_uring
nrfiles=12
numjobs=1                # Each job writes to a different file
size=12g
direct=0                 # Buffered I/O to trigger writeback
group_reporting=1
create_on_open=1
name=test

[job1]
directory=/mnt/dir1

[job2]
directory=/mnt/dir2

...
...

[job12]
directory=/mnt/dir12

Number of CPUs = 128
System RAM = 128G

> Also, what is the raw device performance and how close to that are
> we getting through the filesystem?
>

Raw IO performance BM1743 SSD
fio -iodepth=32 --rw=randwrite -direct=1 -ioengine=io_uring -bs=4K 
-numjobs=1 -size=100G -group_reporting -filename=/dev/nvme2n1 
-name=direct_test
write: IOPS=117k, BW=457MiB/s (479MB/s)(100GiB/224303msec)

Raw IO performance PM9A3 SSD
write: IOPS=546k, BW=2132MiB/s (2235MB/s)(100GiB/48036msec)

>>      - NVMe device PM9A3 SSD
> 
> 130-180k random 4kB write IOPS, ~4GB/s write bandwidth. So roughly
> double the physical throughput of the BM1743, and ....
> 
>>          Base XFS                : 368 MiB/s
>>          Parallel Writeback XFS  : 1634 MiB/s  (+344%)
> 
> .... it gets roughly double the physical throughput of the BM1743.
> 

BM1743 is a large IU device with a 16K IU size, which is not optimized
for my 4K IO operations, resulting in lower throughput. In contrast,
PM9A3 is a faster device that handles IO operations more efficiently.

> This doesn't feel like a writeback concurrency limited workload -
> this feels more like a device IOPS and IO depth limited workload.
> 
>>    B) Workload 6 files each of 20G in 6 directories(AGs)  - numjobs = 6
>>      - NVMe device BM1743 SSD
>>          Base XFS                : 305 MiB/s
>>          Parallel Writeback XFS  : 706 MiB/s  (+131%)
>>
>>      - NVMe device PM9A3 SSD
>>          Base XFS                : 315 MiB/s
>>          Parallel Writeback XFS  : 990 MiB/s  (+214%)
>>
>> Filesystem fragmentation
>> ========================
>> We also see that there is no increase in filesystem fragmentation
>> Number of extents per file:
> 
> Are these from running the workload on a freshly made (i.e. just run
> mkfs.xfs, mount and run benchmark) filesystem, or do you reuse the
> same fs for all tests?

I create a new file system for each test run.

> 
>>    A) Workload 6 files each 1G in single directory(AG)   - numjobs = 1
>>          Base XFS                : 17
>>          Parallel Writeback XFS  : 17
> 
> Yup, this implies a sequential write workload....
> 

This is random IO. As the workload is small the extents merge more.

>>    B) Workload 12 files each of 1G to 12 directories(AGs)- numjobs = 12
>>          Base XFS                : 166593
>>          Parallel Writeback XFS  : 161554
> 
> which implies 144 files, and so over 1000 extents per file. Which
> means about 1MB per extent and is way, way worse than it should be
> for sequential write workloads.
> 

Previous results of fragmentation were taken with randwrite. I took
fresh data for sequential IO and here are the results.
number of extents reduces a lot for seq IO:
   A) Workload 6 files each 1G in single directory(AG)   - numjobs = 1
         Base XFS                : 1
         Parallel Writeback XFS  : 1

   B) Workload 12 files each of 1G to 12 directories(AGs)- numjobs = 12
         Base XFS                : 4
         Parallel Writeback XFS  : 3

   C) Workload 6 files each of 20G to 6 directories(AGs) - numjobs = 6
         Base XFS                : 4
         Parallel Writeback XFS  : 4

>>
>>    C) Workload 6 files each of 20G to 6 directories(AGs) - numjobs = 6
>>          Base XFS                : 3173716
>>          Parallel Writeback XFS  : 3364984
> 
> 36 files, 720GB and 3.3m extents, which is about 100k extents per
> file for an average extent size of 200kB. That would explain why it
> performed roughly the same on both devices - they both have similar
> random 128kB write IO performance...
> 
> But that fragmentation pattern is bad and shouldn't be occurring fro
> sequential writes. Speculative EOF preallocation should be almost
> entirely preventing this sort of fragmentation for concurrent
> sequential write IO and so we should be seeing extent sizes of at
> least hundreds of MBs for these file sizes.
> 
> i.e. this feels to me like you test is triggering some underlying
> delayed allocation defeat mechanism that is causing physical
> writeback IO sizes to collapse. This turns what should be a
> bandwitdh limited workload running at full device bandwidth into an
> IOPS and IO depth limited workload.
> 
> In adding writeback concurrency to this situation, it enables
> writeback to drive deeper IO queues and so extract more small IO
> performance from the device, thereby showing better performance for
> the wrokload. The issue is that baseline writeback performance is
> way below where I think it should be for the given IO workload (IIUC
> the workload being run, hence questions about benchmarks, filesystem
> configs and test hardware).
> 

I have tried to share config, benchmarking script and data,
if you feel some details are missing please let me know.

> Hence while I certainly agree that writeback concurrency is
> definitely needed, I think that the results you are getting here are
> a result of some other issue that writeback concurrency is
> mitigating. The underlying fragmentation issue needs to be
> understood (and probably solved) before we can draw any conclusions
> about the performance gains that concurrent writeback actually
> provides on these workloads and devices...
> 

In these tests we've observed that fragmentation remains consistent 
across sequential and random IO workloads. Your feedback on this would 
be valuable.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
