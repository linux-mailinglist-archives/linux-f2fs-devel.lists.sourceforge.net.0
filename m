Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F456D8136
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 17:13:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk4ok-0007si-0O;
	Wed, 05 Apr 2023 15:12:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pk4oe-0007sX-7e
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SqJwMhzGjMA4RLeL2DTJK7ERbSrDJ+6vKzhw2fl99yc=; b=F4YHR7uk7iigVilgdIOVMpYFhz
 pkC5RcQhf+OBw/Q2Xi37g0YsEJvAsDqzDgKOFTzNnVJqBJPubrKvttBLhhJSWLfQxwoUbIqm3lr6W
 xpjp+sRD+s0dEfKvWrsEjubMONh33Hxju3UN4Ksxrtz/VgR2o5KdXWfBZNbpHT+Yevtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SqJwMhzGjMA4RLeL2DTJK7ERbSrDJ+6vKzhw2fl99yc=; b=drsu2dpI2MSI3W5e87UPS/eBuk
 o9DBxeZbDyCLeHc4ff2r7PB42Rs9xiCST03UAd4UhixWhVEFThAuGsX9Jlf9b9BPLxuliZw3+pfbX
 sFh/Ma3Tg9Ne95VCa6Io9I4L6C16i0qywuMBMNCD3XJdrcSKbUB2Gl+auewIAA0qDscE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk4oZ-00G5pk-IP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680707561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SqJwMhzGjMA4RLeL2DTJK7ERbSrDJ+6vKzhw2fl99yc=;
 b=PuDCgkRDjj7ceaDzYJz0/LmRKsfO5Dlw9YIFmG5uT3TScEB0ZOqycR3c6VEdb08gx+7olh
 isCUOAJsDrojxYEIrjPE2IH75+NyyYSbkasWJ7JLHyYygPORoqkTx+K96Hdsv7H7+haQBW
 hiJSuhJ9douR0r390WHr/LTEvBX8MA4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-jhz6BbPJORS9uXSbwgUG5A-1; Wed, 05 Apr 2023 11:12:40 -0400
X-MC-Unique: jhz6BbPJORS9uXSbwgUG5A-1
Received: by mail-qv1-f72.google.com with SMTP id
 dg8-20020a056214084800b005acc280bf19so16367666qvb.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 08:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqJwMhzGjMA4RLeL2DTJK7ERbSrDJ+6vKzhw2fl99yc=;
 b=pQL3roe1De2mQMBOwfQFRuppGzYyX00/htEmQkxsZ0sKOlDyCsHpiSdZzgRtaZXp1l
 j1bHDqdr/Lg06bxNL5vCsHdYzwofBmuIBBM1FNbaFBAXY/0IawEXHSMNske0IaWBEjpz
 Marsboog5/Vdi4iSrPf+clRqTEziXxkFSUlpYg5KAKHQYzg7sCtXgHXg7B103etAHCKX
 7dB7kD+4JNJS/dwGtuJYxDpOiRg72VgWSKu45OKegCg3EoZCls8I644AygjrQVDffkjM
 wYUXkIEYuNIZRdTh+ULlcoMEnASmC46SjjOn8ExnAVvr7JwaW7CmyzUlS2ztv/E5MVPd
 PA+A==
X-Gm-Message-State: AAQBX9ecbiMnhi2LCg7kR4QE/qzrlWeWaCo8mr3dO7SbswzxrOWWUmaG
 JpIF1ti5EPKGE6taFCBClmLjmO/v2JuudphXuOYDjb5KwAcJGSVUdhPfZOvCN9sHr9EB8WdzI3I
 dnSxOv7+mqVhxFwQ8m4VJ8vNSinOpdWBSu65u
X-Received: by 2002:ad4:5cc6:0:b0:5b8:d384:1b1b with SMTP id
 iu6-20020ad45cc6000000b005b8d3841b1bmr9629010qvb.28.1680707559343; 
 Wed, 05 Apr 2023 08:12:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTLeyVegiyAT0lX0KuZbEyJnR2oIc+0ekYOMME6yW+MNP2PzqzXS2RPNGFIg86YMrIm+IHVg==
X-Received: by 2002:ad4:5cc6:0:b0:5b8:d384:1b1b with SMTP id
 iu6-20020ad45cc6000000b005b8d3841b1bmr9628970qvb.28.1680707558963; 
 Wed, 05 Apr 2023 08:12:38 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a0cc681000000b005dd8b934579sm4274922qvj.17.2023.04.05.08.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:12:38 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:12:34 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405151234.sgkuasb7lwmgetzz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404233224.GE1893@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230404233224.GE1893@sol.localdomain>
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
 Content preview:  Hi Eric, On Tue, Apr 04, 2023 at 04:32:24PM -0700,
 Eric Biggers
 wrote: > Hi Andrey, > > On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey
 Albershteyn wrote: > > In case of different Merkle tree block size fs-ve [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
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
X-Headers-End: 1pk4oZ-00G5pk-IP
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, cluster-devel@redhat.com, dchinner@redhat.com,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On Tue, Apr 04, 2023 at 04:32:24PM -0700, Eric Biggers wrote:
> Hi Andrey,
> 
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
> > +		offset = bs * n;
> > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
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
> > +
> > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > +		kmem_free(args.value);
> > +		args.value = NULL;
> > +	}
> 
> I was really hoping for a solution where the cached data can be used directly,
> instead allocating a temporary page and copying the cached data into it every
> time the cache is accessed.  The problem with what you have now is that every
> time a single 32-byte hash is accessed, a full page (potentially 64KB!) will be
> allocated and filled.  That's not very efficient.  The need to allocate the
> temporary page can also cause ENOMEM (which will get reported as EIO).
> 
> Did you consider alternatives that would work more efficiently?  I think it
> would be worth designing something that works properly with how XFS is planned
> to cache the Merkle tree, instead of designing a workaround.
> ->read_merkle_tree_page was not really designed for what you are doing here.
> 
> How about replacing ->read_merkle_tree_page with a function that takes in a
> Merkle tree block index (not a page index!) and hands back a (page, offset) pair
> that identifies where the Merkle tree block's data is located?  Or (folio,
> offset), I suppose.
> 
> With that, would it be possible to directly return the XFS cache?
> 
> - Eric
> 

Yeah, I also don't like it, I didn't want to change fs-verity much
so went with this workaround. But as it's ok, I will look into trying
to pass xfs buffers to fs-verity without direct use of
->read_merkle_tree_page(). I think it's possible with (folio,
offset), the xfs buffers aren't xattr value align so the 4k merkle
tree block is stored in two pages.

Thanks for suggestion!

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
