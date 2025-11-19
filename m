Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2522C6CF94
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Nov 2025 07:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACsQRwznXblGpQjK5mvhyJfLwunhPf5w+uB9Ijfs2vc=; b=FP2+6i5B7YlVmdSg9O9sC/EWyB
	mXdMS9n4yPrBlczKnus3LA1th3uoooqZUZlxIHJdWB4dAM9MpI9fRHhWzdjUIZT612sPuOV1WvKBl
	WN78mMhCQ6FAl6kKbplEGMye5/jUm3hULMc+16avIhKLum4N/gtTdaWfDgMZI6Bacsro=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLbxM-0002b2-4k;
	Wed, 19 Nov 2025 06:46:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vLbxK-0002at-3a
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 06:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xfw2lKSVj7LK+NoCjFUnexInhqqJhUv9QtQDgxK1sVc=; b=QuBsVF8VM2Zgnak5ZCf0oG5uNt
 epKrEcXg80TmWiHdnuqS8wy1NB593CqbvQS7N9zviHFKR4hT0rFzfNlf0CX2gK/TIAiPvBxuATE/5
 1bae2dt1BYjg+n2RTmPO4N5orHsThTo1WdW1VAeazjsYNhw5gx7F8EDMnhO9PuVfQoIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xfw2lKSVj7LK+NoCjFUnexInhqqJhUv9QtQDgxK1sVc=; b=RYkpOe6HbsKG89QcQ/aBq4+LQ8
 nhlLDaV6bTpFS8lsdSY1E0b8zA2EjpCFoLC2Soppy8z5C8u/BxRL8ni4tx7Mlzc/hmA/30Jj5h8GV
 rCbVcLUPe/tTjjdnnzBmeSxkQ+hx6dLQw6RUkGzRTR7XUWt7K2BmEMI4ltOQpG56OCjg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLbxK-00049U-AO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 06:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF2DB43206;
 Wed, 19 Nov 2025 06:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E31C16AAE;
 Wed, 19 Nov 2025 06:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763534772;
 bh=p2fE6wVS9TbTJkA8qgux4UegzFHrWuo8BAPcmvjWX5A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=klPpQ9mGVWPb3p+Bv6txZ7X0JNz0//HJYKaM4Vhq6He4pw1rQMLj4VuU//hMVtt7h
 NJopwO+VhpluIVmv2Ty2m8K1bOuqTsV67Ar+OHOblc9y3jRJv0iCUDEM89ILBUEr2e
 i3RPfbtIIxvt38yMpZzmxn9gS0/Ij7G/f5dELKdBn1NaADnyr8INTv1nrkqALRCHdc
 uvUfcGlfL9/yFhR65CxsDz8WkihsURa8hVeLbvDubSKnmuTK/gPYmYrpTFIBPhnLUm
 82/TCmjH22xuAB4f8PNtpJdk/M/CutN1KEnmXASOoekd73wvIey5zHbh80Be3QofPv
 SqTVLUQ5i9UUQ==
Message-ID: <889a9ea4-bfdc-430d-95a9-e4b02b0f3625@kernel.org>
Date: Wed, 19 Nov 2025 14:46:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: YH Lin <yhli@google.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20251118062132.678025-1-yhli@google.com>
Content-Language: en-US
In-Reply-To: <20251118062132.678025-1-yhli@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/18/25 14:21, YH Lin wrote: > This patch optimizes the
 tracepoint by replacing these hardcoded strings > with a new enumeration
 f2fs_cp_phase. > > 1.Defines enum f2fs_cp_phase with values for eac [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vLbxK-00049U-AO
Subject: Re: [f2fs-dev] [PATCH] f2fs: optimize trace_f2fs_write_checkpoint
 with enums
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/18/25 14:21, YH Lin wrote:
> This patch optimizes the tracepoint by replacing these hardcoded strings
> with a new enumeration f2fs_cp_phase.
> 
> 1.Defines enum f2fs_cp_phase with values for each checkpoint phase.
> 2.Updates trace_f2fs_write_checkpoint to accept a u16 phase argument
> instead of a string pointer.
> 3.Uses __print_symbolic in TP_printk to convert the enum values
> back to their corresponding strings for human-readable trace output.
> 
> This change reduces the storage overhead for each trace event
> by replacing a variable-length string with a 2-byte integer,
> while maintaining the same readable output in ftrace.
> 
> Signed-off-by: YH Lin <yhli@google.com>
> ---
>  fs/f2fs/checkpoint.c        |  6 +++---
>  include/trace/events/f2fs.h | 28 +++++++++++++++++++++++-----
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index bbe07e3a6c75..b04f82fdd143 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1673,7 +1673,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  		goto out;
>  	}
>  
> -	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "start block_ops");
> +	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_START_BLOCK_OPS);
>  
>  	err = block_operations(sbi);
>  	if (err)
> @@ -1681,7 +1681,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  
>  	stat_cp_time(cpc, CP_TIME_OP_LOCK);
>  
> -	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish block_ops");
> +	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_FINISH_BLOCK_OPS);
>  
>  	f2fs_flush_merged_writes(sbi);
>  
> @@ -1747,7 +1747,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  
>  	/* update CP_TIME to trigger checkpoint periodically */
>  	f2fs_update_time(sbi, CP_TIME);
> -	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
> +	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_FINISH_CHECKPOINT);
>  out:
>  	if (cpc->reason != CP_RESIZE)
>  		f2fs_up_write(&sbi->cp_global_sem);
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index e00611ead024..a87aab397457 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -11,6 +11,15 @@
>  #define show_dev(dev)		MAJOR(dev), MINOR(dev)
>  #define show_dev_ino(entry)	show_dev(entry->dev), (unsigned long)entry->ino
>  
> +#ifndef _TRACE_F2FS_ENUM_H
> +#define _TRACE_F2FS_ENUM_H
> +enum f2fs_cp_phase {
> +	CP_PHASE_START_BLOCK_OPS,
> +	CP_PHASE_FINISH_BLOCK_OPS,
> +	CP_PHASE_FINISH_CHECKPOINT,
> +};

YH,

What do you think of relocating this enumeration to f2fs.h, and remove
_TRACE_F2FS_ENUM_H for cleanup? something like this?

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5f104518c414..67c42aa27d32 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -319,6 +319,12 @@ struct cp_control {
        struct cp_stats stats;
 };

+enum f2fs_cp_phase {
+       CP_PHASE_START_BLOCK_OPS,
+       CP_PHASE_FINISH_BLOCK_OPS,
+       CP_PHASE_FINISH_CHECKPOINT,
+};
+

Thanks,

> +#endif /* _TRACE_F2FS_ENUM_H */
> +
>  TRACE_DEFINE_ENUM(NODE);
>  TRACE_DEFINE_ENUM(DATA);
>  TRACE_DEFINE_ENUM(META);
> @@ -50,6 +59,9 @@ TRACE_DEFINE_ENUM(CP_PAUSE);
>  TRACE_DEFINE_ENUM(CP_RESIZE);
>  TRACE_DEFINE_ENUM(EX_READ);
>  TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
> +TRACE_DEFINE_ENUM(CP_PHASE_START_BLOCK_OPS);
> +TRACE_DEFINE_ENUM(CP_PHASE_FINISH_BLOCK_OPS);
> +TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
>  
>  #define show_block_type(type)						\
>  	__print_symbolic(type,						\
> @@ -175,6 +187,12 @@ TRACE_DEFINE_ENUM(EX_BLOCK_AGE);
>  #define S_ALL_PERM	(S_ISUID | S_ISGID | S_ISVTX |	\
>  			S_IRWXU | S_IRWXG | S_IRWXO)
>  
> +#define show_cp_phase(phase)					\
> +	__print_symbolic(phase,						\
> +		{ CP_PHASE_START_BLOCK_OPS,		"start block_ops" },			\
> +		{ CP_PHASE_FINISH_BLOCK_OPS,	"finish block_ops" },			\
> +		{ CP_PHASE_FINISH_CHECKPOINT,	"finish checkpoint" })
> +
>  struct f2fs_sb_info;
>  struct f2fs_io_info;
>  struct extent_info;
> @@ -1573,26 +1591,26 @@ TRACE_EVENT(f2fs_readpages,
>  
>  TRACE_EVENT(f2fs_write_checkpoint,
>  
> -	TP_PROTO(struct super_block *sb, int reason, const char *msg),
> +	TP_PROTO(struct super_block *sb, int reason, u16 phase),
>  
> -	TP_ARGS(sb, reason, msg),
> +	TP_ARGS(sb, reason, phase),
>  
>  	TP_STRUCT__entry(
>  		__field(dev_t,	dev)
>  		__field(int,	reason)
> -		__string(dest_msg, msg)
> +		__field(u16, phase)
>  	),
>  
>  	TP_fast_assign(
>  		__entry->dev		= sb->s_dev;
>  		__entry->reason		= reason;
> -		__assign_str(dest_msg);
> +		__entry->phase		= phase;
>  	),
>  
>  	TP_printk("dev = (%d,%d), checkpoint for %s, state = %s",
>  		show_dev(__entry->dev),
>  		show_cpreason(__entry->reason),
> -		__get_str(dest_msg))
> +		show_cp_phase(__entry->phase))
>  );
>  
>  DECLARE_EVENT_CLASS(f2fs_discard,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
