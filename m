Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A5BF3FDB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 01:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlebfZHrDFSlTcVIgKTO+dM9eOMvDIUp6HSFjYjbsVY=; b=k1nAWcR3U5ZxWlyyPsw6zTOxrM
	oM3/XwftCXj/eW/863S23iAluuihNa1TJf70F3iDXlJxvNBqiq6DKuI+3KLibUVSdRO6fxBCrKR3i
	1OEGhkqkqaKmNCp9YID1ccrpr1iuIglIN0rLS5Db2trQ+T9XTSurjNCCE06VLN1RlRj8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAz3e-00055G-90;
	Mon, 20 Oct 2025 23:12:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1vAz3c-000553-Vq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 23:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bUtWq6BwnjWVaI8PPEZSZXu56vepaxMGdapsduu3y9o=; b=LpG+J5HijwberxxajGewKKA30m
 GG8RcvDI/TCxhFL22hoBLGAOujNsh62YH6xeoHQSg5BksDNcCOBK7r7mT5EDMD/yaBBifQ2N9n7si
 IEOh290sd3vuhrfkzaxeAtvpUm81K6mD4BOTzYj1EonMDI7YadaLbYfNSliLWox4zn1Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bUtWq6BwnjWVaI8PPEZSZXu56vepaxMGdapsduu3y9o=; b=LsbUgdbodv3aXe+dgWsSsCcICC
 Wqvpj8n572pBGIcid3M5SLjeXTqQVIZxMv3u81bXVJBLY6eiewx0G+I5XRJzDCLF3lOxiHiOwdqGV
 Gwp5s6awuNN3AqYAFNZd+tFk1bx1remhrE73nIa7+q0u4QIkrOjJAX5jgvshSp9sYZZQ=;
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vAz3d-0003py-1B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 23:12:53 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-3c94deb7c7cso2703286fac.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Oct 2025 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1761001967; x=1761606767;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bUtWq6BwnjWVaI8PPEZSZXu56vepaxMGdapsduu3y9o=;
 b=myPMN5/nZ0qf9kzUhzMMISP+HgqVpKWiVC/eDmUDOcX4ujG+jFq8x2I/UgAfDgz7X6
 ze5flIZ3FU50pLtn6Fjy3+SoCvoXKGs1YB0PAJjdRhmyZ/CVSgQmJq9xNWkCoGbWK/zp
 +WZK6tDNxV3AfUJ+NfGCrSoRCN9vWLMOjLhH+HIyLvW4u26bzEJH4Ui6ulNZSnG6bbPj
 JaWSPCwy+TITR79aKLnXg/0UHW6aKCWseqoeGHI0A8RoGrlJsvEzK23eapgOCUhyCEqw
 pMr7i2JA0YmFGeTuArtLQurK60WHUhkVyD42Sq2PJzHDz6Pkx1rIurzCRm/TNP4VjtxI
 29Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001967; x=1761606767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bUtWq6BwnjWVaI8PPEZSZXu56vepaxMGdapsduu3y9o=;
 b=LJXnB/hMyHkjbrWW3vYUoj7KkjytNFPAbbvjUE5BSrJ2b4gZzVHOnK3oXgxCQDHIsv
 7kjb2VFRwwHfJt9ZFmL21uzPqjLuv2TD/TadMdwsql9rRKvjpS5+5358AdcUbnYmOJKI
 G8Wu4pyml0VMPFOCeSER4K9FIdYl4K4tB+of0skcgUV5Bfe1mE9nqoQO3lEL1/bGHpg3
 F6oVBzHXFxJLtOYfyRwbktANM/oOR7Wk/k15/XRKkDqzwPJP+0z92H8gWidnDAi0n0aa
 ZqMqXGsBj7JSh0Z7cE1nShq0uW059KVszNdkkytW/l2UoWuE+yAJeYAcxc1/P1ajwX1g
 288g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCbUd6ggI1QaA+Tk9pA1VLFVW6LGqU9xdYC95P4i6cDCsLNDt1ccNR02U1mo5ybUg0i6dIAaZe92h5tdVZ5NNM@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxEc+vGmFqeqxurhLXRicKqATstrl1Sj9EU1GZBu2oZEQcNQFr9
 LTVfD0A0H3xMjvp0MBbikZflae2pS1OQjVZzGRIrpen8atNElMtvdet3x+4+30rp0Ms37DCOiBQ
 a03Qq
X-Gm-Gg: ASbGncvxcIvX096wZr85eWMBUlisNzoPTD967KW8KIfiyC9w7slzndh//aLABJOBx2v
 XbuXBECIwbOWepryvTKSg9kkRcNf5D7l5IYW6kK2dRiyuKlBM2slv9oFVuHtb63gcHH3wAijaOG
 Hwv4WSWF1kU9xvnsVNO1APdM/oscyUiDovx3utlcsYHlGqF5XmlivLW+2pGGsIZwBem8McC4PP9
 gvR7iW5Jj9YmFncz+AxHv1sSeYeQXmTVeySuKGghIxMXs8SY68GZ7ntmJQeJDDTnHNVvl9GYd5E
 exXTbC0enctBuHz6RPglF7xx5jv9mwPvkJodJMu6zpwI0VZS13CPp3HASNHyQoqWV0Sv/n94SL5
 ama8qevqSNy39NUfwgoXNQ4F2eUw0iclUU1ZCvM9XjgKPFY771jKpgopHHF9L1VWRmvm5cDJI4H
 0RLimmteyzopqY0EgL1/WMulnIWWyFBwqBXACmtYVR2Jv7qQBo3t8=
X-Google-Smtp-Source: AGHT+IFUIIz9u3gROHoyBrX9GrfKv6A6QBpIppZbYxVF4pPYqH4Q7yX35XtiJX79fRgqZ/TJvN1KGA==
X-Received: by 2002:a17:902:d4c4:b0:25b:f1f3:815f with SMTP id
 d9443c01a7336-290cb65f80emr187540085ad.58.1761000394302; 
 Mon, 20 Oct 2025 15:46:34 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-91-142.pa.nsw.optusnet.com.au.
 [49.180.91.142]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d594esm90846765ad.72.2025.10.20.15.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 15:46:33 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1vAye6-0000000HVzd-2eTg;
 Tue, 21 Oct 2025 09:46:30 +1100
Date: Tue, 21 Oct 2025 09:46:30 +1100
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <aPa7xozr7YbZX0W4@dread.disaster.area>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 14, 2025 at 05:38:29PM +0530, Kundan Kumar wrote:
 > Number of writeback contexts > ============================ > We've
 implemented
 two interfaces to manage the number of writeback > conte [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.44 listed in wl.mailspike.net]
X-Headers-End: 1vAz3d-0003py-1B
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
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

On Tue, Oct 14, 2025 at 05:38:29PM +0530, Kundan Kumar wrote:
> Number of writeback contexts
> ============================
> We've implemented two interfaces to manage the number of writeback
> contexts:
> 1) Sysfs Interface: As suggested by Christoph, we've added a sysfs
>    interface to allow users to adjust the number of writeback contexts
>    dynamically.
> 2) Filesystem Superblock Interface: We've also introduced a filesystem
>    superblock interface to retrieve the filesystem-specific number of
>    writeback contexts. For XFS, this count is set equal to the
>    allocation group count. When mounting a filesystem, we automatically
>    increase the number of writeback threads to match this count.

This is dangerous. What happens when we mount a filesystem with
millions of AGs?


> Resolving the Issue with Multiple Writebacks
> ============================================
> For XFS, affining inodes to writeback threads resulted in a decline
> in IOPS for certain devices. The issue was caused by AG lock contention
> in xfs_end_io, where multiple writeback threads competed for the same
> AG lock.
> To address this, we now affine writeback threads to the allocation
> group, resolving the contention issue. In best case allocation happens
> from the same AG where inode metadata resides, avoiding lock contention.

Not necessarily. The allocator can (and will) select different AGs
for an inode as the file grows and the AGs run low on space. Once
they select a different AG for an inode, they don't tend to return
to the original AG because allocation targets are based on
contiguous allocation w.r.t. existing adjacent extents, not the AG
the inode is located in.

Indeed, if a user selects the inode32 mount option, there is
absolutely no relationship between the AG the inode is located in
and the AG it's data extents are allocated in. In these cases,
using the inode resident AG is guaranteed to end up with a random
mix of target AGs for the inodes queued in that AG.  Worse yet,
there may only be one AG that can have inodes allocated in it, so
all the writeback contexts for the other hundreds of AGs in the
filesystem go completely unused...

> Similar IOPS decline was observed with other filesystems under different
> workloads. To avoid similar issues, we have decided to limit
> parallelism to XFS only. Other filesystems can introduce parallelism
> and distribute inodes as per their geometry.

I suspect that the issues with XFS lock contention are related to
the fragmentation behaviour observed (see below) massively
increasing the frequency of allocation work for a given amount of
data being written rather than increasing writeback concurrency...

> 
> IOPS and throughput
> ===================
> With the affinity to allocation group we see significant improvement in
> XFS when we write to multiple files in different directories(AGs).
> 
> Performance gains:
>   A) Workload 12 files each of 1G in 12 directories(AGs) - numjobs = 12
>     - NVMe device BM1743 SSD

So, 80-100k random 4kB write IOPS, ~2GB/s write bandwidth.

>         Base XFS                : 243 MiB/s
>         Parallel Writeback XFS  : 759 MiB/s  (+212%)

As such, the baseline result doesn't feel right - it doesn't match
my experience with concurrent sequential buffered write workloads on
SSDs. My expectation is that they'd get close to device bandwidth or
run out of copy-in CPU at somewhere over 3GB/s.

So what are you actually doing to get these numbers? What is the
benchmark (CLI and conf files details, please!), what is the
mkfs.xfs output, and how many CPUs/RAM do you have on the machines
you are testing?  i.e. please document them sufficiently so that
other people can verify your results.

Also, what is the raw device performance and how close to that are
we getting through the filesystem?

>     - NVMe device PM9A3 SSD

130-180k random 4kB write IOPS, ~4GB/s write bandwidth. So roughly
double the physical throughput of the BM1743, and ....

>         Base XFS                : 368 MiB/s
>         Parallel Writeback XFS  : 1634 MiB/s  (+344%)

.... it gets roughly double the physical throughput of the BM1743.

This doesn't feel like a writeback concurrency limited workload -
this feels more like a device IOPS and IO depth limited workload.

>   B) Workload 6 files each of 20G in 6 directories(AGs)  - numjobs = 6
>     - NVMe device BM1743 SSD
>         Base XFS                : 305 MiB/s
>         Parallel Writeback XFS  : 706 MiB/s  (+131%)
> 
>     - NVMe device PM9A3 SSD
>         Base XFS                : 315 MiB/s
>         Parallel Writeback XFS  : 990 MiB/s  (+214%)
> 
> Filesystem fragmentation
> ========================
> We also see that there is no increase in filesystem fragmentation
> Number of extents per file:

Are these from running the workload on a freshly made (i.e. just run
mkfs.xfs, mount and run benchmark) filesystem, or do you reuse the
same fs for all tests?

>   A) Workload 6 files each 1G in single directory(AG)   - numjobs = 1
>         Base XFS                : 17
>         Parallel Writeback XFS  : 17

Yup, this implies a sequential write workload....

>   B) Workload 12 files each of 1G to 12 directories(AGs)- numjobs = 12
>         Base XFS                : 166593
>         Parallel Writeback XFS  : 161554

which implies 144 files, and so over 1000 extents per file. Which
means about 1MB per extent and is way, way worse than it should be
for sequential write workloads.

> 
>   C) Workload 6 files each of 20G to 6 directories(AGs) - numjobs = 6
>         Base XFS                : 3173716
>         Parallel Writeback XFS  : 3364984

36 files, 720GB and 3.3m extents, which is about 100k extents per
file for an average extent size of 200kB. That would explain why it
performed roughly the same on both devices - they both have similar
random 128kB write IO performance...

But that fragmentation pattern is bad and shouldn't be occurring fro
sequential writes. Speculative EOF preallocation should be almost
entirely preventing this sort of fragmentation for concurrent
sequential write IO and so we should be seeing extent sizes of at
least hundreds of MBs for these file sizes.

i.e. this feels to me like you test is triggering some underlying
delayed allocation defeat mechanism that is causing physical
writeback IO sizes to collapse. This turns what should be a
bandwitdh limited workload running at full device bandwidth into an
IOPS and IO depth limited workload.

In adding writeback concurrency to this situation, it enables
writeback to drive deeper IO queues and so extract more small IO
performance from the device, thereby showing better performance for
the wrokload. The issue is that baseline writeback performance is
way below where I think it should be for the given IO workload (IIUC
the workload being run, hence questions about benchmarks, filesystem
configs and test hardware).

Hence while I certainly agree that writeback concurrency is
definitely needed, I think that the results you are getting here are
a result of some other issue that writeback concurrency is
mitigating. The underlying fragmentation issue needs to be
understood (and probably solved) before we can draw any conclusions
about the performance gains that concurrent writeback actually
provides on these workloads and devices...

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
