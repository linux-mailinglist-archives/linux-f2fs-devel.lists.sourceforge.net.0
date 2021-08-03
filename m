Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD53DE47F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Aug 2021 04:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAkNr-000192-DF; Tue, 03 Aug 2021 02:42:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mAkNq-00018v-1G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 02:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWBZszKpKOQ1BibD20aN4NIRn4cRsMyz86+bE0oRkwk=; b=b7UA4wvk1w2ehrGHEvX0JoTBkp
 XvSCiBH+n0TQJF62Nf6y2ShASTaQIgX4pqDbsJ8ViZ9Jpu4erUqPmiYbHLkxFLA/STGUUpnDeIHHd
 JICGr+mpXkA70fpgT+J5AqChWjkbIwvw8yDKjNjxa+Ps8J6zkA2ScWdNgsevJr29rFT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWBZszKpKOQ1BibD20aN4NIRn4cRsMyz86+bE0oRkwk=; b=aflbVDOxQ+RQ5NCfxtKXB6u9tN
 73QcFq27sSASaXNLRbINaXGAdxPJHu4TbEO4PjnwANUhQ0buGettGtmvc5rsVDLjzxdrV5ubowdql
 8GBCis1MbW9YE5zKp4ApOqrE5lhN+STmOheb8nrSKx8aQZ9XWeD3wnTT2iKvVlEL7paY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAkNk-00AjXd-8X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 02:42:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD80660EE8;
 Tue,  3 Aug 2021 02:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627958530;
 bh=xXMRW/WDePCFaDeizqziaVM0jOmidKkj8W5d5Jyazwo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EDQpDTrYyA6wHEV6hLIhGqF3bmlG2ajVIzj9NvGtdXiN3fAKhm+aN2X3zHGEptMtV
 dCAH8AmLckZONV3Rw8KMZlram3ql5hRXOY5w6HOPj1qDosVJowbRXpIZrZ/Nfs9QV0
 7djtGEf4iVtQUueHfxN5E5gwDCiSvPs/oLOT19+wbp11L9uin3FNgNPL5UoS9ji4rX
 nxiWJeXHz6t4VMAIejoEbJQ+FHxJ7zk6f3BX1bSFGrjRfQ0RYf9V1SkvUk1w+lVv5z
 7231aUbSuqY73FLi8f2ueaZgpiH8T35rxFqwP3KHQkVh6sfzGdSEpfGXveQ9KMyZQL
 YSMX8CR/W0GxQ==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210802175703.895964-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <448ec877-7486-c02b-e6ba-3c32aafff9bf@kernel.org>
Date: Tue, 3 Aug 2021 10:42:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802175703.895964-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
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
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAkNk-00AjXd-8X
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add sysfs node to control ra_pages
 for fadvise seq file
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/3 1:57, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> fadvise() allows the user to expand the readahead window to double with
> POSIX_FADV_SEQUENTIAL, now. But, in some use cases, it is not that
> sufficient and we need to meet the need in a restricted way. We can
> control the multiplier value of bdi device readahead between 2 (default)
> and 256 for POSIX_FADV_SEQUENTIAL advise option.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> ---
> v2: fix minor style issues
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++++
>   fs/f2fs/f2fs.h                          |  2 ++
>   fs/f2fs/file.c                          | 30 +++++++++++++++++++++++++
>   fs/f2fs/super.c                         |  1 +
>   fs/f2fs/sysfs.c                         | 13 +++++++++++
>   5 files changed, 52 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 845c4be535b0..73211f77d11e 100644
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
> index 8459b6d5a2f8..5d16486feb8f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1738,6 +1738,8 @@ struct f2fs_sb_info {
>   	unsigned int gc_segment_mode;		/* GC state for reclaimed segments */
>   	unsigned int gc_reclaimed_segs[MAX_GC_MODE];	/* Reclaimed segs for each mode */
>   
> +	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	struct kmem_cache *page_array_slab;	/* page array entry */
>   	unsigned int page_array_slab_size;	/* default page array slab size */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index b1cb5b50faac..1a631e6d3e9b 100644
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
> @@ -4332,6 +4333,34 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	return ret;
>   }
>   
> +static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
> +		int advice)
> +{
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
> +		filp->f_ra.ra_pages = bdi->ra_pages *
> +			F2FS_I_SB(inode)->seq_file_ra_mul;
> +		spin_lock(&filp->f_lock);
> +		filp->f_mode &= ~FMODE_RANDOM;
> +		spin_unlock(&filp->f_lock);
> +		return 0;
> +	}
> +
> +	return generic_fadvise(filp, offset, len, advice);
> +}
> +
>   #ifdef CONFIG_COMPAT
>   struct compat_f2fs_gc_range {
>   	u32 sync;
> @@ -4460,4 +4489,5 @@ const struct file_operations f2fs_file_operations = {
>   #endif
>   	.splice_read	= generic_file_splice_read,
>   	.splice_write	= iter_file_splice_write,
> +	.fadvise	= f2fs_file_fadvise,
>   };
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 72eb9d70969f..41765e90caa2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3422,6 +3422,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
>   	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
>   	sbi->migration_granularity = sbi->segs_per_sec;
> +	sbi->seq_file_ra_mul = 2;

sbi->seq_file_ra_mul = MIN_RA_MUL;

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


>   
>   	sbi->dir_level = DEF_DIR_LEVEL;
>   	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index b1725620c07d..44b086e5b607 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -50,6 +50,9 @@ struct f2fs_attr {
>   	int id;
>   };
>   
> +#define MIN_RA_MUL	2
> +#define MAX_RA_MUL	256
> +
>   static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   			     struct f2fs_sb_info *sbi, char *buf);
>   
> @@ -538,6 +541,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "seq_file_ra_mul")) {
> +		if (t >= MIN_RA_MUL && t <= MAX_RA_MUL)
> +			sbi->seq_file_ra_mul = t;
> +		else
> +			return -EINVAL;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -763,6 +774,7 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
>   F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
>   F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
>   
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
>   
> @@ -838,6 +850,7 @@ static struct attribute *f2fs_attrs[] = {
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
