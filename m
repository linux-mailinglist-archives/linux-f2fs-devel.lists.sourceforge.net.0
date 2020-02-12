Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5815AF98
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 19:18:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1wag-0000qc-M2; Wed, 12 Feb 2020 18:18:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+0636056a4212f82c3197+6016+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j1waf-0000qL-7a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 18:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4+pGNKZQNPPjUYhUfxAE2vdkfqWETPzu/0lbzblOiLM=; b=UhqZx7L4IuK0fNkHYfb2pmhiR4
 AK80psOgv0L67ZtNPLwbE0EpChVAtgODirX3fAoxahV6yKS0k02QjSofpzODEIeztGundEPdXFJM1
 aeXGsBaNpJU0IVx48rbG6l8rpMg74c/9q1qj4SpC0hSoQLGNHgzhfTyfmdyk8nwRF7Gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4+pGNKZQNPPjUYhUfxAE2vdkfqWETPzu/0lbzblOiLM=; b=YjmNuRSAz8q5KCI3D2+6ZtWsLt
 oljTpchANJDFU6290PaKmNSGrb25Qct9CxJ7yeKjRP/v6vcFI6TF2nxUQ0dW7rph31JbAkw6UpiB+
 xYFunp1gsR5gS6g3dBdCl0/v6vxiJNQ0PxY7G2mme7Dd5/sBhQLuROtv357gpHDNb0kw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1wae-001d3q-82
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 18:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4+pGNKZQNPPjUYhUfxAE2vdkfqWETPzu/0lbzblOiLM=; b=qC1Fti8lZ0koII3U5Sa2TjOM28
 nosTSzdm25oQSeIMGq07AVlCw20djEBGUpWliyiKQwITDdQcoaxm1uXqtkNjwxfTpJNhiOtI8jhOb
 r7GEIlGzU7vqitlAbk9aJYzHnlfzWJw31vQC/Z3Til1uih5qj+enBDV26fhdRz3DdCxYbTIaNuUIX
 2OnWR1DrQfnRApPtzcldB3qtqOzSKFM+aq41f9gck471QDMk1xCwWxmFurCQfy00JF0ZQaamhxAYP
 Bw2GDAtxWrBD9CBq026AuSAIvMitA8b0oUDL/p3WShFpcX4ybJFYzF5XIQaHgMzYrROtQoZVzZ4bv
 WrZl7SaA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j1waR-0004Q0-E1; Wed, 12 Feb 2020 18:18:11 +0000
Date: Wed, 12 Feb 2020 10:18:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200212181811.GC9756@infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
 <20200211010348.6872-5-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211010348.6872-5-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
X-Headers-End: 1j1wae-001d3q-82
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

On Mon, Feb 10, 2020 at 05:03:39PM -0800, Matthew Wilcox wrote:
> +struct readahead_control {
> +	struct file *file;
> +	struct address_space *mapping;
> +/* private: use the readahead_* accessors instead */
> +	pgoff_t start;
> +	unsigned int nr_pages;
> +	unsigned int batch_count;

We often use __ prefixes for the private fields to make that a little
more clear.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
