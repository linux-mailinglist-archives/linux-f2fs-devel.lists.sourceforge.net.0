Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 436193EAC1A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 22:50:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEHeL-0006Kp-3P; Thu, 12 Aug 2021 20:50:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mEHeK-0006Kj-3D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 20:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xvP3tSGDGMQUMSp5Aqcjyv7yBhrYcX5M0+Lv0jpo9AY=; b=Jjdss5P55dM0OHKE8mKMpgs9NM
 LFRgbe4xq6qOHCEH9jupg3IVaYE4QLiA4Xz6p3+pngnn0OAeFeeA5Ns69g+Tkf4QDhL/Qr3Ny4ETz
 5PGBa8HxgZGuv9ZfW5lNjWwl9zQYJPN6xWJJHAsJRwxCg83R1YZhAayx7tt6k9ncyb10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xvP3tSGDGMQUMSp5Aqcjyv7yBhrYcX5M0+Lv0jpo9AY=; b=kWX77eROf1UuRBGTCuorEkYUqT
 9+wBzc7dkNiZuE9600Km4meuL75bPldc8ycze2UEkH81bV2vKX8ownfW+/tRi2x7dZmqlteGL5pVy
 srlJNhVU57LA1N7H8VJtFpfxqixCJni4XMy/mlGuq5f0fpvA+1uEFGji6a49QCww5GOg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEHeI-004Vcg-OM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 20:50:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 856DF60560;
 Thu, 12 Aug 2021 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628801387;
 bh=1jFFI1mfz49g1sV9TwI8xebX1EbH0k/3dXkZktJuI5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ji8MA6NdcDj7Ed4A7FPXDgErpY7OK63nis+ldVdluVXmXDiuaU+P1gA9B3ny7SV1y
 6rnP+F/3URLGv50jQ796s3fAUiLMWRkSQjm+ajlQ322hYAkJfRjYotAwHuHgNK/yg7
 yA5/+e6T6MDrhDKIjorkh52Pa92y4kGZmMxFrXZNwYId5C1JfkGri2/mnvYfxSaoR/
 o7TnADoDEu4s1C4BPdXp3hYDskjV8dC8DJ13CgaQIc5a7rWgE40wBxGJYWJYXjsBgt
 otUMGlB4hZSwm4a6qCqY16pltAQpjPU1wGbriml8aX8ZgOdwomxlewDwpjWW+wmu4R
 p2tubOuN1zTCw==
Date: Thu, 12 Aug 2021 13:49:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YRWJan4JTXHN3RFr@google.com>
References: <20210806000250.39728-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806000250.39728-1-chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mEHeI-004Vcg-OM
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: do sanity check on cluster
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/06, Chao Yu wrote:
> This patch adds f2fs_sanity_check_cluster() to support doing
> sanity check on cluster of compressed file, it will be triggered
> from below two paths:
> 
> - __f2fs_cluster_blocks()
> - f2fs_map_blocks(F2FS_GET_BLOCK_FIEMAP)
> 
> And it can detect below three kind of cluster insanity status.
> 
> C: COMPRESS_ADDR
> N: NULL_ADDR or NEW_ADDR
> V: valid blkaddr
> *: any value
> 
> 1. [*|C|*|*]
> 2. [C|*|C|*]
> 3. [C|N|N|V]
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - cover all map_block cases
> - give EFSCORRUPTED only when CHECK_FS is enabled for fiemap()
>  fs/f2fs/compress.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/data.c     |  9 ++++++++
>  fs/f2fs/f2fs.h     |  1 +
>  3 files changed, 63 insertions(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7dbfd6965b97..f25b32a6893a 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -898,6 +898,54 @@ static bool cluster_has_invalid_data(struct compress_ctx *cc)
>  	return false;
>  }
>  
> +bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> +	unsigned int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
> +	bool compressed = dn->data_blkaddr == COMPRESS_ADDR;
> +	int cluster_end = 0;
> +	int i;
> +	char *reason = "";
> +
> +	if (!compressed)
> +		return false;
> +
> +	/* [..., COMPR_ADDR, ...] */
> +	if (dn->ofs_in_node % cluster_size) {
> +		reason = "[*|C|*|*]";
> +		goto out;
> +	}
> +
> +	for (i = 1; i < cluster_size; i++) {
> +		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
> +							dn->ofs_in_node + i);
> +
> +		/* [COMPR_ADDR, ..., COMPR_ADDR] */
> +		if (blkaddr == COMPRESS_ADDR) {
> +			reason = "[C|*|C|*]";
> +			goto out;
> +		}
> +		if (compressed) {
> +			if (!__is_valid_data_blkaddr(blkaddr)) {
> +				if (!cluster_end)
> +					cluster_end = i;
> +				continue;
> +			}
> +			/* [COMPR_ADDR, NULL_ADDR or NEW_ADDR, valid_blkaddr] */
> +			if (cluster_end) {
> +				reason = "[C|N|N|V]";
> +				goto out;
> +			}
> +		}
> +	}
> +	return false;
> +out:
> +	f2fs_warn(sbi, "access invalid cluster, ino:%lu, nid:%u, ofs_in_node:%u, reason:%s",
> +			dn->inode->i_ino, dn->nid, dn->ofs_in_node, reason);
> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
> +	return true;
> +}
> +
>  static int __f2fs_cluster_blocks(struct inode *inode,
>  				unsigned int cluster_idx, bool compr)
>  {
> @@ -915,6 +963,11 @@ static int __f2fs_cluster_blocks(struct inode *inode,
>  		goto fail;
>  	}
>  
> +	if (f2fs_sanity_check_cluster(&dn)) {
> +		ret = -EFSCORRUPTED;
> +		goto fail;
> +	}
> +
>  	if (dn.data_blkaddr == COMPRESS_ADDR) {
>  		int i;
>  
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index df5e8d8c654e..d4c9aeba0842 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1552,6 +1552,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  			map->m_flags |= F2FS_MAP_NEW;
>  			blkaddr = dn.data_blkaddr;
>  		} else {
> +#ifdef CONFIG_F2FS_FS_COMPRESSION

I tried to remove ifdef. Please check f2fs/dev branch.

> +			if (f2fs_compressed_file(inode) &&
> +					f2fs_sanity_check_cluster(&dn) &&
> +					(flag != F2FS_GET_BLOCK_FIEMAP ||
> +					IS_ENABLED(CONFIG_F2FS_CHECK_FS))) {
> +				err = -EFSCORRUPTED;
> +				goto sync_out;
> +			}
> +#endif
>  			if (flag == F2FS_GET_BLOCK_BMAP) {
>  				map->m_pblk = 0;
>  				goto sync_out;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e97b4d8c5efc..3b368bcbc4d7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4074,6 +4074,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
>  							block_t blkaddr);
>  bool f2fs_cluster_is_empty(struct compress_ctx *cc);
>  bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
> +bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
>  void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
>  int f2fs_write_multi_pages(struct compress_ctx *cc,
>  						int *submitted,
> -- 
> 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
