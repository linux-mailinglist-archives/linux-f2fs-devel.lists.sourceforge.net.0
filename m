Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C178D6D5013
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 20:13:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjOgT-0003SB-2S;
	Mon, 03 Apr 2023 18:13:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pjOgR-0003S5-U8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQswSwVCWniOgNfIDmiNt8PfiWjlZwgX6Y9/dEscvJA=; b=OTV6M5OBh3kjHHkKzEjSdFwFcW
 oOicniLESezUqqavEbjIpCeu6l/5uU5DP20pQ62Kf+cPmMMHwgEinNzPU87qjksAaT0tbk1BOhGtJ
 t4BpmVk1z+JVIokCsjk9a0FgCCV9TYW70+dHfGzYYRqBp8D4ub5Udy3CeG1t14UfzH64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQswSwVCWniOgNfIDmiNt8PfiWjlZwgX6Y9/dEscvJA=; b=ilAYVLgIuFPhblwjzDuGmTdR+S
 Q7Px97+J3a+JKJEGVMN1YKpYRoSywQa73gpu+/O8LwWGi5VAQ7vtz91q6knCmPV8psIkxSH5uplSW
 NEDhShfeU5dl1xPM+nm3130jIqsQqp7HKzAhVxBihQqnpJSYolEOqVoMRVdeOYd5Wod4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjOgQ-0006gg-AS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:13:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0D586256E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 18:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C59AC4339B;
 Mon,  3 Apr 2023 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680545608;
 bh=k9UIDDogZc/t03m0KagHDvNc4egLIHvQ4Q7UQzVp8s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KHmWyod6H+DC5CakKf8PnWaJKQzHAudnn6MCqiAo2bnHdwbkIZy8Gvfnu1h79y3w6
 jz4GTodQpFR5RJMogzpPC3cHFYbYCF3b12EaHyqAOHmNIYVg1Kj3vAsINEgYUsycvY
 nqvZWDUCgVHCHl8HVHVW6yj3W2p0nn2HF6WD5kiDDspZE1pBydrvTXLdrZBLG9ZWwT
 vz13zToyR0xjOZ3rr1cVSKQPd/pyMTml7gctBY/QLsLJ7cJU6c6d6l2xpk2ynMjAwy
 qiRQKwsrBpbW0uDk5e/rAXiOW2/hyJLbHNxyz+l6ubYk6rzm+hP6qECfUC0AOu0aRU
 VSqBeYhHTk9CQ==
Date: Mon, 3 Apr 2023 11:13:26 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZCsXRin7symPxIrn@google.com>
References: <20230324071028.336982-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324071028.336982-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/24, Chao Yu wrote: > In order to reclaim free blocks
 in prefree sections before latter use. We were supposed to do checkpoint
 as is? > > Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in
 f2fs_gc") > Signed-off-by: Chao Yu <chao@kernel.org> > --- > fs/f2fs/f2fs.h
 | 1 + > fs/f2fs/gc.c | 8 ++++++++ > fs/f2fs/segment.c | [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjOgQ-0006gg-AS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/24, Chao Yu wrote:
> In order to reclaim free blocks in prefree sections before latter use.

We were supposed to do checkpoint as is?

> 
> Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h    | 1 +
>  fs/f2fs/gc.c      | 8 ++++++++
>  fs/f2fs/segment.c | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 53a005b420cf..b1515375cb4c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1269,6 +1269,7 @@ struct f2fs_gc_control {
>  	unsigned int victim_segno;	/* target victim segment number */
>  	int init_gc_type;		/* FG_GC or BG_GC */
>  	bool no_bg_gc;			/* check the space and stop bg_gc */
> +	bool reclaim_space;		/* trigger checkpoint to reclaim space */
>  	bool should_migrate_blocks;	/* should migrate blocks */
>  	bool err_gc_skipped;		/* return EAGAIN if GC skipped */
>  	unsigned int nr_free_secs;	/* # of free sections to do GC */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2996d38aa89c..5a451d3d512d 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -132,6 +132,7 @@ static int gc_thread_func(void *data)
>  
>  		gc_control.init_gc_type = sync_mode ? FG_GC : BG_GC;
>  		gc_control.no_bg_gc = foreground;
> +		gc_control.reclaim_space = foreground;
>  		gc_control.nr_free_secs = foreground ? 1 : 0;
>  
>  		/* if return value is not zero, no victim was selected */
> @@ -1880,6 +1881,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
>  		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
>  			goto go_gc_more;
> +
> +		/*
> +		 * trigger a checkpoint in the end of foreground garbage
> +		 * collection.
> +		 */
> +		if (gc_control->reclaim_space)
> +			ret = f2fs_write_checkpoint(sbi, &cpc);
>  		goto stop;
>  	}
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6c11789da884..b62af2ae1685 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -421,6 +421,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>  				.victim_segno = NULL_SEGNO,
>  				.init_gc_type = BG_GC,
>  				.no_bg_gc = true,
> +				.reclaim_space = true,
>  				.should_migrate_blocks = false,
>  				.err_gc_skipped = false,
>  				.nr_free_secs = 1 };
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
