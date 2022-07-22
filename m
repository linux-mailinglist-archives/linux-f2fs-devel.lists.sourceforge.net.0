Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDF57E331
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 16:44:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEtt2-0000SM-OU; Fri, 22 Jul 2022 14:44:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kbusch@kernel.org>) id 1oEtt1-0000SB-UW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 14:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gYsYxrPvuiBbzd+al2cbD2TRXSGDQML3v6jK8tjh5c=; b=P1id7KPz9t056Vj+9qAq43Ruqj
 /AKpWK5oijgulFnpMlX8H9qZvysFFYGYbbO8DDsDe/R2LFHrweVWJQD077ojN3gplz2V+AHixr8+1
 EGeF7nQ+9cEHAqJp2JJ1nyJOUOjmvronHHOn9v70g4ExGZXuJBCvoiu2kpX92RQQUM3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gYsYxrPvuiBbzd+al2cbD2TRXSGDQML3v6jK8tjh5c=; b=RzmX1OjlDhCFNCc8YiEcflFCiL
 K4Vclmgd3RWjHAX/UrYXrAYjFDLqIh3B2dOi1TDGX5KM1rRBdWsCdHt4u0p60Inob4uP6vG1qheVm
 wIpAj1rQp3Q17NUz+8fE0uje0oJLfWeXZVsjFMbYYGsX7EyNZvgtZ42Z3KmUV/qARGGA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEtsx-0005AR-Se
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 14:44:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4E538CE28AA;
 Fri, 22 Jul 2022 14:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EC7C341C6;
 Fri, 22 Jul 2022 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658501039;
 bh=yPbtlfcebw3+LnEiJK9sg6Qtzsu5e//uacihRKgLA/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fzyv5cSdRlKSih5P52FGvi8U6V6oC+eoqT6jqZ8GXtla5rsAqKnFy3Uj5VxGvEWbA
 0kLiSCqxH9hywk5fs0j17upKGGOy7nz8f5701luax7PPptzaBevYcR6RF5EHBpV+mS
 ZoNBnqZqHZOssOPG5NWzMKAKsNqfZljW17y41PtA3qpqiyRK2GKkB7lCEwaPhV7yNt
 lzK4RdovLA/1ibDjgNEM+ekmNCtjPTAXIPJ+b6aHrYsuk83U2RHm16xn9OORXfL5MC
 MsfYfxgpNtndzVEgwehTawZs0WtxCn2oE2ehnTw2ueVQUcLEulqGYMPhDuDn2kOV+a
 vOwNseyBPTfYg==
Date: Fri, 22 Jul 2022 08:43:55 -0600
From: Keith Busch <kbusch@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Ytq3qwTBTRRxBfXv@kbusch-mbp.dhcp.thefacebook.com>
References: <20220610195830.3574005-1-kbusch@fb.com>
 <20220610195830.3574005-12-kbusch@fb.com>
 <YtpTYSNUCwPelNgL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtpTYSNUCwPelNgL@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEtsx-0005AR-Se
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
 Keith Busch <kbusch@fb.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Kernel Team <Kernel-team@fb.com>, hch@lst.de
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

It looks like f2fs just falls back to buffered IO for this condition without
reaching the new code in iomap_dio_bio_iter(). btrfs does the same thing
(check_direct_IO()).  Is that a problem?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
