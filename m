Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 275746CA904
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 17:30:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgoo4-0005Gx-Sr;
	Mon, 27 Mar 2023 15:30:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pgoo3-0005Gr-Bu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 15:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FESZZlliwTJUCT6TyKRM5bh8hruE2lL5Mh5pMDya9eo=; b=BpwwuJE/LwGxdir6fZv0Z9LVcF
 i/Z4/skTQmrv3Aa2aVt+bTN1eSOjkylCTctQsDyorE8v45A/2tf08G1t5PNuULMQgaYwPgzu1q6En
 VQFK47JK32PgEJSjpNybwr04CvdCLSqxrcpsySYDtxLmXK5iMmvc+7/kZ0q2yP5RuOkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FESZZlliwTJUCT6TyKRM5bh8hruE2lL5Mh5pMDya9eo=; b=FaXDPhsVXf762bRKS4v2m6K7Q8
 PqDRnkD4YcVPQyjcLqWwdNu0BgYox5B5CU8GeJ3rQXJfPNiZHk/kzv+aKo1p3ZyRcs73X9sXBBPGv
 aKGqS9UNoGhAZeJ8gheY/74RU6Y6ecSB7NeUhV882+vUbsQI3WjrBFq8Te+tQ84qDTNE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgonz-0001cP-On for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 15:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B14B96130D;
 Mon, 27 Mar 2023 15:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6F5C433D2;
 Mon, 27 Mar 2023 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679931035;
 bh=JHargJmoV2rpLqiVYrLlfoessqmQMDUkG266orZF8xo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3j9dFtzDxvAAtciOQtbBmZjKSjWKnOTy+3e4aHO6Fmezj0zAi2fcTv9TLgM8lNy2
 qkt6NeYsF/zz5nxm1yLa+7aHfSMN9xg9tfOYl2bRP6/mtQU/oBTze8t8pDsxylTU2o
 ibYGcJaZ5s4TCXDHu2fyK3jo/5YQZ3hMsDDplKqI1TVq4v2R2KYeNdjIP0wcekub5D
 mG7XeAFqxJQXa3GWSC2PHfAlwHMhyoIBWGrhKtyZcA4JQ1eqvRzfPsbG3Eph2N0960
 Iwo+afIagZqqjn7OBpArjS2WzGKaYdY901NYtIAWSFJUNRpbvY0cqgdq/b3Go0Lefa
 wmYIq5aY82yvg==
Date: Mon, 27 Mar 2023 08:30:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZCG2mfviZfY1dqb4@google.com>
References: <20230323213919.1876157-1-jaegeuk@kernel.org>
 <8aea02b0-86f9-539a-02e9-27b381e68b66@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8aea02b0-86f9-539a-02e9-27b381e68b66@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/26, Chao Yu wrote: > On 2023/3/24 5:39, Jaegeuk Kim
 wrote: > > https://bugzilla.kernel.org/show_bug.cgi?id=216050 > > > > Somehow
 we're getting a page which has a different mapping. > > Let's av [...] 
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
X-Headers-End: 1pgonz-0001cP-On
Subject: Re: [f2fs-dev] [PATCH] f2fs: get out of a repeat loop when getting
 a locked data page
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
Cc: willy@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/26, Chao Yu wrote:
> On 2023/3/24 5:39, Jaegeuk Kim wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=216050
> > 
> > Somehow we're getting a page which has a different mapping.
> > Let's avoid the infinite loop.
> > 
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/data.c | 8 ++------
> >   1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index bf51e6e4eb64..80702c93e885 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1329,18 +1329,14 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
> >   {
> >   	struct address_space *mapping = inode->i_mapping;
> >   	struct page *page;
> > -repeat:
> > +
> >   	page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
> >   	if (IS_ERR(page))
> >   		return page;
> >   	/* wait for read completion */
> >   	lock_page(page);
> > -	if (unlikely(page->mapping != mapping)) {
> 
> How about using such logic only for move_data_page() to limit affect for
> other paths?

Why move_data_page() only? If this happens, we'll fall into a loop in anywhere?

> 
> Jaegeuk, any thoughts about why mapping is mismatch in between page's one and
> inode->i_mapping?

> 
> After several times code review, I didn't get any clue about why f2fs always
> get the different mapping in a loop.

I couldn't find the path to happen this. So weird. Please check the history in the
bug.

> 
> Maybe we can loop MM guys to check whether below folio_file_page() may return
> page which has different mapping?

Matthew may have some idea on this?

> 
> struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
> 		int fgp_flags, gfp_t gfp)
> {
> 	struct folio *folio;
> 
> 	folio = __filemap_get_folio(mapping, index, fgp_flags, gfp);
> 	if (IS_ERR(folio))
> 		return NULL;
> 	return folio_file_page(folio, index);
> }
> 
> Thanks,
> 
> > -		f2fs_put_page(page, 1);
> > -		goto repeat;
> > -	}
> > -	if (unlikely(!PageUptodate(page))) {
> > +	if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
> >   		f2fs_put_page(page, 1);
> >   		return ERR_PTR(-EIO);
> >   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
