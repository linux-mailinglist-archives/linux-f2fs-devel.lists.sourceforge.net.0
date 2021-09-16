Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09C40D980
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 14:10:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQqDU-0005kS-17; Thu, 16 Sep 2021 12:10:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mQqDR-0005jx-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O7KKGjcIHmDXGKLox6swEL10g+VtPesDsDQQLW7zOIw=; b=FW8m82O4qDJsUOcOmLEoOLFmNw
 gOaFtxMGuMfNrpSjoPqH9GT/MXrGWsv8DabkcKaXVI8Kr8qdLURuwbpxgBAjFVIbo8gbHdDFo7DIi
 aoyttnzHXXUOVn4swRUSjs5zPJ/WwMmjfYB7ecNMgGO8zfoEQB+VdlA5KcPedCiKAe8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O7KKGjcIHmDXGKLox6swEL10g+VtPesDsDQQLW7zOIw=; b=SOH1QqIcpO8/5XB8wnFUERRUrW
 9U2/HX+1ozf8XSsZxuDnNk9wliaQLd8TPdSvQmhBrV8+WAW0HcWUMbTUeXGyWd2bMkRxxofKA7PXb
 5p07Yt9ufVZ98H7RpSgMtRlt36NJvyc1+6UDLrMbb38qU9Bum6DcEzwnnxRb77dIfeHE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQqDR-00CiEp-4N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:10:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1078260E52;
 Thu, 16 Sep 2021 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631794198;
 bh=e9UzXbPN/bEvTWK5YMLy3hnA4T1bnxeDveo1dsoL3Ik=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eLOiWmADfGe9zK2rUB7bncjl9WQ8MrIFxrg/RA/9e9mL/q9jWj0+IsugPhJDZp1Yf
 G/KNA/ncPmv8GBr7W1hMphazzPezMm8TO/VQJKVO9jVASAByKZueNT0vItF8cXOqwX
 VxNQF0JzAYoHC/B1AhKojTp2IXPftbkw+pkJF9n+HH60j10sz2k6TJAmVWqme8E8M1
 mOUy7wXvc22x9peE/DmZ+RDaadjdn65kQTr49lAO0daaJAFYjmUT7ReRsjcJKa6/jE
 JB/ZurABefds1sws5ox6s0A2zSWcBo+EOsv0E83VsVf6rQPaNO7SqX032l9Cxuf4rO
 PmcOKPNJ3VMDA==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b6e2fe51-1f33-bfb9-bc3b-a8735dd2ca87@kernel.org>
Date: Thu, 16 Sep 2021 20:09:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210916113026.378385-2-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/16 19:30, Fengnan Chang wrote: > For now, overwrite
 file with direct io use inplace policy, but > not counted, fix it. And use
 stat_add_inplace_blocks(sbi, 1, ) > instead of stat_inc_inplace [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mQqDR-00CiEp-4N
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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

On 2021/9/16 19:30, Fengnan Chang wrote:
> For now, overwrite file with direct io use inplace policy, but
> not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, )
> instead of stat_inc_inplace_blocks(sb, ).
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c    | 7 ++++++-
>   fs/f2fs/f2fs.h    | 8 ++++----
>   fs/f2fs/segment.c | 2 +-
>   3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c1490b9a1345..0c5728d63c33 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1491,6 +1491,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>   		if (flag == F2FS_GET_BLOCK_DIO)
>   			f2fs_wait_on_block_writeback_range(inode,
>   						map->m_pblk, map->m_len);
> +		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> +				map->m_may_create)
> +			stat_add_inplace_blocks(sbi, map->m_len, true);
>   		goto out;
>   	}
> 
> @@ -1553,7 +1556,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>   				goto sync_out;
>   			blkaddr = dn.data_blkaddr;
>   			set_inode_flag(inode, FI_APPEND_WRITE);
> -		}
> +		} else if (!create && !f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
> +				map->m_may_create)

Why not

} else if {!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
					map->m_may_create)

Thanks,

> +			stat_add_inplace_blocks(sbi, 1, true);
>   	} else {
>   		if (create) {
>   			if (unlikely(f2fs_cp_error(sbi))) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3d4ee444db27..2d81e9f0a0ee 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3785,12 +3785,12 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   		else								\
>   			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
>   	} while (0)
> -#define stat_inc_inplace_blocks(sbi, direct_io)					\
> +#define stat_add_inplace_blocks(sbi, count, direct_io)			\
>   	do {								\
>   		if (direct_io)						\
> -			(atomic_inc(&(sbi)->inplace_count[0]));		\
> +			(atomic_add(count, &(sbi)->inplace_count[0]));  \
>   		else								\
> -			(atomic_inc(&(sbi)->inplace_count[1]));		\
> +			(atomic_add(count, &(sbi)->inplace_count[1]));	\
>   	} while (0)
>   #define stat_update_max_atomic_write(inode)				\
>   	do {								\
> @@ -3877,7 +3877,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>   #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
>   #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
>   #define stat_inc_block_count(sbi, curseg)		do { } while (0)
> -#define stat_inc_inplace_blocks(sbi)			do { } while (0)
> +#define stat_add_inplace_blocks(sbi, count, direct_io)		do { } while (0)
>   #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
>   #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
>   #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index ded744e880d0..c542c4b687ca 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>   		goto drop_bio;
>   	}
>   
> -	stat_inc_inplace_blocks(fio->sbi, false);
> +	stat_add_inplace_blocks(sbi, 1, false);
>   
>   	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
>   		err = f2fs_merge_page_bio(fio);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
