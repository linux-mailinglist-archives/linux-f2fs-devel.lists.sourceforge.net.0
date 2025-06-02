Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC54ACB166
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 16:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS+1KbJ3J9jUCuX+BJlqGQU9U7IUtwm4uwpS1Dh0BNg=; b=FSE/hZMMck7G3VHuVm8KbW3yWu
	DwTl4ZKmZvQJC/zKF8FzFbcCujLiX7kL+HmGZcDRDoYBYHAPTY2nz0XjtFGFx9c08z105WwYGek4O
	HDDsJMbR5919cMn2ayZqUi9exPua4+EduqB+bX5SvTkXkVQGsXqwerxQC7CsIzsc5U8o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM60Y-00069d-Jp;
	Mon, 02 Jun 2025 14:19:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uM60W-00069V-Ns
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=32enGM4pZj92pLRTC2laWAPPMMGLKlbi51pBb1slNZ0=; b=MvwuI5I6zasV/xDTopzhD+loaV
 8hOgiuJS0RR2/7kd+uTIv5r6VuctiEPa6+jvIeDe+KChfY9zggYkMQ+t0BQciZG4QETxZRctKA9Tq
 NG66yIyKWecyDioxRJLNHjD4MKQHwGtOAAZPuOJw1/QR7LZOkuSnci4J3JRj7wZzE3jQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=32enGM4pZj92pLRTC2laWAPPMMGLKlbi51pBb1slNZ0=; b=X6cvdGnQ6MWPgmGCcWq4R5wWJN
 UC9wJbfYgdnbYZsz1rBMr8GiMzWnawUj9p98X/mT49FhTXI1n2CmeYA11mU1Zw93jzhNlikp2mr+g
 +8RRzvTe9OkEYmezoEITG33AwpYwxV8KWBimDl7jHogjT855/D3XCckfa0FUV9FYzYkI=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM60V-0002CA-Mt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 14:19:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id D587968C7B; Mon,  2 Jun 2025 16:19:04 +0200 (CEST)
Date: Mon, 2 Jun 2025 16:19:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20250602141904.GA21996@lst.de>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Headers-End: 1uM60V-0002CA-Mt
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
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 29, 2025 at 04:44:51PM +0530, Kundan Kumar wrote:
> Number of writeback contexts
> ===========================
> The plan is to keep the nr_wb_ctx as 1, ensuring default single threaded
> behavior. However, we set the number of writeback contexts equal to
> number of CPUs in the current version. Later we will make it configurable
> using a mount option, allowing filesystems to choose the optimal number
> of writeback contexts.

Well, the proper thing would be to figure out a good default and not
just keep things as-is, no?

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

What worksload was this?

How many CPU cores did the system have, how many AGs/BGs did the file
systems have?   What SSD/Pmem was this?  Did this change the write
amp as measure by the media writes on the NVMe SSD?

Also I'd be really curious to see numbers on hard drives.

> We also see that there is no increase in filesystem fragmentation
> # of extents:
>   - On XFS (on PMEM):
> 	Base XFS		: 1964
> 	Parallel Writeback XFS	: 1384
> 
>   - On EXT4 (on PMEM):
> 	Base EXT4		: 21
> 	Parallel Writeback EXT4	: 11

How were the number of extents counts given that they look so wildly
different?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
