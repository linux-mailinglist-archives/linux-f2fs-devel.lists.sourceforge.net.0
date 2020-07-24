Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957122BB8E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 03:31:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jymYW-000819-Me; Fri, 24 Jul 2020 01:31:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jymYV-000813-SS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5U0EgGCyaHXXRGx/mPDs8woRod4O855dJAHFLUpixCg=; b=b137cO9E/RM3tcpPHYgCRgrFX4
 7FPllOZPHRXBBR2veR2ABPzyAVBe5TKxI4lJzLpt0opGJajj17NvKyYi5MthjgL2XyGmKVUuu5ZW2
 uUUmqQd7WG3YmklUvKO+XkdeEJfwJTI7N4hrh0RbkUjjodFWuNnHTXT5z9AjTQhHNQQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5U0EgGCyaHXXRGx/mPDs8woRod4O855dJAHFLUpixCg=; b=IajFHrCxCIwFjx3Exy+9Io3n9s
 XIqSm7hrUZxsYDiCqbs1VU4jZYGAw1LaWLYkT+nm89xRJ43LLEQLGP34okgsaqTlzr3/fwOvgxmyt
 PK7bIazAqSjk/VfXmmuA8G8q29Td7ltODQymLtsVqI628FUq2wh7VTrmOrp34LOte05M=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jymYU-00FV6o-I6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:31:23 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6BE29F628B1266093114;
 Fri, 24 Jul 2020 09:31:14 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 24 Jul
 2020 09:31:11 +0800
To: <bugzilla-daemon@bugzilla.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <bug-208565-202145@https.bugzilla.kernel.org/>
 <bug-208565-202145-dVHjH4iPCX@https.bugzilla.kernel.org/>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <acff80e9-b3ef-138e-715b-fee42cfa1000@huawei.com>
Date: Fri, 24 Jul 2020 09:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bug-208565-202145-dVHjH4iPCX@https.bugzilla.kernel.org/>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jymYU-00FV6o-I6
Subject: Re: [f2fs-dev] [Bug 208565] There may be dead lock for cp_rwsem
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/17 1:15, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208565
> 
> Jaegeuk Kim (jaegeuk@kernel.org) changed:
> 
>             What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                   CC|                            |jaegeuk@kernel.org
> 
> --- Comment #1 from Jaegeuk Kim (jaegeuk@kernel.org) ---
> Thank you for the report.
> 
> I think this is valid point that we need to fix.
> I'm testing a RFC patch like this. Thanks.


Shouldn't we revert 34c061ad85a2 ("f2fs: Avoid double lock for cp_rwsem during checkpoint")
at the same time?

> 
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1926,8 +1926,12 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>                                  goto continue_unlock;
>                          }
> 
> -                       /* flush inline_data, if it's async context. */
> -                       if (do_balance && is_inline_node(page)) {
> +                       /* flush inline_data/inode, if it's async context. */
> +                       if (!do_balance)
> +                               goto write_node;
> +
> +                       /* flush inline_data */
> +                       if (is_inline_node(page)) {
>                                  clear_inline_node(page);
>                                  unlock_page(page);
>                                  flush_inline_data(sbi, ino_of_node(page));
> @@ -1940,7 +1944,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>                                  if (flush_dirty_inode(page))
>                                          goto lock_node;
>                          }
> -
> +write_node:
>                          f2fs_wait_on_page_writeback(page, NODE, true, true);
> 
>                          if (!clear_page_dirty_for_io(page))
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
