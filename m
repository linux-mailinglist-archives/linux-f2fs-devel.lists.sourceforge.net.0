Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD23F93FF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Aug 2021 07:27:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJUO5-0007o7-HQ; Fri, 27 Aug 2021 05:26:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mJUO2-0007o0-FK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Aug 2021 05:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Alwp26wWHeLMPgp/blOHq2fntvK25pWBC2wPSOvsjzE=; b=BnYWZKLzFw8S8L/CvCmgsLLTic
 vxnp+bFJkhxKRy/lrF0jgBJ2yvQXaUZ7zT8JcSmVZLcKUUVPKO+gbAK14VcFQ+gkIjy8jwi4mEgyT
 mt0tEOY3D+5ouoqFFbgx0p0+m5V2pUQd5ggxJUdEOr1zBjxwm1cxPLJjU+GJKfJsX6PU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Alwp26wWHeLMPgp/blOHq2fntvK25pWBC2wPSOvsjzE=; b=kcwjUAUb+DRII003PjWZigqxjM
 jfTDKfZAwM3GYZeddr++DTbbm5EOj01w1BSyUWSrhtGcfQbyX1StqmX++bYNUsBp+SOGaAHNHBh+v
 lxYYu29/ZMZJOah/KVgkSIGipZvadfJy/upc4CMW16RUVQ2osD1J7doYbiDB0/rR9rcA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJUO0-0002sx-0y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Aug 2021 05:26:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DCE760F4C;
 Fri, 27 Aug 2021 05:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630041989;
 bh=FBmNSAmhYL1ZVElKyZX49jE7psvhuV0gJ/StadT7LPM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=E3e4cT+kwTd+lEIz2oxt8066+ihUJYP/UBTE2oSDSEtN14ieRcgsdlj4MmgrVBsoq
 jxGWvIr/UtuyfCfBmqtYBXhwQNpxPAAk11cBUxKi6MVvMRun+PwEtLBWcM+YBvx/C2
 UK+wP60BBzpIyDg8JVmh9aX+qgXaKjjysOsvpBlwe4GY759P9rtq3kuqIJq6XKdk7S
 rWVYtZhut3qeVovwwfD8e28bcOCEOhSEosujDaVuB8TZptKKtnLCqsGE9l3qTbD3JP
 AXvPdXWsF2Ry+sEeQs9hcOPLXHD8GQr5euO2KVb7qyTmHhDSPtsNOK5SVLoj+7hj3e
 /lig56jPquFmw==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210825185747.1627497-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <1f1e6d38-6bd1-17ea-b8ca-a45d1244728f@kernel.org>
Date: Fri, 27 Aug 2021 13:26:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825185747.1627497-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mJUO0-0002sx-0y
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce fragment allocation mode
 mount option
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

On 2021/8/26 2:57, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added two options into "mode=" mount option to make it possible for
> developers to make the filesystem fragmented or simulate filesystem
> fragmentation/after-GC situation itself. The developers use these modes
> to understand filesystem fragmentation/after-GC condition well,
> and eventually get some insights to handle them better.
> 
> "fragment:segment": f2fs allocates a new segment in ramdom position.
>                      With this, we can simulate the after-GC condition.
> "fragment:block"  : We can scatter block allocation with
>                      "fragment_chunk_max" and "fragment_hole_max" sysfs
>                      nodes. f2fs will allocate 1..<fragment_chunk_max>
>                      blocks in a chunk and make a hole in the length of
>                      1..<fragment_hole_max> by turns in a newly allocated
>                      free segment.

I'd like to add a fixed chunk/hole fragmentation mode in addition, then
userspace can control the fragmented chunk/hole with fixed size.

How do you think of renaming "fragment:block" to "fragment:rand_block", and
then I can add "fragment:fixed_block" option and its logic in addition?

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: changed mode name and added sysfs nodes to control the fragmentation
>      pattern.
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 18 ++++++++++++++++++
>   Documentation/filesystems/f2fs.rst      | 16 ++++++++++++++++
>   fs/f2fs/f2fs.h                          | 16 ++++++++++++++++
>   fs/f2fs/gc.c                            |  5 ++++-
>   fs/f2fs/segment.c                       | 17 +++++++++++++++--
>   fs/f2fs/super.c                         | 11 +++++++++++
>   fs/f2fs/sysfs.c                         | 20 ++++++++++++++++++++
>   7 files changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index f627e705e663..dba3997895ef 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -512,3 +512,21 @@ Date:		July 2021
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	You can	control the multiplier value of	bdi device readahead window size
>   		between 2 (default) and 256 for POSIX_FADV_SEQUENTIAL advise option.
> +
> +What:		/sys/fs/f2fs/<disk>/fragment_chunk_max
> +Date:		August 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	With "mode=fragment:block" mount option, we can scatter block allocation.
> +		Using this node, f2fs will allocate 1..<fragment_chunk_max> blocks in a chunk
> +		and make a hole in the length of 1..<fragment_hole_max> by turns in a newly
> +		allocated free segment. This value can be set between 1..512 and the default
> +		value is 4.
> +
> +What:		/sys/fs/f2fs/<disk>/fragment_hole_max
> +Date:		August 2021
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	With "mode=fragment:block" mount option, we can scatter block allocation.
> +		Using this node, f2fs will allocate 1..<fragment_chunk_max> blocks in a chunk
> +		and make a hole in the length of 1..<fragment_hole_max> by turns in a newly
> +		allocated free segment. This value can be set between 1..512 and the default
> +		value is 4.
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 09de6ebbbdfa..d2ddc1273f67 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -201,6 +201,22 @@ fault_type=%d		 Support configuring fault injection type, should be
>   mode=%s			 Control block allocation mode which supports "adaptive"
>   			 and "lfs". In "lfs" mode, there should be no random
>   			 writes towards main area.
> +			 "fragment:segment" and "fragment:block" are newly added here.
> +			 These are developer options for experiments to make the filesystem
> +			 fragmented or simulate filesystem fragmentation/after-GC situation
> +			 itself. The developers use these modes to understand filesystem
> +			 fragmentation/after-GC condition well, and eventually get some
> +			 insights to handle them better.
> +			 In "fragment:segment", f2fs allocates a new segment in ramdom
> +			 position. With this, we can simulate the after-GC condition.
> +			 In "fragment:block", we can scatter block allocation with
> +			 "fragment_chunk_max" and "fragment_hole_max" sysfs nodes. f2fs will
> +			 allocate 1..<fragment_chunk_max> blocks in a chunk and make
> +			 a hole in the length of 1..<fragment_hole_max> by turns in a newly
> +			 allocated free segment. With this, the newly allocated blocks will
> +			 be scattered throughout the whole partition. Please, use these
> +			 options for your experiments and we strongly recommend to re-format
> +			 the filesystem after using these options.
>   io_bits=%u		 Set the bit size of write IO requests. It should be set
>   			 with "mode=lfs".
>   usrquota		 Enable plain user disk quota accounting.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c24f03e054cb..4e591fc75ee7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1287,6 +1287,8 @@ enum {
>   enum {
>   	FS_MODE_ADAPTIVE,	/* use both lfs/ssr allocation */
>   	FS_MODE_LFS,		/* use lfs allocation only */
> +	FS_MODE_FRAGMENT_SEG,	/* segment fragmentation mode */
> +	FS_MODE_FRAGMENT_BLK,	/* block fragmentation mode */
>   };
>   
>   enum {
> @@ -1757,6 +1759,10 @@ struct f2fs_sb_info {
>   
>   	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
>   
> +	int fragment_chunk_max;		/* the maximum chunk size for fragment:block allocation mode */
> +	int fragment_hole_max;		/* the maximum hole size for fragment:block allocation mode */
> +	int fragment_remained_chunk;	/* remained size to make a full chunk */
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	struct kmem_cache *page_array_slab;	/* page array entry */
>   	unsigned int page_array_slab_size;	/* default page array slab size */
> @@ -3517,6 +3523,16 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
>   unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>   			unsigned int segno);
>   
> +#define DEF_FRAGMENT_SIZE	4
> +#define MIN_FRAGMENT_SIZE	1
> +#define MAX_FRAGMENT_SIZE	512
> +
> +static inline bool f2fs_fragment_mode(struct f2fs_sb_info *sbi)
> +{
> +	return F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG ||
> +		F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK;
> +}
> +
>   /*
>    * checkpoint.c
>    */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2c18443972b6..14046fb19a20 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -14,6 +14,7 @@
>   #include <linux/delay.h>
>   #include <linux/freezer.h>
>   #include <linux/sched/signal.h>
> +#include <linux/random.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -257,7 +258,9 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>   		p->max_search = sbi->max_victim_search;
>   
>   	/* let's select beginning hot/small space first in no_heap mode*/
> -	if (test_opt(sbi, NOHEAP) &&
> +	if (f2fs_fragment_mode(sbi))
> +		p->offset = prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
> +	else if (test_opt(sbi, NOHEAP) &&
>   		(type == CURSEG_HOT_DATA || IS_NODESEG(type)))
>   		p->offset = 0;
>   	else
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a135d2247415..0063c8ce18ac 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -15,6 +15,7 @@
>   #include <linux/timer.h>
>   #include <linux/freezer.h>
>   #include <linux/sched/signal.h>
> +#include <linux/random.h>
>   
>   #include "f2fs.h"
>   #include "segment.h"
> @@ -2630,6 +2631,8 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>   	unsigned short seg_type = curseg->seg_type;
>   
>   	sanity_check_seg_type(sbi, seg_type);
> +	if (f2fs_fragment_mode(sbi))
> +		return prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
>   
>   	/* if segs_per_sec is large than 1, we need to keep original policy. */
>   	if (__is_large_section(sbi))
> @@ -2707,12 +2710,22 @@ static int __next_free_blkoff(struct f2fs_sb_info *sbi,
>   static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>   				struct curseg_info *seg)
>   {
> -	if (seg->alloc_type == SSR)
> +	if (seg->alloc_type == SSR) {
>   		seg->next_blkoff =
>   			__next_free_blkoff(sbi, seg->segno,
>   						seg->next_blkoff + 1);
> -	else
> +	} else {
>   		seg->next_blkoff++;
> +		/* To allocate block chunks in different sizes, use random number */
> +		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK) {
> +			if (--sbi->fragment_remained_chunk <= 0) {

Do we need to consider multiple thread scenario? in such case,
.fragment_remained_chunk may update randomly.

In addition, multiple log headers share one .fragment_remained_chunk,
it may cause unexpected result, it means there may be continuous holes
or chunks in locality due to swithing between different log headers.

Thanks,

> +				sbi->fragment_remained_chunk =
> +				    prandom_u32() % sbi->fragment_chunk_max + 1;
> +				seg->next_blkoff +=
> +				    prandom_u32() % sbi->fragment_hole_max + 1;
> +			}
> +		}
> +	}
>   }
>   
>   bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 49e153fd8183..112b50bed186 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -817,6 +817,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
>   			} else if (!strcmp(name, "lfs")) {
>   				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
> +			} else if (!strcmp(name, "fragment:segment")) {
> +				F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_SEG;
> +			} else if (!strcmp(name, "fragment:block")) {
> +				F2FS_OPTION(sbi).fs_mode = FS_MODE_FRAGMENT_BLK;
>   			} else {
>   				kfree(name);
>   				return -EINVAL;
> @@ -1897,6 +1901,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   		seq_puts(seq, "adaptive");
>   	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
>   		seq_puts(seq, "lfs");
> +	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_SEG)
> +		seq_puts(seq, "fragment:segment");
> +	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
> +		seq_puts(seq, "fragment:block");
>   	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
>   	if (test_opt(sbi, RESERVE_ROOT))
>   		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
> @@ -3515,6 +3523,9 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
>   	sbi->migration_granularity = sbi->segs_per_sec;
>   	sbi->seq_file_ra_mul = MIN_RA_MUL;
> +	sbi->fragment_chunk_max = DEF_FRAGMENT_SIZE;
> +	sbi->fragment_hole_max = DEF_FRAGMENT_SIZE;
> +	sbi->fragment_remained_chunk = DEF_FRAGMENT_SIZE;
>   
>   	sbi->dir_level = DEF_DIR_LEVEL;
>   	sbi->interval_time[CP_TIME] = DEF_CP_INTERVAL;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index a1a3e0f6d658..42c41efd21d3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -551,6 +551,22 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "fragment_chunk_max")) {
> +		if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
> +			sbi->fragment_chunk_max = t;
> +		else
> +			return -EINVAL;
> +		return count;
> +	}
> +
> +	if (!strcmp(a->attr.name, "fragment_hole_max")) {
> +		if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
> +			sbi->fragment_hole_max = t;
> +		else
> +			return -EINVAL;
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -781,6 +797,8 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, fragment_chunk_max, fragment_chunk_max);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, fragment_hole_max, fragment_hole_max);
>   
>   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>   static struct attribute *f2fs_attrs[] = {
> @@ -859,6 +877,8 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(seq_file_ra_mul),
>   	ATTR_LIST(gc_segment_mode),
>   	ATTR_LIST(gc_reclaimed_segments),
> +	ATTR_LIST(fragment_chunk_max),
> +	ATTR_LIST(fragment_hole_max),
>   	NULL,
>   };
>   ATTRIBUTE_GROUPS(f2fs);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
