Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1043D2E72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 22:55:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6fie-0003Mx-Mz; Thu, 22 Jul 2021 20:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m6fid-0003Mk-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 20:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x4BnUp9UEW5LWmdFtZgpvqc+v0qWgkew5012XidWEvY=; b=GOmbewoQCl4Nqv8747hUi8zdFX
 4H560b3iOrmq6yj0LKvG1CgodMwIySoiP1Sn7PrOqhTHgpSVSNGOmFkyyBd/WMoxTO1WQUld2DdRU
 D6Scj1ENo6Qu/NDlq6gmVNRLgFss14pOgQbfeHkH1tZaluj0ZYsevwL8kMSqQc8rPqTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x4BnUp9UEW5LWmdFtZgpvqc+v0qWgkew5012XidWEvY=; b=TKGGipl+lAMgErX466n81b0s7Z
 LoKYfuBh7cdTRsBjLisUJ968Ldz2yImTrlYxg1peEZAs16Uvupet1JnmFHOqC/RRXAtpU95Fka52L
 AXjExug6ekHYzzW4ShhzjtGVmJQX1wuMb1/tAf8yPt4tTMGSbzMTaKKBXPCLPMxCUiUk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6fiS-0002yN-8p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 20:54:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9163160EBE;
 Thu, 22 Jul 2021 20:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626987282;
 bh=5EuMpFl6Z+3vzvXgXMhAL/OynlzEKbafSFSDnWtb5XI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YU3KgggHhObzmH7NxwmsMvZMaahYqcNSFzdij3+M12WFlbIE61BUFBb03luwzZ8IP
 e7bjCkFn/rYn2hH/aGkg4WlQkld69KIBxoQXBeavZN60Ja9HzBZ4TmRCfhro9pJKki
 szl9E3vi31VhvUr1JtY8hhNsStDVxV3Hs2AsTSbsx7W+Cd/DeYaorN87RFcS50HHqD
 hBOHBWDVN//MKdXaWq/sooa1+iR+qto7QADxf7/5CqSdgTU7yxkd7pQvCSXsfWCVYd
 ahxmkk7Q6ecLhiYskxNtm4HDt/NopKN7aOsFsHp03ZzrO3CgOEsA201qDKtQNpr1Pl
 E7VA/ky2AixWQ==
Date: Thu, 22 Jul 2021 13:54:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YPnbEdVxClWwatKz@gmail.com>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-7-ebiggers@kernel.org>
 <YPU+3inGclUtcSpJ@infradead.org> <YPnZa5dFVP7vtB9q@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPnZa5dFVP7vtB9q@google.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6fiS-0002yN-8p
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: implement iomap operations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 01:47:39PM -0700, Jaegeuk Kim wrote:
> On 07/19, Christoph Hellwig wrote:
> > On Fri, Jul 16, 2021 at 09:39:16AM -0500, Eric Biggers wrote:
> > > +static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
> > > +				    struct bio *bio, loff_t file_offset)
> > > +{
> > > +	struct f2fs_private_dio *dio;
> > > +	bool write = (bio_op(bio) == REQ_OP_WRITE);
> > > +
> > > +	dio = f2fs_kzalloc(F2FS_I_SB(inode),
> > > +			sizeof(struct f2fs_private_dio), GFP_NOFS);
> > > +	if (!dio)
> > > +		goto out;
> > > +
> > > +	dio->inode = inode;
> > > +	dio->orig_end_io = bio->bi_end_io;
> > > +	dio->orig_private = bio->bi_private;
> > > +	dio->write = write;
> > > +
> > > +	bio->bi_end_io = f2fs_dio_end_io;
> > > +	bio->bi_private = dio;
> > > +
> > > +	inc_page_count(F2FS_I_SB(inode),
> > > +			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> > > +
> > > +	return submit_bio(bio);
> > 
> > I don't think there is any need for this mess.  The F2FS_DIO_WRITE /
> > F2FS_DIO_READ counts are only used to check if there is any inflight
> > I/O at all.  So instead we can increment them once before calling
> > iomap_dio_rw, and decrement them in ->end_io or for a failure/noop
> > exit from iomap_dio_rw.  Untested patch below.  Note that all this
> > would be much simpler to review if the last three patches were folded
> > into a single one.
> 
> Eric, wdyt?
> 
> I've merged v1 to v5, including Christoph's comment in v2.
> 

I am planning to do this, but I got caught up by the patch
"f2fs: fix wrong inflight page stats for directIO" that was recently added to
f2fs.git#dev, which makes this suggestion no longer viable.  Hence my review
comment on that patch
(https://lkml.kernel.org/r/YPjNGoFzQojO5Amr@sol.localdomain)
and Chao's new version of that patch
(https://lkml.kernel.org/r/20210722131617.749204-1-chao@kernel.org),
although the new version has some issues too as I commented.

If you could just revert "f2fs: fix wrong inflight page stats for directIO"
for now, that would be helpful, as I don't think we want it.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
