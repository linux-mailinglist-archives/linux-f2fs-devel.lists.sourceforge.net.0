Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B71790F7B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 03:02:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qcxzM-0000Kr-18;
	Mon, 04 Sep 2023 01:02:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qcxzK-0000Kf-TY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 01:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=; b=F2MaILzLyHSsVn5fjJgN9yv723
 wih45nCmCf39FwlVz9W4WTlSR3XI4tnHRZvAzFqc/I75EF5OqS5tl6Z75E7GoPz2S1Lk5649o262x
 1dZNlDPflHos98owHRQqbnzQUR31gCRbYW2ppBvX7izCmu1m7TK4Rr6b9d1Z84O3Xg7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=; b=Gaq5km3li1hGzUq6SD7kjs14Qf
 dyuLVgHhvuGe9ZL/l+TSo/7eT9vpFQWYB09jQAtBynxVi4wsuIIVgN7Sc8WGXFwws6D8c7xFXWFYt
 1rmUlXniO1w9uJfGbdUmnRRLMEO6ilXSSjDv+xDyhzoSDht87l1mCOyD5oFO7p6Z8+nY=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qcxzF-0089tY-Jx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 01:02:45 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1bf48546ccfso1982575ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 03 Sep 2023 18:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693789356; x=1694394156;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=;
 b=S0OXYTBUpPmoAdGapCzrvh4k4elh5yBYAYupcBYs1W9iQXiDMReVAU2x4IQ57Pc4SG
 8UR8g6qjuzjJNQYx+zmK9HdMsIlufofq9Wij8Y28UZeeHIHv08GR1TrxlT9pogMa+LRe
 LVgni07X7aA/GrVfxDGablqz+pn0ghxaQTolKJS5KleizcO27HKgvVgJNHRpvJGTWDa2
 Zd83LxjiZvEANzloNmVCPfK1Y9I8MPVoiQnPZygCtbk1taeEzh/lOorEg20EQ9Be89A6
 Vrs7FFocJDWWv8ZZDjL0/stlrEICmLoj/edWppj7G+ZAWq9xhf7GJG8n3Bp6IYhYAoJj
 J0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693789356; x=1694394156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SkjlWpTOnFF4QpgAAxUR7lqv3IHtXsX9Ov+YWVrmXw=;
 b=MxArW01mAq+kZJIA7yh7/czwX2nw5GtZ74cnqkUFNC0JxrKml8jVCRXZP0N6qPK5un
 LknewagST2/XuYhZlELfsjSHNqdVch+MBJUYU45pfr1ibbMPXWyFNv5QhYNeP0fymvmY
 ITje+h5vhMzeXNTEnapAwAJgOdVkTOG1Lg7iBY7qccTXujThvc4jrckkWtb7i/sUcqmX
 yT1JRgt0uRhcMTuzy1HwC0YuGV3TDXX7myBWISMgLS7v4c5Q6My24vwKcNnQ2ZdOfWVG
 t/MVdOnravSEMOMvrmvZjtInRw0RrttfeeeQ4KBnketEuafHKCmT9ZNUSICzFuBg7r39
 XbDQ==
X-Gm-Message-State: AOJu0YypXQX/pj6bsqaW6+KpzFyVgotn/GjRtjW3Z8VVtsM6fFwpqKXQ
 SvpYAuLg1TEA/+H1IaKYjHObug==
X-Google-Smtp-Source: AGHT+IGGrky2P+bBuH4AKgWBeYdqXOP6u+qaOJyeKMBTbWb7BRdsdnk0jjxmGVwySX0sZe8eaRNDcw==
X-Received: by 2002:a17:902:ecc8:b0:1c1:fe97:bf34 with SMTP id
 a8-20020a170902ecc800b001c1fe97bf34mr8040994plh.24.1693789355853; 
 Sun, 03 Sep 2023 18:02:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170902c18400b001bdcafcf8d3sm6351806pld.69.2023.09.03.18.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 18:02:35 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qcxz6-00AVA9-2L;
 Mon, 04 Sep 2023 11:02:32 +1000
Date: Mon, 4 Sep 2023 11:02:32 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZPUsqGfeUwupdlLE@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827132835.1373581-3-hao.xu@linux.dev>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > Implement NOWAIT semantics for readdir.
 Return EAGAIN error to the > caller if it would block, like fai [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qcxzF-0089tY-Jx
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

On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> Implement NOWAIT semantics for readdir. Return EAGAIN error to the
> caller if it would block, like failing to get locks, or going to
> do IO.
> 
> Co-developed-by: Dave Chinner <dchinner@redhat.com>

Not really.

"Co-developed" implies equal development input between all the
parties, which is not the case here - this patch is based on
prototype I wrote, whilst you're doing the refining, testing and
correctness work.

In these cases with XFS code, we add a line in the commit message to
say:

"This is based on a patch originally written by Dave Chinner."


> Signed-off-by: Dave Chinner <dchinner@redhat.com>
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> [fixes deadlock issue, tweak code style]

With a signoff chain like you already have.

In the end you'll also get a RVB from me, which seems rather wrong
to me if I've apparently been "co-developing" the code....

....

> @@ -156,7 +157,9 @@ xfs_dir2_block_getdents(
>  	if (xfs_dir2_dataptr_to_db(geo, ctx->pos) > geo->datablk)
>  		return 0;
>  
> -	error = xfs_dir3_block_read(args->trans, dp, &bp);
> +	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> +		flags |= XFS_DABUF_NOWAIT;
> +	error = xfs_dir3_block_read(args->trans, dp, flags, &bp);
>  	if (error)
>  		return error;
>  

Given we do this same check in both block and leaf formats to set
XFS_DABUF_NOWAIT, and we do the DIR_CONTEXT_F_NOWAIT check in
xfs_readdir() as well, we should probably do this check once at the
higher level and pass flags down from there with XFS_DABUF_NOWAIT
already set.

> @@ -240,6 +243,7 @@ xfs_dir2_block_getdents(
>  STATIC int
>  xfs_dir2_leaf_readbuf(
>  	struct xfs_da_args	*args,
> +	struct dir_context	*ctx,
>  	size_t			bufsize,
>  	xfs_dir2_off_t		*cur_off,
>  	xfs_dablk_t		*ra_blk,
> @@ -258,10 +262,15 @@ xfs_dir2_leaf_readbuf(
>  	struct xfs_iext_cursor	icur;
>  	int			ra_want;
>  	int			error = 0;
> -
> -	error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
> -	if (error)
> -		goto out;
> +	unsigned int		flags = 0;
> +
> +	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
> +		flags |= XFS_DABUF_NOWAIT;
> +	} else {
> +		error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
> +		if (error)
> +			goto out;
> +	}

Especially as, in hindsight, this doesn't make a whole lot of sense.
If XFS_DABUF_NOWAIT is set, we keep going until
xfs_ilock_data_map_shared_nowait() where we call
xfs_need_iread_extents() to see if we need to read the extents in
and abort at that point.

So, really, we shouldn't get this far with nowait semantics if
we haven't read the extents in yet - we're supposed to already have
the inode locked here and so we should have already checked this
condition before we bother locking the inode...

i.e. all we should be doing here is this:

	if (!(flags & XFS_DABUF_NOWAIT)) {
		error = xfs_iread_extents(args->trans, dp, XFS_DATA_FORK);
		if (error)
			goto out;
	}

And then we don't need to pass the VFS dir_context down into low
level XFS functions unnecessarily.


>  
>  	/*
>  	 * Look for mapped directory blocks at or above the current offset.
> @@ -280,7 +289,7 @@ xfs_dir2_leaf_readbuf(
>  	new_off = xfs_dir2_da_to_byte(geo, map.br_startoff);
>  	if (new_off > *cur_off)
>  		*cur_off = new_off;
> -	error = xfs_dir3_data_read(args->trans, dp, map.br_startoff, 0, &bp);
> +	error = xfs_dir3_data_read(args->trans, dp, map.br_startoff, flags, &bp);
>  	if (error)
>  		goto out;
>  
> @@ -360,6 +369,7 @@ xfs_dir2_leaf_getdents(
>  	int			byteoff;	/* offset in current block */
>  	unsigned int		offset = 0;
>  	int			error = 0;	/* error return value */
> +	int			written = 0;
>  
>  	/*
>  	 * If the offset is at or past the largest allowed value,
> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>  				bp = NULL;
>  			}
>  
> -			if (*lock_mode == 0)
> -				*lock_mode = xfs_ilock_data_map_shared(dp);
> -			error = xfs_dir2_leaf_readbuf(args, bufsize, &curoff,
> -					&rablk, &bp);
> +			if (*lock_mode == 0) {
> +				*lock_mode =
> +					xfs_ilock_data_map_shared_generic(dp,
> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
> +				if (!*lock_mode) {
> +					error = -EAGAIN;
> +					break;
> +				}
> +			}
> +			error = xfs_dir2_leaf_readbuf(args, ctx, bufsize,
> +					&curoff, &rablk, &bp);

int
xfs_ilock_readdir(
	struct xfs_inode	*ip,
	int			flags)
{
	if (flags & XFS_DABUF_NOWAIT) {
		if (!xfs_ilock_nowait(dp, XFS_ILOCK_SHARED))
			return -EAGAIN;
		return XFS_ILOCK_SHARED;
	}
	return xfs_ilock_data_map_shared(dp);
}

And then this code simply becomes:

			if (*lock_mode == 0)
				*lock_mode = xfs_ilock_readdir(ip, flags);


>  			if (error || !bp)
>  				break;
>  
> @@ -479,6 +496,7 @@ xfs_dir2_leaf_getdents(
>  		 */
>  		offset += length;
>  		curoff += length;
> +		written += length;
>  		/* bufsize may have just been a guess; don't go negative */
>  		bufsize = bufsize > length ? bufsize - length : 0;
>  	}
> @@ -492,6 +510,8 @@ xfs_dir2_leaf_getdents(
>  		ctx->pos = xfs_dir2_byte_to_dataptr(curoff) & 0x7fffffff;
>  	if (bp)
>  		xfs_trans_brelse(args->trans, bp);
> +	if (error == -EAGAIN && written > 0)
> +		error = 0;
>  	return error;
>  }
>  
> @@ -514,6 +534,7 @@ xfs_readdir(
>  	unsigned int		lock_mode;
>  	bool			isblock;
>  	int			error;
> +	bool			nowait;
>  
>  	trace_xfs_readdir(dp);
>  
> @@ -531,7 +552,11 @@ xfs_readdir(
>  	if (dp->i_df.if_format == XFS_DINODE_FMT_LOCAL)
>  		return xfs_dir2_sf_getdents(&args, ctx);
>  
> -	lock_mode = xfs_ilock_data_map_shared(dp);
> +	nowait = ctx->flags & DIR_CONTEXT_F_NOWAIT;
> +	lock_mode = xfs_ilock_data_map_shared_generic(dp, nowait);
> +	if (!lock_mode)
> +		return -EAGAIN;
> +

Given what I said above:

	if (ctx->flags & DIR_CONTEXT_F_NOWAIT) {
		/*
		 * If we need to read extents, then we must do IO
		 * and we must use exclusive locking. We don't want
		 * to do either of those things, so just bail if we
		 * have to read extents. Doing this check explicitly
		 * here means we don't have to do it anywhere else
		 * in the XFS_DABUF_NOWAIT path.
		 */
		if (xfs_need_iread_extents(&ip->i_df))
			return -EAGAIN;
		flags |= XFS_DABUF_NOWAIT;
	}
	lock_mode = xfs_ilock_readdir(dp, flags);

And with this change, we probably should be marking the entire
operation as having nowait semantics. i.e. using args->op_flags here
and only use XFS_DABUF_NOWAIT for the actual IO. ie.

		args->op_flags |= XFS_DA_OP_NOWAIT;

This makes it clear that the entire directory op should run under
NOWAIT constraints, and it avoids needing to pass an extra flag
through the stack.  That then makes the readdir locking function
look like this:

/*
 * When we are locking an inode for readdir, we need to ensure that
 * the extents have been read in first. This requires the inode to
 * be locked exclusively across the extent read, but otherwise we
 * want to use shared locking.
 *
 * For XFS_DA_OP_NOWAIT operations, we do an up-front check to see
 * if the extents have been read in, so all we need to do in this
 * case is a shared try-lock as we never need exclusive locking in
 * this path.
 */
static int
xfs_ilock_readdir(
	struct xfs_da_args	*args)
{
	if (args->op_flags & XFS_DA_OP_NOWAIT) {
		if (!xfs_ilock_nowait(args->dp, XFS_ILOCK_SHARED))
			return -EAGAIN;
		return XFS_ILOCK_SHARED;
	}
	return xfs_ilock_data_map_shared(args->dp);
}

> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 9e62cc500140..d088f7d0c23a 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -120,6 +120,33 @@ xfs_ilock_data_map_shared(
>  	return lock_mode;
>  }
>  
> +/*
> + * Similar to xfs_ilock_data_map_shared(), except that it will only try to lock
> + * the inode in shared mode if the extents are already in memory. If it fails to
> + * get the lock or has to do IO to read the extent list, fail the operation by
> + * returning 0 as the lock mode.
> + */
> +uint
> +xfs_ilock_data_map_shared_nowait(
> +	struct xfs_inode	*ip)
> +{
> +	if (xfs_need_iread_extents(&ip->i_df))
> +		return 0;
> +	if (!xfs_ilock_nowait(ip, XFS_ILOCK_SHARED))
> +		return 0;
> +	return XFS_ILOCK_SHARED;
> +}
> +
> +int
> +xfs_ilock_data_map_shared_generic(
> +	struct xfs_inode	*dp,
> +	bool			nowait)
> +{
> +	if (nowait)
> +		return xfs_ilock_data_map_shared_nowait(dp);
> +	return xfs_ilock_data_map_shared(dp);
> +}

And all this "generic" locking stuff goes away.

FWIW, IMO, "generic" is a poor name for an XFS function as there's
nothing "generic" in XFS.  We tend name the functions after what
they do, not some abstract concept. Leave "generic" as a keyword for
widely used core infrastructure functions, not niche, one-off use
cases like this.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
