Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D3B1E134
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 06:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2MQJL9uR3iOZED8aSFte7QuSqPOlzAr8Yy64+/NQEo=; b=ces9vAGTXa/LycU0PfTP1P7wJr
	D43ipNQ8OG0pb7z3p6OmG8x/2hZlujl97ofK3XZd52zdmShhZ5dj+YjDFeuOPgXbGWvmVako9ED6h
	AI9UUfDZE3bS1/x43MdPNTti3guAW8/yFU5yjbM8g9tT1HNS4u4AbYHn8zsgKOkmbwXU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukEWt-0006Bw-5X;
	Fri, 08 Aug 2025 04:16:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ukEWr-0006Bk-Vt
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 04:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LVC0en1OKlIImmItYZPF+klGpBPrrd6R1PAnuEL5gbY=; b=fA5Q7Sx30GTRSdHWDkagerv60s
 CubJHYurigXaI6xEWMH9ayGr8Ac12yaYLNmppNl8htn2UjDLKb8F0OZ6OEkUseH2v60sVaDQk3Zil
 1P72OTa20ZyiwXd8YAmaS5Wo2S0aZbK/kFRfe9Hf9W33sQ15BVcF9m0MiC/iE5QtYISw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LVC0en1OKlIImmItYZPF+klGpBPrrd6R1PAnuEL5gbY=; b=f4VuGXlTA7jn4FGo8O/UjxukAn
 z+WovhTzDmIR3rb2lGcEAKQmewrT7QnzqN2p1NGBdoR14BmdJZ2sLvdyUA1fLVrHKGpMZ74XnX2EE
 mdjyqtAtjYHx7yjxcpvmF9ezBxp06KiRlGTF3YDjqVQyEEmufrZytc4RM/TJndgoE7XY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukEWs-0002Jk-7N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 04:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CDB565C5744;
 Fri,  8 Aug 2025 04:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0582C4CEF0;
 Fri,  8 Aug 2025 04:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754626584;
 bh=N3Myb0MUVeTwDG746zCWbMQx9AeqizE7zCL+CawFEm4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ngfsvInL6yrB5czkl8WcME/ojzsobLgF8K5zq7Lb43hrQvqMBXy1cVd22ArNs5+P8
 3oHl/vHR+2TTWP9kMCLh5rjeEAsX7Mo8CFsJFw2uT6323wgQVeqU75YGRs2VIU7YV3
 zFxR5IZCj6BW0GJu76DGKF+oLScOX/qPU3ww/lRoXQVww/N5xkou8AgZwME/Btm1Nz
 zfmE3G0AiI/Pl+a9pKbNbEBnmat8jg4/xFCu0SRtO6OPr4ewAKuKNhFI4GnF24ewBH
 0/WaIG5w3ZscUMsVEOWguXmyTG0QBod/B4WvbqeUsn32x3J3b061jndj4yZupQWM48
 +jTjTxR+awd2w==
Message-ID: <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
Date: Fri, 8 Aug 2025 12:16:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Xiaojun <wangxiaojun@vivo.com>, jaegeuk@kernel.org
References: <20250807084442.422751-1-wangxiaojun@vivo.com>
Content-Language: en-US
In-Reply-To: <20250807084442.422751-1-wangxiaojun@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Xiaojun, I just notice generic/483 will fail w/ this change, 
 can you please take a look? Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukEWs-0002Jk-7N
Subject: Re: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Xiaojun,

I just notice generic/483 will fail w/ this change, can you please take a
look?

Thanks,

On 8/7/2025 4:44 PM, Wang Xiaojun wrote:
> This patch fixes missing space reclamation during the recovery process.
> In the following scenarios, F2FS cannot reclaim truncated space.
> case 1:
> write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO
> 
> case 2:
> CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO
> 
> During the recovery process, F2FS will recover file A,
> but the 1M-1G space cannot be reclaimed.
> 
> Fixes: d624c96fb3249 ("f2fs: add recovery routines for roll-forward")
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>
> ---
> v3: Add a Fixes line.
> v2: Apply Chao's suggestion from v1. No logical changes.
> v1: Fix missing space reclamation during the recovery process.
> ---
>   fs/f2fs/f2fs.h     |  1 +
>   fs/f2fs/recovery.c | 18 +++++++++++++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46be7560548c..28fce59198ce 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -459,6 +459,7 @@ struct fsync_inode_entry {
>   	struct inode *inode;	/* vfs inode pointer */
>   	block_t blkaddr;	/* block address locating the last fsync */
>   	block_t last_dentry;	/* block address locating the last dentry */
> +	loff_t max_i_size;	/* previous max file size for truncate */
>   };
>   
>   #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 4cb3a91801b4..68b62c8a74d3 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -95,6 +95,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
>   	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
>   					GFP_F2FS_ZERO, true, NULL);
>   	entry->inode = inode;
> +	entry->max_i_size = i_size_read(inode);
>   	list_add_tail(&entry->list, head);
>   
>   	return entry;
> @@ -796,6 +797,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>   	while (1) {
>   		struct fsync_inode_entry *entry;
>   		struct folio *folio;
> +		loff_t i_size;
>   
>   		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
>   			break;
> @@ -828,6 +830,9 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>   				break;
>   			}
>   			recovered_inode++;
> +			i_size = i_size_read(entry->inode);
> +			if (entry->max_i_size < i_size)
> +				entry->max_i_size = i_size;
>   		}
>   		if (entry->last_dentry == blkaddr) {
>   			err = recover_dentry(entry->inode, folio, dir_list);
> @@ -844,8 +849,19 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>   		}
>   		recovered_dnode++;
>   
> -		if (entry->blkaddr == blkaddr)
> +		if (entry->blkaddr == blkaddr) {
> +			i_size = i_size_read(entry->inode);
> +			if (entry->max_i_size > i_size) {
> +				err = f2fs_truncate_blocks(entry->inode,
> +							i_size, false);
> +				if (err) {
> +					f2fs_folio_put(folio, true);
> +					break;
> +				}
> +				f2fs_mark_inode_dirty_sync(entry->inode, true);
> +			}
>   			list_move_tail(&entry->list, tmp_inode_list);
> +		}
>   next:
>   		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
>   					next_blkaddr_of_node(folio));



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
