Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15E6D7240
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 04:02:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjsTr-0001jD-NQ;
	Wed, 05 Apr 2023 02:02:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjsTq-0001j6-VF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 02:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i0QYR5EKIlWzvOD0vX8QGJKC6TfI7FabVR6gkSX6t3A=; b=gVFk/KicfwwolRxashIV/XqYYz
 W63HqV4zDFall+Gfo6hD10qvmDKnb46e0Lh3S5nohwRyfMO0FEGii50xdYYXNDjC7byvcMFIXbmmx
 A98YSnSgbXVeuNj89PhtKfc42YPvxUrW9ZXsCSDLhXiqeq1QPsTJ+1HC/Hd29/TKv0GA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i0QYR5EKIlWzvOD0vX8QGJKC6TfI7FabVR6gkSX6t3A=; b=mjHyuyRQ6yC6jxx+ELH8mW6opu
 nIt5dZxhWogUz/Yb3yzacNT/f9Wp9cpeFOCj4n93L21fLIG6H3akarsQa/Mjl4GljtMO/ZsBnE7Dh
 +Gf7ulA8NFfchJ/7Ici0qf2ZJgBhsZcYuzDCO9dIbw0AjSBaIXTMvwVxh0rEmFuLFKL4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjsTj-0000OQ-2d for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 02:02:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA9FF63ADD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Apr 2023 02:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA21C433D2;
 Wed,  5 Apr 2023 02:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680660141;
 bh=ZeFr2GyRTnTuTL7d6gy/Q0vHZiCuLFauR+rwD51DYIE=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=O3DExJC8FfSm9sm3ey9rcoXjBXQ85dhCo/TweEc6mGHSzuYojcRrMUZHUs8Zobrcy
 Uehg9BJcLLxUPpP5GAwpJo0ALGqQyXO8Ju7AUTtGI44dj+kk0xQE8p3QbNc5BfcIv/
 S37teI0e7fgNQMRAxW5mYblRXtMHPGpPLOf/T5pbOos50qP6yNhuwhljuwnHbXbdd1
 OPcH+aDhxRrAkGpmTrcsGlU2NEJi+Cy4pPOmnduqhJ1h6vAYjApEp8KCVQ6Nhgb9lD
 niZFXsV/z7db07EekFhDk0iZ+VCSuNjhlDWs6kMAICbIfYoPkmT2TW77U8HgE3bN0B
 LmQTpa4C7n0Pw==
Message-ID: <a4e49177-3959-eb2b-996c-5d07b7390495@kernel.org>
Date: Wed, 5 Apr 2023 10:02:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230324071028.336982-1-chao@kernel.org>
 <ZCyZGgf4RSEjyHTF@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZCyZGgf4RSEjyHTF@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/5 5:39, Jaegeuk Kim wrote: > Can we do like this?
 > > From 9a58f0e59364241aa31b555cfe793d278e39b0dc Mon Sep 17 00:00:00 2001
 > From: Jaegeuk Kim <jaegeuk@kernel.org> > Date: Tue, 4 Apr 2023 [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjsTj-0000OQ-2d
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end
 of foreground garbage collection
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/5 5:39, Jaegeuk Kim wrote:
> Can we do like this?
> 
>  From 9a58f0e59364241aa31b555cfe793d278e39b0dc Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Tue, 4 Apr 2023 14:36:00 -0700
> Subject: [PATCH] f2fs: do checkpoint when there's not enough free sections
> 
> We didn't do checkpoint in FG_GC case, which may cause losing to reclaim prefree
> sctions in time.
> 
> Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
> Signed-off-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/gc.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 56c53dbe05c9..f1d0dd9c5a6c 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1806,6 +1806,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   	};
>   	unsigned int skipped_round = 0, round = 0;
>   	unsigned int upper_secs;
> +	bool stop_gc = false;
>   
>   	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
>   				gc_control->nr_free_secs,
> @@ -1876,19 +1877,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
>   		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
>   			goto go_gc_more;
> -		goto stop;
> -	}
> -
> -	/* FG_GC stops GC by skip_count */
> -	if (gc_type == FG_GC) {
> +		stop_gc = true;

I guess below condition is for emergency recycle of prefree segments during
foreground GC, in order to avoid exhausting free sections due to to many
metadata allocation during CP.

	if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
				prefree_segments(sbi)) {

But for common case, free_sections() is close to reserved_segments(), and
upper_secs + NR_GC_CHECKPOINT_SECS value may be far smaller than free_sections(),
so checkpoint may not be trggered as expected, IIUC.

So it's fine to just trigger CP in the end of foreground garbage collection?

One other concern is for those path as below:
- disable_checkpoint
- ioc_gc
- ioc_gc_range
- ioc_resize
...

We've passed gc_type as FG_GC, but the demand here is to migrate block in time,
rather than dirtying blocks, and callers don't expect checkpoint in f2fs_gc(),
instead the callers will do the checkpoit as it needs.

That means it's better to decouple FG_GC and write_checkpoint behavior, so I
added another parameter .reclaim_space to just let f2fs_balance_fs() to trigger
checkpoit in the end of f2fs_gc().

Thanks,

> +	} else if (gc_type == FG_GC) {
> +		/* FG_GC stops GC by skip_count */
>   		if (sbi->skipped_gc_rwsem)
>   			skipped_round++;
>   		round++;
>   		if (skipped_round > MAX_SKIP_GC_COUNT &&
> -				skipped_round * 2 >= round) {
> -			ret = f2fs_write_checkpoint(sbi, &cpc);
> -			goto stop;
> -		}
> +				skipped_round * 2 >= round)
> +			stop_gc = true;
>   	}
>   
>   	__get_secs_required(sbi, NULL, &upper_secs, NULL);
> @@ -1901,12 +1898,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   				prefree_segments(sbi)) {
>   		ret = f2fs_write_checkpoint(sbi, &cpc);
>   		if (ret)
> -			goto stop;
> +			stop_gc = true;
>   	}
>   go_gc_more:
> -	segno = NULL_SEGNO;
> -	goto gc_more;
> -
> +	if (!stop_gc) {
> +		segno = NULL_SEGNO;
> +		goto gc_more;
> +	}
>   stop:
>   	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
>   	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
