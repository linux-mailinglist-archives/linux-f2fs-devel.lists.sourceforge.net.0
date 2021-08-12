Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8C3E9D08
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 05:37:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mE1Wc-0000An-RB; Thu, 12 Aug 2021 03:36:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mE1Wb-0000Ac-Qu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 03:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6G3BwaKVStzxy0Puq3DeaYiftjzl8AyweReR738w5g=; b=caGLaL9s6FrwmtLklfPxklgkRI
 iE4Pf0kSeGUxLG0P7H0HLG9zJynsobQz/lhwzOAO/tFZ2SMT6g8XwKH5WbM8BgaSkuVElAqd7+DoX
 rgAY8lteQEb3eW3xHWzzs5Cgn9v4Zn68EhBh2d4HvfiIA0shpdCMDhyjcpR3QztEV57k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6G3BwaKVStzxy0Puq3DeaYiftjzl8AyweReR738w5g=; b=IXVIbcG6MfYW/GYcOIA4fkQPd4
 XS43L5m5cuxRvV0M5mM3e/FoBe82vx7P3upMp9rMqdIPwVWbrigFErSoXYvB4cLWgEyOKqNoDAHg9
 BlnXNTHFcfW3FIyzxRuG4JUFEsgz7RELMMnaPqOHMyU2eAkp3Gkp19SnhSVUa5UYBhAQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mE1WY-0004C9-2f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 03:36:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 378A860EE2;
 Thu, 12 Aug 2021 03:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628739405;
 bh=wOaK1sJkQLD8LwMJuzBx401pXP/NtxsyzQbqwz+jaZY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=qz7zTTO4lU+E8mjdM4f60K38M7RHrzZmXkwnOGS0cEgK++hngQQNm9RUXpEapsD6F
 yyqhjm58z770weg3if8vojuEnHYJ7pSdv5eAX5fGtw5Q7yvsw0IrEl1rTwQMHm7zP9
 14phl5sySSb4Smi0Ig/Xz/HZ4UkxIjCP1FujyhosUI87QwRm4MsIPNim/nAkwamKa/
 JbwuxuXkbmzF1B86IW41m90mdYHoIRaGJ78lLAFExHGiZM743upGBCN2trXtyq3ipL
 qZfHc6kjVvHMRm6yPX/5pj1HdiKQnRIHiArpnpqvlKtIvFNK2huWDI/jykcgx/5IjN
 TPGjkTbBq83tQ==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210812031837.267323-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <673ae8f2-e090-8cf8-d25a-2932310424ec@kernel.org>
Date: Thu, 12 Aug 2021 11:36:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812031837.267323-1-changfengnan@vivo.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mE1WY-0004C9-2f
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/12 11:18, Fengnan Chang wrote:
> Since cluster is basic unit of compression, one cluster is compressed or
> not, so we can calculate valid blocks only for first page in cluster,
> the other pages just skip.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index df5e8d8c654e..fc0115a61082 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2299,6 +2299,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   		.nr_rpages = 0,
>   		.nr_cpages = 0,
>   	};
> +	pgoff_t nc_cluster_idx = NULL_CLUSTER;
>   #endif
>   	unsigned nr_pages = rac ? readahead_count(rac) : 1;
>   	unsigned max_nr_pages = nr_pages;
> @@ -2328,15 +2329,27 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   							&last_block_in_bio,
>   							rac != NULL, false);
>   				f2fs_destroy_compress_ctx(&cc, false);
> +				nc_cluster_idx = NULL_CLUSTER;

Can we get rid of this?

>   				if (ret)
>   					goto set_error_page;
>   			}
> -			ret = f2fs_is_compressed_cluster(inode, page->index);
> -			if (ret < 0)
> -				goto set_error_page;
> -			else if (!ret)
> -				goto read_single_page;
> +			if (cc.cluster_idx == NULL_CLUSTER) {
> +				if (nc_cluster_idx ==
> +					page->index >> cc.log_cluster_size) {
> +					goto read_single_page;
> +				}
> +
> +				ret = f2fs_is_compressed_cluster(inode, page->index);
> +				if (ret < 0)
> +					goto set_error_page;
> +				else if (!ret) {
> +					nc_cluster_idx =
> +						page->index >> cc.log_cluster_size;
> +					goto read_single_page;
> +				}
>   
> +				nc_cluster_idx = NULL_CLUSTER;
> +			}
>   			ret = f2fs_init_compress_ctx(&cc);
>   			if (ret)
>   				goto set_error_page;
> @@ -2373,6 +2386,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   							&last_block_in_bio,
>   							rac != NULL, false);
>   				f2fs_destroy_compress_ctx(&cc, false);
> +				nc_cluster_idx = NULL_CLUSTER;

Ditto,

Thanks,

>   			}
>   		}
>   #endif
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
