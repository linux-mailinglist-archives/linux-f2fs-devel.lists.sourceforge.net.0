Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 838EF2625CF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Sep 2020 05:19:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFqe8-0004PY-6D; Wed, 09 Sep 2020 03:19:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kFqe5-0004PI-73
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 03:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+I6s5xPhkfcg2S0UkwMOIeEFiy/V5t70BP8DHvIiIHY=; b=N9ZxSvLNgC1gOe7JzfBD1zcLrX
 X+77x/8Nhp14fq2nwA4UsqUOgDhaJ8kNLG8xglao0MI9KVFFppNjnEi7zeSlSJvfSUrppm4/x8DoH
 Bof7c8P3Tkz79XDEKY0yxokUFmhyy+EW4A/tlCc5VZgH7DPuYxBqPim0svm2rcd+87y0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+I6s5xPhkfcg2S0UkwMOIeEFiy/V5t70BP8DHvIiIHY=; b=j6jCbqk7FG3zD/rN6FF8rRUZUX
 LOFiSne/U47UY0ns4nVNNaIa12jQrDLuQu5iLSsgOjktg2m3naj9zfDhgFBt1cV8asAzl7Fv9bJ46
 hyDgYX7iilmFIvEZE6P6G+UWtjVfubJlUUROg2Lk1P9tqobsfv8lIw2ei0REzYctJkFI=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFqdx-0001Wk-20
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Sep 2020 03:19:41 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 30D54FF0F60299D870FD;
 Wed,  9 Sep 2020 11:19:24 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 9 Sep 2020
 11:19:20 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200909023634.3821423-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4c8971ce-98b5-4675-8310-5e9af0a14bb6@huawei.com>
Date: Wed, 9 Sep 2020 11:19:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200909023634.3821423-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kFqdx-0001Wk-20
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up vm_map_ram() call
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/9/9 10:36, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Made f2fs_vmap() wrapper to handle vm_map_ram() stuff.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

LGTM,

I think it should be merged into original patch. :)

Maybe Jaeguek could help to do that.

Thanks,

> ---
>   fs/f2fs/compress.c | 42 ++++++++++++++++++------------------------
>   1 file changed, 18 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 357303d8514b..7895186cc765 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -557,6 +557,20 @@ static void f2fs_compress_free_page(struct page *page)
>   
>   #define MAX_VMAP_RETRIES	3
>   
> +static void *f2fs_vmap(struct page **pages, unsigned int count)
> +{
> +	int i;
> +	void *buf = NULL;
> +
> +	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> +		buf = vm_map_ram(pages, count, -1);
> +		if (buf)
> +			break;
> +		vm_unmap_aliases();
> +	}
> +	return buf;
> +}
> +
>   static int f2fs_compress_pages(struct compress_ctx *cc)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
> @@ -593,23 +607,13 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>   		}
>   	}
>   
> -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> -		cc->rbuf = vm_map_ram(cc->rpages, cc->cluster_size, -1);
> -		if (cc->rbuf)
> -			break;
> -		vm_unmap_aliases();
> -	}
> +	cc->rbuf = f2fs_vmap(cc->rpages, cc->cluster_size);
>   	if (!cc->rbuf) {
>   		ret = -ENOMEM;
>   		goto out_free_cpages;
>   	}
>   
> -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> -		cc->cbuf = vm_map_ram(cc->cpages, cc->nr_cpages, -1);
> -		if (cc->cbuf)
> -			break;
> -		vm_unmap_aliases();
> -	}
> +	cc->cbuf = f2fs_vmap(cc->cpages, cc->nr_cpages);
>   	if (!cc->cbuf) {
>   		ret = -ENOMEM;
>   		goto out_vunmap_rbuf;
> @@ -728,23 +732,13 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>   			goto out_free_dic;
>   	}
>   
> -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> -		dic->rbuf = vm_map_ram(dic->tpages, dic->cluster_size, -1);
> -		if (dic->rbuf)
> -			break;
> -		vm_unmap_aliases();
> -	}
> +	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
>   	if (!dic->rbuf) {
>   		ret = -ENOMEM;
>   		goto destroy_decompress_ctx;
>   	}
>   
> -	for (i = 0; i < MAX_VMAP_RETRIES; i++) {
> -		dic->cbuf = vm_map_ram(dic->cpages, dic->nr_cpages, -1);
> -		if (dic->cbuf)
> -			break;
> -		vm_unmap_aliases();
> -	}
> +	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
>   	if (!dic->cbuf) {
>   		ret = -ENOMEM;
>   		goto out_vunmap_rbuf;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
