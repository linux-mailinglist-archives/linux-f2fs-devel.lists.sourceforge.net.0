Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8046D82CD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:02:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5b1-0006aj-N5;
	Wed, 05 Apr 2023 16:02:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk5ay-0006ac-93
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=; b=S3fnRc08Qg8njbrHSH+X/Y8chC
 6ErbSVZcw4EM545RsEc1WrHEbwaSXPTD2BtKD6C8Ro9mAMaYMA+R0tzux78mgkegIRQhYSdKpAJtv
 dh0uf4xE9zlbiT86Obe1aVrNESbniqU6pOSO+lDfiGD8ZvnILLOgm3d/ohKz6STUYfVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=; b=ckG4kF7iLAFbrsY1DTUZtC3tDd
 sbqsxMDk723HgT3KpA56aax9qx2Qt2x4cEfiz8xzKSoQMSoMZF28xgcnEgnaxgrncLx53G0WppXjm
 rImIMEyDXDBSPoh7fNMM3O7CZuLxEkdlqm2HZFQMmI2fCEVDmA4E7CJDRwcbytLK0eWg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5am-00028c-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680710550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=;
 b=cGM/yVshAUMr9/igXZVs2TQJwuHhJ+JzQSaajsHhsxK2+Mp5piRqdtwFBivCJ2DFDDM1ZL
 Vuw4B98E/WnwcdTdyACtOlK1xX+Y5HREAFDUzAcMTEKfsRblGWy2ey6IJJ+oXUn17mq+2x
 hL1yzmLKqk0Qw1YjRRYGzXtZV/3+sUE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-jKfB-fGWPPCvBllmbmOVFA-1; Wed, 05 Apr 2023 12:02:29 -0400
X-MC-Unique: jKfB-fGWPPCvBllmbmOVFA-1
Received: by mail-qt1-f200.google.com with SMTP id
 n10-20020a05622a11ca00b003e4e30c6c98so21894502qtk.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 09:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=;
 b=EmLoUlqWPJMvx2z/JY3anNgIjODJIjGjhEoVwPqYM613C7wbqzxubN15plVFe1ZfmU
 bS2XFNvLiEbJsp0ehDJyeb+Ystj7DdD6V7p3vCX79XdjcxWBRA4c4YG7b6X5+5Q/Wf2N
 nkgTsL95aUghgbBijpo7U2ZNflMNbfA4xo260Yl9L1UlV3OihM32sx0JgGUyAdYdRcPg
 hZ8kllOGrjcyKpJdkHJkW5ZFJBCxVgeKLMn9IVPxEDAjNrOL8aGWgVLce3n7EgtBmLC4
 M1m4g0+jp/MDxnsK++uwZE7x3EiujZI88xsT/tX13yYCdLBoHuNLwO/hcDPnZj0h5Hhe
 Kfkw==
X-Gm-Message-State: AAQBX9cXwyUVLWu0tgqo5XU9G6rvMWaYWPf5yLL678qQCj6CXYgG9YrI
 CFC03QBwXdgnjaWXlDhRBRCXIM4VpYd/SyznrENqUVBL7Kq9fm9V3GKfQvTK0Tl422Jh1pniDsb
 ijUFvq59b7mcBzc1Y1mTEToS8nlKN/5VeLqU1
X-Received: by 2002:ac8:5fce:0:b0:3b9:b6e3:c78e with SMTP id
 k14-20020ac85fce000000b003b9b6e3c78emr5645473qta.8.1680710548134; 
 Wed, 05 Apr 2023 09:02:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9fBwBu823yNMJRRNCF/kPjd5TTa8a0sHl1G7/F6LAQ61bqbdFkGDEgXPZez2BOg5cs9V+tg==
X-Received: by 2002:ac8:5fce:0:b0:3b9:b6e3:c78e with SMTP id
 k14-20020ac85fce000000b003b9b6e3c78emr5645405qta.8.1680710547586; 
 Wed, 05 Apr 2023 09:02:27 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 m12-20020ac8688c000000b003df7d7bbc8csm4060750qtq.75.2023.04.05.09.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:02:26 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:02:21 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230404163602.GC109974@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Darrick, On Tue, Apr 04, 2023 at 09:36:02AM -0700, Darrick
 J. Wong wrote: > On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn
 wrote: > > In case of different Merkle tree block size fs-verity expects
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk5am-00028c-Ec
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

Hi Darrick,

On Tue, Apr 04, 2023 at 09:36:02AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> > In case of different Merkle tree block size fs-verity expects
> > ->read_merkle_tree_page() to return Merkle tree page filled with
> > Merkle tree blocks. The XFS stores each merkle tree block under
> > extended attribute. Those attributes are addressed by block offset
> > into Merkle tree.
> > 
> > This patch make ->read_merkle_tree_page() to fetch multiple merkle
> > tree blocks based on size ratio. Also the reference to each xfs_buf
> > is passed with page->private to ->drop_page().
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
> >  fs/xfs/xfs_verity.h |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> > index a9874ff4efcd..ef0aff216f06 100644
> > --- a/fs/xfs/xfs_verity.c
> > +++ b/fs/xfs/xfs_verity.c
> > @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
> >  	struct page		*page = NULL;
> >  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
> >  	uint32_t		bs = 1 << log_blocksize;
> > +	int			blocks_per_page =
> > +		(1 << (PAGE_SHIFT - log_blocksize));
> > +	int			n = 0;
> > +	int			offset = 0;
> >  	struct xfs_da_args	args = {
> >  		.dp		= ip,
> >  		.attr_filter	= XFS_ATTR_VERITY,
> > @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
> >  		.valuelen	= bs,
> >  	};
> >  	int			error = 0;
> > +	bool			is_checked = true;
> > +	struct xfs_verity_buf_list	*buf_list;
> >  
> >  	page = alloc_page(GFP_KERNEL);
> >  	if (!page)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	error = xfs_attr_get(&args);
> > -	if (error) {
> > -		kmem_free(args.value);
> > -		xfs_buf_rele(args.bp);
> > +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> > +	if (!buf_list) {
> >  		put_page(page);
> > -		return ERR_PTR(-EFAULT);
> > +		return ERR_PTR(-ENOMEM);
> >  	}
> >  
> > -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> > +	/*
> > +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> > +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> > +	 * PAGE SIZE
> > +	 */
> > +	for (n = 0; n < blocks_per_page; n++) {
> 
> Ahah, ok, that's why we can't pass the xfs_buf pages up to fsverity.
> 
> > +		offset = bs * n;
> > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
> 
> Really this ought to be a typechecked helper...
> 
> struct xfs_fsverity_merkle_key {
> 	__be64	merkleoff;

Sure, thanks, will change this

> };
> 
> static inline void
> xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *k, loff_t pos)
> {
> 	k->merkeloff = cpu_to_be64(pos);
> }
> 
> 
> 
> > +		args.name = (const uint8_t *)&name;
> > +
> > +		error = xfs_attr_get(&args);
> > +		if (error) {
> > +			kmem_free(args.value);
> > +			/*
> > +			 * No more Merkle tree blocks (e.g. this was the last
> > +			 * block of the tree)
> > +			 */
> > +			if (error == -ENOATTR)
> > +				break;
> > +			xfs_buf_rele(args.bp);
> > +			put_page(page);
> > +			kmem_free(buf_list);
> > +			return ERR_PTR(-EFAULT);
> > +		}
> > +
> > +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> > +
> > +		/* One of the buffers was dropped */
> > +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> > +			is_checked = false;
> 
> If there's enough memory pressure to cause the merkle tree pages to get
> evicted, what are the chances that the xfs_bufs survive the eviction?

The merkle tree pages are dropped after verification. When page is
dropped xfs_buf is marked as verified. If fs-verity wants to
verify again it will get the same verified buffer. If buffer is
evicted it won't have verified state.

So, with enough memory pressure buffers will be dropped and need to
be reverified.

> 
> > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > +		kmem_free(args.value);
> > +		args.value = NULL;
> > +	}
> > +
> > +	if (is_checked)
> >  		SetPageChecked(page);
> > +	page->private = (unsigned long)buf_list;
> >  
> > -	page->private = (unsigned long)args.bp;
> > -	memcpy(page_address(page), args.value, args.valuelen);
> > -
> > -	kmem_free(args.value);
> >  	return page;
> >  }
> >  
> > @@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
> >  
> >  static void
> >  xfs_drop_page(
> > -	struct page	*page)
> > +	struct page			*page)
> >  {
> > -	struct xfs_buf *buf = (struct xfs_buf *)page->private;
> > +	int				i = 0;
> > +	struct xfs_verity_buf_list	*buf_list =
> > +		(struct xfs_verity_buf_list *)page->private;
> >  
> > -	ASSERT(buf != NULL);
> > +	ASSERT(buf_list != NULL);
> >  
> > -	if (PageChecked(page))
> > -		buf->b_flags |= XBF_VERITY_CHECKED;
> > +	for (i = 0; i < buf_list->buf_count; i++) {
> > +		if (PageChecked(page))
> > +			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
> > +		xfs_buf_rele(buf_list->bufs[i]);
> > +	}
> >  
> > -	xfs_buf_rele(buf);
> > +	kmem_free(buf_list);
> >  	put_page(page);
> >  }
> >  
> > diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
> > index ae5d87ca32a8..433b2f4ae3bc 100644
> > --- a/fs/xfs/xfs_verity.h
> > +++ b/fs/xfs/xfs_verity.h
> > @@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
> >  #define xfs_verity_ops NULL
> >  #endif	/* CONFIG_FS_VERITY */
> >  
> > +/* Minimal Merkle tree block size is 1024 */
> > +#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
> > +
> > +struct xfs_verity_buf_list {
> > +	unsigned int	buf_count;
> > +	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];
> 
> So... this is going to be a 520-byte allocation on arm64 with 64k pages?
> Even if the merkle tree block size is the same as the page size?  Ouch.

yeah, it also allocates a page and is dropped with the page, so,
I took it as an addition to already big chunk of memory. But I
probably will change it, viz. comment from Eric on this patch.

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
