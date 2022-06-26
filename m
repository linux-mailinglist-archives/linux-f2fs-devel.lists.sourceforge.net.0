Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797955B003
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jun 2022 09:48:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5N0E-0006V8-SA; Sun, 26 Jun 2022 07:48:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+65d228a9ba3d1088b97d+6881+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1o5N0D-0006V1-8Z
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 07:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2TZRQN/GrmPBp8ytdnHV7foGFk0sHlg+XtRAmSyt/4I=; b=dqQurq4oK9j2OnLueqf9rpm/1P
 ERE+JNmvByvUUhVbN3ZGvmT3tcvF8qo9khxZ+5LezNasMzPKQboyhrC1Gg6lfiZkNqt0EwkNt6GUS
 3kRqja5yYF2+0ZZEfiJ+c2yvtsnEl5cwopFgxaV4mwfz+Uam1Fnp03Zz3Et9YdNo5Drg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2TZRQN/GrmPBp8ytdnHV7foGFk0sHlg+XtRAmSyt/4I=; b=Y6BwY1TMOrsnSxXer/OG+ApDkA
 2+68vBJue/RmNxukUzyQIPe3S5F/56ousfbThOqE19iyYm+2MwUq+/lP067+wlY8W6h8HBNxuSCrS
 VIls3AyeQI54zzeurUwY3VEko755rrWXZsA/nYU8QJ5zqOk42V/dsDYUJzE0AwT4VxLE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5N0B-00EEA5-4C
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jun 2022 07:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2TZRQN/GrmPBp8ytdnHV7foGFk0sHlg+XtRAmSyt/4I=; b=saNgYaHV4JuyNL5PDWEhbLb461
 cpore3km28Dk5GZXJzcFYSLbRbmOYeocRHbwrEGyr9+S5T47khW89iOLZftVXqi46r1KQ3Cg5/rJ4
 d5PpypmD2NRXHC+gFeJXhcmWjm70i5QkN97/1WLLts9UYXdcFEDCAGU4eW5S1Ui6cA8Z4qFex+kvn
 VFagNAjta53MDywfJ/+qEfOuqrIPoGgTkiyP7GKNNhLhUG7rl4vn26coquzR3oXccLvoN3E5ZsMgG
 YgiQeq0z2NzkqY82PKJUuycAzTBYGIiH1s/PU4O7ZoX/ocF9uuvIniz+sWxs4lmy97l0uBAKfxUQU
 hGEQZDFg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o5N04-00AStc-6E; Sun, 26 Jun 2022 07:48:08 +0000
Date: Sun, 26 Jun 2022 00:48:08 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YrgPOHarxLdMt2m2@infradead.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616201506.124209-3-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 16, 2022 at 01:15:00PM -0700, Eric Biggers wrote:
 > +/* Handle STATX_DIOALIGN for block devices. */ > +static inline void
 handle_bdev_dioalign(struct
 path *path, u32 request_mask, > + stru [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o5N0B-00EEA5-4C
Subject: Re: [f2fs-dev] [PATCH v3 2/8] vfs: support STATX_DIOALIGN on block
 devices
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 16, 2022 at 01:15:00PM -0700, Eric Biggers wrote:
> +/* Handle STATX_DIOALIGN for block devices. */
> +static inline void handle_bdev_dioalign(struct path *path, u32 request_mask,
> +					struct kstat *stat)
> +{
> +#ifdef CONFIG_BLOCK
> +	struct inode *inode;
> +	struct block_device *bdev;
> +	unsigned int lbs;
> +
> +	if (likely(!(request_mask & STATX_DIOALIGN)))
> +		return;
> +
> +	inode = d_backing_inode(path->dentry);
> +	if (!S_ISBLK(inode->i_mode))
> +		return;
> +
> +	bdev = blkdev_get_no_open(inode->i_rdev);
> +	if (!bdev)
> +		return;
> +
> +	lbs = bdev_logical_block_size(bdev);
> +	stat->dio_mem_align = lbs;
> +	stat->dio_offset_align = lbs;
> +	stat->result_mask |= STATX_DIOALIGN;
> +
> +	blkdev_put_no_open(bdev);
> +#endif /* CONFIG_BLOCK */
> +}

This helper should go into block/bdev.c with the STATX_DIOALIGN and
S_ISBLK checks lifted into the caller.  I'd also pass just the inode
here.

Note that this also needs to account for the reduced memory alignment
that landed in the block tree eventually.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
