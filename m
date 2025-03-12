Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA176A5D4A5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 04:11:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCV7-0007Jn-Bw;
	Wed, 12 Mar 2025 03:11:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsCUy-0007Iz-9w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dPFCF6gUxcMs97FDc+sodqLNlLCjCRIEHNoSWCuwn0g=; b=Cf6pNnHryUubFIXQljIVoVUZxi
 sdLoIrJW6Oi4WAueGfqYtpkmck84VwRlKdP7putEBfe+MuixuumYXFcee4UHittlcSOS4mqtBX1Pk
 L2UikWW8mYAhyp2Faf2SJdiVLaWTxL58JPTSVNuuTj/JVkOthU97Y0JLitxIt1jLevCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dPFCF6gUxcMs97FDc+sodqLNlLCjCRIEHNoSWCuwn0g=; b=U7A52ZoarkpNwvoX+nSW0r+wqD
 Y+syi83+Lw4U1M9xtphmLcbza10ep2rd1Ay91ufDuvGbThlbr/iYv4r/ItJcv2/qXY8uhis1XAyIm
 TLX77LBjZNdSWyYn96WUCn42IfW6kbT6F3yEqmsON3/QNX/NpeBY/S2Kdc6jL6DDGkko=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCUo-0003P9-EN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B2FD5C1A3D;
 Wed, 12 Mar 2025 03:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810B7C4CEE9;
 Wed, 12 Mar 2025 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741749051;
 bh=JN9hrFcuVsm/kzMWV0C4GoKl1UA1F2QYyIAMQiXa21g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=KGCI2qmDF/nPuNmD95u3xguSDkH5F6psu+hRbWjekqCHHoj95yvAviTdBM99MNbnG
 x1FycFHck5Azx4EF935LOrgPIgDLYFy9KPCsENZr/5NCezNH5KhP487qzGwwtfIZbQ
 EFG2cs8yQ+O+EshhOEN5jNOmD2xAd++9NaJuyyTgJSuH3plUCXDoZOKuqojwNQGOuv
 GjJUbpzDRlc2ssFTvvrul4GviQkmGR+FTRYHLYdUO5QQaeOiB3tPGBxAN7rE4CpKwL
 sPNRCK9Y4RImPJe5wdQ0BWLBQsRyBOeOEuBWqCff/TiPNJ3VK/fD+jTAOljtbW1WTN
 7t3z33loR4Rvg==
Message-ID: <5f8c60ec-2186-4315-b8c2-74aee91205df@kernel.org>
Date: Wed, 12 Mar 2025 11:10:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-4-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-4-sandeen@redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12, Eric Sandeen wrote: > From: Eric Sandeen
 <sandeen@sandeen.net> > > The current options parsing function both parses
 options and validates > them - factor the validation out to reduce [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsCUo-0003P9-EN
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: factor out an f2fs_default_check
 function
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
Cc: jaegeuk@kernel.org, Eric Sandeen <sandeen@sandeen.net>,
 lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> From: Eric Sandeen <sandeen@sandeen.net>
> 
> The current options parsing function both parses options and validates
> them - factor the validation out to reduce the size of the function and
> make transition to the new mount API possible, because under the new mount
> API, options are parsed one at a time, and cannot all be tested at the end
> of the parsing function.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
>  fs/f2fs/super.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 29b3aa1ee99c..7cfd5e4e806e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -687,7 +687,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  	int ret;
>  
>  	if (!options)
> -		goto default_check;

Eric, do you know in which condition options can be NULL, mount w/o any
specified options?

If so, maybe we'd keep this in order to chech whether default options
generated from default_options() is conflicted or not? What do you think?

Thanks,

> +		return 0;
>  
>  	while ((p = strsep(&options, ",")) != NULL) {
>  		int token;
> @@ -1318,7 +1318,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			return -EINVAL;
>  		}
>  	}
> -default_check:
> +	return 0;
> +}
> +
> +static int f2fs_default_check(struct f2fs_sb_info *sbi)
> +{
>  #ifdef CONFIG_QUOTA
>  	if (f2fs_check_quota_options(sbi))
>  		return -EINVAL;
> @@ -2364,6 +2368,10 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	}
>  #endif
>  
> +	err = f2fs_default_check(sbi);
> +	if (err)
> +		goto restore_opts;
> +
>  	/* flush outstanding errors before changing fs state */
>  	flush_work(&sbi->s_error_work);
>  
> @@ -4489,6 +4497,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	if (err)
>  		goto free_options;
>  
> +	err = f2fs_default_check(sbi);
> +	if (err)
> +		goto free_options;
> +
>  	sb->s_maxbytes = max_file_blocks(NULL) <<
>  				le32_to_cpu(raw_super->log_blocksize);
>  	sb->s_max_links = F2FS_LINK_MAX;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
