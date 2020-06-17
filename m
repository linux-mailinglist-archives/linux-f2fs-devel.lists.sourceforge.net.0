Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649A1FCD62
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 14:28:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlXBM-0003yI-A0; Wed, 17 Jun 2020 12:28:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jlXBJ-0003y9-VV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 12:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nFsdFWcbLYBUlCYK3kE4wKXFEiCnwdJ9C5Nc4wdtPBk=; b=WJSlTx5372uzoRdm3/qdECWLKD
 nkX/XXNdUv+37l0+Qx5HLMwGXusof6BpcsI7c4gHbv/d83xL0cEoYG0NAti5hCkrQirx4bFDSSZOr
 vx9jemh8v+dg9liMbud9jMztP1uIuvusKjsVY2sCETJbeDFzSnvkcI+YwNx89TV349/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nFsdFWcbLYBUlCYK3kE4wKXFEiCnwdJ9C5Nc4wdtPBk=; b=XDP8PIDA4SK2EYhcVuA1qMzD/Q
 dH8GDsRJpxeyCAdZTbW+0gYhHHKwZQZnd2FwrG23rlxJFPGy56DxBQwmnZ1jFz1ZquqgWv9BXtHWs
 J7Nic/+dIvg7skdLAc3wEC9VvWZ+dMLc+J69nU07eeAgsV+fGkwB/3jfXVQUyBZlA2ys=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlXBH-006qRa-Pu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 12:28:41 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7EC3826641B5BDBD1DA9;
 Wed, 17 Jun 2020 20:28:21 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 20:28:16 +0800
To: <zhaowuyun@wingtech.com>, <jaegeuk@kernel.org>
References: <1592384659-20203-1-git-send-email-zhaowuyun@wingtech.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <86069ba3-cba3-7bc9-c90b-e931abd0dde5@huawei.com>
Date: Wed, 17 Jun 2020 20:28:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1592384659-20203-1-git-send-email-zhaowuyun@wingtech.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jlXBH-006qRa-Pu
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix a race condition between
 f2fs_write_end_io and f2fs_del_fsync_node_entry
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

On 2020/6/17 17:04, zhaowuyun@wingtech.com wrote:
> From: Wuyun Zhao <zhaowuyun@wingtech.com>
> 
> Under some condition, the __write_node_page will submit a page which is not
> f2fs_in_warm_node_list and will not call f2fs_add_fsync_node_entry.
> f2fs_gc continue to run to invoke f2fs_iget -> do_read_inode to read the same node page
> and set code node, which make f2fs_in_warm_node_list become true,
> that will cause f2fs_bug_on in f2fs_del_fsync_node_entry when f2fs_write_end_io called.
Could you please add below race condition description into commit message?

- f2fs_write_end_io
					- f2fs_iget
					 - do_read_inode
					  - set_cold_node
					  recover cold node flag
 - f2fs_in_warm_node_list
  - is_cold_node
  if node is cold, assume we have added
  node to fsync_node_list during writepages()
 - f2fs_del_fsync_node_entry
  - f2fs_bug_on() due to node page
  is not in fsync_node_list

BTW, I'm curious about why we can lose cold flag for non-dir inode?
any clue to reproduce this bug (I mean losing cold flag)?

> 
> [   34.966133] Call trace:
> [   34.969902]  f2fs_del_fsync_node_entry+0x100/0x108
> [   34.976071]  f2fs_write_end_io+0x1e0/0x288
> [   34.981539]  bio_endio+0x248/0x270
> [   34.986289]  blk_update_request+0x2b0/0x4d8
> [   34.991841]  scsi_end_request+0x40/0x440
> [   34.997126]  scsi_io_completion+0xa4/0x748
> [   35.002593]  scsi_finish_command+0xdc/0x110
> [   35.008143]  scsi_softirq_done+0x118/0x150
> [   35.013610]  blk_done_softirq+0x8c/0xe8
> [   35.018811]  __do_softirq+0x2e8/0x578
> [   35.023828]  irq_exit+0xfc/0x120
> [   35.028398]  handle_IPI+0x1d8/0x330
> [   35.033233]  gic_handle_irq+0x110/0x1d4
> [   35.038433]  el1_irq+0xb4/0x130
> [   35.042917]  kmem_cache_alloc+0x3f0/0x418
> [   35.048288]  radix_tree_node_alloc+0x50/0xf8
> [   35.053933]  __radix_tree_create+0xf8/0x188
> [   35.059484]  __radix_tree_insert+0x3c/0x128
> [   35.065035]  add_gc_inode+0x90/0x118
> [   35.069967]  f2fs_gc+0x1b80/0x2d70
> [   35.074718]  f2fs_disable_checkpoint+0x94/0x1d0
> [   35.080621]  f2fs_fill_super+0x10c4/0x1b88
> [   35.086088]  mount_bdev+0x194/0x1e0
> [   35.090923]  f2fs_mount+0x40/0x50
> [   35.095589]  mount_fs+0xb4/0x190
> [   35.100159]  vfs_kern_mount+0x80/0x1d8
> [   35.105260]  do_mount+0x478/0xf18
> [   35.109926]  ksys_mount+0x90/0xd0
> [   35.114592]  __arm64_sys_mount+0x24/0x38
> 
> Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> ---
>  fs/f2fs/inode.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index be6ac33..0df5c8c 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -402,6 +402,7 @@ static int do_read_inode(struct inode *inode)
>  
>  	/* try to recover cold bit for non-dir inode */
>  	if (!S_ISDIR(inode->i_mode) && !is_cold_node(node_page)) {
> +		f2fs_wait_on_page_writeback(node_page, NODE, true, true);
>  		set_cold_node(node_page, false);
>  		set_page_dirty(node_page);
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
