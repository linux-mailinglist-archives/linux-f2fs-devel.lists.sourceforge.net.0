Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D697B814
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 08:44:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqoPt-0001bA-6B;
	Wed, 18 Sep 2024 06:43:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sqoPr-0001ap-09
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 06:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+F3dtEhuOUWcgC5KSG6+C+1CSkVNaVmgiHPWA4pGHM=; b=lM89NQ+aIlE3ZfqA1D+BzhH+fx
 8WIRvnTTtCcj+nOSY/0HPbyB6uOk7TaN7jYMze1lL7tNDzUBJ3E2RLvGfHQ+fLsjXuKZNV24fMdpI
 E7gMCRlxd9Afk6ThExEVDgrO2EarWYpk/Svym/0cAruahkX/VzsCB238Lzyjip0f3p7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5+F3dtEhuOUWcgC5KSG6+C+1CSkVNaVmgiHPWA4pGHM=; b=eCgehqTo+FTjnmgrgwFjSVghSj
 ypQQFJsL6BrdNIzI1xCYaEGxv++nb6rIQeVQ6e8ZwI7tU8Tls5h21cPrYKl4jT2PYH1HEJ34f96Sl
 gcgHMwcZtvNeWfZv+xnISSjAAWELm4LnF2ovuMqAbHtHTXacbTg6N22oAeN1HoKMgc+8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqoPq-0005jU-3N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 06:43:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0800D5C5943;
 Wed, 18 Sep 2024 06:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC09C4CEC3;
 Wed, 18 Sep 2024 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726641828;
 bh=YDkmVjADAn5ZsljbPwya7Vl8v9ZGj+0kyF+MMrdCVa4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I8SD3xjJuEUMhOGbAohhBMrXpH2TQh5G+pHIWYeCK7q8IX7NKrzahsPDfjKDmwFK5
 YmpUlaDOy20yX7GUh3b/yjxMdtH6xTHIYZUeMlCBhR2RXmV7VU8XhLrU8N1GMr/phY
 bOsiiKOw2JDEqAAjuBj5nvZnb/fdRuXSUZ9zJbvEBDxfqun3NAE9k80m0B2sfDiIh3
 cOK8QaUQAb2urNJZ03J1ksTSp4ef3qmFezd1B+eGumutUOSGe1Us/KHUJX31GPlqXY
 DvSS+RVYIrMuhS/Oj5YmDxVjmRPkpVwu3xXt8DjLvckIigj6ozELVV/FMOpH7WdUiV
 Pk0jtTL5IwDTA==
Message-ID: <17ceed17-b17f-42d9-8c82-79f1f4814c1a@kernel.org>
Date: Wed, 18 Sep 2024 14:43:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liuderong@oppo.com, jaegeuk@kernel.org
References: <1726123214-208356-1-git-send-email-liuderong@oppo.com>
 <1726123214-208356-3-git-send-email-liuderong@oppo.com>
Content-Language: en-US
In-Reply-To: <1726123214-208356-3-git-send-email-liuderong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/12 14:40,
 liuderong@oppo.com wrote: > From: liuderong
 <liuderong@oppo.com> > > When segs_per_sec is larger than 1, section may
 contain free segments, > mtime should be the mean value of each [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqoPq-0005jU-3N
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce get_section_mtime
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

On 2024/9/12 14:40, liuderong@oppo.com wrote:
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
>   fs/f2fs/segment.c | 41 ++++++++++++++++++++++++++++++++++++-----
>   3 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4dcdcdd..d6adf0f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3762,6 +3762,8 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>   unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi);
>   unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>   			unsigned int segno);
> +unsigned long long get_section_mtime(struct f2fs_sb_info *sbi,
> +			unsigned int segno);

Hi Derong,

It needs to add "f2fs_" prefix for get_section_mtime() to avoid global
namespace pollution.

>   
>   #define DEF_FRAGMENT_SIZE	4
>   #define MIN_FRAGMENT_SIZE	1
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6299639..03c6117 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -332,20 +332,14 @@ static unsigned int check_bg_victims(struct f2fs_sb_info *sbi)
>   static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
>   {
>   	struct sit_info *sit_i = SIT_I(sbi);
> -	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> -	unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
>   	unsigned long long mtime = 0;
>   	unsigned int vblocks;
>   	unsigned char age = 0;
>   	unsigned char u;
> -	unsigned int i;
>   	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
>   
> -	for (i = 0; i < usable_segs_per_sec; i++)
> -		mtime += get_seg_entry(sbi, start + i)->mtime;
> +	mtime = get_section_mtime(sbi, segno);
>   	vblocks = get_valid_blocks(sbi, segno, true);
> -
> -	mtime = div_u64(mtime, usable_segs_per_sec);
>   	vblocks = div_u64(vblocks, usable_segs_per_sec);
>   
>   	u = BLKS_TO_SEGS(sbi, vblocks * 100);
> @@ -485,10 +479,7 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>   				struct victim_sel_policy *p, unsigned int segno)
>   {
>   	struct sit_info *sit_i = SIT_I(sbi);
> -	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> -	unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
>   	unsigned long long mtime = 0;
> -	unsigned int i;
>   
>   	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>   		if (p->gc_mode == GC_AT &&
> @@ -496,9 +487,7 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>   			return;
>   	}
>   
> -	for (i = 0; i < SEGS_PER_SEC(sbi); i++)
> -		mtime += get_seg_entry(sbi, start + i)->mtime;
> -	mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
> +	mtime = get_section_mtime(sbi, segno);
>   
>   	/* Handle if the system time has changed by the user */
>   	if (mtime < sit_i->min_mtime)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6627394..e62e722 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5389,6 +5389,41 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi)
>   	return SEGS_PER_SEC(sbi);
>   }
>   
> +unsigned long long get_section_mtime(struct f2fs_sb_info *sbi,
> +	unsigned int segno)
> +{
> +	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
> +	unsigned int secno = 0, start = 0;
> +	struct free_segmap_info *free_i = FREE_I(sbi);
> +	unsigned int valid_seg_count = 0;
> +	unsigned long long mtime = 0;
> +	unsigned int i = 0;
> +
> +	if (segno == NULL_SEGNO)
> +		return 0;

No needed.

> +
> +	secno = GET_SEC_FROM_SEG(sbi, segno);
> +	start = GET_SEG_FROM_SEC(sbi, secno);
> +
> +	if (!__is_large_section(sbi))
> +		return get_seg_entry(sbi, start + i)->mtime;
> +
> +	for (i = 0; i < usable_segs_per_sec; i++) {
> +		/* for large section, only check the mtime of valid segments */
> +		spin_lock(&free_i->segmap_lock);
> +		if (test_bit(start + i, free_i->free_segmap)) {
> +			mtime += get_seg_entry(sbi, start + i)->mtime;
> +			valid_seg_count++;
> +		}
> +		spin_unlock(&free_i->segmap_lock);
> +	}

After commit 6f3a01ae9b72 ("f2fs: record average update time of segment"),
mtime of segment starts to indicate average update time of segment.

So it needs to change like this?

for (i = 0; i < usable_segs_per_sec; i++) {
	struct seg_entry *se = get_seg_entry(sbi, start + i);

	mtime += se->mtime * se->valid_blocks;
	total_valid_blocks += se->valid_blocks;
}

if (total_valid_blocks == 0)
	return 0;

return div_u64(mtime, total_valid_blocks);

Thanks,

> +
> +	if (valid_seg_count == 0)
> +		return 0;
> +
> +	return div_u64(mtime, valid_seg_count);
> +}
> +
>   /*
>    * Update min, max modified time for cost-benefit GC algorithm
>    */
> @@ -5402,13 +5437,9 @@ static void init_min_max_mtime(struct f2fs_sb_info *sbi)
>   	sit_i->min_mtime = ULLONG_MAX;
>   
>   	for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
> -		unsigned int i;
>   		unsigned long long mtime = 0;
>   
> -		for (i = 0; i < SEGS_PER_SEC(sbi); i++)
> -			mtime += get_seg_entry(sbi, segno + i)->mtime;
> -
> -		mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
> +		mtime = get_section_mtime(sbi, segno);
>   
>   		if (sit_i->min_mtime > mtime)
>   			sit_i->min_mtime = mtime;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
