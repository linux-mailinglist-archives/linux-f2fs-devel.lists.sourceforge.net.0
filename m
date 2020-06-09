Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D71F346B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jun 2020 08:53:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiY8J-0007lb-Gq; Tue, 09 Jun 2020 06:53:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jiY8H-0007lO-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 06:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdf9yryw7dySlqlFUzXa2yY2/rApR+kdSVCreL8iEio=; b=A7ro+PCLRtQggGg3DfYclj+yWY
 9ecYI8BYOBbXUEdNWmKu52A84RYRjtr8f2b8tJxfbQeIYD5y7EDXdCNOpmgM2ikRMLLj97qPncTPl
 suNFmZ530WCLNc2Ia3LUyOO7HowhCq6mtpbN59ynAU/Zxg6IzIavnx0fIS6nkrB64DvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pdf9yryw7dySlqlFUzXa2yY2/rApR+kdSVCreL8iEio=; b=BIguxuensUbiM97C4dGy0t2cr/
 RoonxezilI15xs5SRJk82cFWuyraGxp45wp69lxlfvxzCjTNg6B+UJNKMkmaydqYw0IiqRofJjVVj
 4d9MwIpljwNash1kcBj8OUaccalFrpcDcrUa0lHFKYPlPRM/iL5uHUeN79zCDjfsHea0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jiY8D-00CRk0-8j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Jun 2020 06:53:13 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B3EA53834E9FF4BC3AA4;
 Tue,  9 Jun 2020 14:53:01 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 9 Jun 2020
 14:52:56 +0800
To: <jaegeuk@kernel.org>
References: <20200608120107.6336-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f981a95d-8ec3-4992-478a-1dc1f910f497@huawei.com>
Date: Tue, 9 Jun 2020 14:52:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200608120107.6336-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jiY8D-00CRk0-8j
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow writeback on error status
 filesystem
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

Jaegeuk,

Let's consider this patch in next Linux version.

BTW, do you still encounter consistency problem w/o this version?

On 2020/6/8 20:01, Chao Yu wrote:
>     71.07%     0.01%  kworker/u256:1+  [kernel.kallsyms]  [k] wb_writeback
>             |
>              --71.06%--wb_writeback
>                        |
>                        |--68.96%--__writeback_inodes_wb
>                        |          |
>                        |           --68.95%--writeback_sb_inodes
>                        |                     |
>                        |                     |--65.08%--__writeback_single_inode
>                        |                     |          |
>                        |                     |           --64.35%--do_writepages
>                        |                     |                     |
>                        |                     |                     |--59.83%--f2fs_write_node_pages
>                        |                     |                     |          |
>                        |                     |                     |           --59.74%--f2fs_sync_node_pages
>                        |                     |                     |                     |
>                        |                     |                     |                     |--27.91%--pagevec_lookup_range_tag
>                        |                     |                     |                     |          |
>                        |                     |                     |                     |           --27.90%--find_get_pages_range_tag
> 
> If filesystem was injected checkpoint errror, before umount, kworker will
> always hold one core in order to writeback a large number of node pages,
> that looks not reasonable, to avoid that, we can allow data/node write in
> such case, since we can force all data/node writes with OPU mode, and
> clear recovery flag on node, and checkpoint is not allowed as well, so we
> don't need to worry about writeback's effect on data/node in previous
> checkpoint, then with this way, it can decrease memory footprint cost by
> node/data pages and avoid looping into data/node writeback process.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/checkpoint.c |  7 +++++++
>  fs/f2fs/data.c       | 22 +++++++++++++++-------
>  fs/f2fs/node.c       |  7 +++++--
>  3 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 236064930251..1bb8278a1c4a 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1238,6 +1238,13 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  		goto retry_flush_nodes;
>  	}
>  
> +	if (unlikely(f2fs_cp_error(sbi))) {
> +		up_write(&sbi->node_write);
> +		up_write(&sbi->node_change);
> +		f2fs_unlock_all(sbi);
> +		return -EIO;
> +	}
> +
>  	/*
>  	 * sbi->node_change is used only for AIO write_begin path which produces
>  	 * dirty node blocks and some checkpoint values by block allocation.
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 267b5e76a02b..808e7734db19 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2508,6 +2508,8 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return true;
>  	if (f2fs_lfs_mode(sbi))
>  		return true;
>  	if (S_ISDIR(inode->i_mode))
> @@ -2691,13 +2693,19 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  	/* we should bypass data pages to proceed the kworkder jobs */
>  	if (unlikely(f2fs_cp_error(sbi))) {
>  		mapping_set_error(page->mapping, -EIO);
> -		/*
> -		 * don't drop any dirty dentry pages for keeping lastest
> -		 * directory structure.
> -		 */
> -		if (S_ISDIR(inode->i_mode))
> -			goto redirty_out;
> -		goto out;
> +
> +		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE))
> +			goto out;
> +
> +		if (has_not_enough_free_secs(sbi, 0, 0)) {
> +			/*
> +			 * don't drop any dirty dentry pages for keeping lastest
> +			 * directory structure.
> +			 */
> +			if (S_ISDIR(inode->i_mode))
> +				goto redirty_out;
> +			goto out;
> +		}
>  	}
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 03e24df1c84f..372c04efad38 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1527,7 +1527,10 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>  			unlock_page(page);
>  			return 0;
>  		}
> -		goto redirty_out;
> +		if (has_not_enough_free_secs(sbi, 0, 0))
> +			goto redirty_out;
> +		set_fsync_mark(page, 0);
> +		set_dentry_mark(page, 0);
>  	}
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
> @@ -1568,7 +1571,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>  		goto redirty_out;
>  	}
>  
> -	if (atomic && !test_opt(sbi, NOBARRIER))
> +	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_cp_error(sbi))
>  		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
>  
>  	/* should add to global list before clearing PAGECACHE status */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
