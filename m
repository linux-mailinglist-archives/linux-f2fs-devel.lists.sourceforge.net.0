Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B30672EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 03:15:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIKSs-0004pL-PE;
	Thu, 19 Jan 2023 02:15:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pIKSr-0004pE-Jb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 02:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibNQKd2lrXSNQ5Sym5ju6ot4SBnsqhPW9/Bt/2OAVG0=; b=nUTGbpPcWmKUpXpMe1qNE/C6+g
 UjZSby4o5ibgdKz2nfk6qYklNXrqPi7At/P+sB5pt7Wf0hBuwJ82TPCs9GD5LouCjcTm06HGBCfYB
 se9W/kbdMM5Fv76vekEPl2VDP28EIEm8HN5KyHYBYqSEHpP85JjebTwyg9QkrV82w3B4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ibNQKd2lrXSNQ5Sym5ju6ot4SBnsqhPW9/Bt/2OAVG0=; b=m8gb+uwKSokX36hKZ+BdKMovKo
 QKeyETGbB0e0iJOJgJhhsF/Ld2dvF4zmZQi2DusmA+dSFIdXFfkb7gdiokERpoLagdF0YmOSLDMLD
 /TlR/A73cKIZky/pnLbe2qjMAv5YJl5wSA9xXvXdnceBQnRG9XpYB0EW+7rpYSuUC5os=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIKSp-008Uj8-QB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 02:15:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 813BCB81FB6;
 Thu, 19 Jan 2023 02:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108E2C43392;
 Thu, 19 Jan 2023 02:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674094532;
 bh=/ltzt1Csvme38n0fgFnKgL3v4ZrlbvWtk/qKHYPTuKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CZwBvMQ8J2a8d74b5+qWBj0Sg2Pz1MqrqBX5s/RCOY2CMm/15OKkU5OJo8TVJ50A3
 3MGsro7MojCMTSZAl5qwRz7BZxeACUgEB4rcengZCYoqFaJhEDUuMUEF5g+yFxyqNX
 mMkNLyXmIHr5yC+vz6oYt3SQa/yr1QIEg63rO7zVn0obUkpjlW/4xOb2sVtkNTLM7b
 b1obWw+aqf+rcZw8iiOgUFNK37IupLEIuou7nVE9a9ifMwN+DWzlXRBPw0b8NHXd1P
 61UlgHnPOdOCj9UXRdaTAWC56a6BPRDmFShuzEoAudtYVSjC6x86cQZvYP2uoGIBQz
 +um6MNQTFERCA==
Date: Wed, 18 Jan 2023 18:15:30 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y8inwtRzVHXsxxyT@google.com>
References: <20230112201032.66300-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112201032.66300-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/13, Yangtao Li wrote: > Opt_compress_chksum,
 Opt_compress_mode
 and Opt_compress_cache > lack the necessary check to see if the image supports
 compression, > let's add it. > > Signed-off-by: Yang [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pIKSp-008Uj8-QB
Subject: Re: [f2fs-dev] [PATCH] f2fs: add compression feature check for all
 compress mount opt
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

On 01/13, Yangtao Li wrote:
> Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache
> lack the necessary check to see if the image supports compression,
> let's add it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/super.c | 55 +++++++++++++++++++++++++------------------------
>  1 file changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5fc83771042d..8ef1449272b3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -89,7 +89,7 @@ static struct shrinker f2fs_shrinker_info = {
>  	.seeks = DEFAULT_SEEKS,
>  };
>  
> -enum {
> +enum f2fs_mount_opt {
>  	Opt_gc_background,
>  	Opt_disable_roll_forward,
>  	Opt_norecovery,
> @@ -655,6 +655,30 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
>  #endif
>  #endif
>  
> +static bool f2fs_mount_opt_need_skip(struct f2fs_sb_info *sbi, enum f2fs_mount_opt opt)
> +{
> +	switch (opt) {
> +	case Opt_compress_algorithm:
> +	case Opt_compress_log_size:
> +	case Opt_compress_extension:
> +	case Opt_nocompress_extension:
> +	case Opt_compress_chksum:
> +	case Opt_compress_mode:
> +	case Opt_compress_cache:
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +		if (f2fs_sb_has_compression(sbi))
> +			return false;
> +
> +		f2fs_info(sbi, "Image doesn't support compression");
> +#else
> +		f2fs_info(sbi, "compression options not supported");
> +#endif
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> @@ -685,6 +709,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		args[0].to = args[0].from = NULL;
>  		token = match_token(p, f2fs_tokens, args);
>  
> +		if (f2fs_mount_opt_need_skip(sbi, token))
> +			continue;

It seems this changes the behavior?

> +
>  		switch (token) {
>  		case Opt_gc_background:
>  			name = match_strdup(&args[0]);
> @@ -1068,10 +1095,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			break;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  		case Opt_compress_algorithm:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
>  			name = match_strdup(&args[0]);
>  			if (!name)
>  				return -ENOMEM;
> @@ -1122,10 +1145,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			kfree(name);
>  			break;
>  		case Opt_compress_log_size:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
>  			if (args->from && match_int(args, &arg))
>  				return -EINVAL;
>  			if (arg < MIN_COMPRESS_LOG_SIZE ||
> @@ -1137,10 +1156,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			F2FS_OPTION(sbi).compress_log_size = arg;
>  			break;
>  		case Opt_compress_extension:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
>  			name = match_strdup(&args[0]);
>  			if (!name)
>  				return -ENOMEM;
> @@ -1161,10 +1176,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			kfree(name);
>  			break;
>  		case Opt_nocompress_extension:
> -			if (!f2fs_sb_has_compression(sbi)) {
> -				f2fs_info(sbi, "Image doesn't support compression");
> -				break;
> -			}
>  			name = match_strdup(&args[0]);
>  			if (!name)
>  				return -ENOMEM;
> @@ -1204,16 +1215,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		case Opt_compress_cache:
>  			set_opt(sbi, COMPRESS_CACHE);
>  			break;
> -#else
> -		case Opt_compress_algorithm:
> -		case Opt_compress_log_size:
> -		case Opt_compress_extension:
> -		case Opt_nocompress_extension:
> -		case Opt_compress_chksum:
> -		case Opt_compress_mode:
> -		case Opt_compress_cache:
> -			f2fs_info(sbi, "compression options not supported");
> -			break;
>  #endif
>  		case Opt_atgc:
>  			set_opt(sbi, ATGC);
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
