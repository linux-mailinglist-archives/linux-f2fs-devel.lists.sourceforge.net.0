Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD01CEA3C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2020 03:49:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYK2X-0003iG-Mg; Tue, 12 May 2020 01:49:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jYK2V-0003i0-SD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 01:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c37NomX1DKPHIWJcGFO6Ce7lqlzrlS8f+0eEzeEIjEg=; b=U+HIUXT3C9ZTTNq20p90gNkIqO
 ya9+QpjwAp8SjSsLdedWBwKwy4c4ll+UmCl6//52IRrbGmIzPGqEI7uCfnCVnHEnticQ02B/2m/MC
 96ty3g491HwxSUU1Z5lEUhwEl7qkh2J2M8WoOi4NWkkuLe9303xNvkyKNf/rt/dZ5Coc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c37NomX1DKPHIWJcGFO6Ce7lqlzrlS8f+0eEzeEIjEg=; b=BY+oAAAQJnuXWC+Q39uv6GnOVY
 Zz7jf8+ofSUAAY5xiEsi0eLDfwvVMP+/zVv2HUhkH4qRw9hzst6+o2AfuP3gsd0XVElP0EtECco0W
 6JErUdU/BoX9KNMbM3bcpQ1IzVtL1hmxrM7XCVTUA8p23HFVBv3Q8GWxETb909sy0eMI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYK2U-005K5p-58
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 May 2020 01:48:59 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 26746A524833430A3C10;
 Tue, 12 May 2020 09:48:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 12 May
 2020 09:48:36 +0800
To: Ma Feng <mafeng.ma@huawei.com>, <chao@kernel.org>, <jaegeuk@kernel.org>
References: <1589197886-10580-1-git-send-email-mafeng.ma@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6641e0f4-cea3-cf3a-bb9b-954bfa630778@huawei.com>
Date: Tue, 12 May 2020 09:48:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1589197886-10580-1-git-send-email-mafeng.ma@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jYK2U-005K5p-58
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: make num_compress_pages and
 f2fs_compress_free_page static
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Ma,

On 2020/5/11 19:51, Ma Feng wrote:
> Fix the following sparse warning:
> 
> fs/f2fs/compress.c:501:5: warning: symbol 'num_compress_pages' was not declared.
>  Should it be static?
> fs/f2fs/compress.c:530:6: warning: symbol 'f2fs_compress_free_page' was not
> declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ma Feng <mafeng.ma@huawei.com>

Thanks for fixing this.

It's better to merge this into original patch, let me know if you mind it.

Thanks,

> ---
>  fs/f2fs/compress.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 4c7eaee..c7c5a8f 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -498,7 +498,7 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>  }
> 
>  static mempool_t *compress_page_pool = NULL;
> -int num_compress_pages = 512;
> +static int num_compress_pages = 512;
>  module_param(num_compress_pages, uint, 0444);
>  MODULE_PARM_DESC(num_compress_pages,
>  		"Number of intermediate compress pages to preallocate");
> @@ -527,7 +527,7 @@ static struct page *f2fs_compress_alloc_page(void)
>  	return page;
>  }
> 
> -void f2fs_compress_free_page(struct page *page)
> +static void f2fs_compress_free_page(struct page *page)
>  {
>  	if (!page)
>  		return;
> --
> 2.6.2
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
