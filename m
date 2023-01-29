Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508E67FE24
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 11:21:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM4oY-00053u-PR;
	Sun, 29 Jan 2023 10:21:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM4oW-00053a-D2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAW+jLkVxCcebviJ7VcHTs5hafysPKDoT7XMFw4Vzok=; b=S9j+VMhGO8E1DP9D5qRlVLt+Ag
 cbJkR7HbFXw0bIkW9SnueaBmdDkgJt+TLys/5g6zfPcuqnoF78tAUp/WnNaZbi/fBm0gcfdecG0rS
 XjD8KT3yKk6mYxm573aORMTmA19xwBUsUeQVktN5gkE11VWCBUwG5N8At+X9KZb0pPoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VAW+jLkVxCcebviJ7VcHTs5hafysPKDoT7XMFw4Vzok=; b=X3lBy+Elu72n9zcJLA2qyR89PQ
 d+dgowuVCDvWqszJBOfLEROiotwO8GPXmpNzfgy+g6ST5PTN3GXazYPPbA686vuWdwvsSHrWPnZLS
 N7lnmEk/kN4fuuML0s200taZNsPLDYogbjoJtre2cVTXAa36Sx1BdBmT2X8gKbc7XBoE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM4oU-002Nwk-Ty for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:21:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 515C660C81;
 Sun, 29 Jan 2023 10:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7217BC433EF;
 Sun, 29 Jan 2023 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674987681;
 bh=GSdKAo92nai0wbeJYq4a7V9fH+8wliaNJ599WdgV9W4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jOOOKQProIT7qWbY5uBYX46HpTgNT7wClnjsnmQg46EDdi7zaHDLshipccmPt7i9/
 zIa6XhEP4c65i22SwHgQ8eVlqcRbelxECL7ncJfrQLEGhY2Uc7lZm4gqBhk3r0lstt
 7zuBSDebOTVflwFcOr6F3Zjei0hzbQE6L+qbRiYFQ2OdSYPi9z3UtoiUorqCSeuLll
 7t5Z90o3///f6jD9Sqg2LFkn+C5SibCTtCfc7BUBZZkFNq5+97+iBmZy6/dE+x8y5M
 8brH30t2DN8W9lxAvsYRFWZ8gni/cbhsgr1VuWA3kBaMPD0CN5TrW8Q3r+4bhPuo+Y
 4i75tzicWS77Q==
Message-ID: <99e4e218-d9a4-93d1-c0d3-9ba01da21093@kernel.org>
Date: Sun, 29 Jan 2023 18:21:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230124153346.74881-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230124153346.74881-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/24 23:33, Yangtao Li wrote: > f2fs supports lz4
 compression algorithm and lz4hc compression algorithm,
 > which the level parameter
 needs to be passed in. When CONFIG_F2FS_FS_LZ4HC > is not e [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM4oU-002Nwk-Ty
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix to check lz4hc compression
 when CONFIG_F2FS_FS_LZ4HC is not enabled
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

On 2023/1/24 23:33, Yangtao Li wrote:
> f2fs supports lz4 compression algorithm and lz4hc compression algorithm,
> which the level parameter needs to be passed in. When CONFIG_F2FS_FS_LZ4HC
> is not enabled, even if there is no problem with the level parameter, add
> the level parameter to the lz4 algorithm will cause the mount to fail.
> 
> Let's change it to be the same as other compression algorithms. When the
> kernel does not enable the algorithm, ignore this parameter and print msg.
> 
> Fixes: 3fde13f817e2 ("f2fs: compress: support compress level")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/super.c | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d8a65645ee48..ad5df4d5c39a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -588,19 +588,11 @@ static int f2fs_test_compress_extension(struct f2fs_sb_info *sbi)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_F2FS_FS_LZ4
> +#ifdef CONFIG_F2FS_FS_LZ4HC
>   static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
>   {
> -#ifdef CONFIG_F2FS_FS_LZ4HC
>   	unsigned int level;
> -#endif
>   
> -	if (strlen(str) == 3) {
> -		F2FS_OPTION(sbi).compress_level = 0;
> -		return 0;
> -	}
> -
> -#ifdef CONFIG_F2FS_FS_LZ4HC
>   	str += 3;
>   
>   	if (str[0] != ':') {
> @@ -617,10 +609,6 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
>   
>   	F2FS_OPTION(sbi).compress_level = level;
>   	return 0;
> -#else
> -	f2fs_info(sbi, "kernel doesn't support lz4hc compression");
> -	return -EINVAL;
> -#endif
>   }
>   #endif
>   
> @@ -1085,10 +1073,19 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   #endif
>   			} else if (!strncmp(name, "lz4", 3)) {
>   #ifdef CONFIG_F2FS_FS_LZ4
> -				ret = f2fs_set_lz4hc_level(sbi, name);
> -				if (ret) {
> -					kfree(name);
> -					return -EINVAL;
> +				if (strlen(name) == 3) {
> +					F2FS_OPTION(sbi).compress_level = 0;
> +				} else {
> +#ifdef CONFIG_F2FS_FS_LZ4HC
> +					ret = f2fs_set_lz4hc_level(sbi, name);
> +					if (ret) {
> +						kfree(name);
> +						return -EINVAL;
> +					}
> +#else
> +					f2fs_info(sbi, "kernel doesn't support lz4hc compression");

It needs to check <alg_name>:<compr_level> format to make sure user wants to
enable lz4hc w/ specified level, otherwise if parameter is lz4xx, it doesn't
make sense to print:

"kernel doesn't support lz4hc compression"

> +					break;

It will cause memory leak for name.

Thanks,

> +#endif
>   				}
>   				F2FS_OPTION(sbi).compress_algorithm =
>   								COMPRESS_LZ4;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
