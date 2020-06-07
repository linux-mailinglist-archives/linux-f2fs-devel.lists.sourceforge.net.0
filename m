Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C571F0FF4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Jun 2020 23:18:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ji2g6-0001N0-B4; Sun, 07 Jun 2020 21:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ji2g4-0001Mf-Sj
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Jun 2020 21:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pykINq2SlpdIayM1Zh9U+ARKvifFPAdipc9Tilm3Aw=; b=itTl9eFv9z42pfTSCK1ZH36DXW
 XhX+ZUkNSbGHMLF4rbPMyB9hNiKXmeU/V+XGelB5zVqIegxqREBTJz/OfG0TUWwAijhfvXiBxrAeG
 OuIa/8xhJUixC3dda6DQmuwKRzbf6GatbkkwjmEaaCkKu68T9Q4WTqp2M9OPiLfJV6T8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pykINq2SlpdIayM1Zh9U+ARKvifFPAdipc9Tilm3Aw=; b=XGIxjG4kMQDeHmAtVx79OzCr60
 uyNxgytJLbBLfkT0vUBwuHrT5QhNIKL8Fa0EZYG/xRdK3/MvLNRanZcjmkJPHCaqh4u8M4whe84D8
 x9YhKIqluyrwpJhxEzmNZZSeOX133kTfe5VlLHXa+vvS8EvxdNvyOrr93DpNUWHdSREI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ji2g2-00CONf-Rg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Jun 2020 21:18:00 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AA602067B;
 Sun,  7 Jun 2020 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591564668;
 bh=wEivynlQPef/VO9ow2cpwEO2SaJr8PZ0KsNxmupY4ow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZoH/4EUI9REPKk0bBji19GyKSCDMvacGfoanlTwN0pj+3YTM0gblFj4c9cHA2Od+4
 /dZfB+D0a+nb4P4Npvv5HLrdPKof+oT2cMsZCK2Gj6OhDG/dyJPk4GmPmlDSB6cn3e
 ZkGERTwXJIhckZoQZR2xdDghrPONm4k3e7tsJbGc=
Date: Sun, 7 Jun 2020 14:17:48 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200607211748.GA26785@google.com>
References: <20200605085453.45717-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605085453.45717-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ji2g2-00CONf-Rg
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow writeback on error status
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

On 06/05, Chao Yu wrote:
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
> If filesystem was injected w/ checkpoint errror, before umount, kworker
> will always hold one core in order to writeback a large number of node
> pages, that looks not reasonable, to avoid that, we can allow data/node
> write in such case, since we can force all data/node writes with OPU mode,
> and clear recovery flag on node, and checkpoint is not allowed as well,
> so we don't need to worry about writeback's effect on data/node in
> previous checkpoint, then with this way, it can decrease memory footprint
> cost by node/data pages and avoid looping into data/node writeback
> process.

This patch breaks fault injection test with filesystem corruption. Please check.

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/data.c | 19 ++++++++++++-------
>  fs/f2fs/node.c |  7 +++++--
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9d40db50cd65..2b3c846181bb 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2519,6 +2519,8 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return true;
>  	if (f2fs_lfs_mode(sbi))
>  		return true;
>  	if (S_ISDIR(inode->i_mode))
> @@ -2702,13 +2704,16 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
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
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
