Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C37482A6C53
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 19:02:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kaN6p-00083Q-MB; Wed, 04 Nov 2020 18:02:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kaN6o-00083C-0H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 18:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MUyujG+o/uFazLBHHQPbjub0OYd9bRzM587cv8Fplt4=; b=Ux6OCfGDG/2txvzg0irJfaWXeZ
 oY9GrRNvJU3MbuKCmCyiKxvjnSHkZnnBjxFNaVCI9ZH/C731x63aHYGaMSgbYNCo5fvAoii1Obsm6
 yhJQIa87BqoYfSnhx/jLOsUjyajJy/3fz1DY2JSC+DjYm7U583/OQRSsMYtU6iX+msp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MUyujG+o/uFazLBHHQPbjub0OYd9bRzM587cv8Fplt4=; b=Q1l8BweSDbfUbs2eJkcT0bUkNI
 YPUxV1km2PV9+93nZrf0OCL3pUkOr5j45g77KrTDF2XP4Hu+j8usPr/MYdAQ31Q8oclXgSwIhzVbO
 iRk16pwI0jXcdsJrLg1N+mBC3UyN3dzCbOvVjlMt63aV1KiERw0ug+Dgqtbefy6q/BpI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kaN6e-009UYw-It
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 18:02:09 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCD93206F4;
 Wed,  4 Nov 2020 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604512915;
 bh=wXUW33CCdia8aWj2B1exrXaEYZ1hCuHd8oBpvcyoMJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n7Q3If8p8K2mQRqrN1dUJltaVQy3W4JMJhMnyK4k1/mqlXg10IbonyhycJTIDMNK7
 zByMKMGDWRA0L9J3TKWsxhXmPljH+0S1iNAgGl7ZTgDHU0hoOS0EfpTZVCqUiaYoXb
 6pVhsOkKq80hhHFp/YNeikg5OMisOdbFAMaT1gFo=
Date: Wed, 4 Nov 2020 10:01:53 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201104180153.GB846@sol.localdomain>
References: <20201104064310.15769-1-yuchao0@huawei.com>
 <20201104064310.15769-2-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104064310.15769-2-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kaN6e-009UYw-It
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 04, 2020 at 02:43:10PM +0800, Chao Yu wrote:
> +static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
> +{
> +	struct f2fs_gc_range range;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;
> +	if (copy_from_user(&range, (struct f2fs_gc_range __user *)arg,
> +							sizeof(range)))
> +		return -EFAULT;
> +
> +	return __f2fs_ioc_gc_range(filp, &range);
> +}
[...]
>  #ifdef CONFIG_COMPAT
> +static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(file));
> +	struct compat_f2fs_gc_range __user *urange;
> +	struct f2fs_gc_range range;
> +	int err;
> +
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return -EIO;
> +	if (!f2fs_is_checkpoint_ready(sbi))
> +		return -ENOSPC;
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;
> +
> +	urange = compat_ptr(arg);
> +	err = get_user(range.sync, &urange->sync);
> +	err |= get_user(range.start, &urange->start);
> +	err |= get_user(range.len, &urange->len);
> +	if (err)
> +		return -EFAULT;
> +
> +	return __f2fs_ioc_gc_range(file, &range);
> +}

It would be better to have __f2fs_ioc_gc_range() handle the f2fs_cp_error(),
f2fs_is_checkpoint_ready(), capable(), and f2fs_readonly() checks, so that they
don't have to be duplicated in the native and compat cases.

Similarly for "move range".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
