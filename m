Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0357E605
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 19:54:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEwqe-0005g7-W1; Fri, 22 Jul 2022 17:53:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1oEwqd-0005fx-F4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 17:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uxng6bKCwV+3WFR5Qlo4h/csnyoaQJYkWW63EVrbAyw=; b=SCb3JGiNYaimB9nairpms+6NOM
 qzxPz83fRrpbMYr5Xo7yI90V10zTGEeTnRLUU3sNaoOVBo7eBvnS3zZ2T/Xw9DzqGqjAN1VB04v9i
 qKj9xaeWmlFl4hyLrOkzUliewGxzE4ULhP6LT2ip8J3pIHANRfN+c75MN4PXs2WH1SFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uxng6bKCwV+3WFR5Qlo4h/csnyoaQJYkWW63EVrbAyw=; b=ApJ9o+ZchJ/7nEiF57mh5SDDwb
 SfNl8+cbxF7D4pFlKBR3onq5nmPHLAWqAHHwVq9Bj2JwiXu3zoBYnPUOMrYcVUsn4f0bfl6ULPqVr
 8zeN5vLHIUYLR1oXGJdvcCnI9EpE4KVXdVjpVgGDXeW0ramc2lFo9DPKXol67WtUEFw4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEwqV-0004cx-Hw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 17:53:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68F24B829D7;
 Fri, 22 Jul 2022 17:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D11C341C6;
 Fri, 22 Jul 2022 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658512423;
 bh=aH7ipXW19B/cULTLHxU4tydKYD6QhKFE7T4q2uxNrD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ReHgVOJpZKkP8HvxXgI8IsZJv0mIyKP0Mjwfjkhr5FHHBqffXTErE4bbmZgLLCYP6
 T+AE/FUOtdZbf4fdoggWfrm1qgbi1RlTjVyOjI9Z8n6fzYkt1v0RMuPcTKmY5UGldb
 0w0gyYORBFfJbzFD1SC7Q8HepbsRIsZP48nbunzpuz14/9fQ8xa/ToiWWAl03lPRjl
 boz3BJp2x6s0EwT4/FOr/qSpDj6+P/DUYCgt0uRcxuQAd97BvrRkcjYj27IASzCiVo
 8OmtMEd1bmqXw17QzW/EfL5y20ycJKL4DAc6ySKI5JQatsDZDy13YoHtxWrLLV3RVI
 CIAGt0syvJzcw==
Date: Fri, 22 Jul 2022 10:53:42 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YtrkJgwOmCGqPO3E@magnolia>
References: <20220610195830.3574005-1-kbusch@fb.com>
 <20220610195830.3574005-12-kbusch@fb.com>
 <YtpTYSNUCwPelNgL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtpTYSNUCwPelNgL@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 22, 2022 at 12:36:01AM -0700, Eric Biggers wrote:
 > [+f2fs list and maintainers] > > On Fri, Jun 10, 2022 at 12:58:30PM -0700,
 Keith Busch wrote: > > From: Keith Busch <kbusch@kernel.org> [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEwqV-0004cx-Hw
Subject: Re: [f2fs-dev] [PATCHv6 11/11] iomap: add support for dma aligned
 direct-io
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
Cc: axboe@kernel.dk, bvanassche@acm.org, pankydev8@gmail.com,
 damien.lemoal@opensource.wdc.com, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Keith Busch <kbusch@fb.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Kernel Team <Kernel-team@fb.com>, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 22, 2022 at 12:36:01AM -0700, Eric Biggers wrote:
> [+f2fs list and maintainers]
> 
> On Fri, Jun 10, 2022 at 12:58:30PM -0700, Keith Busch wrote:
> > From: Keith Busch <kbusch@kernel.org>
> > 
> > Use the address alignment requirements from the block_device for direct
> > io instead of requiring addresses be aligned to the block size.
> > 
> > Signed-off-by: Keith Busch <kbusch@kernel.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/iomap/direct-io.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> > index 370c3241618a..5d098adba443 100644
> > --- a/fs/iomap/direct-io.c
> > +++ b/fs/iomap/direct-io.c
> > @@ -242,7 +242,6 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
> >  	struct inode *inode = iter->inode;
> >  	unsigned int blkbits = blksize_bits(bdev_logical_block_size(iomap->bdev));
> >  	unsigned int fs_block_size = i_blocksize(inode), pad;
> > -	unsigned int align = iov_iter_alignment(dio->submit.iter);
> >  	loff_t length = iomap_length(iter);
> >  	loff_t pos = iter->pos;
> >  	unsigned int bio_opf;
> > @@ -253,7 +252,8 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
> >  	size_t copied = 0;
> >  	size_t orig_count;
> >  
> > -	if ((pos | length | align) & ((1 << blkbits) - 1))
> > +	if ((pos | length) & ((1 << blkbits) - 1) ||
> > +	    !bdev_iter_is_aligned(iomap->bdev, dio->submit.iter))

How does this change intersect with "make statx() return DIO alignment
information" ?  Will the new STATX_DIOALIGN implementations have to be
adjusted to set stx_dio_mem_align = bdev_dma_alignment(...)?

I'm guessing the answer is yes, but I haven't seen any patches on the
list to do that, but more and more these days email behaves like a flood
of UDP traffic... :(

--D

> >  		return -EINVAL;
> >  
> >  	if (iomap->type == IOMAP_UNWRITTEN) {
> 
> I noticed that this patch is going to break the following logic in
> f2fs_should_use_dio() in fs/f2fs/file.c:
> 
> 	/*
> 	 * Direct I/O not aligned to the disk's logical_block_size will be
> 	 * attempted, but will fail with -EINVAL.
> 	 *
> 	 * f2fs additionally requires that direct I/O be aligned to the
> 	 * filesystem block size, which is often a stricter requirement.
> 	 * However, f2fs traditionally falls back to buffered I/O on requests
> 	 * that are logical_block_size-aligned but not fs-block aligned.
> 	 *
> 	 * The below logic implements this behavior.
> 	 */
> 	align = iocb->ki_pos | iov_iter_alignment(iter);
> 	if (!IS_ALIGNED(align, i_blocksize(inode)) &&
> 	    IS_ALIGNED(align, bdev_logical_block_size(inode->i_sb->s_bdev)))
> 		return false;
> 
> 	return true;
> 
> So, f2fs assumes that __iomap_dio_rw() returns an error if the I/O isn't logical
> block aligned.  This patch changes that.  The result is that DIO will sometimes
> proceed in cases where the I/O doesn't have the fs block alignment required by
> f2fs for all DIO.
> 
> Does anyone have any thoughts about what f2fs should be doing here?  I think
> it's weird that f2fs has different behaviors for different degrees of
> misalignment: fail with EINVAL if not logical block aligned, else fallback to
> buffered I/O if not fs block aligned.  I think it should be one convention or
> the other.  Any opinions about which one it should be?
> 
> (Note: if you blame the above code, it was written by me.  But I was just
> preserving the existing behavior; I don't know the original motivation.)
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
