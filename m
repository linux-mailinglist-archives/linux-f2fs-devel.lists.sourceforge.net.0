Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA19217CFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 04:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jszfN-0003Yo-71; Wed, 08 Jul 2020 02:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jszfL-0003Yg-Qt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 02:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ji/pvoJnruxZ5NTjsh4X71yxAbd7TNOpl18z5+X561M=; b=gfoOR9sMQA0rL5JP0lryAYvV/z
 TX6PcGoo8KT8R5GXqvhvolebhUktFcaWdRQ3AhFuGt2o/tiRGps/ou/KaX/kAIj/oqIyGkQcJOQRP
 7Cpzb+NUbnNlOn99MKgPAQN0jKqbtl4xSXX/pryZqgX8UoI1zZmlbFAy5EaEXbaxz3HI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ji/pvoJnruxZ5NTjsh4X71yxAbd7TNOpl18z5+X561M=; b=P9KEgEKjuRb6bZ0cagVjFoCzGB
 uFtYz3+T62Lj3oxjOnKhxOoDiQWicwwa59gVbzNm8jzWvIF8/0+Uqetj2GIwxbFWaM43qSjRU/Qor
 MbCZd2aOVQmhBxmDiNl1TepR17w4+wJYQgHnEfcoOyZS7WwoDGCPD7G4RoE8qOSYgTRA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jszfK-00Alc9-N0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 02:18:31 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F15720708;
 Wed,  8 Jul 2020 02:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594174705;
 bh=tmDaVR1PNrJoafm9vwgEyEGPyx5FVMi3bRneTLieczc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qm0NEvdHgBIvBYQ0kZRa9x8UC5hkczTLyfUPIZtS4ULBj+sQfa9A5Z27URXj1jJvf
 RUslpdDbm8ypKaJ8FhMNxWW2eq09Q3TCg7uN7eJ6r2DwgffiICQRSzPCAA9mG5rEFg
 QMMPAobt7Sa+Opu8cuWkX8xa0c1cacPM6oF/YtV8=
Date: Tue, 7 Jul 2020 19:18:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200708021823.GJ839@sol.localdomain>
References: <20200618125152.84099-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618125152.84099-1-daeho43@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jszfK-00Alc9-N0
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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

Hi Daeho,

On Thu, Jun 18, 2020 at 09:51:52PM +0900, Daeho Jeong wrote:
> +static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct address_space *mapping = inode->i_mapping;
> +	struct block_device *prev_bdev = NULL;
> +	struct f2fs_sectrim_range range;
> +	pgoff_t index, pg_end;
> +	block_t prev_block = 0, len = 0;
> +	u64 end_addr;
> +	bool to_end;
> +	int ret = 0;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (copy_from_user(&range, (struct f2fs_sectrim_range __user *)arg,
> +				sizeof(range)))
> +		return -EFAULT;
> +
> +	if (range.flags == 0 || (range.flags & ~F2FS_TRIM_FILE_MASK) ||
> +			!S_ISREG(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((range.flags & F2FS_TRIM_FILE_DISCARD) &&
> +			!f2fs_hw_support_discard(sbi))
> +		return -EOPNOTSUPP;
> +
> +	file_start_write(filp);
> +	inode_lock(inode);
> +
> +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	if (inode->i_size == 0)
> +		goto err;
> +
> +	end_addr = range.start + range.len;
> +	if (end_addr > inode->i_size) {
> +		ret = -EINVAL;
> +		goto err;
> +	}

This is missing a check that range.start + range.len doesn't overflow.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
