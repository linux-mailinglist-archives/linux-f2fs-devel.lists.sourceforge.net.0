Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B17681634BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 22:21:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4AJ3-0004p1-3j; Tue, 18 Feb 2020 21:21:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4AJ1-0004oq-Uc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0HtJTFPkdLwAcbGGhAHyzxa8a1mSgpc758IYlfDOg/k=; b=LOGvjrTykmE81QDSkjgSZ1dmWf
 nx0TccMvUXy9Dw1PB0q0TE5626OIEepluEyHpIfdQKaknfjAY36XBaAC0DTOrHhImIjVw3Zy8kV+Y
 IGlwC5aIUL7mVxZgsidKTEgkO6AxaFGE7ZCwt6Dm5rQY/qpwd65MzunF9na6peQ8Ay58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0HtJTFPkdLwAcbGGhAHyzxa8a1mSgpc758IYlfDOg/k=; b=SSQJVGxmaApzsv2cimjRPOdpeC
 zfGgnOgiX7B8aSxImAmE6OSxHT0BN/4uRgkrOpgGp8T/pSliAeBxXa7aSI/OxnIP36wRSCzEwzOin
 buIxfJqjyh/nnaDnz2ZHM9nBr1+Teggeg+95ZZ+/fLmhYUMQqoo51TA1a8iX8MWFnvGc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4AJ0-007hpY-UQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0HtJTFPkdLwAcbGGhAHyzxa8a1mSgpc758IYlfDOg/k=; b=L9ufQZtGybPYd67zmz67Xgy4Tn
 mZsneK5DIi4+EdZSTDy3qMq6jC4G9yjF4A0m3HKQqgfmPcf89rxgAlz7TflzrDt+lPKQjG8DBB0Nc
 hFwG4XwkG9NeYBz6KYBZ58AKe0IfPIrYhHeqqinr+nlcKs9GdGtB8jhCcawcvPy3icitqNTTzH4jP
 ZCAGflog5kL6wL3IvL71BWNMv5PaAXyucj7tYF+EQU4HI4NEjXGWh1T+shXyemzhRpUXmIabqr29C
 5LaP21DN5DNYTONx+gIE3+S5Zr0Asg51I2iJBLolcYDkCch1kyQ608fu1c/WOZsk9fwFBAcPrEAy8
 FZTOuLoQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4AIt-0003y5-Bi; Tue, 18 Feb 2020 21:21:15 +0000
Date: Tue, 18 Feb 2020 13:21:15 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200218212115.GG24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-2-willy@infradead.org>
 <29d2d7ca-7f2b-7eb4-78bc-f2af36c4c426@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29d2d7ca-7f2b-7eb4-78bc-f2af36c4c426@nvidia.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nvidia.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4AJ0-007hpY-UQ
Subject: Re: [f2fs-dev] [PATCH v6 01/19] mm: Return void from various
 readahead functions
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

On Tue, Feb 18, 2020 at 01:05:29PM -0800, John Hubbard wrote:
> This is an easy review and obviously correct, so:
> 
>     Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks

> Thoughts for the future of the API:
> 
> I will add that I could envision another patchset that went in the
> opposite direction, and attempted to preserve the information about
> how many pages were successfully read ahead. And that would be nice
> to have (at least IMHO), even all the way out to the syscall level,
> especially for the readahead syscall.

Right, and that was where I went initially.  It turns out to be a
non-trivial aount of work to do the book-keeping to find out how many
pages were _attempted_, and since we don't wait for the I/O to complete,
we don't know how many _succeeded_, and we also don't know how many
weren't attempted because they were already there, and how many weren't
attempted because somebody else has raced with us and is going to attempt
them themselves, and how many weren't attempted because we just ran out
of memory, and decided to give up.

Also, we don't know how many pages were successfully read, and then the
system decided to evict before the program found out how many were read,
let alone before it did any action based on that.

So, given all that complexity, and the fact that nobody actually does
anything with the limited and incorrect information we tried to provide
today, I think it's fair to say that anybody who wants to start to do
anything with that information can delve into all the complexity around
"what number should we return, and what does it really mean".  In the
meantime, let's just ditch the complexity and pretense that this number
means anything.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
