Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7133628307
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 15:43:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouag9-0005mf-Fm;
	Mon, 14 Nov 2022 14:43:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ouag0-0005mP-4F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 14:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9x3dWxHcaDPBjNzSqYV76md8sqsLJ1nmCxVCht3E6g=; b=Yzb4RgSgWCcLmKCc5WH9wzGP62
 eZEl47ItLc8qBGnoq3aBX0oj3hS7qP8flnIXpl2ghDiWTdlWJdWgI7pOpQpNCIhlB3W5fqppu6hXK
 WN2J2LFNmg0BK4/ELtX1iZVL9alE7tkK3ghACI4eIPdL3OtaHMr5pcE8BqB+trPwJKEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J9x3dWxHcaDPBjNzSqYV76md8sqsLJ1nmCxVCht3E6g=; b=P9tajoBPfbduuAHyWYU7xjHBXw
 WWUFKbgC8bhtYtC0ZBEIq3OXXDaPfzLo1WS4xQeutl6aLI7PqYgSaIMpJi9BHiJBSOg44/xdoNOac
 23C3JEisH1513bwwrUVJ3Zt1X0xJ/ZmWKu6QgtPnI2X7P3nckfA5ibMKIMSzSNXgCmsg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouafz-0080aI-9X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 14:43:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01487B80FEE;
 Mon, 14 Nov 2022 14:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A3EC433D7;
 Mon, 14 Nov 2022 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668436979;
 bh=w4GrNzhovrN80KKmTP2OEJZe9pNiPh8tGOWQIrUQZus=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ncvG4DeWFq6xXs+ZW79xASuvQr7k2XuWyvfIPei5CXCWhpdppn3qUlKZq2OpObWy1
 snozfaLE4xN5Bnn4j96gNbHbIw8zOmmScXzdCsPNuCntlT7SCdr66IP66CgX+XvuAl
 psqFTm4OKPWDYN/La0sU9No1J3NRL0r22KrS/dvI3TMeLyGXDLlIVXtIsCw/OjVLTY
 xW4GaZz6xe4AeNcrt+dpTsmZEZaaJQ2YIUwnwdXg83JpUg0F7Z1riWjpJuf43Qf4iY
 +AoOgpUfFKFLj5qxJlNELviCCkL02L57/LzUI7FKNz5rw5J+mdJzumS88TVlULreGR
 021NfSwdR2pwg==
Message-ID: <983de611-a9e7-56d0-d375-f2b54e1f4d05@kernel.org>
Date: Mon, 14 Nov 2022 22:42:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
 <20221112083250.295700-2-Yuwei.Guan@zeekrlife.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221112083250.295700-2-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/12 16:32,
 Yuwei Guan wrote: > The commit 84b89e5d943d8
 ("f2fs: add auto tuning for small devices") add > tuning for small volume
 device, now support to tune alloce_mode to 'reuse' > if it's [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouafz-0080aI-9X
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: fix to alloc_mode changed after
 remount on a small volume device
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

On 2022/11/12 16:32, Yuwei Guan wrote:
> The commit 84b89e5d943d8 ("f2fs: add auto tuning for small devices") add
> tuning for small volume device, now support to tune alloce_mode to 'reuse'
> if it's small size. But the alloc_mode will change to 'default' when do
> remount on this small size dievce.
> 
> The commit 4cac90d5491c9 ("f2fs: relocate readdir_ra configure
> initialization") relocates readdir_ra variable to tuning process.
> 
> This patch fo fix alloc_mode changed when do remount for a small volume
> device.
> 
> For a small device,
> - alloc_mode will keep 'reuse', if no alloc_mode option in remount
>    command,
> - alloc_mode will be set as remount command, if it has 'alloc_mode='.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> ---
>   fs/f2fs/super.c | 37 ++++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 3834ead04620..2f36824ff84b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2190,6 +2190,23 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
>   	f2fs_flush_ckpt_thread(sbi);
>   }
>   
> +static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi, bool is_remount)
> +{
> +	struct f2fs_sm_info *sm_i = SM_I(sbi);
> +
> +	/* adjust parameters according to the volume size */
> +	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
> +		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;

How about moving above logic into default_options()?

Thanks,

> +		if (f2fs_block_unit_discard(sbi))
> +			sm_i->dcc_info->discard_granularity = 1;
> +		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE |
> +					1 << F2FS_IPU_HONOR_OPU_WRITE;
> +	}
> +
> +	if (!is_remount)
> +		sbi->readdir_ra = 1;
> +}
> +
>   static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> @@ -2248,6 +2265,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   
>   	default_options(sbi);
>   
> +	f2fs_tuning_parameters(sbi, true);
> +
>   	/* parse mount options */
>   	err = parse_options(sb, data, true);
>   	if (err)
> @@ -4054,22 +4073,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
>   	return 0;
>   }
>   
> -static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
> -{
> -	struct f2fs_sm_info *sm_i = SM_I(sbi);
> -
> -	/* adjust parameters according to the volume size */
> -	if (sm_i->main_segments <= SMALL_VOLUME_SEGMENTS) {
> -		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
> -		if (f2fs_block_unit_discard(sbi))
> -			sm_i->dcc_info->discard_granularity = 1;
> -		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE |
> -					1 << F2FS_IPU_HONOR_OPU_WRITE;
> -	}
> -
> -	sbi->readdir_ra = 1;
> -}
> -
>   static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   {
>   	struct f2fs_sb_info *sbi;
> @@ -4475,7 +4478,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   
>   	f2fs_join_shrinker(sbi);
>   
> -	f2fs_tuning_parameters(sbi);
> +	f2fs_tuning_parameters(sbi, false);
>   
>   	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
>   		    cur_cp_version(F2FS_CKPT(sbi)));


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
