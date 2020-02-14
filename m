Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B317115D0F9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 05:22:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2SUF-0007qL-Cd; Fri, 14 Feb 2020 04:21:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j2SUE-0007qE-Mw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 04:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJ62j82nIU2Zy2GDXfwdfrwos2PK4U7hpjBMCZD+BHU=; b=jUL0Rp1m6UhAcShzHzD9ZxgjfX
 wv3dzkh3zY8y+1LM2rKRYIK+P9FIQ301fbl55IY0hkjt71dm5jEkqwFJOzsDoe/qhrvnrVON9RFWN
 0M+sq8UMZ+AVpDjjNI5ntHEn7qO+eOKixZH0h5HhOoecJx+I00CQmM40faPQLYhziUNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pJ62j82nIU2Zy2GDXfwdfrwos2PK4U7hpjBMCZD+BHU=; b=hgnwY+P/ojr8nZ9BOFFnSKU8/s
 RuU/g1ty4Z8rXe+cO3UK2wceDTbZMfYYI6vzPO3MMRhCv+lcH8mcMtcByt/8JrsrJJlK3xL3WW0JY
 7SAEFM5OoeW/+nj/5CK8psRUlHM2rRcMnRovpOwmCSJLPbsnaMvhHhucgR8SJvMl4xng=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2SUB-003VOX-Al
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 04:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pJ62j82nIU2Zy2GDXfwdfrwos2PK4U7hpjBMCZD+BHU=; b=ek5FlmUJYVH7TpMGN0UDhdbdlP
 ZpmOzXocMxVA9d+jNFuPudLwDNy8swGrQKmqAV1aNIqgz+vUnuTGmNlYmgpVvtLBxVCCQf/xRgUQe
 aYNfvPrXmq2c9txws9vk9GMvkDWjdJajzfqJTNG4wpo2D6zNpxIMcEYsw/Uzmu6+fgNlhK+Z6xcqv
 U2oZdCKEAQQi7TpP6smp3l+MpsP/IBWp0Zr5Q7SQ0ag+jo6r6bu7CUU385j6YfQ+3UbG2m+R8CiIP
 hMY9ekNVlTY1SfacIa6TX8hjMg1KzbNePDpc9q0x1IrQoqCtQgquJiQia27l1b496aVFYOc5RO091
 699nobpA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j2STx-0008Ig-7x; Fri, 14 Feb 2020 04:21:37 +0000
Date: Thu, 13 Feb 2020 20:21:37 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200214042137.GX7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-2-willy@infradead.org>
 <e0f459af-bb5d-58b9-78be-5adf687477c0@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0f459af-bb5d-58b9-78be-5adf687477c0@nvidia.com>
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
X-Headers-End: 1j2SUB-003VOX-Al
Subject: Re: [f2fs-dev] [PATCH v5 01/13] mm: Fix the return type of
 __do_page_cache_readahead
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

On Thu, Feb 13, 2020 at 07:19:53PM -0800, John Hubbard wrote:
> On 2/10/20 5:03 PM, Matthew Wilcox wrote:
> > @@ -161,7 +161,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
> >  	unsigned long end_index;	/* The last page we want to read */
> >  	LIST_HEAD(page_pool);
> >  	int page_idx;
> 
> 
> What about page_idx, too? It should also have the same data type as nr_pages, as long as
> we're trying to be consistent on this point.
> 
> Just want to ensure we're ready to handle those 2^33+ page readaheads... :)

Nah, this is just a type used internally to the function.  Getting the
API right for the callers is the important part.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
