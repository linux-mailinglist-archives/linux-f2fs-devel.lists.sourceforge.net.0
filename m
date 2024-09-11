Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D72974FA4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 12:23:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soKVH-0002Yd-GD;
	Wed, 11 Sep 2024 10:23:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soKVE-0002YW-EQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 10:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kx4aHhh0p5dWSgOAK2KVv+FYKzdVwMc7gsrfYyIo33A=; b=DOYoDYMI4slH9VrpIMcEK/7JB5
 lhlHDMm8VLizlHYKmjgDCBQrwiS3u/MNyg+tQZVB0WZ5WDHzrUjgYd5ewZxWOimrIbU0nX2Ek4O2E
 qfVZB5bD+U8oROJw7ilOH1W9KcmCMmnWf29NgoL4KPXh5g3qD5YnACplR7k5X/kO9adw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kx4aHhh0p5dWSgOAK2KVv+FYKzdVwMc7gsrfYyIo33A=; b=WmBZlV3XM6gjxWV9aAYQhAI/DL
 R4CRwYj8g0REepk+J7P2Th87wpMd0x8QMNa7wwy9qRdKeGP7kyvUxW4TBLmIr0xxM5XBA3gV12cCc
 wuGZpi2cf51tCi/MvG8Q6k7VxlM7H+JnxESOpgIZZHoQ4aGX16eA1lUTReASd5BM/Amw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soKVC-0000wn-S6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 10:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 89E0DA44BD7;
 Wed, 11 Sep 2024 10:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703FCC4CEC5;
 Wed, 11 Sep 2024 10:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726050179;
 bh=f0S4FUmNZzyRmAxdsEPeHrzAY8IG+/3ETr++B8BFpw0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vPsfzm+cEdLxRShf6ekewpfkStsxG20DZZpTLsKG6zj9Ws2tqHUzJhOTGqO31JlxG
 hw2ChIf6Tvu4IVskUeCcnmtbF2Rv+LSTLLiAD8bzW6EeVO6rMLMQPF6IstTrJvX/4I
 fdWeTSchwFRKQ7UIj8oB9W7LzJ2LHUGx1PFHiRlpP0SPnobFXdxZz0EO56nLMUpXje
 1E7a/HvRxOcuF3OpbP5aSEE+0AkrmvGvm4fnbKiiuUB9M3bW5YvZcCOzDHPzxcn3dP
 hfLpesyAKc3Ogv/BV0iLt/O7vf9ybvdeM1ZgjfXW19M61Kg4cdGJbN60VKnGifi/7n
 sjwIZMpY3ntKw==
Message-ID: <56e4e969-12d3-45c7-bb6a-27207ae4bf4c@kernel.org>
Date: Wed, 11 Sep 2024 18:22:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liuderong@oppo.com, jaegeuk@kernel.org
References: <1726022421-58677-1-git-send-email-liuderong@oppo.com>
 <1726022421-58677-3-git-send-email-liuderong@oppo.com>
Content-Language: en-US
In-Reply-To: <1726022421-58677-3-git-send-email-liuderong@oppo.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/11 10:40,
 liuderong@oppo.com wrote: > From: liuderong
 <liuderong@oppo.com> > > When segs_per_sec is larger than 1, section may
 contain free segments, > mtime should be the mean value of each [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soKVC-0000wn-S6
Subject: Re: [f2fs-dev] [PATCH v1 2/2] f2fs: introduce get_section_mtime
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/11 10:40, liuderong@oppo.com wrote:
> From: liuderong <liuderong@oppo.com>
> 
> When segs_per_sec is larger than 1, section may contain free segments,
> mtime should be the mean value of each valid segments,
> so introduce get_section_mtime to exclude free segments in a section.
> 
> Signed-off-by: liuderong <liuderong@oppo.com>
> ---
>   fs/f2fs/f2fs.h    |  2 ++
>   fs/f2fs/gc.c      | 15 ++-------------
>   fs/f2fs/segment.c | 49 ++++++++++++++++++++++++++++++++++++++++++++-----
>   3 files changed, 48 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4dcdcdd..d6adf0f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3762,6 +3762,8 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>   unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi);
>   unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>                          unsigned int segno);
> +unsigned long long get_section_mtime(struct f2fs_sb_info *sbi,
> +                       unsigned int segno);
> 
>   #define DEF_FRAGMENT_SIZE      4
>   #define MIN_FRAGMENT_SIZE      1
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6299639..03c6117 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -332,20 +332,14 @@ static unsigned int check_bg_victims(struct f2fs_sb_info *sbi)
>   static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
>   {
>          struct sit_info *sit_i = SIT_I(sbi);
> -       unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> -       unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
>          unsigned long long mtime = 0;
>          unsigned int vblocks;
>          unsigned char age = 0;
>          unsigned char u;
> -       unsigned int i;
>          unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
> 
> -       for (i = 0; i < usable_segs_per_sec; i++)
> -               mtime += get_seg_entry(sbi, start + i)->mtime;
> +       mtime = get_section_mtime(sbi, segno);
>          vblocks = get_valid_blocks(sbi, segno, true);
> -
> -       mtime = div_u64(mtime, usable_segs_per_sec);
>          vblocks = div_u64(vblocks, usable_segs_per_sec);
> 
>          u = BLKS_TO_SEGS(sbi, vblocks * 100);
> @@ -485,10 +479,7 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>                                  struct victim_sel_policy *p, unsigned int segno)
>   {
>          struct sit_info *sit_i = SIT_I(sbi);
> -       unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> -       unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
>          unsigned long long mtime = 0;
> -       unsigned int i;
> 
>          if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>                  if (p->gc_mode == GC_AT &&
> @@ -496,9 +487,7 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>                          return;
>          }
> 
> -       for (i = 0; i < SEGS_PER_SEC(sbi); i++)
> -               mtime += get_seg_entry(sbi, start + i)->mtime;
> -       mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
> +       mtime = get_section_mtime(sbi, segno);
> 
>          /* Handle if the system time has changed by the user */
>          if (mtime < sit_i->min_mtime)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6627394..b63f35fa 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5389,6 +5389,49 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi)
>          return SEGS_PER_SEC(sbi);
>   }
> 
> +unsigned long long get_section_mtime(struct f2fs_sb_info *sbi,
> +       unsigned int segno)
> +{
> +       unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
> +       unsigned int secno = 0, start = 0;
> +       struct free_segmap_info *free_i = FREE_I(sbi);
> +       unsigned int valid_seg_count = 0;
> +       unsigned long long mtime = 0;
> +       unsigned int i;
> +
> +       if (segno == NULL_SEGNO)
> +               return 0;
> +
> +       secno = GET_SEC_FROM_SEG(sbi, segno);
> +       start = GET_SEG_FROM_SEC(sbi, secno);
> +
> +       for (i = 0; i < usable_segs_per_sec; i++) {
> +               /* for large section, only check the mtime of valid segments */
> +               if (__is_large_section(sbi)) {
> +                       spin_lock(&free_i->segmap_lock);
> +                       if (test_bit(start + i, free_i->free_segmap)) {
> +                               mtime += get_seg_entry(sbi, start + i)->mtime;
> +                               valid_seg_count++;
> +                       }
> +                       spin_unlock(&free_i->segmap_lock);
> +               } else {
> +                       mtime += get_seg_entry(sbi, start + i)->mtime;
> +               }
> +       }
> +
> +       if (__is_large_section(sbi)) {
> +               if (!valid_seg_count)
> +                       goto out;
> +               mtime = div_u64(mtime, valid_seg_count);
> +       } else {
> +               mtime = div_u64(mtime, usable_segs_per_sec);
> +       }

What about:

if (!__is_large_section(sbi))
	return get_seg_entry(sbi, start + i)->mtime;

for (i = 0; i < usable_segs_per_sec; i++) {
	/* for large section, only check the mtime of valid segments */
	...
}

return div_u64(mtime, usable_segs_per_sec);

Thanks,

> +
> +out:
> +       return mtime;
> +}
> +
>   /*
>    * Update min, max modified time for cost-benefit GC algorithm
>    */
> @@ -5402,13 +5445,9 @@ static void init_min_max_mtime(struct f2fs_sb_info *sbi)
>          sit_i->min_mtime = ULLONG_MAX;
> 
>          for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
> -               unsigned int i;
>                  unsigned long long mtime = 0;
> 
> -               for (i = 0; i < SEGS_PER_SEC(sbi); i++)
> -                       mtime += get_seg_entry(sbi, segno + i)->mtime;
> -
> -               mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
> +               mtime = get_section_mtime(sbi, segno);
> 
>                  if (sit_i->min_mtime > mtime)
>                          sit_i->min_mtime = mtime;
> --
> 2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
