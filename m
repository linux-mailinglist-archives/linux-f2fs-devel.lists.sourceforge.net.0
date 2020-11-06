Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB252A8B1A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Nov 2020 01:06:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kapGg-0006Am-N7; Fri, 06 Nov 2020 00:06:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kapGb-0006AR-3o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 00:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WT3UK0+qpxIajf1mVGmZbuhlMnZdgRKjpxz6LdKbhOU=; b=ALkFPC9KcsokwgWHV3Y+y+mbph
 aE94x/Ajo7uV1KTvXYgObUSkbbtUjjYZZX89zeDlRt8Me4CSCKPV2c7iORgzvUSXa/fnkcnMf88Ew
 WkzTjKmzws3bZAwOjv7QMxzQ3JbBFtqmD2KOZ+F3Qb51Tk9zWO3L5cVMS9zr6nclSh0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WT3UK0+qpxIajf1mVGmZbuhlMnZdgRKjpxz6LdKbhOU=; b=lu7svAtREpRZJIRFNDzGS2nZSM
 0Tks3TZxWhEDtuOso+vTYzqvm66hdX6quW15PK/D/XvdPJZfBtGYk/wSkLv5GVF5dKshp1J2ONxLg
 C1GLFei7axYNmcpxWWo+KUKQzwjtxYvMm+IiZAm9NDNRk0F31d+Tau1tvdzwqa4cM+do=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kapGT-002s8t-NC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Nov 2020 00:06:06 +0000
Received: from gmail.com (unknown [104.132.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB85420759;
 Fri,  6 Nov 2020 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604621152;
 bh=GopOboKX48Vi0577YtxhvXzwzmNNcbiW/DXzmt2YRyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJUAgFFxsomGeKRDsqkPvTl10ieWoHnI53gAbkmNITqavukLvtAaBYdFJS4gCo93T
 KbphgajLNbDle8mGVn8KSnV/z2VtoaPcr2R0ho+k+amGkhhmiwJeCcqGcYvHFPkW8/
 +RljiNOBxc5452dh/5GaT8hff7sS0F2L87LEe7jw=
Date: Thu, 5 Nov 2020 16:05:50 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201106000550.GD2555324@gmail.com>
References: <20201105010934.16018-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105010934.16018-1-yuchao0@huawei.com>
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
X-Headers-End: 1kapGT-002s8t-NC
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
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

This patch is marked 2/2, but it seems you sent it out on its own.  Patch series
are supposed to be resend in full; otherwise people can see just one patch and
have no context.

On Thu, Nov 05, 2020 at 09:09:34AM +0800, Chao Yu wrote:
> Eric reported a ioctl bug in below link:
> 
> https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/
> 
> That said, on some 32-bit architectures, u64 has only 32-bit alignment,
> notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
> in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
> compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
> due to mismatched value of ioctl command in between binary and f2fs
> module, similarly, F2FS_IOC_MOVE_RANGE will fail too.
> 
> In this patch we introduce two ioctls for compatibility of above special
> 32-bit binary:
> - F2FS_IOC32_GARBAGE_COLLECT_RANGE
> - F2FS_IOC32_MOVE_RANGE
> 

It would be good to add a proper reported-by line, otherwise it's not clear who
"Eric" is (there are lots of Erics):

Reported-by: Eric Biggers <ebiggers@google.com>

> +static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
>  {
> -	struct inode *inode = file_inode(filp);
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct f2fs_gc_range range;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>  	u64 end;
>  	int ret;
>  
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return -EIO;
> +	if (!f2fs_is_checkpoint_ready(sbi))
> +		return -ENOSPC;

These two checkpoint-related checks weren't present in the original version.
Is that intentional?

> +static int __f2fs_ioc_move_range(struct file *filp,
> +				struct f2fs_move_range *range)
>  {
> -	struct f2fs_move_range range;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
>  	struct fd dst;
>  	int err;
>  
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return -EIO;
> +	if (!f2fs_is_checkpoint_ready(sbi))
> +		return -ENOSPC;
> +

Likewise here.

> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index f00199a2e38b..8c14e88a9645 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -5,6 +5,10 @@
>  #include <linux/types.h>
>  #include <linux/ioctl.h>
>  
> +#ifdef __KERNEL__
> +#include <linux/compat.h>
> +#endif
> +
>  /*
>   * f2fs-specific ioctl commands
>   */
> @@ -65,6 +69,16 @@ struct f2fs_gc_range {
>  	__u64 len;
>  };
>  
> +#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
> +struct compat_f2fs_gc_range {
> +	u32 sync;
> +	compat_u64 start;
> +	compat_u64 len;
> +};
> +#define F2FS_IOC32_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,\
> +						struct compat_f2fs_gc_range)
> +#endif
> +
>  struct f2fs_defragment {
>  	__u64 start;
>  	__u64 len;
> @@ -77,6 +91,17 @@ struct f2fs_move_range {
>  	__u64 len;		/* size to move */
>  };
>  
> +#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
> +struct compat_f2fs_move_range {
> +	u32 dst_fd;
> +	compat_u64 pos_in;
> +	compat_u64 pos_out;
> +	compat_u64 len;
> +};
> +#define F2FS_IOC32_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
> +					struct compat_f2fs_move_range)
> +#endif
> +
>  struct f2fs_flush_device {
>  	__u32 dev_num;		/* device number to flush */
>  	__u32 segments;		/* # of segments to flush */
> -- 

Did you consider instead putting these compat definitions in an internal kernel
header, or even just in the .c file, to avoid cluttering up the UAPI header?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
