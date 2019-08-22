Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738C9A25C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2019 23:50:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0uyA-0005a7-Hr; Thu, 22 Aug 2019 21:50:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1i0uy5-0005ZP-Lc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 21:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kNORw2oZ5e6TlWCXXVKhYtP+/Ls73oTltH0pbiIb4zs=; b=R7dwr3zyPjSsDqcr4lpm1qCjsN
 C0D2ybrHw5tpe4g2bBTY94GEh4SeDkaayQ29ImOLizQfyWCJIF4hd99LXUaYwKOaOVv+fhscpg5wV
 XZpPNpfc2XGTwEeXh7MAGavfyI19yFu91BRjHsM/kcKqKgDfgse0zCbsh2PD5+YmSh9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kNORw2oZ5e6TlWCXXVKhYtP+/Ls73oTltH0pbiIb4zs=; b=OykoN8tDCDJehvnzYEEQ9Dlo9A
 Pk+tB8k8oXx7uesBFxkMLkhpCb31bvpsg7VewBGB7UnnbAw7vYYr4j5lD0cvrSWl6PizrGn0tzeVM
 KDKz/jp0+JyqqUKe3Sx3P92EdDWO2R7mYB3DjCjIg7dazPPOnyK9Bc9RjACyBB06OLv4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0uy3-00Ckmx-Hj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 21:50:05 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BAA82082F;
 Thu, 22 Aug 2019 21:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566510597;
 bh=4nuihHocfjME8KX0oPzfUplmPa84TX7Db/bZnFPJTiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NNZBJ8qW6ftCdaL0noNYBrIsPEfSyAZ61QbKwni0u649/qaLMM40Az8jN31ocly7K
 3U1M2uyCMYe0ouZ7vR6pwDy6aVlEzsOj9KPGDCRjplXCmo5czNckvkLCD4boIpq2cV
 QAMudyoX6GM8AXzt7ZiQbSVbWMOnpitfsBPCJH6o=
Date: Thu, 22 Aug 2019 14:49:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190822214955.GA1349@sol.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190822121756.107187-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822121756.107187-1-yuchao0@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i0uy3-00Ckmx-Hj
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to writeout dirty inode during
 node flush
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Aug 22, 2019 at 08:17:56PM +0800, Chao Yu wrote:
> As Eric reported:
> 
> On xfstest generic/204 on f2fs, I'm getting a kernel BUG.
> 
>  allocate_segment_by_default+0x9d/0x100 [f2fs]
>  f2fs_allocate_data_block+0x3c0/0x5c0 [f2fs]
>  do_write_page+0x62/0x110 [f2fs]
>  f2fs_do_write_node_page+0x2b/0xa0 [f2fs]
>  __write_node_page+0x2ec/0x590 [f2fs]
>  f2fs_sync_node_pages+0x756/0x7e0 [f2fs]
>  block_operations+0x25b/0x350 [f2fs]
>  f2fs_write_checkpoint+0x104/0x1150 [f2fs]
>  f2fs_sync_fs+0xa2/0x120 [f2fs]
>  f2fs_balance_fs_bg+0x33c/0x390 [f2fs]
>  f2fs_write_node_pages+0x4c/0x1f0 [f2fs]
>  do_writepages+0x1c/0x70
>  __writeback_single_inode+0x45/0x320
>  writeback_sb_inodes+0x273/0x5c0
>  wb_writeback+0xff/0x2e0
>  wb_workfn+0xa1/0x370
>  process_one_work+0x138/0x350
>  worker_thread+0x4d/0x3d0
>  kthread+0x109/0x140
> 
> The root cause of this issue is, in a very small partition, e.g.
> in generic/204 testcase of fstest suit, filesystem's free space
> is 50MB, so at most we can write 12800 inline inode with command:
> `echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX > $SCRATCH_MNT/$i`,
> then filesystem will have:
> - 12800 dirty inline data page
> - 12800 dirty inode page
> - and 12800 dirty imeta (dirty inode)
> 
> When we flush node-inode's page cache, we can also flush inline
> data with each inode page, however it will run out-of-free-space
> in device, then once it triggers checkpoint, there is no room for
> huge number of imeta, at this time, GC is useless, as there is no
> dirty segment at all.
> 
> In order to fix this, we try to recognize inode page during
> node_inode's page flushing, and update inode page from dirty inode,
> so that later another imeta (dirty inode) flush can be avoided.
> 
> Reported-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2: fix potential deadlock
>  fs/f2fs/node.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index d9ba1db2d01e..e5044eec8097 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1762,6 +1762,47 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  	return ret ? -EIO: 0;
>  }
>  
> +static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	bool clean;
> +
> +	if (inode->i_ino != ino)
> +		return 0;
> +
> +	if (!is_inode_flag_set(inode, FI_DIRTY_INODE))
> +		return 0;
> +
> +	spin_lock(&sbi->inode_lock[DIRTY_META]);
> +	clean = list_empty(&F2FS_I(inode)->gdirty_list);
> +	spin_unlock(&sbi->inode_lock[DIRTY_META]);
> +
> +	if (clean)
> +		return 0;
> +
> +	inode = igrab(inode);
> +	if (!inode)
> +		return 0;
> +	return 1;
> +}
> +
> +static bool flush_dirty_inode(struct page *page)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
> +	struct inode *inode;
> +	nid_t ino = ino_of_node(page);
> +
> +	inode = find_inode_nowait(sbi->sb, ino, f2fs_match_ino, NULL);
> +	if (!inode)
> +		return false;
> +
> +	f2fs_update_inode(inode, page);
> +	unlock_page(page);
> +
> +	iput(inode);
> +	return true;
> +}
> +
>  int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>  				struct writeback_control *wbc,
>  				bool do_balance, enum iostat_type io_type)
> @@ -1785,6 +1826,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>  		for (i = 0; i < nr_pages; i++) {
>  			struct page *page = pvec.pages[i];
>  			bool submitted = false;
> +			bool may_dirty = true;
>  
>  			/* give a priority to WB_SYNC threads */
>  			if (atomic_read(&sbi->wb_sync_req[NODE]) &&
> @@ -1832,6 +1874,13 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>  				goto lock_node;
>  			}
>  
> +			/* flush dirty inode */
> +			if (IS_INODE(page) && may_dirty) {
> +				may_dirty = false;
> +				if (flush_dirty_inode(page))
> +					goto lock_node;
> +			}
> +
>  			f2fs_wait_on_page_writeback(page, NODE, true, true);
>  
>  			if (!clear_page_dirty_for_io(page))
> -- 
> 2.18.0.rc1
> 

Thanks, the test passes for me with this patch applied.

Tested-by: Eric Biggers <ebiggers@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
