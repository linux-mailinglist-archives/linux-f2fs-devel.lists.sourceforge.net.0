Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF1113278
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 19:11:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icZ7F-00006b-4Z; Wed, 04 Dec 2019 18:11:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1icZ7C-00006E-Ti
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 18:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z5mJNcjy3l0Ml7D3BNCDo1kWHYC6R1F2vL4CGTUFokU=; b=OKzR++VZUrGqAkA280uh6dQFtL
 ozP7MnGV3jjuvsiRFeaj8AD2aQfTg3j9qHqYG7Z/ZFckqjYbKYw/Gr5lTGL3XhlXWndvYzt8m2TuR
 IV9zNsQzfmmxTKH91SGe4HbPgY5zwK2eVFv+esQoQ3uGv/wvommZgDx7JjHLzMe/OMII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z5mJNcjy3l0Ml7D3BNCDo1kWHYC6R1F2vL4CGTUFokU=; b=A6iGdvJLRvVet21E5PV2tu2Z+C
 tvXOcV/Ndkto401SjiTXloCuoZWhBT8/xKy1q/i0KphLaW/F1Hpe6MfBTteBcpb0FcpFO39Rwk+K7
 0uLh5kLR37BFCFW7mgu+j0AB+kASdNMZxwFmaU4xKnzhYAA+6mQMYY1uzVyixMcfYCTY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icZ7B-009URx-11
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 18:11:06 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6928D20863;
 Wed,  4 Dec 2019 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575483058;
 bh=yG8GPbqviAwiLRynbSvmgC1rPCu+1+hYU0TZYOzcVRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uo+6n7dswijeSvj+tjH/6tbQi5dTDjCVPCl/8FSzUf/8AFpcqT55fi0Cx9jp8St2u
 awX/6Ak65XXMqko9j7JyxF7fL8xOrZuq+hTtjoh5pT1o+RxRfENRBBK2voxf1kYK7G
 QhlpzYDGretUM3JHsS0ze0SDnzWZmbqvlw93JBJI=
Date: Wed, 4 Dec 2019 10:10:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Vyacheslav Dubeyko <slava@dubeyko.com>
Message-ID: <20191204181056.GA4576@sol.localdomain>
References: <20191203193001.66906-1-ebiggers@kernel.org>
 <96a288281d9d84f11dcc06e62a1ff20e2bb2f776.camel@dubeyko.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96a288281d9d84f11dcc06e62a1ff20e2bb2f776.camel@dubeyko.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icZ7B-009URx-11
Subject: Re: [f2fs-dev] [PATCH] fs-verity: implement readahead for
 FS_IOC_ENABLE_VERITY
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 04, 2019 at 10:53:50AM +0300, Vyacheslav Dubeyko wrote:
> > diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> > index eabc6ac19906..f7eaffa60196 100644
> > --- a/fs/verity/enable.c
> > +++ b/fs/verity/enable.c
> > @@ -13,14 +13,44 @@
> >  #include <linux/sched/signal.h>
> >  #include <linux/uaccess.h>
> >  
> > -static int build_merkle_tree_level(struct inode *inode, unsigned int
> > level,
> > +/*
> > + * Read a file data page for Merkle tree construction.  Do
> > aggressive readahead,
> > + * since we're sequentially reading the entire file.
> > + */
> > +static struct page *read_file_data_page(struct inode *inode,
> > +					struct file_ra_state *ra,
> > +					struct file *filp,
> > +					pgoff_t index,
> > +					pgoff_t num_pages_in_file)
> > +{
> > +	struct page *page;
> > +
> > +	page = find_get_page(inode->i_mapping, index);
> > +	if (!page || !PageUptodate(page)) {
> > +		if (page)
> > +			put_page(page);
> 
> 
> It looks like that there is not necessary check here. If we have NULL
> pointer on page then we will not enter inside. But if we have valid
> pointer on page then we have double check inside. Am I correct? 
> 

I'm not sure what you mean.  This code does the page_cache_sync_readahead() and
read_mapping_page() if either the page is not in the pagecache at all *or* is
not up to date.  I know this is slightly different logic than
generic_file_buffered_read() uses, and is suboptimal since the use of
read_mapping_page() causes a redundant pagecache lookup.  But we don't need to
squeeze out every possible bit of performance here.

Hmm, maybe it should only call page_cache_sync_readahead() when page == NULL
though.  I'll check the readahead code again.

> 
> > +		page_cache_sync_readahead(inode->i_mapping, ra, filp,
> > +					  index, num_pages_in_file -
> > index);
> > +		page = read_mapping_page(inode->i_mapping, index,
> > NULL);
> > +		if (IS_ERR(page))
> > +			return page;
> 
> Could we recieve the NULL pointer here? Is callee ready to process theNULL return value? 
> 

No, read_mapping_page() returns either a valid page or an ERR_PTR().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
