Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C495FC1862B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 07:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnJUKadv4HVIq3npNGCrNzXh6/Z2beiTK1pWAfBk9oY=; b=DqewiPJnACjuOtn02ZDMy7jleL
	/8xuUYZG1Ap5Zx+2F2NcZMXzOJ0X1g4blTfA7sRNQiYUwTanLolvBKs5EWpuCL0wbUW59kDtBahgi
	giPt+oeNqPn0nSdHW/RC2OrSQw3bbNmv4PzbhdxcYwC9zKwVKTDRQpJ/DXM/8oTjOJIk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDzNR-0001Ax-T8;
	Wed, 29 Oct 2025 06:09:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vDzNQ-0001Ar-Db
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 06:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q2S7P56jzAj0RQfiBXUJ1E/mSO50DPnJhIS/kgymulE=; b=Gj8DfwTJtGmqI2YP5ffAXsnXkK
 l1729qC36AY5IxGNjmtJgmWr16UfaTh8VQY1XFPFb5AQekH9VTzSRtjZ6BDmGblMZvLbg5kngvKgF
 sTPhiHguRHH4KLIX2Q2p46ug9p6innRFwWwisjqHN2qxaBJjQC0ZwQdOFZCZQeUPrDns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q2S7P56jzAj0RQfiBXUJ1E/mSO50DPnJhIS/kgymulE=; b=Pw7RKZTkv9DX5yV+fwhmwzXWUW
 yIUVi8VbvCs8KPtaZ11oemMDsAJT9dg0K+K4XEZR/M0Ns15pry0r99dWUynR5u9nM7NJq1vx/rSnb
 BxRBDzRFRB4EtCK8tGRvG1FpwLdA/oxPbXwXjp/2p2DRyLKGrLp4aU7/8ItYx3B79ggU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDzNQ-0004cV-0Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 06:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5256C605CC;
 Wed, 29 Oct 2025 06:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AD4C4CEF7;
 Wed, 29 Oct 2025 06:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761718173;
 bh=KhUCwoEAjcKURljQn6Z5eULKXiBUNQeiGlQ0+eSZ1+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jv8axgsk0a3r/K6s7anKOkdMHyoV9M9ohNLW6Pl1/bQB2ujsqML/NoQhhejBmqaK3
 86Xp9WXDrWll1/0uizzBMXVWnxjT6M1yQXWhR/dtFAgXer1cs0/+gCJokbdV+U+R7j
 rh+bSqMZejs5VHCLhtFXE+64+ISmcgtS1QgL9x108T5fFxUd17eLyFDWoTYmrq7fm/
 VeqiahI9+MlKVwQ85vBqNlyTiOFo7DuhfqFp7iQWb7Tzt1SRshl6CLVMWIgK5bNXru
 C3dGfWC2R7UhQIz7c+PDEO0phQxrW7dVvcP9VhkDolbrbTYJpovNOzg2NZKZDgxt/m
 /E7EbpFdhc1wg==
Date: Tue, 28 Oct 2025 23:09:32 -0700
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20251029060932.GS4015566@frogsfrogsfrogs>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area>
 <20251022043930.GC2371@lst.de>
 <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 29, 2025 at 11:35:21AM +0530, Kundan Kumar wrote:
 > On 10/22/2025 10:09 AM, Christoph Hellwig wrote: > > On Tue, Oct 21, 2025
 at 09:46:30AM +1100, Dave Chinner wrote: > >> Not necessarily. [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDzNQ-0004cV-0Z
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 amir73il@gmail.com, Dave Chinner <david@fromorbit.com>, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, Christoph Hellwig <hch@lst.de>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, anuj20.g@samsung.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 29, 2025 at 11:35:21AM +0530, Kundan Kumar wrote:
> On 10/22/2025 10:09 AM, Christoph Hellwig wrote:
> > On Tue, Oct 21, 2025 at 09:46:30AM +1100, Dave Chinner wrote:
> >> Not necessarily. The allocator can (and will) select different AGs
> >> for an inode as the file grows and the AGs run low on space. Once
> >> they select a different AG for an inode, they don't tend to return
> >> to the original AG because allocation targets are based on
> >> contiguous allocation w.r.t. existing adjacent extents, not the AG
> >> the inode is located in.
> > 
> > Also, as pointed out in the last discussion of this for the RT
> > subvolume there is zero relation between the AG the inode is in
> > and the data placement.
> > 
> > 
> I evaluated the effect of parallel writeback on realtime inodes and
> observed no improvement in IOPS. We can limit writes for realtime
> inodes to utilize a single default (0) writeback context. Do you
> see it differently?

Was that with or without rtgroups?  metadir/rtgroups aren't enabled by
default yet so you'd have to select that manually with mkfs.xfs -m
metadir=1.

(and you might still not see much change because of what hch said)

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
