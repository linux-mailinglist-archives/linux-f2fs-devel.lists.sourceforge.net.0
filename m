Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE878A18B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 22:46:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaMdx-0003oE-Er;
	Sun, 27 Aug 2023 20:45:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qaMdw-0003o8-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 20:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b31OO6Xd9+jxzKw5QB3n4d33iA6sZ4nPi+nMylKSno4=; b=eGUZjJ3YUlVYRV093I+t2xqBx1
 wJRHC2dZX2GRUR1IITmhmIm9lSYqwVdntEkbxh02HvorJIWaGCD2vNVUWkfRP/PDraIZgVZboakNk
 DXrgWWAkUGMsqJlPbhY+FwdBPK4P7SCPulV833SG+6AzH0MbEtrnT1DJlefFtzRXcfbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b31OO6Xd9+jxzKw5QB3n4d33iA6sZ4nPi+nMylKSno4=; b=IxmjDWqmZ0w/thUK9pDTrc96Uc
 zprAQ+LiP0HZDVJNMLAZhZNpTryigwKrbcITf6AD/zqmDN7GpdHRGCCbfACv3vgc7x8HBob7XL5y3
 6NNWuraWIvYwvXCQsM2/iu7qVUT0ax1sPZh4jgzQI70Wl2sgggGqfVSGYk/5imk0gj2Y=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaMdt-0003Rd-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 20:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b31OO6Xd9+jxzKw5QB3n4d33iA6sZ4nPi+nMylKSno4=; b=rh2eHyjfSChvP5M3GZFqng0djt
 iCSjqmEmDczFMnSTrKUt8mmVXGPGgbJ4oq2lIEXyRSbFH+YR4YMUxP/z9QQKohjOoCQZks3WE0IMK
 3S4hJ/QxWWGwrLIXBI8vnsgZg3HMNGIE+hIRemTa2iQvkDDHCCMd0yz1djBYQiyi1qOQAKg4GjHdy
 fEL5cINLesPqAO5iR1xTPAPnXU+iFHAHJEGUTx86DeTnZzv1uxgeaR21j4BV+7nscvIXdd9sVE/Si
 rCIGIbVvaskI417AUCK4HwQeBGpvqIcrg+ypempVGeBQFeEiZBUSg5QboubLY+HaM/1Y954EFPxgD
 hXmevJ/g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qaMcv-00Dkeb-PH; Sun, 27 Aug 2023 20:44:53 +0000
Date: Sun, 27 Aug 2023 21:44:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOu1xYS6LRmPgEiV@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-3-hao.xu@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote: >
 +++ b/fs/xfs/libxfs/xfs_da_btree.c > @@ -2643, 16 +2643, 32 @@ xfs_da_read_buf(
 > struct xfs_buf_map map, *mapp = &map; > int nmap = 1; > int er [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qaMdt-0003Rd-W1
Subject: Re: [f2fs-dev] [PATCH 02/11] xfs: add NOWAIT semantics for readdir
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
> +++ b/fs/xfs/libxfs/xfs_da_btree.c
> @@ -2643,16 +2643,32 @@ xfs_da_read_buf(
>  	struct xfs_buf_map	map, *mapp = &map;
>  	int			nmap = 1;
>  	int			error;
> +	int			buf_flags = 0;
>  
>  	*bpp = NULL;
>  	error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
>  	if (error || !nmap)
>  		goto out_free;
>  
> +	/*
> +	 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
> +	 * issue IO for this buffer if it is not already in memory. Caller will
> +	 * retry. This will return -EAGAIN if the buffer is in memory and cannot
> +	 * be locked, and no buffer and no error if it isn't in memory.  We
> +	 * translate both of those into a return state of -EAGAIN and *bpp =
> +	 * NULL.
> +	 */

I would not include this comment.

> +	if (flags & XFS_DABUF_NOWAIT)
> +		buf_flags |= XBF_TRYLOCK | XBF_INCORE;
>  	error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
>  			&bp, ops);

what tsting did you do with this?  Because you don't actually _use_
buf_flags anywhere in this patch (presumably they should be the
sixth argument to xfs_trans_read_buf_map() instead of 0).  So I can only
conclude that either you didn't test, or your testing was inadequate.

>  	if (error)
>  		goto out_free;
> +	if (!bp) {
> +		ASSERT(flags & XFS_DABUF_NOWAIT);

I don't think this ASSERT is appropriate.

> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>  				bp = NULL;
>  			}
>  
> -			if (*lock_mode == 0)
> -				*lock_mode = xfs_ilock_data_map_shared(dp);
> +			if (*lock_mode == 0) {
> +				*lock_mode =
> +					xfs_ilock_data_map_shared_generic(dp,
> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> +				if (!*lock_mode) {
> +					error = -EAGAIN;
> +					break;
> +				}
> +			}

'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
And this is far too far indented.

			xfs_dir2_lock(dp, ctx, lock_mode);

with:

STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
		unsigned int lock_mode)
{
	if (*lock_mode)
		return;
	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
		return xfs_ilock_data_map_shared_nowait(dp);
	return xfs_ilock_data_map_shared(dp);
}

... which I think you can use elsewhere in this patch (reformat it to
XFS coding style, of course).  And then you don't need
xfs_ilock_data_map_shared_generic().



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
