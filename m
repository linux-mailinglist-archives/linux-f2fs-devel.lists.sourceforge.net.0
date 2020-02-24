Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661C16B2B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:36:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LPK-00081A-Qp; Mon, 24 Feb 2020 21:36:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+fd4c774fa746ae91f5d1+6028+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j6LPI-000812-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFwk7Ogzw1DwSroExaLsOAPWW4X5SCgwVYe/ydMONuc=; b=XaTkDtr3o0nMrbThfKhOVV9ZD4
 5K4VjMmhJ/uixuhNBluJNnThROvGqi7mYV13hVQur3oIxUBMjGE6dnKaM5122OXlmDYrPEFqOApeL
 M5hFJfAPMsP9HEaiaOl571UJzWWPU2BTvNZCk678uE7iww2LqezC74sJ3hHkG/FrmyU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFwk7Ogzw1DwSroExaLsOAPWW4X5SCgwVYe/ydMONuc=; b=JQ2PshXs3vt7XJSLnSigqzIMP1
 1BATdpwhSVxygYa2SPv0xH8iuz/r2O4dT1vUoAuod4bU3zXpyGr6ajb2cZ6SDs3iV9tEY/gah+r64
 ZebpUDbbswmxFHPvn2tOQieGsTHiB3Q8HQdep8qWUbT71L6CPDcxyNHdI9SLJL7Sc3Xc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LPE-005Scy-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mFwk7Ogzw1DwSroExaLsOAPWW4X5SCgwVYe/ydMONuc=; b=h/ro7KECScPGoDcA++S4qIfmW4
 a06F8eE7BeOWkVDTLANRFPSvwkLapVgJFqt2VXCcOLFMLb/IVkdpgWIewAjZwrmoXoLgiQWSG9Zty
 UOQzMrCaYm6q5rbwkHC0Ctve2q580OSV2Oy4PszFr17DCrDQhwfT/4C+JU/PKFZsFq6SqQp9tCg+g
 acEByWoYRjIwj8O0VsmpyloGmy5L4TaJDe+GO7Y7wN9a8IZc2Z/AgJajdXqjL1+CPTF2F1h+Z6qwh
 d7Lt1pwr7q//pc6zqqg9O/LFXziK/pHi+Sp1b494SmXhpNH92hlDYT7pk0T0Rb9hF8+rxMxWmvnsf
 KMVQIFBQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6LP7-0005et-TQ; Mon, 24 Feb 2020 21:36:41 +0000
Date: Mon, 24 Feb 2020 13:36:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224213641.GD13895@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-6-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219210103.32400-6-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6LPE-005Scy-Qm
Subject: Re: [f2fs-dev] [PATCH v7 05/24] mm: Use readahead_control to pass
 arguments
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
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 19, 2020 at 01:00:44PM -0800, Matthew Wilcox wrote:
> @@ -160,9 +164,13 @@ void __do_page_cache_readahead(struct address_space *mapping,
>  	unsigned long end_index;	/* The last page we want to read */
>  	LIST_HEAD(page_pool);
>  	int page_idx;
> -	unsigned int nr_pages = 0;
>  	loff_t isize = i_size_read(inode);
>  	gfp_t gfp_mask = readahead_gfp_mask(mapping);
> +	struct readahead_control rac = {
> +		.mapping = mapping,
> +		.file = filp,
> +		._nr_pages = 0,

There is no real need to initialize fields to zero if we initialize
the structure at all.  And while I'd normally not care that much,
having as few references as possible to the _-prefixed internal
variables helps making clear how internal they are.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
