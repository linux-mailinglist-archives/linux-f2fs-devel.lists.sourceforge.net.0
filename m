Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8655079D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:01:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2iNx-0004WC-To; Sun, 19 Jun 2022 00:01:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2iNw-0004W6-Ml
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMXmpka7HGSl+flEXq7vzG+7qky3GksEHOXROtmtMmQ=; b=XsvMu/NDAntQHVktJSSwd2kVTg
 v1j9T3zUBt4G3Ln+Zosfe8hUUJwv42Goh/gxURSxaBtIIGXRjHVMw+57jiVkcx/p6vPN6xh4tMkdZ
 KvZ8w43cb0WFdhjNkZJKMdnzDoFUHtqxsHvPgWOUQNGUYLeVgP+R0pZe7HgYb3P/zqlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TMXmpka7HGSl+flEXq7vzG+7qky3GksEHOXROtmtMmQ=; b=agd1aUa3VIlpqR0Jdm5zUdTaOz
 XM6kDx4jOiW3fJc/B0bKX/ZY82Rrps9xpsZxggUJ/quOPxF5yHUVAeqYTpvy3697PX9VZZI5UXIiM
 dGYT9XiNlrkW/5C1vBWqvAnd1fALlJNy27yRADEWPGTYhgocUtYkUaSnSoU2PtyoROoI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2iNu-0001yB-Jm
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:01:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A132DB80B43;
 Sun, 19 Jun 2022 00:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A07DC3411A;
 Sun, 19 Jun 2022 00:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655596900;
 bh=4uZ3w8KpztyoIhhdswu8fmZ99307UAhVHd/s9nQ5sTc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mJ8C++Oe0oYGN98XUZKsOzfHXGIpjQ9j3VfnHrTBFtNpc5BS0E19tvzrnHlMthMaK
 ImqrSPz26HO51t4EcIumlZEREkSBgD6dRvIdexi7T81LywdhFTMwEW/PyyRxMRqUzo
 rpkP1d6Yros64AKvKQOhrqYXa4f6UDiU0l2YIe3qtldfWOQpn94Th19EdrH4tE2KqE
 dPYlPQpplEMlkR9acN3++b1zB0vm4INDJVSBCbrak+h7G2CWHc2+I5GxMS2n9e+/cx
 /ssvU3wRxWnkIhslWG1w4mLlCAh85vMjdxipXhAATBaldl1ldAGKAXvYYRJZIGRVlY
 PVlEra9Ye/qjQ==
Message-ID: <5627a654-d605-6840-a133-e583c804aadd@kernel.org>
Date: Sun, 19 Jun 2022 08:01:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: qixiaoyu1 <qxy65535@gmail.com>, jaegeuk@kernel.org
References: <20220614114929.6897-1-qixiaoyu1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220614114929.6897-1-qixiaoyu1@xiaomi.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/14 19:49,
 qixiaoyu1 wrote: > From: liuchao12 <liuchao12@xiaomi.com>
 > > Make.f2fs supports manually specifying overprovision, and we expect >
 resize.f2fs to support it as well. > > This chan [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2iNu-0001yB-Jm
Subject: Re: [f2fs-dev] [PATCH 1/2] resize.f2fs: add option to manually
 specify new overprovision
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
Cc: liuchao12 <liuchao12@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/14 19:49, qixiaoyu1 wrote:
> From: liuchao12 <liuchao12@xiaomi.com>
> 
> Make.f2fs supports manually specifying overprovision, and we expect
> resize.f2fs to support it as well.
> 
> This change add a new '-o' option to manually specify overprovision.
> 
> Signed-off-by: liuchao12 <liuchao12@xiaomi.com>
> ---
>   fsck/main.c   |  8 ++++++--
>   fsck/resize.c | 12 ++++++++++--
>   2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/fsck/main.c b/fsck/main.c
> index aef797e..3b4da0f 100644
> --- a/fsck/main.c
> +++ b/fsck/main.c
> @@ -121,7 +121,8 @@ void resize_usage()
>   	MSG(0, "[options]:\n");
>   	MSG(0, "  -d debug level [default:0]\n");
>   	MSG(0, "  -i extended node bitmap, node ratio is 20%% by default\n");
> -	MSG(0, "  -s safe resize (Does not resize metadata)");
> +	MSG(0, "  -o overprovision percentage [default:auto]\n");

Should update manual as well?

> +	MSG(0, "  -s safe resize (Does not resize metadata)\n");
>   	MSG(0, "  -t target sectors [default: device size]\n");
>   	MSG(0, "  -V print the version number and exit\n");
>   	exit(1);
> @@ -527,7 +528,7 @@ void f2fs_parse_options(int argc, char *argv[])
>   #endif
>   	} else if (!strcmp("resize.f2fs", prog)) {
>   #ifdef WITH_RESIZE
> -		const char *option_string = "d:fst:iV";
> +		const char *option_string = "d:fst:io:V";
>   
>   		c.func = RESIZE;
>   		while ((option = getopt(argc, argv, option_string)) != EOF) {
> @@ -561,6 +562,9 @@ void f2fs_parse_options(int argc, char *argv[])
>   			case 'i':
>   				c.large_nat_bitmap = 1;
>   				break;
> +			case 'o':
> +				c.new_overprovision = atof(optarg);
> +				break;
>   			case 'V':
>   				show_version(prog);
>   				exit(0);
> diff --git a/fsck/resize.c b/fsck/resize.c
> index f1b7701..d19c6fa 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -146,12 +146,15 @@ safe_resize:
>   						get_sb(segs_per_sec));
>   
>   	/* Let's determine the best reserved and overprovisioned space */
> -	c.new_overprovision = get_best_overprovision(sb);
> +	if (c.new_overprovision == 0)
> +		c.new_overprovision = get_best_overprovision(sb);
> +
>   	c.new_reserved_segments =
>   		(2 * (100 / c.new_overprovision + 1) + 6) *
>   						get_sb(segs_per_sec);
>   
> -	if ((get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
> +	if (c.new_overprovision == 0 ||

Should never be zero here? Otherwise above "100 / c.new_overprovision"
calculation will cause arithmetic exception.

Thanks,

> +		(get_sb(segment_count_main) - 2) < c.new_reserved_segments ||
>   		get_sb(segment_count_main) * blks_per_seg >
>   						get_sb(block_count)) {
>   		MSG(0, "\tError: Device size is not sufficient for F2FS volume, "
> @@ -476,6 +479,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>   	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
>   						get_cp(rsvd_segment_count));
>   
> +	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
> +	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
> +					get_cp(overprov_segment_count),
> +					c.new_reserved_segments);
> +
>   	free_segment_count = get_free_segments(sbi);
>   	new_segment_count = get_newsb(segment_count_main) -
>   					get_sb(segment_count_main);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
