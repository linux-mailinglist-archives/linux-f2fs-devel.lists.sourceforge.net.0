Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6A03DD2BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Aug 2021 11:16:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAU3t-0008A1-Hl; Mon, 02 Aug 2021 09:16:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mAU3r-00089q-27
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 09:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVyCtIm/Mm8muA0riJ8MIfbveYdEJdEEOYuXr4lTiZI=; b=VEMTUgR/KbHpMSwqYI+UmijfEQ
 vBsNR6HBS53aUlkQiZPnRPHB6TduzqiEEObtWE0CA/5m8UKYh5iFS1srDuc355ooVKUx8fXy2IrrG
 leCUG/unRKb2HwauqK3VEM9dvXiqKpB1k6v+EoFRdu4v8D4iItzQYBVQP8lvobkeeTXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVyCtIm/Mm8muA0riJ8MIfbveYdEJdEEOYuXr4lTiZI=; b=hYoHXOue5PSr+sDq+wlrWTE9qM
 FCdzIYMijfaocwssaLsuL3jA56yMoQTZW4zJBQbXsY6xbzgM9XQuzKAOB87fy6BbASAARlu7zM5nk
 pMplSk/Abk4cQ9JVyUfQM1FTsWuWlnmBgUI8pvhx/kCu2UXNqc7yHg3ICgu/Dn0Q+1y4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAU3p-0004OX-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 09:16:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60B5D604AC;
 Mon,  2 Aug 2021 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627895792;
 bh=zrg6mn9Pq04VnDfI2UrnZolDhRXQdluXenAFbQF9jHU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Tqj8mPldpWrnu4rjCKk5phzXBynV6V1p7/oywCQIqxwdrzS5EykLcMyj7hFQQY2a5
 Sg78pfAPHypTrFmjYgxlZWwLESFTPoPiA3CEnwSw7LQDqIKILDT3WKWoa/6mDrqyAH
 n0GZc4B7HZqjHGmvmvRzLnBDSDzYs1VU72sYSbH1gDRo3dImb2S179C04cPofrjMIi
 DQHE8xfNkgrKHbekVOY4dr99bbyH014Dpc0uhOssQPYEynYqgod/aLlX9l0P1Pembp
 f/u63isogqlOWs/0jTCneL//toOFImOqcl9dhS1qjoGoCqRh/U4655+AspGmQLqA9U
 0nhooHMNwLuNg==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210722231358.611801-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <54865f0f-7072-c209-4b1d-06a9894dbd55@kernel.org>
Date: Mon, 2 Aug 2021 17:16:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722231358.611801-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAU3p-0004OX-Ls
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs node to control ra_pages for
 fadvise seq file
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/23 7:13, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> fadvise() allows the user to expand the readahead window to double with
> POSIX_FADV_SEQUENTIAL, now. But, in some use cases, it is not that
> sufficient and we need to meet the need in a restricted way. We can
> control the multiplier value of bdi device readahead between 2 (default)
> and 256 for POSIX_FADV_SEQUENTIAL advise option.

Minor things as below comments....

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++++
>   fs/f2fs/f2fs.h                          |  2 ++
>   fs/f2fs/file.c                          | 32 +++++++++++++++++++++++++
>   fs/f2fs/super.c                         |  1 +
>   fs/f2fs/sysfs.c                         | 10 ++++++++
>   5 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 3d1f853c6681..60f1f176374e 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -507,3 +507,9 @@ Date:		July 2021
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	You can control for which gc mode the "gc_reclaimed_segments" node shows.
>   		Refer to the description of the modes in "gc_reclaimed_segments".
> +
> +What:		/sys/fs/f2fs/<disk>/seq_file_ra_mul
> +Date:		July 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	You can	control the multiplier value of	bdi device readahead window size
> +		between 2 (default) and 256 for POSIX_FADV_SEQUENTIAL advise option.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 502e47936651..c59329dcb1f6 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1733,6 +1733,8 @@ struct f2fs_sb_info {
>   	unsigned int gc_segment_mode;		/* GC state for reclaimed segments */
>   	unsigned int gc_reclaimed_segs[MAX_GC_MODE];	/* Reclaimed segs for each mode */
>   
> +	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	struct kmem_cache *page_array_slab;	/* page array entry */
>   	unsigned int page_array_slab_size;	/* default page array slab size */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..f71c90236815 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -23,6 +23,7 @@
>   #include <linux/nls.h>
>   #include <linux/sched/signal.h>
>   #include <linux/fileattr.h>
> +#include <linux/fadvise.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -4332,6 +4333,36 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	return ret;
>   }
>   
> +static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
> +		int advice)
> +{
> +	int ret;
> +	struct inode *inode;
> +	struct address_space *mapping;
> +	struct backing_dev_info *bdi;
> +
> +	if (advice == POSIX_FADV_SEQUENTIAL) {
> +		inode = file_inode(filp);
> +		if (S_ISFIFO(inode->i_mode))
> +			return -ESPIPE;
> +
> +		mapping = filp->f_mapping;
> +		if (!mapping || len < 0)
> +			return -EINVAL;
> +
> +		bdi = inode_to_bdi(mapping->host);
> +		filp->f_ra.ra_pages = bdi->ra_pages * F2FS_I_SB(inode)->seq_file_ra_mul;

Exceed 80 columns...

> +		spin_lock(&filp->f_lock);
> +		filp->f_mode &= ~FMODE_RANDOM;
> +		spin_unlock(&filp->f_lock);
> +		return 0;
> +	}
> +
> +	ret = generic_fadvise(filp, offset, len, advice);
> +
> +	return ret;

return generic_fadvise(filp, offset, len, advice); ?

Then we can remove @ret definition.

> +}
> +
>   #ifdef CONFIG_COMPAT
>   struct compat_f2fs_gc_range {
>   	u32 sync;
> @@ -4460,4 +4491,5 @@ const struct file_operations f2fs_file_operations = {
>   #endif
>   	.splice_read	= generic_file_splice_read,
>   	.splice_write	= iter_file_splice_write,
> +	.fadvise	= f2fs_file_fadvise,
>   };
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9089303f7f8c..ccb745807fe1 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3312,6 +3312,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>   	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
>   	sbi->migration_granularity = sbi->segs_per_sec;
> +	sbi->seq_file_ra_mul = 2;
>   
>   	sbi->dir_level = DEF_DIR_LEVEL;
>   	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 15fe30d3aeb5..9a21be63436d 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -538,6 +538,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "seq_file_ra_mul")) {
> +		if (t >= 2 && t <= 256)

Would it be better to use macro to instead number?

Thanks,

> +			sbi->seq_file_ra_mul = t;
> +		else
> +			return -EINVAL;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -763,6 +771,7 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
>   F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
>   F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
>   
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
>   
> @@ -838,6 +847,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(atgc_candidate_count),
>   	ATTR_LIST(atgc_age_weight),
>   	ATTR_LIST(atgc_age_threshold),
> +	ATTR_LIST(seq_file_ra_mul),
>   	ATTR_LIST(gc_segment_mode),
>   	ATTR_LIST(gc_reclaimed_segments),
>   	NULL,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
