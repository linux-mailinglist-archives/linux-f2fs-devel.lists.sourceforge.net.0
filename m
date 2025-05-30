Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D660AC8711
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 May 2025 05:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Mime-Version:References:In-Reply-To:Message-Id:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9EwO2H5yTG57KS9XniQgcEzg0p+xvoEpyx8df2Rzec=; b=eXQXkkYC5EFEvnj3KQt1uJWunr
	VMcZGc8ca2+GjtNTfp2radaB3rKYXF4DGf5FFPlrzvaC9E7hgGW3bYCUegoFOyk/iY96aPAEH996q
	kPz+Y5A1klZFnqQWNyRvwSGyth0zv3EtsaLXi6GGMEkIZhM7XgJ4VUZ8zI4E8QC0o9vg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKqqc-00048I-1j;
	Fri, 30 May 2025 03:55:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1uKqqa-000489-Oa
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 03:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2LkW8pLuFljGIeCAazp65VucmI98VGwolK55I9VwmAY=; b=WroDDsrMQW/s/reIT/KSfa/FKy
 jLy4rEjKq10Ehz5i7uxtPbcA6Y+UC/TQGEt5H0L/uFKgclYiR6EquMzQ74sjXHa6aTSPSQIzLSnFu
 vUFl5y4aeigPvd4y8rdEJ3FdBGmQvIBHTGN7GesgnMIic3xKep3EasqQE/KSk8EYvdB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2LkW8pLuFljGIeCAazp65VucmI98VGwolK55I9VwmAY=; b=WuxW8MCObdWgm0xZcpx1GH4GPD
 YRB/oUmmKFRdXSpjQK3R6yvGXXmEQwnoVNEr8xCB3ess5/WFcNI4z/WGQHPlpnxqRR650Mcy10q/M
 51lan11qMqKtzyKiJQd7RqW3VkO9suGLpLOfjsiClVBOw2Rqaf9CzDAfW34+n53vM0tY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKqqZ-0006p8-Sq for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 03:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11C5E43740;
 Fri, 30 May 2025 03:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E1BC4CEE7;
 Fri, 30 May 2025 03:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1748576229;
 bh=OSG0k/shA7/oPeCkLIqhhJKa64IsPWc6byb8m63R2lg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uh6IdToSMXduPJ0LBRaOW7H0TbqSEGqbYCiuOrOx2biqC/urC9X8571G+b159WuzP
 B74SmCo4aL5ncirSXsWdGPWtts6XpLJpxUtR2AGvKAuDPsMDM+qhq00g5Enpi+aDKI
 Zyygr6GhtcZTYWAeHt7PJgJX93t5B4C4QvAJQFwA=
Date: Thu, 29 May 2025 20:37:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-Id: <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Headers-End: 1uKqqZ-0006p8-Sq
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com,
 hch@lst.de, dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, p.raghav@samsung.com,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 29 May 2025 16:44:51 +0530 Kundan Kumar <kundan.kumar@samsung.com> wrote:

> Currently, pagecache writeback is performed by a single thread. Inodes
> are added to a dirty list, and delayed writeback is triggered. The single
> writeback thread then iterates through the dirty inode list, and executes
> the writeback.
> 
> This series parallelizes the writeback by allowing multiple writeback
> contexts per backing device (bdi). These writebacks contexts are executed
> as separate, independent threads, improving overall parallelism.
> 
> Would love to hear feedback in-order to move this effort forward.
> 
> Design Overview
> ================
> Following Jan Kara's suggestion [1], we have introduced a new bdi
> writeback context within the backing_dev_info structure. Specifically,
> we have created a new structure, bdi_writeback_context, which contains
> its own set of members for each writeback context.
> 
> struct bdi_writeback_ctx {
>         struct bdi_writeback wb;
>         struct list_head wb_list; /* list of all wbs */
>         struct radix_tree_root cgwb_tree;
>         struct rw_semaphore wb_switch_rwsem;
>         wait_queue_head_t wb_waitq;
> };
> 
> There can be multiple writeback contexts in a bdi, which helps in
> achieving writeback parallelism.
> 
> struct backing_dev_info {
> ...
>         int nr_wb_ctx;
>         struct bdi_writeback_ctx **wb_ctx_arr;

I don't think the "_arr" adds value. bdi->wb_contexts[i]?

> ...
> };
> 
> FS geometry and filesystem fragmentation
> ========================================
> The community was concerned that parallelizing writeback would impact
> delayed allocation and increase filesystem fragmentation.
> Our analysis of XFS delayed allocation behavior showed that merging of
> extents occurs within a specific inode. Earlier experiments with multiple
> writeback contexts [2] resulted in increased fragmentation due to the
> same inode being processed by different threads.
> 
> To address this, we now affine an inode to a specific writeback context
> ensuring that delayed allocation works effectively.
> 
> Number of writeback contexts
> ===========================
> The plan is to keep the nr_wb_ctx as 1, ensuring default single threaded
> behavior. However, we set the number of writeback contexts equal to
> number of CPUs in the current version.

Makes sense.  It would be good to test this on a non-SMP machine, if
you can find one ;)

> Later we will make it configurable
> using a mount option, allowing filesystems to choose the optimal number
> of writeback contexts.
> 
> IOPS and throughput
> ===================
> We see significant improvement in IOPS across several filesystem on both
> PMEM and NVMe devices.
> 
> Performance gains:
>   - On PMEM:
> 	Base XFS		: 544 MiB/s
> 	Parallel Writeback XFS	: 1015 MiB/s  (+86%)
> 	Base EXT4		: 536 MiB/s
> 	Parallel Writeback EXT4	: 1047 MiB/s  (+95%)
> 
>   - On NVMe:
> 	Base XFS		: 651 MiB/s
> 	Parallel Writeback XFS	: 808 MiB/s  (+24%)
> 	Base EXT4		: 494 MiB/s
> 	Parallel Writeback EXT4	: 797 MiB/s  (+61%)
> 
> We also see that there is no increase in filesystem fragmentation
> # of extents:
>   - On XFS (on PMEM):
> 	Base XFS		: 1964
> 	Parallel Writeback XFS	: 1384
> 
>   - On EXT4 (on PMEM):
> 	Base EXT4		: 21
> 	Parallel Writeback EXT4	: 11

Please test the performance on spinning disks, and with more filesystems?




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
