Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5BAB1C0BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 08:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyyOMZDJGj8VA3kTtTmLlIHFo//yjqkl4FODTqidXRo=; b=ilBPNK03YNizsJlz5Amm+A0vuR
	O5No5wVvNj/vJhJ/I4B2FZORNxRAJRM1a/pg3l+vsecIE06luxLbZPXJSP6xosb2SPXO9Be54/cpo
	QQQkOQ4s8TRQwsLpVzZdEPDUhIjZHzu0P0V6pNGMf9wzRnxUk9wGbhKunvCbjw67Hl3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujY6K-0004is-MW;
	Wed, 06 Aug 2025 06:58:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujY6J-0004ij-0R
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 06:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y+TFYcqgjrUmj5AoKQdUwq23npz4NcOzQxDRF+eHB/w=; b=Wa4efv64Y+dVQJ+LFFB91Awwn/
 DL4DmSsuDtmhcjNqA2+ahXQ1Su8uM5JktjRpH2d2yMW5/Anm8LhyD58Hq/NfbJDkF1eteQRattxKD
 l9BwdbD1GafLrpVRjoF0SYMjSw0X8fOPwonq/gg0t1+6qpHOwHoY2QA1RSSJklyfdbYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y+TFYcqgjrUmj5AoKQdUwq23npz4NcOzQxDRF+eHB/w=; b=Ks7spOP5Q4kCY3bmXRvhemoLPD
 HQzRMIfcZH/851rzmTjnVLMVLlfZCeNA37ZwVylcGJdl8Ky+zOfbgLtar08GaOixAQ0cZhJJyZaGK
 Ll7Uj9GagIyi9sfbOfhLatNtDKi8oqV/kbd2XjnTBWlsDyeGxhxcy5TIxL2lm0fO/R9U=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujY6G-0002wm-PW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 06:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A0BB4410B;
 Wed,  6 Aug 2025 06:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C202C4CEE7;
 Wed,  6 Aug 2025 06:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754463482;
 bh=v/OeGHoMWLuhtUF7X3BqHdvfDxs23xjMvHsAQd4BheI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FhiS24FaZXy/jhoBdsair8NMN+Dtm/qgik3eZhpPtCEDNIvNzyz2Oh+A0wIDC80mz
 SdE72wf9xSv3b8Bd/8Qs/7oiczEm3pjKMZsOfVBNEMKz0O6OpPxgxaAOrC0b9WQq9i
 JyOPj5SzGDWpLAqvmjYcoeAcXw3o3luFWtQUC4Ii6+kDe9TVzZw0GuDKV/qdYcsHJf
 dLTuDXmKKi2x58HgBamyt6MUXR5K8yOLeNhkU7SGa5AX8c1hcTK+YUcnXQZlseitXS
 YzgKk4TtgtzrBO4Ip9btG3SoY+ZTr55tWk/ayRjv385MIOHzfW8vLF2/ZAJ65TWvuR
 3TrQjPSF4PysA==
Message-ID: <ed15f10a-3bd5-4779-8ad2-ad1b2e384d39@kernel.org>
Date: Wed, 6 Aug 2025 14:57:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Xiaojun <wangxiaojun@vivo.com>, jaegeuk@kernel.org
References: <20250801024539.317438-1-wangxiaojun@vivo.com>
Content-Language: en-US
In-Reply-To: <20250801024539.317438-1-wangxiaojun@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/1/25 10:45,
 Wang Xiaojun wrote: > In the following scenarios, 
 F2FS cannot reclaim truncated space. > > case 1: > write file A, size is
 1G | CP | truncate A to 1M | fsync A | SPO > > case 2: > CP [...] 
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
X-Headers-End: 1ujY6G-0002wm-PW
Subject: Re: [f2fs-dev] [PATCH] f2fs:reclaim truncated space during the
 recovery process
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/1/25 10:45, Wang Xiaojun wrote:
> In the following scenarios, F2FS cannot reclaim truncated space.
> 
> case 1: 
> write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO
> 
> case 2: 
> CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO
> 
> During the recovery process, F2FS will recover file A,
> but the 1-1G space cannot be reclaimed.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>

Xiaojun,

Can you please add a fixes line?

> ---
>  fs/f2fs/f2fs.h     |  1 +
>  fs/f2fs/recovery.c | 15 ++++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46be7560548c..d37204567b66 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -459,6 +459,7 @@ struct fsync_inode_entry {
>  	struct inode *inode;	/* vfs inode pointer */
>  	block_t blkaddr;	/* block address locating the last fsync */
>  	block_t last_dentry;	/* block address locating the last dentry */
> +	loff_t old_max_size;	/* old max file size for truncate */

Nitpick,

How about max_i_size?

>  };
>  
>  #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 4cb3a91801b4..2f482742857c 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -95,6 +95,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
>  	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
>  					GFP_F2FS_ZERO, true, NULL);
>  	entry->inode = inode;
> +	entry->old_max_size = i_size_read(inode);
>  	list_add_tail(&entry->list, head);
>  
>  	return entry;
> @@ -828,6 +829,8 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>  				break;
>  			}
>  			recovered_inode++;
> +			if (entry->old_max_size < i_size_read(entry->inode))
> +				entry->old_max_size = i_size_read(entry->inode);

loff_t i_size = i_size_read(entry->inode);

if (entry->max_i_size < i_size)
	entry->max_i_size = i_size;

>  		}
>  		if (entry->last_dentry == blkaddr) {
>  			err = recover_dentry(entry->inode, folio, dir_list);
> @@ -844,8 +847,18 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>  		}
>  		recovered_dnode++;
>  
> -		if (entry->blkaddr == blkaddr)
> +		if (entry->blkaddr == blkaddr) {
> +			if (entry->old_max_size > i_size_read(entry->inode)) {
> +				err = f2fs_truncate_blocks(entry->inode,
> +					i_size_read(entry->inode), false);

Ditto,

Thanks,

> +				if (err) {
> +					f2fs_folio_put(folio, true);
> +					break;
> +				}
> +				f2fs_mark_inode_dirty_sync(entry->inode, true);
> +			}
>  			list_move_tail(&entry->list, tmp_inode_list);
> +		}
>  next:
>  		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
>  					next_blkaddr_of_node(folio));



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
