Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 728266D8AC7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 00:51:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkByZ-00058A-TO;
	Wed, 05 Apr 2023 22:51:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pkByY-000584-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dLSxfaMFCVS8468KN/z0VwXJmbpcmKd5R8VPq1b2igA=; b=eCQf+iLtD3MS6jw0RfLVI3rF7L
 IwFsubH6zvetwOQdiGYRk7sHsSYabQlnULyKdnUgHyjgpWsgA8PY1k93iBPBKlwR016NpNQS3dcHb
 T3gNoOh8GBblSppbuvKwdmilZi+jCbhZffb0J8NY8Sd6UgvcE8gysLZ/zaND8t8BPhDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dLSxfaMFCVS8468KN/z0VwXJmbpcmKd5R8VPq1b2igA=; b=XIrdPKZqQS39huzJr2GIseGvi2
 i/s32pUjjeorxtGlzoUTmq+YGSMuFMDRm/t7PgGZneTrwGsrUIXYVWWWqLNvPyd7h8WA31lnDFmdp
 A/0fy0Z/2ouhPwEpVFgsmmgNJ23fxkd1yI4OrpuzA+Tr27VqWX/nuLoWGKZZXG29ECak=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pkByY-00GLuv-F9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:51:35 +0000
Received: by mail-pg1-f181.google.com with SMTP id d8so22718067pgm.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Apr 2023 15:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680735089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dLSxfaMFCVS8468KN/z0VwXJmbpcmKd5R8VPq1b2igA=;
 b=DKNaEMAvLoxgxcW7C/DG2hGwlybNwuFNi7Q8qY482/jzM9d4xL2UjV2S9BGfeJcIDr
 MA5ql8Ba3dLnaVVaPhzE2O1VDUcT7iJ/QxiGopWq24vyCi9gjKBCmMqTVc80ZzvfS+zT
 y1i56dDgdCCa+DALwBNBfN3/jA9Mdt2k/DUFQJQwT8rTqbxQlLXKbG94azFShwTCHrRC
 j2vDIirPUgjQi/BpGinlJPvMNSyzo5n0IBLLvknGncJH3Tm1MZO+xIiGDixxqlk3i4Bo
 R1xKFWnLl5NxzMVulcM3Ebj7nNcXnWCd0yodUgm1mhmBHJF1ocZct58oemW+AHAqXqk9
 /VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680735089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLSxfaMFCVS8468KN/z0VwXJmbpcmKd5R8VPq1b2igA=;
 b=NQuA5umlbLAWq/ZJXcW+FRiYBvF1PoDZEO6Tl2qmnISBOTO0EiW8hMYevDGu5V+YEn
 Uh7IHjYO0DTGj2A2O4mGXUrMguDWgYG4MGK/O4D2SZxjrF6/g/s9noMuVjawSXyDmSgH
 wQVmYnbT2KrtyewinJY+L0FmPTIdaXGB4YoDEfhPOQjd3oJX/yOdmBOLafi5ltgi6WHq
 Yeq0/ZLqGiedRGg1O8QAZuouN6wKdIY8eqze0WoTrr4u1yJhWVSMy2U4NG7iwfrXXGI3
 KXmsv/8Y8RDqU38526bsGG2wtM16vv0oi9Msx1OLhdPUiAEOdUYS/XUEJvBeH79vk9HI
 t+fw==
X-Gm-Message-State: AAQBX9fciCoGPZyt5WY5W9bLeTaE3L1rfJH8VIc1gnjQrNeuWN9y1iPX
 DwHmJ3i8q2TTgk5khQx0XwzXAQ==
X-Google-Smtp-Source: AKy350byI2dOXAx2UUhieoBDXlt6kMcfX++CjjnLqbSOozpqmQEUOmvJ7mOnsddzMAKRV6q6VXMDHg==
X-Received: by 2002:a62:7b8b:0:b0:625:cc03:df33 with SMTP id
 w133-20020a627b8b000000b00625cc03df33mr7050385pfc.31.1680735088792; 
 Wed, 05 Apr 2023 15:51:28 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 m3-20020aa79003000000b006260645f2a7sm11619498pfo.17.2023.04.05.15.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:51:28 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkByP-00HV2h-IA; Thu, 06 Apr 2023 08:51:25 +1000
Date: Thu, 6 Apr 2023 08:51:25 +1000
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230405225125.GS3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404233224.GE1893@sol.localdomain>
 <20230405151234.sgkuasb7lwmgetzz@aalbersh.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405151234.sgkuasb7lwmgetzz@aalbersh.remote.csb>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 05:12:34PM +0200, Andrey Albershteyn
 wrote: > Hi Eric, > > On Tue, Apr 04, 2023 at 04:32:24PM -0700, Eric Biggers
 wrote: > > Hi Andrey, > > > > On Tue, Apr 04, 2023 at 04:53:17 [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.181 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pkByY-00GLuv-F9
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, hch@infradead.org,
 djwong@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 05:12:34PM +0200, Andrey Albershteyn wrote:
> Hi Eric,
> 
> On Tue, Apr 04, 2023 at 04:32:24PM -0700, Eric Biggers wrote:
> > Hi Andrey,
> > 
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
> > > +		offset = bs * n;
> > > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
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
> > > +
> > > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > > +		kmem_free(args.value);
> > > +		args.value = NULL;
> > > +	}
> > 
> > I was really hoping for a solution where the cached data can be used directly,
> > instead allocating a temporary page and copying the cached data into it every
> > time the cache is accessed.  The problem with what you have now is that every
> > time a single 32-byte hash is accessed, a full page (potentially 64KB!) will be
> > allocated and filled.  That's not very efficient.  The need to allocate the
> > temporary page can also cause ENOMEM (which will get reported as EIO).
> > 
> > Did you consider alternatives that would work more efficiently?  I think it
> > would be worth designing something that works properly with how XFS is planned
> > to cache the Merkle tree, instead of designing a workaround.
> > ->read_merkle_tree_page was not really designed for what you are doing here.
> > 
> > How about replacing ->read_merkle_tree_page with a function that takes in a
> > Merkle tree block index (not a page index!) and hands back a (page, offset) pair
> > that identifies where the Merkle tree block's data is located?  Or (folio,
> > offset), I suppose.

{kaddr, len}, please.

> > 
> > With that, would it be possible to directly return the XFS cache?
> > 
> > - Eric
> > 
> 
> Yeah, I also don't like it, I didn't want to change fs-verity much
> so went with this workaround. But as it's ok, I will look into trying
> to pass xfs buffers to fs-verity without direct use of
> ->read_merkle_tree_page(). I think it's possible with (folio,
> offset), the xfs buffers aren't xattr value align so the 4k merkle
> tree block is stored in two pages.

I don't think this is necessary to actually merge the code. We want
it to work correctly as the primary concern, performance is a
secondary concern.

Regardless, as you mention, the xfs_buf is not made up of contiguous
pages so the merkle tree block data will be split across two
(or more) pages.  AFAICT, the fsverity code doesn't work with data
structures that span multiple disjoint pages...

Another problem is that the xfs-buf might be backed by heap memory
(e.g. 4kB fs block size on 64kB PAGE_SIZE) and so it cannot be
treated like a page cache page by the fsverity merkle tree code. We
most definitely do not want to be passing pages containing heap
memory to functions expecting to be passed lru-resident page cache
pages....

That said, xfs-bufs do have a stable method of addressing the data
in the buffers, and all the XFS code uses this to access and
manipulate data directly in the buffers.

That is, xfs_buf_offset() returns a mapped kaddr that points to the
contiguous memory region containing the metadata in the buffer.  If
the xfs_buf spans multiple pages, it will return a kaddr pointing
into the contiguous vmapped memory address that maps the entire
buffer data range. If it is heap memory, it simply returns a pointer
into that heap memory. If it's a single page, then it returns the
kaddr for the data within the page.

If you move all the assumptions about how the merkle tree data is
managed out of fsverity and require the fielsystems to do the
mapping to kaddrs and reference counting to guarantee life times,
then the need for multiple different methods for reading merkle tree
data go away...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
