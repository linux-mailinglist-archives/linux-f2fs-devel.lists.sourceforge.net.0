Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66522D388
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jul 2020 03:24:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz8vk-0005H1-1a; Sat, 25 Jul 2020 01:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jz8vj-0005Gu-2D
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 01:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKTiIpdMKQVzuDzQClcnNXxOcoc1fsWBrlfVDQNzKT4=; b=VYzSj9gcDy9DcV86H6m/Jx9HsZ
 7ZzjLNSs5iKwVQ+Y19ufhwxIfZXvXXJXAnw4FdCvIWWV3RV4dMd30ToTBAyYtcjuHNpElCyAAtMPw
 7qPyTbIE9jJRYKvpH8oiJyX2UmeNCDo79J48ouogAV9AtVDrPTJyQ6nPKOhWliWvL49c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GKTiIpdMKQVzuDzQClcnNXxOcoc1fsWBrlfVDQNzKT4=; b=llTCicryuuTgxFDG4u55A0w4+c
 b6Z9ivo1KIZyqZrjfwUZpV2Oghh7K7A+OLAvVTFhkvX3o8Rcv+FU9L0Hjhpnjh0+Sty2NXwXAvlF1
 v2R7WAAOXTgEw1Tlo8GlRCJ+b1ig88CBDjROGeL3zrXKWcyPmyMSAtnq/+2oASu8mbMQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jz8vh-00GTnF-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 01:24:50 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 494E489B49F5EB2E533F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Jul 2020 09:24:42 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 25 Jul
 2020 09:24:33 +0800
To: Jack Qiu <jack.qiu@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200725014952.19036-1-jack.qiu@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c45c1d4d-5cfb-da9d-19e6-749881823029@huawei.com>
Date: Sat, 25 Jul 2020 09:24:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200725014952.19036-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz8vh-00GTnF-Ji
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kfree() to free sbi->gc_thread
 allocated by f2fs_kmalloc
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

Hello,

Let's check and do conversion for all possible cases rather than do
one by one.

On 2020/7/25 9:49, Jack Qiu wrote:
> Use kfree() instead of kvfree() to free sbi->gc_thread allocated
> by f2fs_kmalloc(). Because the memory is allocated with kmalloc
> inside f2fs_kmalloc().
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>   fs/f2fs/gc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5b95d5a146eb..696ceeedc76d 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -147,7 +147,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
>   	if (IS_ERR(gc_th->f2fs_gc_task)) {
>   		err = PTR_ERR(gc_th->f2fs_gc_task);
> -		kvfree(gc_th);
> +		kfree(gc_th);
>   		sbi->gc_thread = NULL;
>   	}
>   out:
> @@ -160,7 +160,7 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
>   	if (!gc_th)
>   		return;
>   	kthread_stop(gc_th->f2fs_gc_task);
> -	kvfree(gc_th);
> +	kfree(gc_th);
>   	sbi->gc_thread = NULL;
>   }
> 
> --
> 2.17.1
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
