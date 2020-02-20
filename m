Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBF1667E5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 21:02:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4s1O-00005o-Tb; Thu, 20 Feb 2020 20:02:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4s1N-00005K-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/X+cuahXNVjwX8kIjzPU/QZUMEm+qIm+lNxfvhlX3EA=; b=ltV5o52urh5dvnj7KYBsX1PrFw
 Dd+EG6+6MOwx/kbgnPCxuaYNUCNI1rPCSa1TPGGtWO3R1aLY2FZaXnlaa/rofzb+kC76ysSt40Cjs
 /cqjjmbU5PPo7UojhIjeAzwi2P+RRVWBI727UkyDkkyLSHsXoH2fle80C1GglSWEE0v0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/X+cuahXNVjwX8kIjzPU/QZUMEm+qIm+lNxfvhlX3EA=; b=QpSIfh74g/rPsMtf09DGmrfkzC
 Cw0/zKpNhzyT31heGMVZSKMvnuQFq/InYWSv1VqgdmJDzOPVh8VpevsnKUFLZIEWdkD76xQXxM9Y0
 uFt4oZppBk4hguXQGhxKGX35ND1UVQZaSB/BXcCpLMclgc9T/+Esz5eoETl4NmPIHea4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4s1L-00C9cy-IG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/X+cuahXNVjwX8kIjzPU/QZUMEm+qIm+lNxfvhlX3EA=; b=lxTIdidZw2P2UO9t/Oji3FNceT
 +CjnxJZogq66GLHl3rhRoufVhXPoH7CxN5rw1pgrMvr7szk03lJeq2TvDL3R2ys6m86hnGj7sXBXg
 AQaHFo4WLWH90RnuR6backVMmU/lhsJTXMH7V42hfdxcXElLYWAoi8WkszieVn0N2xZmXUiT1EECe
 GJX8uJUjnaFLb7zI2vKxvhhrKwSedVafnnaMtZd9zrJbg6npgPtnxSYDtx+h9J81ITalXizKXonPp
 SQVVA+pyipbUonuljCpyE7+n90vEPRYltjJb/REqxUNVBonREpCV+ttQEEWV7EF1CEorahGhIHM1b
 9p1J3F8g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4ocO-0001zg-A1; Thu, 20 Feb 2020 16:24:04 +0000
Date: Thu, 20 Feb 2020 08:24:04 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200220162404.GY24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
 <20200220154741.GB19577@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220154741.GB19577@infradead.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4s1L-00C9cy-IG
Subject: Re: [f2fs-dev] [PATCH v7 21/24] iomap: Restructure
 iomap_readpages_actor
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

On Thu, Feb 20, 2020 at 07:47:41AM -0800, Christoph Hellwig wrote:
> On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > By putting the 'have we reached the end of the page' condition at the end
> > of the loop instead of the beginning, we can remove the 'submit the last
> > page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> > didn't return 0, which would lead to an endless loop.
> 
> I'm obviously biassed a I wrote the original code, but I find the new
> very much harder to understand (not that the previous one was easy, this
> is tricky code..).

Agreed, I found the original code hard to understand.  I think this is
easier because now cur_page doesn't leak outside this loop, so it has
an obvious lifecycle.

I'm kind of optimistic for Dave Howells' iov_iter addition of an
ITER_MAPPING.  That might simplify all of this code.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
