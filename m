Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FC3E87D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 04:07:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDdel-0004kB-UN; Wed, 11 Aug 2021 02:07:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mDdek-0004jy-QJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UR0lNfa/aqi0ZfUB1aD1PO7rMqJVyGPH35FKdi4yER8=; b=ZW63fvbR/jc5fczG5wYls7MKxq
 xvAuTqB3nYE5G0hZYp/8usZbDvlEmC5uMKtB9gPwzUF5vIHYJuElQf2lQAwgQ4/RWUvlCu2Q/Q0Ik
 ZNTLanEZWuCY26m5U11dz7oYzjLaYp0sAVZltBgDvIuQTv9YmqUn/tURQc88Ul76i1Es=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UR0lNfa/aqi0ZfUB1aD1PO7rMqJVyGPH35FKdi4yER8=; b=IhoidwHBuVuVLeRgR9Lw9M9CD3
 gCoNsY8cXmr5RORKgSueTYG+8aunXsvrOpxP3XaF7UhpvkJOzVXQBp07GdZvZ+1kudj1nuNsqwFtv
 O8vajW4sm7BHWJYr5q/R2QfBYySPxVm0/FfWj9ODcMEz5SxOC0JhYJlPrO1q7rdLiTFk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDdei-0007rl-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 02:07:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC78B60EB5;
 Wed, 11 Aug 2021 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628647659;
 bh=/j7UVvH27OFc6nO9B5D47N2FuXGlMUDUxJRH4JwEU8w=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ARWX1nj09fXpFrAsEHHFL6WzLYVG96Klk2VXAP7esaJQLdMMx0fEbbT9yrbrpdApM
 oJMApZqEhC4gpuP6iDCD2Oe1sjrwDwiO+Z/th99c3YIsnbqFhO0CUQXNU8hyPStWzW
 Fj3+dQUR82JZsnLfCqWFEa6z0AwNCCNgRcDEQMdUwKiqxd4kP6rZH5t4vcaXHobonj
 5hsoXJ4hcq4i6/W/XP/5j3QWe3xqw5uLsRSg3n1oS8XltrHwkyI83cjjNDMoCIeVtU
 pTA82KC1H/S3Ag1c8cIWUOAAvk2hA/HiBmI1rMHuH0sANCU0kiofJWJJI/RZ+aE/tx
 c7B86qmwQ5L0g==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210810033934.123709-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7d7b6e89-7bcb-85c3-8567-796741e0d335@kernel.org>
Date: Wed, 11 Aug 2021 10:07:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810033934.123709-1-changfengnan@vivo.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDdei-0007rl-Ph
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: avoid duplicate counting of
 valid blocks when read compressed file
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

On 2021/8/10 11:39, Fengnan Chang wrote:
> Since cluster is basic unit of compression, one cluster is compressed or
> not, so we can calculate valid blocks only for first page in cluster,
> the other pages just skip.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c |  1 +
>   fs/f2fs/data.c     | 19 ++++++++++++++-----
>   fs/f2fs/f2fs.h     |  1 +
>   3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7dbfd6965b97..71768f15752a 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -152,6 +152,7 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
>   	cc->rpages = NULL;
>   	cc->nr_rpages = 0;
>   	cc->nr_cpages = 0;
> +	cc->nc_cluster_idx = NULL_CLUSTER;
>   	if (!reuse)
>   		cc->cluster_idx = NULL_CLUSTER;
>   }
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index df5e8d8c654e..bc5c0d94a6fa 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2294,6 +2294,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
>   		.cluster_size = F2FS_I(inode)->i_cluster_size,
>   		.cluster_idx = NULL_CLUSTER,
> +		.nc_cluster_idx = NULL_CLUSTER,
>   		.rpages = NULL,
>   		.cpages = NULL,
>   		.nr_rpages = 0,
> @@ -2331,12 +2332,20 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   				if (ret)
>   					goto set_error_page;
>   			}
> -			ret = f2fs_is_compressed_cluster(inode, page->index);
> -			if (ret < 0)
> -				goto set_error_page;
> -			else if (!ret)
> -				goto read_single_page;
> +			if (cc.cluster_idx == NULL_CLUSTER) {
> +				if (cc.nc_cluster_idx != NULL_CLUSTER)

Once cc.nc_cluster_idx was set, this condition will always force to reading
single page? due to "cc.nc_cluster_idx = NULL_CLUSTER;" will never be called.

Thanks,

> +					goto read_single_page;
>   
> +				ret = f2fs_is_compressed_cluster(inode, page->index);
> +				if (ret < 0)
> +					goto set_error_page;
> +				else if (!ret) {
> +					cc.nc_cluster_idx = page->index >> cc.log_cluster_size;
> +					goto read_single_page;
> +				}
> +
> +				cc.nc_cluster_idx = NULL_CLUSTER;
> +			}
>   			ret = f2fs_init_compress_ctx(&cc);
>   			if (ret)
>   				goto set_error_page;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e97b4d8c5efc..e9b6890a3f19 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1471,6 +1471,7 @@ struct compress_data {
>   struct compress_ctx {
>   	struct inode *inode;		/* inode the context belong to */
>   	pgoff_t cluster_idx;		/* cluster index number */
> +	pgoff_t nc_cluster_idx;		/* cluster index number for non-compressed cluster use*/
>   	unsigned int cluster_size;	/* page count in cluster */
>   	unsigned int log_cluster_size;	/* log of cluster size */
>   	struct page **rpages;		/* pages store raw data in cluster */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
