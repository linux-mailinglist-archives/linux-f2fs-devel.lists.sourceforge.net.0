Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E651D6D68FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 18:36:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjjdj-00066d-NZ;
	Tue, 04 Apr 2023 16:36:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pjjdi-00066X-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 16:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2lFLBRct8NMXBe5NZ/2xWs6XVd4Kj62CAloWI3nXQ4w=; b=DlVJRUSU+HPgDoUz/jKL6DbMMd
 SHae64hVrC0NtotfaN4BcL7XHnxM9Xkaocrcd3iiiIQy1OLNYtfEG6yjMQD5DQ0RzVKGE8POOSEyh
 1uxF4myIlF3xIzHkE+iqOs0og5f/pqnfdi216VTtwX1UbdC1yQXS8xwNwdbKooULAyf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2lFLBRct8NMXBe5NZ/2xWs6XVd4Kj62CAloWI3nXQ4w=; b=kXCaixgY3NL97ZcbQzcRuNgA8c
 wau4OfY0dnp3hLgZDLtcIubDijRIF/Gh3aTzBWVMTepP/6qmOn3kqYnvfst5nX3a4bZgWTIriDHTk
 o3Ramf+m6XZFR3m8SbvtPk6j2RmkBpPrMRjH9jWhdcS8+g4u5exRtGmZOtTFfhQSoz4Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjjdh-00F5tV-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 16:36:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D7DC636E5;
 Tue,  4 Apr 2023 16:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8443DC4339B;
 Tue,  4 Apr 2023 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680626163;
 bh=N6TABPI2++ww4VWCJkhoOBlIJk/AjRql5ITP9NRMCk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rn3+0QPGAyfXLa6eEJXEt0v2Ek2mmD3Yz7lfP5MCte5hkoRcdeR8pIipn9kYY64t3
 yUNBvbCGIrG4p9utwYUkwt0RncGcqlGY3n+K1rI1qT+cFR/dABOSPNEMTksSjBn7Zl
 p8Z6nevVPJHRmj3Y01koH7512dM+ExUREQ/422OPHDtcwU/TbdrN/WieMuDqJG4QIU
 49W1rAZjWQSdu3kx5SF8toa6N9k1uqMRaflsn8wqaFMqs3wpp4M8VY6LQX+a2RUQSi
 1epMuPGptX8meVqodKw9d0rdcpYZ/niy9ZTg8HHq9QQN63TYEvzNI38QGqNs5AlSip
 IZg0XiXC4nYSg==
Date: Tue, 4 Apr 2023 09:36:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404163602.GC109974@frogsfrogsfrogs>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-22-aalbersh@redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn
 wrote: > In case of different Merkle tree block size fs-verity expects >
 ->read_merkle_tree_page() to return Merkle tree page filled with > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjjdh-00F5tV-Ln
Subject: Re: [f2fs-dev] [PATCH v2 21/23] xfs: handle merkle tree block size
 != fs blocksize != PAGE_SIZE
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, linux-ext4@vger.kernel.org,
 agruenba@redhat.com, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> In case of different Merkle tree block size fs-verity expects
> ->read_merkle_tree_page() to return Merkle tree page filled with
> Merkle tree blocks. The XFS stores each merkle tree block under
> extended attribute. Those attributes are addressed by block offset
> into Merkle tree.
> 
> This patch make ->read_merkle_tree_page() to fetch multiple merkle
> tree blocks based on size ratio. Also the reference to each xfs_buf
> is passed with page->private to ->drop_page().
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> ---
>  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
>  fs/xfs/xfs_verity.h |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> index a9874ff4efcd..ef0aff216f06 100644
> --- a/fs/xfs/xfs_verity.c
> +++ b/fs/xfs/xfs_verity.c
> @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
>  	struct page		*page = NULL;
>  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
>  	uint32_t		bs = 1 << log_blocksize;
> +	int			blocks_per_page =
> +		(1 << (PAGE_SHIFT - log_blocksize));
> +	int			n = 0;
> +	int			offset = 0;
>  	struct xfs_da_args	args = {
>  		.dp		= ip,
>  		.attr_filter	= XFS_ATTR_VERITY,
> @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
>  		.valuelen	= bs,
>  	};
>  	int			error = 0;
> +	bool			is_checked = true;
> +	struct xfs_verity_buf_list	*buf_list;
>  
>  	page = alloc_page(GFP_KERNEL);
>  	if (!page)
>  		return ERR_PTR(-ENOMEM);
>  
> -	error = xfs_attr_get(&args);
> -	if (error) {
> -		kmem_free(args.value);
> -		xfs_buf_rele(args.bp);
> +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> +	if (!buf_list) {
>  		put_page(page);
> -		return ERR_PTR(-EFAULT);
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
> -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> +	/*
> +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> +	 * PAGE SIZE
> +	 */
> +	for (n = 0; n < blocks_per_page; n++) {

Ahah, ok, that's why we can't pass the xfs_buf pages up to fsverity.

> +		offset = bs * n;
> +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));

Really this ought to be a typechecked helper...

struct xfs_fsverity_merkle_key {
	__be64	merkleoff;
};

static inline void
xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *k, loff_t pos)
{
	k->merkeloff = cpu_to_be64(pos);
}



> +		args.name = (const uint8_t *)&name;
> +
> +		error = xfs_attr_get(&args);
> +		if (error) {
> +			kmem_free(args.value);
> +			/*
> +			 * No more Merkle tree blocks (e.g. this was the last
> +			 * block of the tree)
> +			 */
> +			if (error == -ENOATTR)
> +				break;
> +			xfs_buf_rele(args.bp);
> +			put_page(page);
> +			kmem_free(buf_list);
> +			return ERR_PTR(-EFAULT);
> +		}
> +
> +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> +
> +		/* One of the buffers was dropped */
> +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> +			is_checked = false;

If there's enough memory pressure to cause the merkle tree pages to get
evicted, what are the chances that the xfs_bufs survive the eviction?

> +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> +		kmem_free(args.value);
> +		args.value = NULL;
> +	}
> +
> +	if (is_checked)
>  		SetPageChecked(page);
> +	page->private = (unsigned long)buf_list;
>  
> -	page->private = (unsigned long)args.bp;
> -	memcpy(page_address(page), args.value, args.valuelen);
> -
> -	kmem_free(args.value);
>  	return page;
>  }
>  
> @@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
>  
>  static void
>  xfs_drop_page(
> -	struct page	*page)
> +	struct page			*page)
>  {
> -	struct xfs_buf *buf = (struct xfs_buf *)page->private;
> +	int				i = 0;
> +	struct xfs_verity_buf_list	*buf_list =
> +		(struct xfs_verity_buf_list *)page->private;
>  
> -	ASSERT(buf != NULL);
> +	ASSERT(buf_list != NULL);
>  
> -	if (PageChecked(page))
> -		buf->b_flags |= XBF_VERITY_CHECKED;
> +	for (i = 0; i < buf_list->buf_count; i++) {
> +		if (PageChecked(page))
> +			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
> +		xfs_buf_rele(buf_list->bufs[i]);
> +	}
>  
> -	xfs_buf_rele(buf);
> +	kmem_free(buf_list);
>  	put_page(page);
>  }
>  
> diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
> index ae5d87ca32a8..433b2f4ae3bc 100644
> --- a/fs/xfs/xfs_verity.h
> +++ b/fs/xfs/xfs_verity.h
> @@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
>  #define xfs_verity_ops NULL
>  #endif	/* CONFIG_FS_VERITY */
>  
> +/* Minimal Merkle tree block size is 1024 */
> +#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
> +
> +struct xfs_verity_buf_list {
> +	unsigned int	buf_count;
> +	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];

So... this is going to be a 520-byte allocation on arm64 with 64k pages?
Even if the merkle tree block size is the same as the page size?  Ouch.

--D

> +};
> +
>  #endif	/* __XFS_VERITY_H__ */
> -- 
> 2.38.4
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
