Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 416691667EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 21:02:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4s1a-0004Vn-V6; Thu, 20 Feb 2020 20:02:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4s1Y-0004V7-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2o7/2wQz4I2bSTa23Jz+2T7ehA7+Qh/DABLcJ7++Gg=; b=HU92TS8VR6jrLXqlsrwMoEdzf5
 Y4KzP/Why/TKyzsGD2Meh/9dhYBCVURjEeGDPBYVGqrW1IOtLgoFRTUjRwla7nD3MV3ozZwD4raH0
 e8/hx3HaFkT5DoozJ16taNkO+YliJNHrPrn0uymi7b38QKATY+duDVuYihOusQO3Sdhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G2o7/2wQz4I2bSTa23Jz+2T7ehA7+Qh/DABLcJ7++Gg=; b=eG9piOnduLVNRJ4uB8yOINH6++
 rWDYzTJURtM2J9sOt1nhuKihrXsmvI/8GeOOFPR7QBKAXWdjkTsO9yuO9QO4AlTtlCYt0fNwFbjti
 ytlO/jHvO7tsHD+vy3xhfg0VtyMiNvM98dBeO+y8NmfAq392xyYUa357QUJuNp4U+nLw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4s1W-00C9cy-R5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 20:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=G2o7/2wQz4I2bSTa23Jz+2T7ehA7+Qh/DABLcJ7++Gg=; b=rNJKV58kH2Hi3xhQxkLMMzx8lV
 RipoN223ZmXSatYqltHsRF6idpZbBmyf0GL9X+CH+Ks6Wc6k43+EjLitqhF4xF2b133YQH9ZG5EHi
 9S2PEh7TBE1weivsELdxeyxuCZbNPOZ2MqqDqE2ZOhY+EIiIxbWx+hcdKp9lxQ0cgIgNcZkczih6K
 9FdryOmrnuCo9AOOf+joSEfiifv0Cop4iRUq+zKJAofsbwZLBBoyX6i8M/2kx+6/2vGI/vLfIxQw1
 2Ucmc3/Mow9vozyw390izexHNWNfoWyIucqRv+4NiQ+0nLq6AIcDZr0SBA/Y13JQUbUW+KN6Xz/8C
 FKW5FgEA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4nTU-00007F-C8; Thu, 20 Feb 2020 15:10:48 +0000
Date: Thu, 20 Feb 2020 07:10:48 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Message-ID: <20200220151048.GW24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-11-willy@infradead.org>
 <5D7CE6BD-FABD-4901-AEF0-E0F10FC00EB1@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D7CE6BD-FABD-4901-AEF0-E0F10FC00EB1@nvidia.com>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4s1W-00C9cy-R5
Subject: Re: [f2fs-dev] [PATCH v7 10/24] mm: Add readahead address space
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

On Thu, Feb 20, 2020 at 10:00:30AM -0500, Zi Yan wrote:
> > +/* The index of the first page in this readahead block */
> > +static inline unsigned int readahead_index(struct readahead_control *rac)
> > +{
> > +	return rac->_index;
> > +}
> 
> rac->_index is pgoff_t, so readahead_index() should return the same type, right?
> BTW, pgoff_t is unsigned long.

Oh my goodness!  Thank you for spotting that.  Fortunately, it's only
currently used by tracepoints, so it wasn't causing any trouble, but
that's a nasty landmine to leave lying around.  Fixed:

static inline pgoff_t readahead_index(struct readahead_control *rac)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
