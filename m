Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F9F1F4163
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jun 2020 18:51:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jihTI-0003J8-U3; Tue, 09 Jun 2020 16:51:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jihTH-0003In-Iy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 16:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZyMzN3XeJwkpI3jQ6VcPTc6DcG7Z8BuXCJIJnFwv7hM=; b=J5HOt5vkOtaTrJG/kQmmggzEWw
 vLxCn7e+6RKgKoMxt/S/kQQuhHAR49p6lLKcj9FgisQAw3xJx5jdNCpw0IbXpRxsrzkA6bQJeYEZz
 Cf3OUMWG7xc8LPf8PRTnDkHG04W8UNdJ+oHvFaXVpzvqk29L9/uyTn2SxQW0OejUl/M8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZyMzN3XeJwkpI3jQ6VcPTc6DcG7Z8BuXCJIJnFwv7hM=; b=Oc2VcPuBScGvAAG+knB+ODcttH
 fagj4iviT017sCZxBzRS9T9CTAmxwPZszuXwbbXo40NSILmFVF9MH1HfwNcAJ6Npxy8aCQfwdDPCp
 TqB1agOh+TvPG4cXPGHuX430Y2kjRmMy5NJVZOy/xQx9aawfxdtN32Z20hS4WfFY+2pA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jihTC-000ByQ-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 16:51:31 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA2AC20737;
 Tue,  9 Jun 2020 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591721468;
 bh=xymI/tLTEKoILAM/HormIMwHsrmGg7Ok1E9P6gQAM1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yoLBFn2r17siUg+uiUZsPxEqiZYXs7ivvfJSpmEaxbeCoPl4rnaxNEYaSvFZpMrBd
 wSjMvNVq8d6V72BYMr77k8m/PL+lHtaSqyK+15B8D1V49tlqU1s5GAjTjhPyyOwIyw
 WRmNQxOHABSwfIiOtJWnhjMTW1+zdn2puHGVTEy8=
Date: Tue, 9 Jun 2020 09:51:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200609165107.GA228564@gmail.com>
References: <20200609060137.143501-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609060137.143501-1-daeho43@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jihTC-000ByQ-Aq
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 09, 2020 at 03:01:37PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new ioctl to send discard commands or/and zero out
> to whole data area of a regular file for security reason.

With this ioctl available, what is the exact procedure to write and then later
securely erase a file on f2fs?  In particular, how can the user prevent f2fs
from making multiple copies of file data blocks as part of garbage collection?

> +static int f2fs_secure_erase(struct block_device *bdev, block_t block,
> +					block_t len, u32 flags)
> +{
> +	struct request_queue *q = bdev_get_queue(bdev);
> +	sector_t sector = SECTOR_FROM_BLOCK(block);
> +	sector_t nr_sects = SECTOR_FROM_BLOCK(len);
> +	int ret = 0;
> +
> +	if (!q)
> +		return -ENXIO;

Why can the request_queue be NULL here?

> +
> +	if (flags & F2FS_TRIM_FILE_DISCARD)
> +		ret = blkdev_issue_discard(bdev, sector, nr_sects, GFP_NOFS,
> +						blk_queue_secure_erase(q) ?
> +						BLKDEV_DISCARD_SECURE : 0);
> +
> +	if (!ret && flags & F2FS_TRIM_FILE_ZEROOUT)
> +		ret = blkdev_issue_zeroout(bdev, sector, nr_sects, GFP_NOFS, 0);
> +
> +	return ret;
> +}
> +
> +static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct address_space *mapping = inode->i_mapping;
> +	struct block_device *prev_bdev = NULL;
> +	loff_t file_size;
> +	pgoff_t index, pg_start = 0, pg_end;
> +	block_t prev_block = 0, len = 0;
> +	u32 flags;
> +	int ret = 0;
> +
> +	if (!S_ISREG(inode->i_mode) || f2fs_is_atomic_file(inode) ||
> +			f2fs_compressed_file(inode))
> +		return -EINVAL;

Is it valid to check f2fs_is_atomic_file() and f2fs_compressed_file() outside of
inode_lock()?

> +
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;

Isn't this redundant with mnt_want_write_file()?

Also, shouldn't write access to the file be required, i.e.
(filp->f_mode & FMODE_WRITE)?  Then the f2fs_readonly() and
mnt_want_write_file() checks would be unnecessary.

> +
> +	if (f2fs_lfs_mode(sbi))
> +		return -EOPNOTSUPP;

Doesn't this check have to be serialized with remount?

> +
> +	if (get_user(flags, (u32 __user *)arg))
> +		return -EFAULT;
> +	if (!(flags & F2FS_TRIM_FILE_MASK))
> +		return -EINVAL;

Need to reject unknown flags:

	if (flags & ~F2FS_TRIM_FILE_MASK)
		return -EINVAL;

> +
> +	if (flags & F2FS_TRIM_FILE_DISCARD && !f2fs_hw_support_discard(sbi))
> +		return -EOPNOTSUPP;
> +
> +	ret = mnt_want_write_file(filp);
> +	if (ret)
> +		return ret;
> +
> +	inode_lock(inode);
> +
> +	file_size = i_size_read(inode);
> +	if (!file_size)
> +		goto err;

->i_size is stable while holding inode_lock().  So just use ->i_size instead of
i_size_read().

> +	pg_end = (pgoff_t)round_up(file_size, PAGE_SIZE) >> PAGE_SHIFT;

This can be simplified to:

	pg_end = DIV_ROUND_UP(file_size, PAGE_SIZE);


- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
