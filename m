Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C716D83DE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:39:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk6A4-0000SY-Em;
	Wed, 05 Apr 2023 16:39:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pk69u-0000Rx-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iNtWsrioIK01owafWisSqWK0+UwGdi+eFIXqQBURn+U=; b=Lx1v5gV1U7dVCm2475+ZR0cR6D
 fD2m/ilJZUfOrLX7Axl4EupPMHKNnUS+61mYMamJM5toWzuYiiPKTJMFh7G6XatyS7Prxi5qUnwLh
 nJ1EITofqzbjheWxfvRqxH/J8C9XxU1JT7IRtIHRTK8ef1sMB+w1wpKgPjykkwPqXLJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iNtWsrioIK01owafWisSqWK0+UwGdi+eFIXqQBURn+U=; b=Ka44ctOhBGwOQtp3khPET2xMJh
 iPKHO3LsHDYpIbEos+AzI+Zf8BNgzybU8YwJ7QXggc6CDDpTF5/RZgPVwELudRzWusxwiWg6GWOIi
 G3OZA5r9yUraf+MqTLHrHs8nOuTD08x/S+iaGVqAXydq9OUxRsMQH84eM5CtnNdSG0bk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk69u-00G93y-8c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:38:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D87EB62489;
 Wed,  5 Apr 2023 16:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D10AC433EF;
 Wed,  5 Apr 2023 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680712728;
 bh=bdwer0ckOV0VvNBNptviSJ4Aij6q7ab6EoIjpJEkU8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ojRVBOKtUGuMf5Xx6+fu11Y4x9zA1hxfzop7c1U7aQXy0Zo/c7ihZSEwjGJrezKH9
 uPuuNm/oCDFW1l1HxFMLa6NsMeKCz5ImRAB+OugNcQlSFXRpYFnHhkKeme8Kc9ksMl
 XqjYva7bS2OfsOhjs7ZzYd2RLH7ggh1p6f1nr6I2q70PUA4T7qDKH3K7omJkrvAYhB
 W3kJlacbJJT6+DQNLLyAwg+QRqgf9019Zu1QLYweBb92QVlx4KBK+Rtn5+kz9IyfvL
 wXSyP+UyTRwzO2d3TPwe/4gAvjJbgg1h+4ZxhdY9cQjprbHz/JhNd7HNx7fuAS5+fr
 LcANAR4F5mkxg==
Date: Wed, 5 Apr 2023 09:38:47 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230405163847.GG303486@frogsfrogsfrogs>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 06:02:21PM +0200, Andrey Albershteyn
 wrote: > Hi Darrick, > > On Tue, Apr 04, 2023 at 09:36:02AM -0700, Darrick
 J. Wong wrote: > > On Tue, Apr 04, 2023 at 04:53:17PM +0200, And [...] 
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
X-Headers-End: 1pk69u-00G93y-8c
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

On Wed, Apr 05, 2023 at 06:02:21PM +0200, Andrey Albershteyn wrote:
> Hi Darrick,
> 
> On Tue, Apr 04, 2023 at 09:36:02AM -0700, Darrick J. Wong wrote:
> > On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> > > In case of different Merkle tree block size fs-verity expects
> > > ->read_merkle_tree_page() to return Merkle tree page filled with
> > > Merkle tree blocks. The XFS stores each merkle tree block under
> > > extended attribute. Those attributes are addressed by block offset
> > > into Merkle tree.
> > > 
> > > This patch make ->read_merkle_tree_page() to fetch multiple merkle
> > > tree blocks based on size ratio. Also the reference to each xfs_buf
> > > is passed with page->private to ->drop_page().
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > ---
> > >  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
> > >  fs/xfs/xfs_verity.h |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> > > index a9874ff4efcd..ef0aff216f06 100644
> > > --- a/fs/xfs/xfs_verity.c
> > > +++ b/fs/xfs/xfs_verity.c
> > > @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
> > >  	struct page		*page = NULL;
> > >  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
> > >  	uint32_t		bs = 1 << log_blocksize;
> > > +	int			blocks_per_page =
> > > +		(1 << (PAGE_SHIFT - log_blocksize));
> > > +	int			n = 0;
> > > +	int			offset = 0;
> > >  	struct xfs_da_args	args = {
> > >  		.dp		= ip,
> > >  		.attr_filter	= XFS_ATTR_VERITY,
> > > @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
> > >  		.valuelen	= bs,
> > >  	};
> > >  	int			error = 0;
> > > +	bool			is_checked = true;
> > > +	struct xfs_verity_buf_list	*buf_list;
> > >  
> > >  	page = alloc_page(GFP_KERNEL);
> > >  	if (!page)
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > > -	error = xfs_attr_get(&args);
> > > -	if (error) {
> > > -		kmem_free(args.value);
> > > -		xfs_buf_rele(args.bp);
> > > +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> > > +	if (!buf_list) {
> > >  		put_page(page);
> > > -		return ERR_PTR(-EFAULT);
> > > +		return ERR_PTR(-ENOMEM);
> > >  	}
> > >  
> > > -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> > > +	/*
> > > +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> > > +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> > > +	 * PAGE SIZE
> > > +	 */
> > > +	for (n = 0; n < blocks_per_page; n++) {
> > 
> > Ahah, ok, that's why we can't pass the xfs_buf pages up to fsverity.
> > 
> > > +		offset = bs * n;
> > > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
> > 
> > Really this ought to be a typechecked helper...
> > 
> > struct xfs_fsverity_merkle_key {
> > 	__be64	merkleoff;
> 
> Sure, thanks, will change this
> 
> > };
> > 
> > static inline void
> > xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *k, loff_t pos)
> > {
> > 	k->merkeloff = cpu_to_be64(pos);
> > }
> > 
> > 
> > 
> > > +		args.name = (const uint8_t *)&name;
> > > +
> > > +		error = xfs_attr_get(&args);
> > > +		if (error) {
> > > +			kmem_free(args.value);
> > > +			/*
> > > +			 * No more Merkle tree blocks (e.g. this was the last
> > > +			 * block of the tree)
> > > +			 */
> > > +			if (error == -ENOATTR)
> > > +				break;
> > > +			xfs_buf_rele(args.bp);
> > > +			put_page(page);
> > > +			kmem_free(buf_list);
> > > +			return ERR_PTR(-EFAULT);
> > > +		}
> > > +
> > > +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> > > +
> > > +		/* One of the buffers was dropped */
> > > +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> > > +			is_checked = false;
> > 
> > If there's enough memory pressure to cause the merkle tree pages to get
> > evicted, what are the chances that the xfs_bufs survive the eviction?
> 
> The merkle tree pages are dropped after verification. When page is
> dropped xfs_buf is marked as verified. If fs-verity wants to
> verify again it will get the same verified buffer. If buffer is
> evicted it won't have verified state.
> 
> So, with enough memory pressure buffers will be dropped and need to
> be reverified.

Please excuse me if this was discussed and rejected long ago, but
perhaps fsverity should try to hang on to the merkle tree pages that
this function returns for as long as possible until reclaim comes for
them?

With the merkle tree page lifetimes extended, you then don't need to
attach the xfs_buf to page->private, nor does xfs have to extend the
buffer cache to stash XBF_VERITY_CHECKED.

Also kinda wondering why you don't allocate the page, kmap it, and then
pass that address into args->value to avoid the third memory allocation
that gets done inside xfs_attr_get?

--D

> > 
> > > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > > +		kmem_free(args.value);
> > > +		args.value = NULL;
> > > +	}
> > > +
> > > +	if (is_checked)
> > >  		SetPageChecked(page);
> > > +	page->private = (unsigned long)buf_list;
> > >  
> > > -	page->private = (unsigned long)args.bp;
> > > -	memcpy(page_address(page), args.value, args.valuelen);
> > > -
> > > -	kmem_free(args.value);
> > >  	return page;
> > >  }
> > >  
> > > @@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
> > >  
> > >  static void
> > >  xfs_drop_page(
> > > -	struct page	*page)
> > > +	struct page			*page)
> > >  {
> > > -	struct xfs_buf *buf = (struct xfs_buf *)page->private;
> > > +	int				i = 0;
> > > +	struct xfs_verity_buf_list	*buf_list =
> > > +		(struct xfs_verity_buf_list *)page->private;
> > >  
> > > -	ASSERT(buf != NULL);
> > > +	ASSERT(buf_list != NULL);
> > >  
> > > -	if (PageChecked(page))
> > > -		buf->b_flags |= XBF_VERITY_CHECKED;
> > > +	for (i = 0; i < buf_list->buf_count; i++) {
> > > +		if (PageChecked(page))
> > > +			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
> > > +		xfs_buf_rele(buf_list->bufs[i]);
> > > +	}
> > >  
> > > -	xfs_buf_rele(buf);
> > > +	kmem_free(buf_list);
> > >  	put_page(page);
> > >  }
> > >  
> > > diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
> > > index ae5d87ca32a8..433b2f4ae3bc 100644
> > > --- a/fs/xfs/xfs_verity.h
> > > +++ b/fs/xfs/xfs_verity.h
> > > @@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
> > >  #define xfs_verity_ops NULL
> > >  #endif	/* CONFIG_FS_VERITY */
> > >  
> > > +/* Minimal Merkle tree block size is 1024 */
> > > +#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
> > > +
> > > +struct xfs_verity_buf_list {
> > > +	unsigned int	buf_count;
> > > +	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];
> > 
> > So... this is going to be a 520-byte allocation on arm64 with 64k pages?
> > Even if the merkle tree block size is the same as the page size?  Ouch.
> 
> yeah, it also allocates a page and is dropped with the page, so,
> I took it as an addition to already big chunk of memory. But I
> probably will change it, viz. comment from Eric on this patch.
> 
> -- 
> - Andrey
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
