Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A922BB93
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 03:34:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jymbR-0007bA-MK; Fri, 24 Jul 2020 01:34:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jymbP-0007ay-Bi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WRsabkQFzg5c9P5jZM11Awyczt+XrhuGc7rlgnhhg9o=; b=cQNEsn1VZY8a1mAQlF1iYv7DrS
 q7D96cUmwA352Z4XiM1N6ZHOnxBN91FvCyc4un5TO47kjIo8QIVmZ/JWHSz9XBI2hCj/C6khx5IIA
 FrX+Qvt39wOsOQDvVwNVkAAyQqmxJcN6HTHSznVWE1nKYN9aSDK5Wvuhc8cykAG3pbBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WRsabkQFzg5c9P5jZM11Awyczt+XrhuGc7rlgnhhg9o=; b=m7hTY0c6vk3oYE8ktDmf26o4Ra
 bicFpfaxCeS7PUUQQ5JEACis3t9aNGrsgbPABib0rsfE/VcoEt1B0GmDF9ugZL1hSpMfdJ0xFUt0a
 PNW6lTtev7k+Sg3z1a+e+ESMqxfs1auQtLErttZ3WCDwY8zTS2CjVQO+0KwZ06f/8+NA=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jymbM-000w4t-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:34:23 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BA1EE62DF0D20449AD60;
 Fri, 24 Jul 2020 09:34:12 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 24 Jul
 2020 09:34:04 +0800
To: Jia Yang <jiayang5@huawei.com>, <jaegeuk@kernel.org>
References: <20200721034914.51210-1-jiayang5@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <11953828-cbdb-a5f4-b054-556640516d0a@huawei.com>
Date: Fri, 24 Jul 2020 09:34:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200721034914.51210-1-jiayang5@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jymbM-000w4t-Tv
Subject: Re: [f2fs-dev] [PATCH] f2fs: Change the type of
 f2fs_flush_inline_data() to void
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

On 2020/7/21 11:49, Jia Yang wrote:
> The return value of f2fs_flush_inline_data() is not used,
> so delete it.
> 
> Signed-off-by: Jia Yang <jiayang5@huawei.com>

The patch looks good to me, however f2fs_flush_inline_data() should be
reverted, so let's see...

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> ---
>   fs/f2fs/f2fs.h | 2 +-
>   fs/f2fs/node.c | 4 +---
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b35a50f4953c..cf808aa749bc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3275,7 +3275,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
>   struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
>   struct page *f2fs_get_node_page_ra(struct page *parent, int start);
>   int f2fs_move_node_page(struct page *node_page, int gc_type);
> -int f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
> +void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
>   int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			struct writeback_control *wbc, bool atomic,
>   			unsigned int *seq_id);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 03e24df1c84f..6a95bbcb8313 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1814,12 +1814,11 @@ static bool flush_dirty_inode(struct page *page)
>   	return true;
>   }
>   
> -int f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
> +void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
>   {
>   	pgoff_t index = 0;
>   	struct pagevec pvec;
>   	int nr_pages;
> -	int ret = 0;
>   
>   	pagevec_init(&pvec);
>   
> @@ -1858,7 +1857,6 @@ int f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
>   		pagevec_release(&pvec);
>   		cond_resched();
>   	}
> -	return ret;
>   }
>   
>   int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
