Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D07BDBF87
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 03:19:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Mime-Version:References:In-Reply-To:Message-Id:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGOImyAp0WcjecVcqU3mI1m8HVMGxVs/JHoQgtJM4gk=; b=e/co+O0JP/uAAUlVxVn0T8i/fU
	h+nYAuOUdudwrrUNznYF12QXq/iNwxLVUHHF5+I6NF1LMY8l3GL8wgBWnUvOC/igXPgsXzTx9Vgwr
	JH7EI0bCF3XODvLO097BgYqxhoogBcbFAZ2xUvTHCC9qkiboam9ChdyfuXDfRGew99vg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8qAd-0008Ew-Rf;
	Wed, 15 Oct 2025 01:19:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1v8qAc-0008Eq-8Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 01:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jd8JoSwYJ3bPuRm6iTGouCOCT+zSKviknwUe1ePUhdI=; b=Mkm4xQGjsn5rcNbsQe9lVB/hJ7
 tre6oUOvjfMoryhT16bjTJg+mrnFUfWLYeuhK7Stzmns7XCSBK4tpWZkjxlQh2UfBYS+DjBReNcnj
 f2YovHFfml7VxP03VmtimD3jbjFGZvVV1zj08GgWvvZP0pwC7oaqJAfTcveddAsv4364=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jd8JoSwYJ3bPuRm6iTGouCOCT+zSKviknwUe1ePUhdI=; b=ZQP+Hn0jTTgAwqDMNVfd/Mr+2i
 WPSpXjSwPmXJxC696HmxviWGuWmkomcW28dBOW+OLJZeLimGkiHqxW9WCwWKsiSNxPsk2UnIltzee
 44X/YAMfMvQHy1X/uafaI6OJOxTjr8UrUsg5KRB2L4NjzhUs3RHlbCHw96x+okW2xvRo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8qAb-0006HX-IU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 01:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F3F1D60251;
 Wed, 15 Oct 2025 01:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5719AC4CEE7;
 Wed, 15 Oct 2025 01:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1760490194;
 bh=RREgf6Gg7wwMbGdc/AWZnTykON32Sl+5JqxT1WhtNd8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b6hAzcK9a6ZsHa0Mk3iI21Eqpc+IV+6ztwUn4mhqw/zL741FObJn7o/U9JxPSucFA
 SEs+LS9B625yiZiRfHBLry2rSnVIcwt334tzjVqkWVwgBsNZDdhpSWaH5YoM+Re3XR
 MVE+EarzW3FoEwNNGRRa6truUMvxx/+8yivIASe4=
Date: Tue, 14 Oct 2025 18:03:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-Id: <20251014180312.6917d7bd5681d4c8ca356691@linux-foundation.org>
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue,
 14 Oct 2025 17:38:29 +0530 Kundan Kumar <kundan.kumar@samsung.com>
 wrote: > Currently, pagecache writeback is performed by a single thread.
 Inodes > are added to a dirty list, and delayed writeback is triggered. The
 single > writeback thread then iterates through the dirty [...] 
 Content analysis details:   (-1.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1v8qAb-0006HX-IU
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
 djwong@kernel.org, amir73il@gmail.com, david@fromorbit.com,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com, hch@lst.de,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, anuj20.g@samsung.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 14 Oct 2025 17:38:29 +0530 Kundan Kumar <kundan.kumar@samsung.com> wrote:

> Currently, pagecache writeback is performed by a single thread. Inodes
> are added to a dirty list, and delayed writeback is triggered. The single
> writeback thread then iterates through the dirty inode list, and executes
> the writeback.
> 
> This series parallelizes the writeback by allowing multiple writeback
> contexts per backing device (bdi). These writeback contexts are executed
> as separate, independent threads, improving overall parallelism. Inodes
> are distributed to these threads and are flushed in parallel.
> 
> ...
>
> IOPS and throughput
> ===================
> With the affinity to allocation group we see significant improvement in
> XFS when we write to multiple files in different directories(AGs).
> 
> Performance gains:
>   A) Workload 12 files each of 1G in 12 directories(AGs) - numjobs = 12
>     - NVMe device BM1743 SSD
>         Base XFS                : 243 MiB/s
>         Parallel Writeback XFS  : 759 MiB/s  (+212%)
> 
>     - NVMe device PM9A3 SSD
>         Base XFS                : 368 MiB/s
>         Parallel Writeback XFS  : 1634 MiB/s  (+344%)
> 
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
>   A) Workload 6 files each 1G in single directory(AG)   - numjobs = 1
>         Base XFS                : 17
>         Parallel Writeback XFS  : 17
> 
>   B) Workload 12 files each of 1G to 12 directories(AGs)- numjobs = 12
>         Base XFS                : 166593
>         Parallel Writeback XFS  : 161554
> 
>   C) Workload 6 files each of 20G to 6 directories(AGs) - numjobs = 6
>         Base XFS                : 3173716
>         Parallel Writeback XFS  : 3364984

Nice results.  Is testing planned for other filesystems?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
