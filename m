Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F6C3F254
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 10:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:In-Reply-To:From:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCqA4yXN5TE8I2olUffOHIWGlGK+7cvgayPnSZ4BhJI=; b=bEWX+f9crNyyZ5xAkLY1tgqvBr
	i+QVJWuhNKtwJwRqgtdAJZyhSF/4qxn3oKuciVv3Vclvm1y8dlFqEU49YjLCm3dLvyp7wMKANEAw6
	kDrs5ayMMip8tMWF4XFOLD2D3upkJxrJy405V3zOQ9dFHrinFKjZB+RWN+ZkCsY7Tm1g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHIik-0005kq-Qt;
	Fri, 07 Nov 2025 09:25:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1vHIih-0005kg-At
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 09:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u8uZZ4eKtfeKdhCl1Q4zHBINNzxY5n31tzDb1+D2ZUs=; b=DC8lvVw4auk5P1DouFuGQeu/3X
 7eEKQIVr9unFvX0yhgBNSUqkw55NDQzlpzpRC+EBtNsN23ho6s/gI4+frg0oJtN1bxaKF4mTi+OE3
 FoQ7Y2GkxJsCh6XbDnz5yE8PiAUPKTvuvSDiF5jT7/n6ibKCeKizs4+uf2Sv09MbfKqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:In-Reply-To:From:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u8uZZ4eKtfeKdhCl1Q4zHBINNzxY5n31tzDb1+D2ZUs=; b=hGWs08retD7r8spxN738YoPaU/
 YpWgF86bQRoCyjNIkYdKgJUvDj/OKTXe6ZugWN6GKd/r0M5iJBL+kEgtRCavJ6B7Ge14qywss3uPY
 p4IBEW/5y4erf31TxSmyP9IhsLYokN7I6hEyzeW0YE+x+51aDVlSm3277mN9AIOzFBag=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHIig-0002MN-7E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 09:25:23 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20251107092510epoutp04df0e680abe965f565fafc7848fa9d994~1rz4Bx2sR0793507935epoutp04G
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Nov 2025 09:25:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20251107092510epoutp04df0e680abe965f565fafc7848fa9d994~1rz4Bx2sR0793507935epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762507510;
 bh=u8uZZ4eKtfeKdhCl1Q4zHBINNzxY5n31tzDb1+D2ZUs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=nNuFq4JnvaalPuw3XSCF+FmfhR4hroJIdPSDaHbSmmalxbF06Dg/9xIUKs6+9KzFz
 +mAELlYpPRLM/VRb9troicO5aYquOMj5KfMMzbcDgQdZ0rmuNl5y5iIwuarLma8XZW
 tCVt9qc3o0mDZEE2QeTmo6c4tZqQQITd/PUA9KvM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20251107092509epcas5p39521b5623906275347b3ec7177eac680~1rz3UXgnn2572925729epcas5p39;
 Fri,  7 Nov 2025 09:25:09 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4d2tv81KkDz2SSKY; Fri,  7 Nov
 2025 09:25:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251107092507epcas5p3041edfe682f64c59ac3fe0fab4b9384b~1rz1O74AD2299222992epcas5p3F;
 Fri,  7 Nov 2025 09:25:07 +0000 (GMT)
Received: from [107.111.86.57] (unknown [107.111.86.57]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251107092447epsmtip2e07f9528cf570ebdd336a8a4571fc676~1rzi_2xUI0827208272epsmtip2i;
 Fri,  7 Nov 2025 09:24:46 +0000 (GMT)
Message-ID: <91367b76-e48b-46b4-b10b-43dfdd8472fa@samsung.com>
Date: Fri, 7 Nov 2025 14:54:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
From: Kundan Kumar <kundan.kumar@samsung.com>
In-Reply-To: <20251029085526.GA32407@lst.de>
X-CMS-MailID: 20251107092507epcas5p3041edfe682f64c59ac3fe0fab4b9384b
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area> <20251022043930.GC2371@lst.de>
 <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
 <20251029060932.GS4015566@frogsfrogsfrogs> <20251029085526.GA32407@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/29/2025 2:25 PM, Christoph Hellwig wrote: > On Tue,
 Oct 28, 2025 at 11:09:32PM -0700, Darrick J. Wong wrote: >> Was that with
 or without rtgroups? metadir/rtgroups aren't enabled by >> default y [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vHIig-0002MN-7E
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
 amir73il@gmail.com, Dave Chinner <david@fromorbit.com>, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, dave@stgolabs.net, agruenba@redhat.com,
 miklos@szeredi.hu, gost.dev@samsung.com, willy@infradead.org,
 anuj20.g@samsung.com, linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/29/2025 2:25 PM, Christoph Hellwig wrote:
> On Tue, Oct 28, 2025 at 11:09:32PM -0700, Darrick J. Wong wrote:
>> Was that with or without rtgroups?  metadir/rtgroups aren't enabled by
>> default yet so you'd have to select that manually with mkfs.xfs -m
>> metadir=1.
>>
>> (and you might still not see much change because of what hch said)
> 
> The real problem here is that even the inode number to AG association
> is just a hint, and will often go wrong on an aged file system.
> 
> Now for the zoned RT device we could probably do a thread per open
> zone, as that is a very logical association.  The problem with that
> right now is that we only pick the zone to write to once doing
> writeback, but there might be ways to lift it up.  Then again
> zoned writeback is so little code that I can't see how it would
> saturate a single thread.
> 

Predicting the Allocation Group (AG) for aged filesystems and passing
this information to per-AG writeback threads appears to be a complex
task.

For write operations without pre-allocated data blocks (fallocate=none,
resulting in DELALLOC), the next available AG is selected, and the
XFS hook can be used to predict the AG that will be allocated.

In contrast, when writing to a previously allocated data block
(fallocate default, resulting in UNWRITTEN), the AG containing the data
block is chosen. Large files that span multiple AGs can lead to a mix
of random I/O operations (DELALLOC, UNWRITTEN, MAPPED) being directed
to different AGs, while still being cached in the same page cache.

To segregate these I/O requests by AG, it is necessary to associate
AG-specific information with the pages/folios in the page cache. Two
possible approaches are:
(1) storing AG information in the folio->private field, or
(2) introducing new markers in the xarray to track AG-specific data.

The AG-affined writeback thread processes specific pages from the page 
cache marked for its AG. Is this a viable approach, or are there 
alternative solutions that could be more effective?

>>
>> --D
> ---end quoted text---
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
