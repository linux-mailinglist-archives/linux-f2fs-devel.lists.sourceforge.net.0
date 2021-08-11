Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4A3E87FC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 04:25:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDdvn-0004LN-Jc; Wed, 11 Aug 2021 02:25:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mDdvl-0004LG-S2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HhIfSn9l8aAEM6oyxa28KDL+azMQTvtXetyoO979+mM=; b=A8tSc/ZLT2MFQxrciGMTlDPye7
 EVEvuWexGTL0ZM5aUUMs4dClGebet4NLaLLDn+U2Pw0wc14iBwk55Cr5lQENcomcHOR3/h+fuTuKD
 8J71mcDW2dU+FPkaQzPRDF91jSuxj/7wKib1f2+x0qYlyUSeOxpQfWrereWre9kS6oz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HhIfSn9l8aAEM6oyxa28KDL+azMQTvtXetyoO979+mM=; b=gFVAeHzRU+exZvb1lu6+FZjy6T
 DmI+rc43RZViTePoiGMN2TsDZhjql9mapyuZXDbmFl/s6PkgJ5FgMZJPYuBOhcVtZwKScan3RhVAO
 +CwxDZo+izTigaSH5Jlb7JsO4Qq+u0RDbukl5q+t66INlkcjIEBUfPOEcf+wKp1z5q7c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDdvi-002WK1-4y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:25:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D302260EB2;
 Wed, 11 Aug 2021 02:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628648712;
 bh=SNkK8Gy4KILIfp0TFUEVNShMLEV17bUDZoDxLk6DdOY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EHXpHMMJrXJs3zQ1Cujlqr2KCcv2Ys70sq5B8xU8l3YegJg+syhUJvfZj8VDY77h5
 QXNrQbZv36IMKTtr6MrCzWW9l7spwGKLly+uHtrLBBri8jovJKLq7LPBX0L5NaC4eA
 n6/jEAKVF9jgFcPUoAnCXAGlA41jnyD0Mak8bENZlDSbK5cmRmSLi0xX5pAPwLJHad
 hebfpFTmiXHeIsnwky/xeimoMEHECKMXejbqSfjNle3QENeOT87InacrDTt/cMYzOX
 EKUAvWOaxgBUEAQwLZy1zX6zJPFN023BKtJDHLyF1KxyNYNRCUyuzIZNInunrmaogl
 P6kDAysC7Kbbg==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210810132707.349147-1-frank.li@vivo.com>
 <20210810132707.349147-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <bb2f564d-325b-b082-c001-a33187329d27@kernel.org>
Date: Wed, 11 Aug 2021 10:25:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810132707.349147-2-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mDdvi-002WK1-4y
Subject: Re: [f2fs-dev] [PATCH] f2fs: improve sbi status info in
 debugfs/f2fs/status
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

On 2021/8/10 21:27, Yangtao Li wrote:
> Do not use numbers but strings to improve readability.

I'm fine with this, but not sure it's what Jaeguek wants.

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/debug.c | 28 +++++++++++++++++++++++-----
>   1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 473ad04d1891..91c0910b0bb7 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -323,22 +323,40 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
>   #endif
>   }
>   
> +static char *s_flag[] = {
> +	[SBI_IS_DIRTY]		= " dirty",

fs_dirty

> +	[SBI_IS_CLOSE]		= " close",

closing

> +	[SBI_NEED_FSCK]		= " fsck",

need_fsck

> +	[SBI_POR_DOING]		= " doing",

recovering

> +	[SBI_NEED_SB_WRITE]	= " sb_write",

sb_dirty

> +	[SBI_NEED_CP]		= " cp",

need_cp

> +	[SBI_IS_SHUTDOWN]	= " shutdown",
> +	[SBI_IS_RECOVERED]	= " recovered",
> +	[SBI_CP_DISABLED]	= " cp_disabled",
> +	[SBI_CP_DISABLED_QUICK]	= " cp_disabled_quick",
> +	[SBI_QUOTA_NEED_FLUSH]	= " quota_need_flush",
> +	[SBI_QUOTA_SKIP_FLUSH]	= " quota_skip_flush",
> +	[SBI_QUOTA_NEED_REPAIR]	= " quota_need_repair",
> +	[SBI_IS_RESIZEFS]	= " resizefs",
> +};
> +
>   static int stat_show(struct seq_file *s, void *v)
>   {
>   	struct f2fs_stat_info *si;
> -	int i = 0;
> -	int j;
> +	int i = 0, j = 0;
>   
>   	mutex_lock(&f2fs_stat_mutex);
>   	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
>   		update_general_status(si->sbi);
>   
> -		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s (sbi: 0x%lx)]=====\n",
> +		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s (sbi:",
>   			si->sbi->sb->s_bdev, i++,
>   			f2fs_readonly(si->sbi->sb) ? "RO": "RW",
>   			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
> -			"Disabled": (f2fs_cp_error(si->sbi) ? "Error": "Good"),
> -			si->sbi->s_flag);
> +			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
> +		for_each_set_bit(j, &si->sbi->s_flag, 32)
> +			seq_puts(s, s_flag[j]);

How about starting to print sb related status in a new line to avoid
extreme long line.

Thanks,

> +		seq_puts(s, ") ]=====\n");
>   		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
>   			   si->sit_area_segs, si->nat_area_segs);
>   		seq_printf(s, "[SSA: %d] [MAIN: %d",
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
