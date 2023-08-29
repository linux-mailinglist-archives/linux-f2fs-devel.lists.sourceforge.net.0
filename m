Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B951278C4CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 15:06:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qayQ4-0005Dt-5P;
	Tue, 29 Aug 2023 13:06:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qayQ1-0005Dl-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 13:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RchKoATVAdQvPJfSjQ7igQ4w+5FVPwMefhSLf5vYpSI=; b=kGfUKXifxYp7zvQ/UsdueZ4ge2
 hIyueSLqVwUiCMCZi7sdPqRGbPt/qU4qUJP7ZoWsAypLm8eQyyzw+ooFxtLa4trX5ZEuCru/oAqdc
 ZtGRauDWO6Kv5dw2wkaH7MvzMFD1EdH/zUuiBbHakvwlSKBWM0NdTa7cf34QvHkGvsh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RchKoATVAdQvPJfSjQ7igQ4w+5FVPwMefhSLf5vYpSI=; b=g+I9Xt5cczYuUI8sszmP31AfV7
 KZhFZXvaKnFiu+MGWzXndNqxRk2ol984nnjN/bBRNoOcPasODBRvZu9IimUSGqQgG1xcsZE23pqQ7
 poFn75Dypjx6Zs8+QW59j81SQVwhiM2lJP6SG7GSyUEcriMDAd9VRaMGJ0QEp3PrdOGA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qayPt-0008Ky-KP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 13:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RchKoATVAdQvPJfSjQ7igQ4w+5FVPwMefhSLf5vYpSI=; b=Q3QmRgXTehCOZCVueX+FS2Az5N
 PVqmWnEC5SOyltZJNMDkbuPj3BuxIKobdTkUGJdkwt9An23qab7RWIeUTJvkRcM5ZQw7A9VajHpfv
 K7r2l3ZZ2pGC+tetoYQU12TmTvlZI3sm3ayVKtCD8x7/yd2j9SuUz7gnHbMb8LXGAJC6qfT96aNHD
 /+KAN9szQKpq1/b+zh8evtWeBszURne3cpQtIIZ5DUWss+rP/RkNTx5Y/tCCASZPZaSLUEyAkYJWx
 0SrCGJoWwn5s3UmnWTZbObVE6DrneAPDreiurlPZ6M22SpYEkwQtVmJFqXgm29PIZAfXouLOFvP7I
 44OUuuBQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qayP8-006i8Z-JC; Tue, 29 Aug 2023 13:05:10 +0000
Date: Tue, 29 Aug 2023 14:05:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZO3tBqJLtRwSYrEr@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
 <ZOu1xYS6LRmPgEiV@casper.infradead.org>
 <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 29, 2023 at 03:41:43PM +0800, Hao Xu wrote: >
 On 8/28/23 04:44, Matthew Wilcox wrote: > > > @@ -391, 10 +401,
 17 @@ xfs_dir2_leaf_getdents(
 > > > bp = NULL; > > > } > > > - if (*lock_mode == [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qayPt-0008Ky-KP
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

On Tue, Aug 29, 2023 at 03:41:43PM +0800, Hao Xu wrote:
> On 8/28/23 04:44, Matthew Wilcox wrote:
> > > @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
> > >   				bp = NULL;
> > >   			}
> > > -			if (*lock_mode == 0)
> > > -				*lock_mode = xfs_ilock_data_map_shared(dp);
> > > +			if (*lock_mode == 0) {
> > > +				*lock_mode =
> > > +					xfs_ilock_data_map_shared_generic(dp,
> > > +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> > > +				if (!*lock_mode) {
> > > +					error = -EAGAIN;
> > > +					break;
> > > +				}
> > > +			}
> > 
> > 'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
> > And this is far too far indented.
> > 
> > 			xfs_dir2_lock(dp, ctx, lock_mode);
> > 
> > with:
> > 
> > STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
> > 		unsigned int lock_mode)
> > {
> > 	if (*lock_mode)
> > 		return;
> > 	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> > 		return xfs_ilock_data_map_shared_nowait(dp);
> > 	return xfs_ilock_data_map_shared(dp);
> > }
> > 
> > ... which I think you can use elsewhere in this patch (reformat it to
> > XFS coding style, of course).  And then you don't need
> > xfs_ilock_data_map_shared_generic().
> 
> How about rename xfs_ilock_data_map_shared() to xfs_ilock_data_map_block()
> and rename xfs_ilock_data_map_shared_generic() to
> xfs_ilock_data_map_shared()?
> 
> STATIC void xfs_ilock_data_map_shared(struct xfs_inode *dp, struct
> dir_context *ctx, unsigned int lock_mode)
> {
>  	if (*lock_mode)
>  		return;
>  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
>  		return xfs_ilock_data_map_shared_nowait(dp);
>  	return xfs_ilock_data_map_shared_block(dp);
> }

xfs_ilock_data_map_shared() is used for a lot of things which are not
directories.  I think a new function name is appropriate, and that
function name should include the word 'dir' in it somewhere.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
