Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6339C193BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 09:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MJXkMRQK5LutMFK/1WmjNhSZE49CThGVR+3thEjYvE=; b=PEkcnZbjQNhoumgl8wzT75KdxT
	W/9ImcevYGWN3h3pf2jiT9ES2dPOBmXy2215u9xTEtW9GFdz2SO3SBQVPI51jk+pAxIAbdegsADj2
	JtKIhxh0kBop8pq7kRlF9zoOe7y///arH+WFaP7bseGh90eT3dudHenTZWQn9NTkWVps=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE1y9-0007CQ-WB;
	Wed, 29 Oct 2025 08:55:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vE1y2-0007C2-A9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 08:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xT4pORLfqaLby9rFuKhU+xXPmsubSSO5lJI7u2+zXvQ=; b=lfUhrQ1RILRliBtPMgwan/IOGo
 gCFsN00fvXd3O9X7MXoK/BH4gK3LOl8V4BR5L/w69IyhRwga3XLms+QaygUORt0OKIbD2bPIGdn3r
 vuJFBdVa6cjnjBLzp7O3avPxP0BaWlNP2VU1gsQzdH0PgyQTFzpkdh1l7bl8JSK9A6Mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xT4pORLfqaLby9rFuKhU+xXPmsubSSO5lJI7u2+zXvQ=; b=d57YZZ07kEyhaCHrQHU4YVai5P
 6W6TMJoiUleXOQekBChDsLNR5/iOIrRdqw5WQnR/WX1f8Yl5ZBRlPqsuvIxUw0SKjFMWGSDnAwUSy
 ngiLWO13ga3xcVTdM4pCJjFChCCxTSzSUbDZh9GpTXqTjlCLORxCyUDRXiFxys/ihA5Y=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vE1y2-00069K-CX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 08:55:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id AEDD8227A88; Wed, 29 Oct 2025 09:55:26 +0100 (CET)
Date: Wed, 29 Oct 2025 09:55:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20251029085526.GA32407@lst.de>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area> <20251022043930.GC2371@lst.de>
 <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
 <20251029060932.GS4015566@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029060932.GS4015566@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 28, 2025 at 11:09:32PM -0700, Darrick J. Wong
 wrote: > Was that with or without rtgroups? metadir/rtgroups aren't enabled
 by > default yet so you'd have to select that manually with mkfs.x [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vE1y2-00069K-CX
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
 linux-mm@kvack.org, clm@meta.com, Christoph Hellwig <hch@lst.de>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 anuj20.g@samsung.com, linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 28, 2025 at 11:09:32PM -0700, Darrick J. Wong wrote:
> Was that with or without rtgroups?  metadir/rtgroups aren't enabled by
> default yet so you'd have to select that manually with mkfs.xfs -m
> metadir=1.
> 
> (and you might still not see much change because of what hch said)

The real problem here is that even the inode number to AG association
is just a hint, and will often go wrong on an aged file system.

Now for the zoned RT device we could probably do a thread per open
zone, as that is a very logical association.  The problem with that
right now is that we only pick the zone to write to once doing
writeback, but there might be ways to lift it up.  Then again
zoned writeback is so little code that I can't see how it would
saturate a single thread.

> 
> --D
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
