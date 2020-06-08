Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F531F1182
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 04:51:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ji7sh-0007QQ-PH; Mon, 08 Jun 2020 02:51:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ji7sh-0007QJ-87
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 02:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wkqkRXy6tAefLc7dY2jgT0K+gCwjzCp9GiJYQC7qRwo=; b=VE2mOuwpygsvgFkKQWVfzDsBBg
 NERE0QdolYhd4scaQE5o0kN1O7+BNpzVREo8zj46gIm7TepLhiWBDALGx0XcFM+w1Ick2ew3WW1NK
 ixB0O0y8vvZQMJ7nhzG2I+QlA3OVmLla/kZNwG/GKlUiDx+C2zoJBLRIg7y6Bo+z+OMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wkqkRXy6tAefLc7dY2jgT0K+gCwjzCp9GiJYQC7qRwo=; b=aGqQSCPbq7cUtVOoq6rexzqC7z
 lk3/QpW6HVNH6oepb30ODkngIMRhZTlrZQekoCkIHUgB8/NetmU3pf8YY5iPtnw5OY9cnikIvilAQ
 aXUuJ7ZfCnKUhMl655i5nRUz68qBbpEhwZiI+rNCwnn4zdv909xaq9wj8IQBaimCs9ew=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ji7sf-00Cc5E-Ua
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 02:51:23 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 684BB96EE16A14BE0FDD;
 Mon,  8 Jun 2020 10:51:06 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 8 Jun 2020
 10:51:01 +0800
To: Denis Efremov <efremov@linux.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "Chao Yu" <chao@kernel.org>
References: <20200605181533.73113-1-efremov@linux.com>
 <20200605181533.73113-2-efremov@linux.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c49bbb44-f842-14ca-68a8-88f1b6cd200c@huawei.com>
Date: Mon, 8 Jun 2020 10:51:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200605181533.73113-2-efremov@linux.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ji7sf-00Cc5E-Ua
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: use kfree() to free sbi in
 f2fs_fill_super()
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

On 2020/6/6 2:15, Denis Efremov wrote:
> Use kfree() instead of kvfree() to free sbi in
> f2fs_fill_super() because the memory is allocated with
> kzalloc() in the function.

Could you fix them in one patch?

In addition, we need to fix them in f2fs_put_super() as well.

Thanks,

> 
> Fixes: 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed")
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9a3c8eba37e2..39b644c7e9d4 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3812,7 +3812,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  free_sbi:
>  	if (sbi->s_chksum_driver)
>  		crypto_free_shash(sbi->s_chksum_driver);
> -	kvfree(sbi);
> +	kfree(sbi);
>  
>  	/* give only one another chance */
>  	if (retry_cnt > 0 && skip_recovery) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
