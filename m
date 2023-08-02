Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2776D3B7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 18:32:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qREm1-00055O-OG;
	Wed, 02 Aug 2023 16:32:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1qREm1-00055H-0Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 16:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hzEhURS6YslSqV/7y6QISxo3C8CNSt+NPCA8IYWGreA=; b=EVicqx97cioJ5KO8/szb+M2k34
 z2quPJHDyQaQIpTOH9nkfoEL7XkpuQmz2rnntsjYMjXmlp0boU0VlwjTbzu6D1rkFAUu9KOrVfGwj
 BozL9LiV5YseMWwacbUpywF/C7UeFj3HghrRNQeg3MVe6wYs3XRGbiRr7FkwZ/6JMd9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hzEhURS6YslSqV/7y6QISxo3C8CNSt+NPCA8IYWGreA=; b=DbI/gTvEu8fa+y2KjtSwaNJWsB
 C1zGZdpUDTTctw3XCAoZlvTb52UzQw4mR6CUf6sRZVtWddjqdPqJgtOWDbmZMM4NvHHO3ZESO1HVT
 WnIDLa2HyNm+OqYHPHpDgCzKYI2lyChNkMJwMh649MwI+Ii2uoa2SrOywpBkzFwUeAjA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRElv-0006nD-I7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 16:32:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5310761A3C;
 Wed,  2 Aug 2023 16:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7D9C433C8;
 Wed,  2 Aug 2023 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690993939;
 bh=GcVu5AKxQx3Xueu/J47RQ71hv6d/lK6wYIHHmRfGqaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wtd/B0tT5WFKMlZ4FcUuBOY403mH8jUVkWi+G6Rc6yRr8xqjh9e6QJP4M5cVaQZjl
 RdSRk087/R+zJKvlBUY6iflSrQVduZHiM7vhrntHc8ykJ5MZ3CsTWNydd8G60nAjjB
 xsTI+0r8XJWzqubQJge2bfArwRHdY+O0Fl3cJpBpiRZiCeObWknsnSeiOIYUNNlQ5n
 gF1Wsh0ENOOBgf0aIBZa5zNVBIhSdH4vc5MXOCvbYSInOKhXU+6gtVD2ABSpP8k6sE
 GxKNKflCh1H01pQA/zivBFr3jCjg3b+DK9HkonEjcCq0iyGozH4qOncit0g9T89zgx
 DasFxOweGYc3Q==
Date: Wed, 2 Aug 2023 09:32:19 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230802163219.GW11352@frogsfrogsfrogs>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-12-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 05:41:30PM +0200, Christoph Hellwig
 wrote: > Just like get_tree_bdev needs to drop s_umount when opening the
 main > device, we need to do the same for the xfs log and RT device [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRElv-0006nD-I7
Subject: Re: [f2fs-dev] [PATCH 11/12] xfs: drop s_umount over opening the
 log and RT devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 05:41:30PM +0200, Christoph Hellwig wrote:
> Just like get_tree_bdev needs to drop s_umount when opening the main
> device, we need to do the same for the xfs log and RT devices to avoid a
> potential lock order reversal with s_unmount for the mark_dead path.
> 
> It might be preferable to just drop s_umount over ->fill_super entirely,
> but that will require a fairly massive audit first, so we'll do the easy
> version here first.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/xfs/xfs_super.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 8185102431301d..d5042419ed9997 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -448,17 +448,21 @@ STATIC int
>  xfs_open_devices(
>  	struct xfs_mount	*mp)
>  {
> -	struct block_device	*ddev = mp->m_super->s_bdev;
> +	struct super_block	*sb = mp->m_super;
> +	struct block_device	*ddev = sb->s_bdev;
>  	struct block_device	*logdev = NULL, *rtdev = NULL;
>  	int			error;
>  
> +	/* see get_tree_bdev why this is needed and safe */

Which part of get_tree_bdev?  Is it this?

		/*
		 * s_umount nests inside open_mutex during
		 * __invalidate_device().  blkdev_put() acquires
		 * open_mutex and can't be called under s_umount.  Drop
		 * s_umount temporarily.  This is safe as we're
		 * holding an active reference.
		 */
		up_write(&s->s_umount);
		blkdev_put(bdev, fc->fs_type);
		down_write(&s->s_umount);

<confused>

> +	up_write(&sb->s_umount);
> +
>  	/*
>  	 * Open real time and log devices - order is important.
>  	 */
>  	if (mp->m_logname) {
>  		error = xfs_blkdev_get(mp, mp->m_logname, &logdev);
>  		if (error)
> -			return error;
> +			goto out_unlock;
>  	}
>  
>  	if (mp->m_rtname) {
> @@ -496,7 +500,10 @@ xfs_open_devices(
>  		mp->m_logdev_targp = mp->m_ddev_targp;
>  	}
>  
> -	return 0;
> +	error = 0;
> +out_unlock:
> +	down_write(&sb->s_umount);

Isn't down_write taking s_umount?  I think the label should be
out_relock or something less misleading.

--D

> +	return error;
>  
>   out_free_rtdev_targ:
>  	if (mp->m_rtdev_targp)
> @@ -508,7 +515,7 @@ xfs_open_devices(
>   out_close_logdev:
>  	if (logdev && logdev != ddev)
>  		xfs_blkdev_put(mp, logdev);
> -	return error;
> +	goto out_unlock;
>  }
>  
>  /*
> -- 
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
