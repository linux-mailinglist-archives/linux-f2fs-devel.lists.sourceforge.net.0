Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0F77B74C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 13:05:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVVOA-0007F1-66;
	Mon, 14 Aug 2023 11:05:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cem@kernel.org>) id 1qVVO9-0007Er-Dt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 11:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hsCCgiHaixdQOsxniPqKPHOMdwvJO/L64YX+/lrwqIo=; b=ADeYXduU8IuHQwsFPA287QMpE6
 AI0H7If8EcpH5JEL/TaKX74V9bgQuTcvnb7XdExLGwuWREfcVxO/IP4QLscxDiqXd/L8l1h8q596U
 rFOeyA59GGzvOjGFBsRhQM1sVLHPXdwVbBs9Epv5pLQMLee6EzTfQ717n+/bSql+ndhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hsCCgiHaixdQOsxniPqKPHOMdwvJO/L64YX+/lrwqIo=; b=DcQMGQMkS/5oiHdoob3EGVvxu6
 JjjF2sODcYm4fCfFWw1/UYtWsm/WcjOfFh3TmmfE6Dd92WIoVoRL9XNuUcXgpGB4e5VpRgoMKlwG4
 GPSPYDgRpAdPkVJDmDFf2TuqZgyOfKK5sDxU4XUtezCTXqytrlJgDYNB7r1ssGBIW+Ag=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVVO9-005IAN-UE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 11:05:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50A2564EDB;
 Mon, 14 Aug 2023 11:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8AAC433C7;
 Mon, 14 Aug 2023 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692011127;
 bh=o2GX9ktf7XmPbMjQ9eJQ/RJAYkU4u146tdoCQwdGLb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bIay++Zk8I7jdq3aa314BvqvMSwSTvUrpfQ7qiM3lFepfXfKvkyxKw+ScOHOeNAeF
 swv1N35AaYHTsafue1ph47qRvF4v7/WNS4m6C/vyxo5D8YlSLO7aA3cWTsuhPBBc5n
 LB+rxQtjAurAl+RNPoAAUTKinsrT3dSVXbCaXI4wxEsLhMQzqaX9UtRxoIsUj5gxfY
 +H3DHAZWgwJJoUhMVb9xrAz/MBkCw+eE9/jjoA6eBhWtNlCNXNEfgNI/4TVQRrEk3+
 iMkeR/oOvgPUnvMrLBKF2FjWxg11L6xc3ZZzJ4Tt6uXZBsaEqVGQza9pz0gzmiarsL
 wVtCOM+YmdytQ==
Date: Mon, 14 Aug 2023 13:05:19 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230814110519.i4vjdomisjrez3r3@andromeda>
References: <20230802154131.2221419-1-hch@lst.de>
 <GiAHRRU8GiDH6Pv5bBBlwPA3hI_9kRXKZCNl7-CoadP8Bf7DiWIUnUt9bG1gBU92q5OuJ4Uy1Negt6JqJWxpeg==@protonmail.internalid>
 <20230802154131.2221419-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-13-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 05:41:31PM +0200, Christoph Hellwig
 wrote: > Use the generic fs_holder_ops to shut down the file system when
 the > log or RT device goes away instead of duplicating the logic. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVVO9-005IAN-UE
Subject: Re: [f2fs-dev] [PATCH 12/12] xfs use fs_holder_ops for the log and
 RT devices
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
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 05:41:31PM +0200, Christoph Hellwig wrote:
> Use the generic fs_holder_ops to shut down the file system when the
> log or RT device goes away instead of duplicating the logic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>

Carlos

> ---
>  fs/xfs/xfs_super.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index d5042419ed9997..338eba71ff8667 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -377,17 +377,6 @@ xfs_setup_dax_always(
>  	return 0;
>  }
> 
> -static void
> -xfs_bdev_mark_dead(
> -	struct block_device	*bdev)
> -{
> -	xfs_force_shutdown(bdev->bd_holder, SHUTDOWN_DEVICE_REMOVED);
> -}
> -
> -static const struct blk_holder_ops xfs_holder_ops = {
> -	.mark_dead		= xfs_bdev_mark_dead,
> -};
> -
>  STATIC int
>  xfs_blkdev_get(
>  	xfs_mount_t		*mp,
> @@ -396,8 +385,8 @@ xfs_blkdev_get(
>  {
>  	int			error = 0;
> 
> -	*bdevp = blkdev_get_by_path(name, BLK_OPEN_READ | BLK_OPEN_WRITE, mp,
> -				    &xfs_holder_ops);
> +	*bdevp = blkdev_get_by_path(name, BLK_OPEN_READ | BLK_OPEN_WRITE,
> +				    mp->m_super, &fs_holder_ops);
>  	if (IS_ERR(*bdevp)) {
>  		error = PTR_ERR(*bdevp);
>  		xfs_warn(mp, "Invalid device [%s], error=%d", name, error);
> @@ -412,7 +401,7 @@ xfs_blkdev_put(
>  	struct block_device	*bdev)
>  {
>  	if (bdev)
> -		blkdev_put(bdev, mp);
> +		blkdev_put(bdev, mp->m_super);
>  }
> 
>  STATIC void
> --
> 2.39.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
