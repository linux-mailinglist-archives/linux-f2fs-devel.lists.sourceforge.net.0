Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B01C9789085
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 23:39:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZeWi-0001hE-UK;
	Fri, 25 Aug 2023 21:39:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qZeWg-0001h8-Qa
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 21:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=; b=YWGxU0aFeTi5b8BDtdpwrZyW/X
 S77rhKjkvkO2+CK+tBXFLBdualVoZIF15l05LjtdRJaKHZRvCLoXJm0Sfur5i0tC2AEMCauH3AEXV
 W3/TNYJG3qGsLyRFQ4Heq1EP86VTs4SyI+i2sX0mIq6JuMtXcpgpeJ96zJUQj8+6V/UA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=; b=IVto6pPbwcRAVaUWfmJfDoQg5+
 AYAPUpdcDceN9FdiRBYLXvi36DeSqbnOQP9KeDi4c9kOkKGqT+Bnj9QzgdJPYCxutksAT3v77hJSV
 9KIO4TtCZxXb812nWI8SM5oZd/OyKYjPmjjpgZ7hv3ibD4CoxDIIIa79+tA3Dqnt+3oo=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZeWa-0005Pj-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 21:39:28 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-68c3b9f85b7so323706b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1692999556; x=1693604356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=;
 b=SlHW1FHh55Miyt5dC5YbHFzbz8/Ww6dpIRyxo6vWvL1BUT9wpnYc90O8W3sh6jbVDI
 8VSN/Xe7i/NpqgfmZUfGif/OWVY4CvO1XNCApsJ0gTKpBFDUVISAdbUZIXX0AL7Ymm4P
 GTcb7wyrBEoupwm2T77MgFldNvL555iN8Gi3uYCzgcocNv0xnFj+WWlwbcbOTqmgKZI+
 MLGEhJoBOR8ij98DujYJDG8/ErJs1WTRaajOZxKdaJWii5ir39jpSlGIz75MH3BFujgn
 75aCRb2KJIpxhwlYFJHEvUeGNqpylJdIJf8XyyAJR0UoHIDg5wblyZNVqnwV4VZyvNd5
 jfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692999556; x=1693604356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7dRQ9By/T99QWDW5xev9b8rVkM9NZXXwZrmSduoTKY=;
 b=XgPPzXlYC2Zhs61j12CFknlwi7nxmW/jagvoy7qlFODeU4vps0/JVNwYGMyhBh0e+n
 7fcIujDXaLBke09WloitN8XxbIvcfbFAsc7oLRql5j5D032F9eImJqm+du42FOtqBPCk
 upncHiQbnvxa2DgIUVSF72asYTwrARlg+RZbGSLmCd/qH8vRKzrKJQ2RRW7WtRwi6Mxc
 2lYgs9A0i463Ax6o3EWzXD8vT8/OHGG/+qXJ63zjjMMdl27cEOteI4VNG1cDIQDAowRF
 rwaAt1rCnB9HBocysWwBt5JDnQfwSPjUGc99+MLIvzIXfJ0eJFbe5qR5Zj4JZxsf5O78
 3w/Q==
X-Gm-Message-State: AOJu0YxQoUzfh5M9TNn8vlG0X0FTpzRgCtCs73Or7N0ks5mwShZeqM7c
 rSllWqTKHmzKqdwL+8cTWkGANw==
X-Google-Smtp-Source: AGHT+IFGwDu4J6IE5hfbjc7KSF4OfJEndquVBvBoV5vhWuIhyGy4zoBWcpcC8Lokr19GaOsT0RulfQ==
X-Received: by 2002:a05:6a20:7fa0:b0:140:324c:124c with SMTP id
 d32-20020a056a207fa000b00140324c124cmr22387249pzj.62.1692999556447; 
 Fri, 25 Aug 2023 14:39:16 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 a14-20020a62bd0e000000b006875df4773fsm1997221pff.163.2023.08.25.14.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:39:15 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZeWO-006Uvd-0J;
 Sat, 26 Aug 2023 07:39:12 +1000
Date: Sat, 26 Aug 2023 07:39:12 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkfgBlWKVmGN84i@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-3-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-3-hao.xu@linux.dev>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:04PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > XBF_TRYLOCK means we need lock but
 don't block on it, Yes. > we can use it to > stand for not waiting for memory
 allcation. Rename XBF_TRYLOCK to > XBF_NOWAIT, which is more generic. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qZeWa-0005Pj-Jv
Subject: Re: [f2fs-dev] [PATCH 02/29] xfs: rename XBF_TRYLOCK to XBF_NOWAIT
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
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

On Fri, Aug 25, 2023 at 09:54:04PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> XBF_TRYLOCK means we need lock but don't block on it,

Yes.


> we can use it to
> stand for not waiting for memory allcation. Rename XBF_TRYLOCK to
> XBF_NOWAIT, which is more generic.

No.

Not only can XBF_TRYLOCK require memory allocation, it can require
IO to be issued. We use TRYLOCK for -readahead- and so we *must* be
able to allocate memory and issue IO under TRYLOCK caller
conditions.

[...]

> diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
> index d440393b40eb..2ccb0867824c 100644
> --- a/fs/xfs/libxfs/xfs_attr_remote.c
> +++ b/fs/xfs/libxfs/xfs_attr_remote.c
> @@ -661,7 +661,7 @@ xfs_attr_rmtval_invalidate(
>  			return error;
>  		if (XFS_IS_CORRUPT(args->dp->i_mount, nmap != 1))
>  			return -EFSCORRUPTED;
> -		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_TRYLOCK);
> +		error = xfs_attr_rmtval_stale(args->dp, &map, XBF_NOWAIT);
>  		if (error)
>  			return error;

XBF_INCORE | XBF_NOWAIT makes no real sense. I mean, XBF_INCORE is
exactly "find a cached buffer or fail" - it's not going to do any
memory allocation or IO so NOWAIT smeantics don't make any sense
here. It's the buffer lock that this lookup is explicitly
avoiding, and so TRYLOCK describes exactly the semantics we want
from this incore lookup.

Indeed, this is a deadlock avoidance mechanism as the transaction
may already have the buffer locked and so we don't want the
xfs_buf_incore() lookup to try to lock the buffer again. TRYLOCK
documents this pretty clearly - NOWAIT loses that context....

> diff --git a/fs/xfs/libxfs/xfs_btree.c b/fs/xfs/libxfs/xfs_btree.c
> index 6a6503ab0cd7..77c4f1d83475 100644
> --- a/fs/xfs/libxfs/xfs_btree.c
> +++ b/fs/xfs/libxfs/xfs_btree.c
> @@ -1343,7 +1343,7 @@ xfs_btree_read_buf_block(
>  	int			error;
>  
>  	/* need to sort out how callers deal with failures first */
> -	ASSERT(!(flags & XBF_TRYLOCK));
> +	ASSERT(!(flags & XBF_NOWAIT));
>  
>  	error = xfs_btree_ptr_to_daddr(cur, ptr, &d);
>  	if (error)
> diff --git a/fs/xfs/scrub/repair.c b/fs/xfs/scrub/repair.c
> index ac6d8803e660..9312cf3b20e2 100644
> --- a/fs/xfs/scrub/repair.c
> +++ b/fs/xfs/scrub/repair.c
> @@ -460,7 +460,7 @@ xrep_invalidate_block(
>  
>  	error = xfs_buf_incore(sc->mp->m_ddev_targp,
>  			XFS_FSB_TO_DADDR(sc->mp, fsbno),
> -			XFS_FSB_TO_BB(sc->mp, 1), XBF_TRYLOCK, &bp);
> +			XFS_FSB_TO_BB(sc->mp, 1), XBF_NOWAIT, &bp);

My point exactly.

xfs_buf_incore() is simply a lookup with XBF_INCORE set. (XBF_INCORE
| XBF_TRYLOCK) has the exactly semantics of "return the buffer only
if it is cached and we can lock it without blocking.

It will not instantiate a new buffer (i.e. do memory allocation) or
do IO because the if it is under IO the buffer lock will be held.

So, essentially, this "NOWAIT" semantic you want is already supplied
by (XBF_INCORE | XBF_TRYLOCK) buffer lookups.

>  	if (error)
>  		return 0;
>  
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 15d1e5a7c2d3..9f84bc3b802c 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -228,7 +228,7 @@ _xfs_buf_alloc(
>  	 * We don't want certain flags to appear in b_flags unless they are
>  	 * specifically set by later operations on the buffer.
>  	 */
> -	flags &= ~(XBF_UNMAPPED | XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD);
> +	flags &= ~(XBF_UNMAPPED | XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD);
>  
>  	atomic_set(&bp->b_hold, 1);
>  	atomic_set(&bp->b_lru_ref, 1);
> @@ -543,7 +543,7 @@ xfs_buf_find_lock(
>  	struct xfs_buf          *bp,
>  	xfs_buf_flags_t		flags)
>  {
> -	if (flags & XBF_TRYLOCK) {
> +	if (flags & XBF_NOWAIT) {
>  		if (!xfs_buf_trylock(bp)) {
>  			XFS_STATS_INC(bp->b_mount, xb_busy_locked);
>  			return -EAGAIN;
> @@ -886,7 +886,7 @@ xfs_buf_readahead_map(
>  	struct xfs_buf		*bp;
>  
>  	xfs_buf_read_map(target, map, nmaps,
> -		     XBF_TRYLOCK | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
> +		     XBF_NOWAIT | XBF_ASYNC | XBF_READ_AHEAD, &bp, ops,
>  		     __this_address);

That will break readahead (which we use extensively in getdents
operations) if we can't allocate buffers and issue IO under NOWAIT
conditions.

>  }
>  
> diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
> index 549c60942208..8cd307626939 100644
> --- a/fs/xfs/xfs_buf.h
> +++ b/fs/xfs/xfs_buf.h
> @@ -45,7 +45,7 @@ struct xfs_buf;
>  
>  /* flags used only as arguments to access routines */
>  #define XBF_INCORE	 (1u << 29)/* lookup only, return if found in cache */
> -#define XBF_TRYLOCK	 (1u << 30)/* lock requested, but do not wait */
> +#define XBF_NOWAIT	 (1u << 30)/* mem/lock requested, but do not wait */

That's now a really poor comment. It doesn't describe the semantics
or constraints that NOWAIT might imply.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
