Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC8271ECF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Sep 2020 11:21:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKI0t-0000IX-Fg; Mon, 21 Sep 2020 09:21:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kKI0r-0000IG-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 09:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olYNMZggma/RRWpVeKG5eYvT7ZlIzUMAm4rJRcPh/JM=; b=f7308Wj5jGY3pIFcJ6dvjZgY0W
 ZmsnkG60R+nms+h7pieVI2UBFzP8zmiw+CL77hhovgvuEXoIPd7jqXrrPbN0XR2NRdmmTuAC6akIy
 9caKI0k8H7hLQAdCqNTDP5SeS3mNUGhttlf4Ooa8RCjP7uePfZlSZ0wFDerrEzynLtmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=olYNMZggma/RRWpVeKG5eYvT7ZlIzUMAm4rJRcPh/JM=; b=H12k9rQxiT/D4slEFA1cvfbsXf
 i1UvfhuL+vs1EJ0nAucih0TwMWpPQ9y0pjI65TgVA5PNk6C7/G6IYuAZXmPNvwUSP7dXac87a07bA
 4qqREqHquu9kCs1X4266YKtDz7DbxlaT1ATHMDM+yzHTiRcBgbCtKNwJHS0dr5cctMKA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKI0e-001peQ-V1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 09:21:33 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E22F2AAA24B3ADC9DE1B;
 Mon, 21 Sep 2020 17:21:00 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 21 Sep
 2020 17:20:52 +0800
To: Wang Xiaojun <wangxiaojun11@huawei.com>, <jaegeuk@kernel.org>
References: <20200921061916.1917750-1-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <47b4bd9d-0934-1f83-5a68-be8628ddea44@huawei.com>
Date: Mon, 21 Sep 2020 17:20:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200921061916.1917750-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kKI0e-001peQ-V1
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unused check on nid
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Xiaojun,

On 2020/9/21 14:19, Wang Xiaojun wrote:
> The case where nid is 0 will be checked in f2fs_check_nid_range.
> Remove the unused check.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> ---
>   fs/f2fs/node.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index cb1b5b61a1da..c61d5b52e29e 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1319,8 +1319,6 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
>   	struct page *apage;
>   	int err;
>   
> -	if (!nid)
> -		return;
>   	if (f2fs_check_nid_range(sbi, nid))
>   		return;

They have different usage, first condition is used to bypass @nid = 0 case which
is legal case; second condition is used to check sanity of nid value, in where
warn log would be printed once nid is a illegal value and in addition, SBI_NEED_FSCK
will be set for later fsck.

So let's keep it as it is. :)

Thanks,

>   
> @@ -1342,8 +1340,6 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>   	struct page *page;
>   	int err;
>   
> -	if (!nid)
> -		return ERR_PTR(-ENOENT);
>   	if (f2fs_check_nid_range(sbi, nid))
>   		return ERR_PTR(-EINVAL);
>   repeat:
> @@ -2193,10 +2189,6 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>   	int err = -EINVAL;
>   	bool ret = false;
>   
> -	/* 0 nid should not be used */
> -	if (unlikely(nid == 0))
> -		return false;
> -
>   	if (unlikely(f2fs_check_nid_range(sbi, nid)))
>   		return false;
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
