Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C565A15FBE2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Feb 2020 02:15:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2m3P-0003Uw-HJ; Sat, 15 Feb 2020 01:15:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j2m3N-0003UZ-DX
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Feb 2020 01:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8vF3wmoykU6jc6+10TSp5NOFVxwRnMSI+FSzYO1WEQQ=; b=jCuFYu9XtY2B9QiphJlCTpZbyK
 Nzxi/+fcv7owz9r2IXtJw4fnrHRo5ydzQlDF+0tE8pmbJ8T7uVr7c0rbW/pb4kDXWYeLAMClW8xBC
 gQqTVwlvdXhCG4Yoh0XxRLG2PgD+3N3dcmUE9Yjzst2srjgAy6diC3RIEld4RSBKn+S0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8vF3wmoykU6jc6+10TSp5NOFVxwRnMSI+FSzYO1WEQQ=; b=ebydDzUhsMtk2zzVFwR3pXnRVW
 VBvXk+iEXBGlD7HCVjcx7ja1+5DbzmF/OZ102WgYcifOUB4iJbuonhH6f5XVDCxGpsUhpm7EBlnte
 8dauhf3HHV4YMY1D4sc43wx9Yq2QtR4dGxCeOEgUJzGzAK6I97/E55KyVshgxEC4ZuOk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2m3L-004RNb-DF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Feb 2020 01:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8vF3wmoykU6jc6+10TSp5NOFVxwRnMSI+FSzYO1WEQQ=; b=bYTz4ixAcXgUBn5lU/9H4Qkc8U
 psonlrVRSl1w2Efajn8sSvZ4fc66CBslbfJ8hYC7paJRLK+yJwFFKlpcmnCuSqQ3VgQIQc9bRKzS3
 RKpTi9vip5bJenIXktMAoR2hmT8VH80rF4tgY3sf4QnBz8MWKa+ALVxAEtDMgRdz1VPOIaUeTItOS
 2pxc8IX2HDPzzkM5B4sWPw6NpUySd6jYHfalkiD/26kIZxfM118k/TIVrruZyhX4bQ6tIJjKq3niB
 ldfXT72DOy+DLMs6ox4SNWF1RllK7qc+dkUXgtwEY31BR65L8+zEdJD+0mj8Hsxex+wOSOCKsfGso
 5F0cnt9Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j2m2z-0006lw-H3; Sat, 15 Feb 2020 01:15:05 +0000
Date: Fri, 14 Feb 2020 17:15:05 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200215011505.GD7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-5-willy@infradead.org>
 <755399a8-8fdf-bfac-9f23-81579ff63ddf@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <755399a8-8fdf-bfac-9f23-81579ff63ddf@nvidia.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j2m3L-004RNb-DF
Subject: Re: [f2fs-dev] [PATCH v5 04/13] mm: Add readahead address space
 operation
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 13, 2020 at 09:36:25PM -0800, John Hubbard wrote:
> > +static inline struct page *readahead_page(struct readahead_control *rac)
> > +{
> > +	struct page *page;
> > +
> > +	if (!rac->nr_pages)
> > +		return NULL;
> > +
> > +	page = xa_load(&rac->mapping->i_pages, rac->start);
> 
> 
> Is it worth asserting that the page was found:
> 
> 	VM_BUG_ON_PAGE(!page || xa_is_value(page), page);
> 
> ? Or is that overkill here?

It shouldn't be possible since they were just added in a locked state.
If it did happen, it'll be caught by the assert below -- dereferencing
a NULL pointer or a shadow entry is not going to go well.

> > +	VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +	rac->batch_count = hpage_nr_pages(page);
> > +	rac->start += rac->batch_count;
> 
> The above was surprising, until I saw the other thread with Dave and you.
> I was reviewing this patchset in order to have a chance at understanding the 
> follow-on patchset ("Large pages in the page cache"), and it seems like that
> feature has a solid head start here. :)  

Right, I'll document that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
