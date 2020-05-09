Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D52661CBCA9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 May 2020 05:02:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jXFlD-0007fe-7G; Sat, 09 May 2020 03:02:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jXFlC-0007fX-Cz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 May 2020 03:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cO3g3jHndqbRDcybBlliQ/0q+Td6+iS9HxUJACAu1Q4=; b=QuClBKp0kaLAb/aeDzJdnrsGSz
 tveo5ZgR0ZROYt3orwOcKjR/XIHNak8HMqNf8HeUaa4yPvwrMgm4mYfAVFxvAAbjJXiIW+jbHSpVS
 7U3YAZ4VI6xdkKhHXojvXlgwgs8qQT/OYWtj82gd805cWQuzp+qbr4rM9+K6lo2fiW/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cO3g3jHndqbRDcybBlliQ/0q+Td6+iS9HxUJACAu1Q4=; b=iO1UXFJF1ZozzKIkN9rp2u3LSr
 Fdfjg3Xf4b5FpmCxg1Doj5i0hz6boaRxUjOQY+v83cvo7jvHg2sTSzUeDyBNCBGneUhJpl5W7SL1b
 +Laiz0S+Rj7Ii23P0PLZ9BC1sq5/qT6tWnoU4Ff5uWqhadbU5j7P5vkR9lDr0w7nGRSM=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jXFl9-00HGI9-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 May 2020 03:02:42 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5A6CC335C76B1BBD74F7;
 Sat,  9 May 2020 11:02:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sat, 9 May 2020
 11:02:26 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sayali Lokhande <sayalil@codeaurora.org>
References: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
 <20200508161052.GA49579@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0902037e-998d-812e-53e7-90ea7b9957eb@huawei.com>
Date: Sat, 9 May 2020 11:02:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200508161052.GA49579@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jXFl9-00HGI9-Bo
Subject: Re: [f2fs-dev] [PATCH V4] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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

On 2020/5/9 0:10, Jaegeuk Kim wrote:
> Hi Sayali,
> 
> In order to address the perf regression, how about this?
> 
>>From 48418af635884803ffb35972df7958a2e6649322 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Fri, 8 May 2020 09:08:37 -0700
> Subject: [PATCH] f2fs: avoid double lock for cp_rwsem during checkpoint
> 
> There could be a scenario where f2fs_sync_node_pages gets
> called during checkpoint, which in turn tries to flush
> inline data and calls iput(). This results in deadlock as
> iput() tries to hold cp_rwsem, which is already held at the
> beginning by checkpoint->block_operations().
> 
> Call stack :
> 
> Thread A		Thread B
> f2fs_write_checkpoint()
> - block_operations(sbi)
>  - f2fs_lock_all(sbi);
>   - down_write(&sbi->cp_rwsem);
> 
>                         - open()
>                          - igrab()
>                         - write() write inline data
>                         - unlink()
> - f2fs_sync_node_pages()
>  - if (is_inline_node(page))
>   - flush_inline_data()
>    - ilookup()
>      page = f2fs_pagecache_get_page()
>      if (!page)
>       goto iput_out;
>      iput_out:
> 			-close()
> 			-iput()
>        iput(inode);
>        - f2fs_evict_inode()
>         - f2fs_truncate_blocks()
>          - f2fs_lock_op()
>            - down_read(&sbi->cp_rwsem);
> 
> Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/node.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 1db8cabf727ef..626d7daca09de 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1870,8 +1870,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>  				goto continue_unlock;
>  			}
>  
> -			/* flush inline_data */
> -			if (is_inline_node(page)) {
> +			/* flush inline_data, if it's not sync path. */
> +			if (do_balance && is_inline_node(page)) {

IIRC, this flow was designed to avoid running out of free space issue
during checkpoint:

2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")

The sceanrio is:
1. create fully node blocks
2. flush node blocks
3. write inline_data for all the node blocks again
4. flush node blocks redundantly

I guess this may cause failing one case of fstest.


Since block_operations->f2fs_sync_inode_meta has synced inode cache to
inode page, so in block_operations->f2fs_sync_node_pages, could we
check nlink before flush_inline_data():

if (is_inline_node(page)) {
	if (IS_INODE(page) && raw_inode_page->i_links) {
		flush_inline_data()
	}
}


>  				clear_inline_node(page);
>  				unlock_page(page);
>  				flush_inline_data(sbi, ino_of_node(page));
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
