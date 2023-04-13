Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55A6E113C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 17:35:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmyyi-0007fI-1d;
	Thu, 13 Apr 2023 15:35:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pmyyX-0007eq-OM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EEyMM/y4LID756HM+EVvcRjxKYOvAXu7aQ2FIz5cIOs=; b=UwyJCJhKj8kRRnL2cDHZx2cef3
 EQjMAarR5iPMR8lubl4rGI/S7e6l3TQ1Gc70XQZXubuzWWVN9H+XtzYi2NUq0DTpp1BuN6D/4DvuX
 N+Tha1MaFCwQgBm37jUiPmFomZ4JX64GDStTOlhxGvmrjfuVx1upjUkz6HNoZjfqR7zI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EEyMM/y4LID756HM+EVvcRjxKYOvAXu7aQ2FIz5cIOs=; b=cSFKuaqsp7/cDXBupxQO7dz9Ct
 bdAnbFk3t+ikv7jNh5TKGLaISNrOcFLV09cx/YoOl9a3c8cPdSL7wQRDdOefv6LdrPrc/fwL4vIZ7
 v5AAGzUuAndoaiWmo18n2yUFAUdd5M4xl1QaDhwJJtU/mpXPsx9LLoPk8NLJFytgX9QQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmyyW-006eZu-9W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:35:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7BCC60C83;
 Thu, 13 Apr 2023 15:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637B2C433D2;
 Thu, 13 Apr 2023 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681400098;
 bh=5b1IzpQyge6KH+O/dVzMPOkhGkuOm+Ss22lyL9Jiwg0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DL0eJVp3YYnrmtYR9co6LopRabVAVkS7Whb4L5S6ypLDygawuooYmHz56w1T0u+2X
 iQb/IaoTN1DuZJ5JPQVC38E0d6pCfVtd5DeXKinfcclvyr6gNq2JQvLOJ/0R2A0LRP
 EYbmUgXAaPo5ycXnxSaR81u83Ug0Lj8ltrLgr3gMUuvD/7DQFn9DWDbJaNOs7hOuO9
 gMtBTnmUtIws/OHTw4y+ldIRi6o4yG6uxixGq7btqe3HuxX8VoHWsrfMFu7OQSB+ko
 fXS7qCYKQxshN4rmtiXoet46bsutdG5aX+iWe7OLcvi1FlVXMBlGgYpWOF7yqliKZn
 NXxrXnT+9vylQ==
Message-ID: <e5dbb307-7337-1f5e-4bfd-b4736616bf57@kernel.org>
Date: Thu, 13 Apr 2023 23:34:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230412165055.38461-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230412165055.38461-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/13 0:50, Yangtao Li wrote: > This patch exports
 gc_mode to debugfs. Since gc_urgent and gc_idle > nodes can get gc mode, so
 remove gc_mode node. What if some app/script is using gc_mode....it breaks
 its use. 
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
X-Headers-End: 1pmyyW-006eZu-9W
Subject: Re: [f2fs-dev] [PATCH] f2fs: export gc_mode in debugfs
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

On 2023/4/13 0:50, Yangtao Li wrote:
> This patch exports gc_mode to debugfs. Since gc_urgent and gc_idle
> nodes can get gc mode, so remove gc_mode node.

What if some app/script is using gc_mode....it breaks its use.

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 ------
>   fs/f2fs/debug.c                         | 13 ++++++++++++-
>   fs/f2fs/sysfs.c                         | 18 ------------------
>   3 files changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 8140fc98f5ae..3b78b8324263 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -643,12 +643,6 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	Show the accumulated total revoked atomic write block count after boot.
>   		If you write "0" here, you can initialize to "0".
>   
> -What:		/sys/fs/f2fs/<disk>/gc_mode
> -Date:		October 2022
> -Contact:	"Yangtao Li" <frank.li@vivo.com>
> -Description:	Show the current gc_mode as a string.
> -		This is a read-only entry.
> -
>   What:		/sys/fs/f2fs/<disk>/discard_urgent_util
>   Date:		November 2022
>   Contact:	"Yangtao Li" <frank.li@vivo.com>
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 61c35b59126e..5172b2417c08 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -366,6 +366,16 @@ static const char *ipu_mode_names[F2FS_IPU_MAX] = {
>   	[F2FS_IPU_HONOR_OPU_WRITE]	= "HONOR_OPU_WRITE",
>   };
>   
> +static const char *gc_mode_names[MAX_GC_MODE] = {
> +	[GC_NORMAL]		= "GC_NORMAL",
> +	[GC_IDLE_CB]		= "GC_IDLE_CB",
> +	[GC_IDLE_GREEDY]	= "GC_IDLE_GREEDY",
> +	[GC_IDLE_AT]		= "GC_IDLE_AT",
> +	[GC_URGENT_HIGH]	= "GC_URGENT_HIGH",
> +	[GC_URGENT_LOW]		= "GC_URGENT_LOW",
> +	[GC_URGENT_MID]		= "GC_URGENT_MID",
> +};
> +
>   static int stat_show(struct seq_file *s, void *v)
>   {
>   	struct f2fs_stat_info *si;
> @@ -409,7 +419,8 @@ static int stat_show(struct seq_file *s, void *v)
>   			for_each_set_bit(j, &policy, F2FS_IPU_MAX)
>   				seq_printf(s, " %s", ipu_mode_names[j]);
>   		}
> -		seq_puts(s, " ]\n\n");
> +		seq_puts(s, " ]\n");
> +		seq_printf(s, "  - GC: [ %s ]\n\n", gc_mode_names[sbi->gc_mode]);
>   
>   		if (test_opt(sbi, DISCARD))
>   			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 4d6263e556fa..c2873a94f7b2 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -41,16 +41,6 @@ enum {
>   	ATGC_INFO,	/* struct atgc_management */
>   };
>   
> -static const char *gc_mode_names[MAX_GC_MODE] = {
> -	"GC_NORMAL",
> -	"GC_IDLE_CB",
> -	"GC_IDLE_GREEDY",
> -	"GC_IDLE_AT",
> -	"GC_URGENT_HIGH",
> -	"GC_URGENT_LOW",
> -	"GC_URGENT_MID"
> -};
> -
>   struct f2fs_attr {
>   	struct attribute attr;
>   	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
> @@ -143,12 +133,6 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
>   				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
>   }
>   
> -static ssize_t gc_mode_show(struct f2fs_attr *a,
> -		struct f2fs_sb_info *sbi, char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
> -}
> -
>   static ssize_t features_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -916,7 +900,6 @@ F2FS_GENERAL_RO_ATTR(encoding);
>   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
>   F2FS_GENERAL_RO_ATTR(pending_discard);
> -F2FS_GENERAL_RO_ATTR(gc_mode);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> @@ -1008,7 +991,6 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(discard_granularity),
>   	ATTR_LIST(max_ordered_discard),
>   	ATTR_LIST(pending_discard),
> -	ATTR_LIST(gc_mode),
>   	ATTR_LIST(ipu_policy),
>   	ATTR_LIST(min_ipu_util),
>   	ATTR_LIST(min_fsync_blocks),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
