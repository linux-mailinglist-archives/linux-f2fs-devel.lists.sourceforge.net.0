Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE44E137CA4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jan 2020 10:33:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iqD9a-0001CQ-FH; Sat, 11 Jan 2020 09:33:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iqD9Y-0001C9-5q
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jULcxNjWMWMF2qOqyGWb8HWRGD4zLxAO5axtwlS8kmE=; b=k1JZnIVlkkVOXISkpNGMpifURK
 dMqo55Xn0XAxRRyUgZEqXY+ugJLoMhWNegMg9WQVWUXrL7Flj6qZzB1LklkoksfX2O0TDND9EKJvu
 EWemYtGZ0s6lCn3oNA+Hfo30TEmmjWmV/RBPEYM7ouVvNd0L9ylBBEZHo3S9U8h34FrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jULcxNjWMWMF2qOqyGWb8HWRGD4zLxAO5axtwlS8kmE=; b=Fw8JoIGf4fPoMcwW/nGKqZ8IiE
 Q2vs7PMokPPZoAO05gA1v1L+rpw1vc/mnz4Hhbdow4c6PIzzJTuXygBc0XjQIv0Oip/i2n8J30I8n
 F2x7QbJFxgqapR4EaWZ2Ev34w7i12WTNXwPPWiXgc9W+koYV2CdEpY/tNlx6Uv6+pY/8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iqD9W-000MUr-BP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 09:33:56 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 697C1D2AADD4DAAA70F9;
 Sat, 11 Jan 2020 17:33:46 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 11 Jan
 2020 17:33:40 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200109015957.61089-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4bac40d1-4a3f-65ed-0eea-40101fde3fdc@huawei.com>
Date: Sat, 11 Jan 2020 17:33:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200109015957.61089-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iqD9W-000MUr-BP
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: avoid ambigous checkpoint
 mirroring
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Any commit message? A little bit hard to just review on changed
codes.

On 2020/1/9 9:59, Jaegeuk Kim wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fsck/fsck.c  | 26 ++++++++++++++------------
>  fsck/fsck.h  |  1 -
>  fsck/mount.c | 20 +++++---------------
>  3 files changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 507437d..8383f08 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2171,16 +2171,6 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  }
>  
> -static void fix_checkpoints(struct f2fs_sb_info *sbi)
> -{
> -	/* copy valid checkpoint to its mirror position */
> -	duplicate_checkpoint(sbi);
> -
> -	/* repair checkpoint at CP #0 position */
> -	sbi->cur_cp = 1;
> -	fix_checkpoint(sbi);
> -}
> -
>  #ifdef HAVE_LINUX_BLKZONED_H
>  
>  /*
> @@ -3103,6 +3093,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>  
>  		if (force || c.bug_on || c.bug_nat_bits) {
> +			/*
> +			 * copy valid checkpoint to its mirror position and
> +			 * fix everything in cp #0.
> +			 */
> +			duplicate_checkpoint(sbi);
> +
>  			/* flush nats to write_nit_bits below */
>  			flush_journal_entries(sbi);
>  			fix_hard_links(sbi);
> @@ -3111,10 +3107,16 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  			fix_wp_sit_alignment(sbi);
>  			fix_curseg_info(sbi);
>  			fix_checksum(sbi);
> -			fix_checkpoints(sbi);
> +			fix_checkpoint(sbi);
>  		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
>  			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
> -			write_checkpoints(sbi);
> +
> +			/*
> +			 * copy valid checkpoint to its mirror position and
> +			 * fix everything in cp #0.
> +			 */
> +			duplicate_checkpoint(sbi);
> +			write_checkpoint(sbi);
>  		}
>  	}
>  	return ret;
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index c4432e8..bbc2593 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -203,7 +203,6 @@ extern void write_curseg_info(struct f2fs_sb_info *);
>  extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
>  extern void duplicate_checkpoint(struct f2fs_sb_info *);
>  extern void write_checkpoint(struct f2fs_sb_info *);
> -extern void write_checkpoints(struct f2fs_sb_info *);
>  extern void update_superblock(struct f2fs_super_block *, int);
>  extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
>  extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 882f1ea..ffc10fb 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2404,11 +2404,8 @@ next:
>  
>  void flush_journal_entries(struct f2fs_sb_info *sbi)
>  {
> -	int n_nats = flush_nat_journal_entries(sbi);
> -	int n_sits = flush_sit_journal_entries(sbi);
> -
> -	if (n_nats || n_sits)
> -		write_checkpoints(sbi);
> +	flush_nat_journal_entries(sbi);
> +	flush_sit_journal_entries(sbi);
>  }
>  
>  void flush_sit_entries(struct f2fs_sb_info *sbi)
> @@ -2777,6 +2774,9 @@ void duplicate_checkpoint(struct f2fs_sb_info *sbi)
>  
>  	sbi->cp_backuped = 1;
>  
> +	/* repair checkpoint at CP #0 position */
> +	sbi->cur_cp = 1;
> +
>  	MSG(0, "Info: Duplicate valid checkpoint to mirror position "
>  		"%llu -> %llu\n", src, dst);
>  }
> @@ -2870,16 +2870,6 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  }
>  
> -void write_checkpoints(struct f2fs_sb_info *sbi)
> -{
> -	/* copy valid checkpoint to its mirror position */
> -	duplicate_checkpoint(sbi);
> -
> -	/* repair checkpoint at CP #0 position */
> -	sbi->cur_cp = 1;
> -	write_checkpoint(sbi);
> -}
> -
>  void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
