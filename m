Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7916B3E91BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 14:42:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDnYU-0000IX-FA; Wed, 11 Aug 2021 12:41:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mDnYS-0000IM-G4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 12:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7jv5eR05mzVB0kuVBFkBRM/RMSHy/+SOTkqBWl8V3oE=; b=O/s0xw8SXVqzRyIsTgIpDCAA8C
 yeLPoU7cK0mWITkKOt0Sr5r9vCzRDMj3mq90aOzIK7x+0ZMuflNg/GtkCRMr+rGWzael3g7xSEYSK
 599L8wpUjKTaySn3gCbm8SELH64MdsL2aHvtYys5rVhhsEOVjwcUKoqH9jOkFgciDqPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7jv5eR05mzVB0kuVBFkBRM/RMSHy/+SOTkqBWl8V3oE=; b=a7wGRfwETc1iK8pQjkmSZLeBmN
 Rnfs21CWmrjODX0yGA5Uxz3FMDfotFKYGHRI36WK0JpJPQYwpgq2PmJ5pNHKt8GhevRMRju2DPl5k
 uubxLcx4sBxRcQJaCHSjk281AsI7Gav3WN3bX6KecSHG79ourpAxD+FU7VoTPtB8Y4rQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDnYQ-0002CD-M5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 12:41:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C44D60C41;
 Wed, 11 Aug 2021 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628685701;
 bh=o/ghcMSP/MHl3Q3pPgWEXA0wrBgFxhinLG9n1RyxHbg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iwEtj4fPFDd7ythJCXUbJOwLgJGat6ENjgfu63OnGtAH9u1Q/UBB53OscKVZbje2K
 tdGTLT8RhaJ60I/gzNM6l5HiV0bcrIbc+qlwfWOx3UfaluZ4Ti+ob9CaSdfcKrGH3q
 NYV5uw1eAU/lbpoKcfG+aiz3x1nSGI7RvT1ltbrKeKik3p6uqw+IJekKy9N9pZ2zsW
 jYSvleLblLdHHtG/p77/Y3YqWex+5oRQnwHu6TZqQ+G+qkldlti9fI5vrOmyKZ9FAP
 itxHRqKh7PR4TFCDN+0QPlZly/WeulGQKg1lyZa7iBK3ygRCEzr7Vn2viLtbnQiysi
 xeFaX6Y2QqkaQ==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210809185449.2565768-1-daeho43@gmail.com>
 <425daf77-8020-26ce-dc9f-019d9a881b78@kernel.org>
 <CACOAw_xTh_HZizaVzDNjnVswu_OQwOjzEWRNxouGtM9E5qj6Pg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <071534dd-cf10-38d3-b83b-c833f9c0a70a@kernel.org>
Date: Wed, 11 Aug 2021 20:41:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_xTh_HZizaVzDNjnVswu_OQwOjzEWRNxouGtM9E5qj6Pg@mail.gmail.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDnYQ-0002CD-M5
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce blk_alloc_mode mount
 option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/11 13:41, Daeho Jeong wrote:
> On Tue, Aug 10, 2021 at 6:58 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/8/10 2:54, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> Added a mount option to control block allocation mode for filesystem
>>> developer to simulate filesystem fragmentation and after-GC situation
>>> for experimental reasons to understand the filesystem behaviors well
>>
>> At a glance, I think this functionality can be used to initialize filesystem
>> status as fragmented one, which is commonly used in the first step of aging
>> test, in order to make filesystem fragmented, aging program needs to fill
>> file or block sequentially and remove them at fixed interval, that takes a
>> lot of time. IMO, it will be great to support this by filesystem naturally
>> to save time of aging filessytem, rather just for experimental reasons to
>> understand filesystem behavior.
>>
> 
> Yes, that's what I meant~ :)
> 
>> Maybe we can add a new mode for filesystem allocation mode except adaptive
>> and lfs mode, maybe "fragment" mode... :P
>>
> 
> Sounds good~ Could you suggest the names for both blk_random and seg_random.
> We need seg_random mode,too, in order to simulate after-GC condition.

mode=fragment:block and mode=fragment:segment?

> 
>>> under the severe condition. This supports "normal", "seg_random" and
>>> "blk_random:<num>" options.
>>>
>>> "normal" (default): f2fs allocates blocks in the normal way.
>>> "seg_random": f2fs allocates a new segment in ramdom position.
>>>                 With this, we can simulate the after-GC condition.
>>> "blk_random:<num>": We can make f2fs allocate only 1..<num> blocks
>>>                       in a row and forcibly change the segment randomly.
>>>                       With this, the newly allocated blocks will be scatter
>>>                       throughout the whole partition and we can simulate
>>>                       filesystem fragmentation condition.
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>
>>> ---
>>> v2: changed the <num> initialization way.
>>> ---
>>>    Documentation/filesystems/f2fs.rst | 16 ++++++++++
>>>    fs/f2fs/f2fs.h                     | 20 +++++++++++++
>>>    fs/f2fs/gc.c                       |  5 +++-
>>>    fs/f2fs/segment.c                  | 12 ++++++++
>>>    fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++++++++
>>>    5 files changed, 99 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>>> index ff9e7cc97c65..a0ca963fda20 100644
>>> --- a/Documentation/filesystems/f2fs.rst
>>> +++ b/Documentation/filesystems/f2fs.rst
>>> @@ -312,6 +312,22 @@ inlinecrypt               When possible, encrypt/decrypt the contents of encrypted
>>>                         Documentation/block/inline-encryption.rst.
>>>    atgc                         Enable age-threshold garbage collection, it provides high
>>>                         effectiveness and efficiency on background GC.
>>> +blk_alloc_mode=%s     Control block allocation mode. This is a developer option
>>> +                      for experiments to simulate filesystem fragmentation and
>>> +                      after-GC situation. The developers use this mode to understand
>>> +                      filesystem fragmentation and after-GC condition well, and
>>> +                      eventually get the insight to handle them better.
>>> +                      This supports "normal", "seg_random" and "blk_random:<num>" modes.
>>> +                      In "normal" mode (default), f2fs allocates blocks in the normal way.
>>> +                      In "seg_random", f2fs allocates a new segment in ramdom position.
>>> +                      With this, we can simulate the after-GC condition.
>>> +                      In "blk_random:<num>", we can make f2fs allocate only 1..<num>
>>> +                      blocks in a row and forcibly change the segment randomly.
>>> +                      You can set the <num> within 1 .. 512 number.
>>> +                      With this, the newly allocated blocks will be scatter throughout
>>> +                      the whole partition and we can simulate filesystem fragmentation
>>> +                      condition. Please, use this option for your experiments and we
>>> +                      strongly recommand a filesystem format after using this option.
>>>    ======================== ============================================================
>>>
>>>    Debugfs Entries
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index fccee18ab776..aed09e8c0fce 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -155,6 +155,9 @@ struct f2fs_mount_info {
>>>        int compress_mode;                      /* compression mode */
>>>        unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
>>>        unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
>>> +
>>> +     int blk_alloc_mode;             /* block allocation mode */
>>> +     int blk_alloc_random_max;       /* the maximum chunk size for block random allocation mode */
>>>    };
>>>
>>>    #define F2FS_FEATURE_ENCRYPT                0x0001
>>> @@ -1740,6 +1743,8 @@ struct f2fs_sb_info {
>>>
>>>        unsigned long seq_file_ra_mul;          /* multiplier for ra_pages of seq. files in fadvise */
>>>
>>> +     int blk_alloc_remained;                 /* remained block count for this block allocation period */
>>> +
>>>    #ifdef CONFIG_F2FS_FS_COMPRESSION
>>>        struct kmem_cache *page_array_slab;     /* page array entry */
>>>        unsigned int page_array_slab_size;      /* default page array slab size */
>>> @@ -3619,6 +3624,21 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
>>>    unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>>>                        unsigned int segno);
>>>
>>> +#define MIN_BLK_ALLOC_RANDOM 1
>>> +#define MAX_BLK_ALLOC_RANDOM 512
>>> +
>>> +enum {
>>> +     BLK_ALLOC_MODE_NORMAL,          /* normal block allocation mode */
>>> +     BLK_ALLOC_MODE_SEG_RANDOM,      /* make segment allocation random */
>>> +     BLK_ALLOC_MODE_BLK_RANDOM,      /* make block allocation random */
>>> +};
>>> +
>>> +static inline bool f2fs_need_seg_random(struct f2fs_sb_info *sbi)
>>> +{
>>> +     return F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_SEG_RANDOM ||
>>> +             F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_BLK_RANDOM;
>>> +}
>>> +
>>>    /*
>>>     * checkpoint.c
>>>     */
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index 9dce44619069..571b50322e6e 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -14,6 +14,7 @@
>>>    #include <linux/delay.h>
>>>    #include <linux/freezer.h>
>>>    #include <linux/sched/signal.h>
>>> +#include <linux/random.h>
>>>
>>>    #include "f2fs.h"
>>>    #include "node.h"
>>> @@ -256,7 +257,9 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>>>                p->max_search = sbi->max_victim_search;
>>>
>>>        /* let's select beginning hot/small space first in no_heap mode*/
>>> -     if (test_opt(sbi, NOHEAP) &&
>>> +     if (f2fs_need_seg_random(sbi))
>>> +             p->offset = prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
>>> +     else if (test_opt(sbi, NOHEAP) &&
>>>                (type == CURSEG_HOT_DATA || IS_NODESEG(type)))
>>>                p->offset = 0;
>>>        else
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>> index f9b7fb785e1d..6dff2d36ad6b 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/timer.h>
>>>    #include <linux/freezer.h>
>>>    #include <linux/sched/signal.h>
>>> +#include <linux/random.h>
>>>
>>>    #include "f2fs.h"
>>>    #include "segment.h"
>>> @@ -2587,6 +2588,8 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>>>        unsigned short seg_type = curseg->seg_type;
>>>
>>>        sanity_check_seg_type(sbi, seg_type);
>>> +     if (f2fs_need_seg_random(sbi))
>>> +             return prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);
>>>
>>>        /* if segs_per_sec is large than 1, we need to keep original policy. */
>>>        if (__is_large_section(sbi))
>>> @@ -3150,6 +3153,15 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
>>>    static bool __has_curseg_space(struct f2fs_sb_info *sbi,
>>>                                        struct curseg_info *curseg)
>>>    {
>>> +     /* To allocate block chunks in different sizes, use random number */
>>> +     if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_BLK_RANDOM) {
>>> +             if (--sbi->blk_alloc_remained < 0) {
>>> +                     sbi->blk_alloc_remained = prandom_u32() %
>>> +                             F2FS_OPTION(sbi).blk_alloc_random_max;
>>> +                     return false;
>>> +             }
>>> +     }
>>
>> Why not adjusting __refresh_next_blkoff(), so we can control granularity of
>> allocation interval, e.g.
>>
>>          if (seg->alloc_type == SSR)
>>                  seg->next_blkoff =
>>                          __next_free_blkoff(sbi, seg->segno,
>>                                                  seg->next_blkoff + 1);
>>          else if (seg->alloc_type == LFS)
>>                  seg->next_blkoff++;
>>          else
>>                  seg->next_blkoff += sbi->fragment_granularity;
>>
>> Thanks,
>>
> 
> I am not sure this is safe, is this?

I didn't look into the details, but what I mean here is we can control
log header pointer directly to fragment filesystem as we expect.

> Plus, I wanted to allocate the blocks in a chunk sized between
> <1..num>. This is a little bit different from what I meant.

Ah, I see, maybe we can maintain an extra config cur_chunk_size for each
log header to control chunksize in fragmenting flow.

__refresh_next_blkoff()

	seg->next_blkoff++;
	seg->cur_chunk_size++;
	if (seg->cur_chunk_size == sbi->fragment_chunk_size) {
		seg->cur_chunk_size = 0;
		seg->next_blkoff += sbi->fragment_hole_size;
	}

.fragment_chunk_size + .fragment_hole_size should be 1 << n (1 <= n <= 9), e.g.:

a) data(4k) | hole(4k) | data | hole | ...
.fragment_chunk_size = 1
.fragment_hole_size = 1

b) data(12k) | hole(4k) | data | hole | ...
.fragment_chunk_size = 3
.fragment_hole_size = 1

c) data(4k) | hole (12k) |data | hole | ...
.fragment_chunk_size = 1
.fragment_hole_size = 3

And we can control .fragment_chunk_size and .fragment_hole_size via sysfs?

Thoughts?

Thanks,

> 
> 
>>> +
>>>        return curseg->next_blkoff < f2fs_usable_blks_in_seg(sbi,
>>>                                                        curseg->segno);
>>>    }
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 9ead6d2e703b..ef14f3e8b29a 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -155,6 +155,7 @@ enum {
>>>        Opt_atgc,
>>>        Opt_gc_merge,
>>>        Opt_nogc_merge,
>>> +     Opt_blk_alloc_mode,
>>>        Opt_err,
>>>    };
>>>
>>> @@ -231,6 +232,7 @@ static match_table_t f2fs_tokens = {
>>>        {Opt_atgc, "atgc"},
>>>        {Opt_gc_merge, "gc_merge"},
>>>        {Opt_nogc_merge, "nogc_merge"},
>>> +     {Opt_blk_alloc_mode, "blk_alloc_mode=%s"},
>>>        {Opt_err, NULL},
>>>    };
>>>
>>> @@ -1173,6 +1175,40 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>>>                case Opt_nogc_merge:
>>>                        clear_opt(sbi, GC_MERGE);
>>>                        break;
>>> +             case Opt_blk_alloc_mode:
>>> +                     name = match_strdup(&args[0]);
>>> +                     if (!name)
>>> +                             return -ENOMEM;
>>> +                     if (!strcmp(name, "normal")) {
>>> +                             F2FS_OPTION(sbi).blk_alloc_mode =
>>> +                                     BLK_ALLOC_MODE_NORMAL;
>>> +                     } else if (!strcmp(name, "seg_random")) {
>>> +                             F2FS_OPTION(sbi).blk_alloc_mode =
>>> +                                     BLK_ALLOC_MODE_SEG_RANDOM;
>>> +                     } else if (!strncmp(name, "blk_random:", 11)) {
>>> +                             const char *num = name + 11;
>>> +                             long size;
>>> +
>>> +                             ret = kstrtol(num, 10, &size);
>>> +                             if (ret) {
>>> +                                     kfree(name);
>>> +                                     return ret;
>>> +                             }
>>> +                             if (size < MIN_BLK_ALLOC_RANDOM)
>>> +                                     size = MIN_BLK_ALLOC_RANDOM;
>>> +                             else if (size > MAX_BLK_ALLOC_RANDOM)
>>> +                                     size = MAX_BLK_ALLOC_RANDOM;
>>> +
>>> +                             F2FS_OPTION(sbi).blk_alloc_mode =
>>> +                                     BLK_ALLOC_MODE_BLK_RANDOM;
>>> +                             F2FS_OPTION(sbi).blk_alloc_random_max = size;
>>> +                             sbi->blk_alloc_remained = size;
>>> +                     } else {
>>> +                             kfree(name);
>>> +                             return -EINVAL;
>>> +                     }
>>> +                     kfree(name);
>>> +                     break;
>>>                default:
>>>                        f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>>>                                 p);
>>> @@ -1919,6 +1955,14 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>>>        else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_NOBARRIER)
>>>                seq_printf(seq, ",fsync_mode=%s", "nobarrier");
>>>
>>> +     if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_NORMAL)
>>> +             seq_printf(seq, ",blk_alloc_mode=%s", "normal");
>>> +     else if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_SEG_RANDOM)
>>> +             seq_printf(seq, ",blk_alloc_mode=%s", "seg_random");
>>> +     else if (F2FS_OPTION(sbi).blk_alloc_mode == BLK_ALLOC_MODE_BLK_RANDOM)
>>> +             seq_printf(seq, ",blk_alloc_mode=%s:%d", "blk_random",
>>> +                             F2FS_OPTION(sbi).blk_alloc_random_max);
>>> +
>>>    #ifdef CONFIG_F2FS_FS_COMPRESSION
>>>        f2fs_show_compress_options(seq, sbi->sb);
>>>    #endif
>>> @@ -1947,6 +1991,9 @@ static void default_options(struct f2fs_sb_info *sbi)
>>>        F2FS_OPTION(sbi).compress_ext_cnt = 0;
>>>        F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
>>>        F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>>> +     F2FS_OPTION(sbi).blk_alloc_mode = BLK_ALLOC_MODE_NORMAL;
>>> +     F2FS_OPTION(sbi).blk_alloc_random_max = MAX_BLK_ALLOC_RANDOM;
>>> +     sbi->blk_alloc_remained = MAX_BLK_ALLOC_RANDOM;
>>>
>>>        sbi->sb->s_flags &= ~SB_INLINECRYPT;
>>>
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
