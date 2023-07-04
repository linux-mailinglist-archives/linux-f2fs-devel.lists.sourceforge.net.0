Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4087476B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jul 2023 18:29:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qGitZ-0005Ye-VF;
	Tue, 04 Jul 2023 16:28:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1qGitY-0005YU-17;
 Tue, 04 Jul 2023 16:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grp7IOV96yxy6pAh3ZZU8aXr+Lk0kn7LWhW74Y7myAE=; b=jV9g6bGbextd5L3EoSXCehNBUw
 mCU+a0ZIqizzrGpu//sa2IXkXhLNdp90WWvTv6uDjwTRoGeu1W75/tVfxKTF4sJV9i05YXMTZ4QFx
 S4Y32vsl7ZAF1jIsviHiM1sS40VJet1NX2Um2CnARnc9Wuqo8lrVWZuBGSRKO/sqkNJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=grp7IOV96yxy6pAh3ZZU8aXr+Lk0kn7LWhW74Y7myAE=; b=iBAQ/A29Fx4flnWrPvrXKZNH77
 D/E9/2vKj/8jS+FbzDjv1Ek/Z0X00421RjZR5Mfw0AfGHi8WstV74S9S+DoUMK08P3HwOtywL5+7c
 pf8pdFgBWTRuwtAv6d3m6PzLtdpa41sXIvDzLaHkZJN2g3nc7uWZoWrvrysMK252fnT8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qGitU-0005Tw-IF; Tue, 04 Jul 2023 16:28:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A3D9612CF;
 Tue,  4 Jul 2023 16:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8C9C433C7;
 Tue,  4 Jul 2023 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688488122;
 bh=ZbfFFniWhSahnp7jSJ3oIaV9POCcbiLvynkhKSgpXe4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rYhrvsNpwqCJwn41eekT5X8PaPVwBQ6ub8Netmz5zCPt/qzVPnkLxH2Kjiq9nv1Cm
 yUeZjhUrBrMq2ThgKqf6VqdUdYp1P2/zpT5yvYD7siJiybpmyKwoPpaa5gXpr6CMMv
 akxinQnPPwXHrxodKNqiTb/6JTMYG4lY9mmxI0dhS9y7wawVJYcWdRHa64BuE/8weJ
 eX7co1v82fmGWp5kKAm9BaeWX8/tRjFqKX1EDWvGtKd5aZ5LCCXaAY86lmuE5eezEu
 Ix6OVXIAm9Wp1Cia2H4ClFO9rKC6nhjukt+dwjQnGXu6F26u0+VUNsprhPIs/s+nRo
 qHwq5/jxHTM8Q==
Date: Tue, 4 Jul 2023 10:28:36 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZKRItBRhm8f5Vba/@kbusch-mbp>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704122224.16257-1-jack@suse.cz>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
 > +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
 > + void *holder, const struct blk_holder_ops *hops) > +{ > + stru [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qGitU-0005Tw-IF
Subject: Re: [f2fs-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
 functions
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 "Darrick J. Wong" <djwong@kernel.org>, linux-nvme@lists.infradead.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jack Wang <jinpu.wang@ionos.com>, Alasdair Kergon <agk@redhat.com>,
 drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
> +		void *holder, const struct blk_holder_ops *hops)
> +{
> +	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
> +					     GFP_KERNEL);

I believe 'sizeof(*handle)' is the preferred style.

> +	struct block_device *bdev;
> +
> +	if (!handle)
> +		return ERR_PTR(-ENOMEM);
> +	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> +	if (IS_ERR(bdev))
> +		return ERR_CAST(bdev);

Need a 'kfree(handle)' before the error return. Or would it be simpler
to get the bdev first so you can check the mode settings against a
read-only bdev prior to the kmalloc?

> +	handle->bdev = bdev;
> +	handle->holder = holder;
> +	return handle;
> +}
> +EXPORT_SYMBOL(blkdev_get_handle_by_dev);
> +
>  /**
>   * blkdev_get_by_path - open a block device by name
>   * @path: path to the block device to open
> @@ -884,6 +902,28 @@ struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
>  }
>  EXPORT_SYMBOL(blkdev_get_by_path);
>  
> +struct bdev_handle *blkdev_get_handle_by_path(const char *path, blk_mode_t mode,
> +		void *holder, const struct blk_holder_ops *hops)
> +{
> +	struct bdev_handle *handle;
> +	dev_t dev;
> +	int error;
> +
> +	error = lookup_bdev(path, &dev);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	handle = blkdev_get_handle_by_dev(dev, mode, holder, hops);
> +	if (!IS_ERR(handle) && (mode & BLK_OPEN_WRITE) &&
> +	    bdev_read_only(handle->bdev)) {
> +		blkdev_handle_put(handle);
> +		return ERR_PTR(-EACCES);
> +	}
> +
> +	return handle;
> +}
> +EXPORT_SYMBOL(blkdev_get_handle_by_path);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
