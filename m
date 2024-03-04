Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3755486F8D8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Mar 2024 04:20:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rgyrm-0005Ml-29;
	Mon, 04 Mar 2024 03:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rgyrk-0005Md-Hv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 03:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cyjySM0LxV5dJ8J3vMbN85sd0wjKVGChfzCFke6zVe4=; b=V/uxPUaEqXgjJ30kGO31UPiAfq
 dLNITOPyTkGRXIE5R9swKzZNZcRLUZS+13I+vXSU5Jracg8eDzBH33iOd/U3qVsHp5Gz0wQ1QRe22
 vD1GeDPpQgJck9Gvl6vUyO3WAFW2SiL62rYANas2G7CciJ3MxdgQV4yc+C5MGYzBcXfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cyjySM0LxV5dJ8J3vMbN85sd0wjKVGChfzCFke6zVe4=; b=N79Q1BJEc9O5TRBS5y+2QPR1TB
 oYpvVUzVz7DudJ/N8H9T//pzSB4Ad1ATqUMkoA24ZX0w+/7089ZuRfKAXrP+emq7nyrHDPs/hMfmt
 VKmQSmhHIuq+TtK4a0JyV6h5kdmSGU7drMVNRWd7SbICUQA8A4QPghivurIu7uEYn8kE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rgyra-0005O1-HC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Mar 2024 03:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A36B60C35;
 Mon,  4 Mar 2024 03:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A04C433C7;
 Mon,  4 Mar 2024 03:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709522378;
 bh=V+RFDPpTYUKW1qUvgdx7/B+Sd3EmYDwkX0GvYntj4Ro=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hEVOR3scu9UZ5CjncLG9Z95wY0CxECuIZGKuolA5DJt+FI5jqwFdmXFzTqerGuvCv
 VeUQ5FUAoKvWq7BcZszk/dlUAXYOqyLNbUwgx/7fCtThCGDlavSAgKQ/VCJ/2uEmxh
 C0OsJmFm9SAAK3l7DbtAZjRRyj+GF5yySbJ9z6tmplQEHW0aoBL5S/XbbWQvdvmPN5
 7gS+QsNTrCoBuft9Vp/ULXpzk99WA7RorlDrUxQv3QHCSn+zdWiM8BCmJ5ZJfM9X9E
 BQFMU6wTIO1R0pzU80veEcMaC/vNYBk4Lh9lNNjDot809r4z2bIMPvJ2je/PkEJubg
 xkKUWkr7XSH4w==
Message-ID: <7dc371ad-2448-4dd4-9551-8caef0a00d48@kernel.org>
Date: Mon, 4 Mar 2024 11:19:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1709292976-13118-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1709292976-13118-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/1 19:36, Zhiguo Niu wrote: > new_curseg may return
 error if get_new_segment fail, so its result > should be check in its caller
 f2fs_allocate_segment_for_resize, > alos pass this results to [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rgyra-0005O1-HC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check result of new_curseg in
 f2fs_allocate_segment_for_resize
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/1 19:36, Zhiguo Niu wrote:
> new_curseg may return error if get_new_segment fail, so its result
> should be check in its caller f2fs_allocate_segment_for_resize,
> alos pass this results to free_segment_range.

Zhiguo,

What about handling all error paths of new_curseg() and change_curseg()
in one patch?

Thanks,

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/f2fs.h    | 2 +-
>   fs/f2fs/gc.c      | 7 +++++--
>   fs/f2fs/segment.c | 9 +++++++--
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4331012..39dda7d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3701,7 +3701,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>   void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
>   void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
>   void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
> -void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
> +int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   					unsigned int start, unsigned int end);
>   int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
>   int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index c60b747..7a458fa 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2037,8 +2037,11 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
>   	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
>   
>   	/* Move out cursegs from the target range */
> -	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++)
> -		f2fs_allocate_segment_for_resize(sbi, type, start, end);
> +	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++) {
> +		err = f2fs_allocate_segment_for_resize(sbi, type, start, end);
> +		if (err)
> +			goto out;
> +	}
>   
>   	/* do GC to move out valid blocks in the range */
>   	err = f2fs_gc_range(sbi, start, end, dry_run, 0);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1bb3019..2a07b9d 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3071,11 +3071,12 @@ static bool need_new_seg(struct f2fs_sb_info *sbi, int type)
>   	return false;
>   }
>   
> -void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
> +int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   					unsigned int start, unsigned int end)
>   {
>   	struct curseg_info *curseg = CURSEG_I(sbi, type);
>   	unsigned int segno;
> +	int err = 0;
>   
>   	f2fs_down_read(&SM_I(sbi)->curseg_lock);
>   	mutex_lock(&curseg->curseg_mutex);
> @@ -3089,7 +3090,10 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   		change_curseg(sbi, type);
>   	else
>   		new_curseg(sbi, type, true);
> -
> +	if (curseg->segno == NULL_SEGNO) {
> +		err = -ENOSPC;
> +		goto unlock;
> +	}
>   	stat_inc_seg_type(sbi, curseg);
>   
>   	locate_dirty_segment(sbi, segno);
> @@ -3102,6 +3106,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
>   
>   	mutex_unlock(&curseg->curseg_mutex);
>   	f2fs_up_read(&SM_I(sbi)->curseg_lock);
> +	return err;
>   }
>   
>   static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
