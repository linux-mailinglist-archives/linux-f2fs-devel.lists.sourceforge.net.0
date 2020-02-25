Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D216B761
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 02:50:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6PMR-00037H-5H; Tue, 25 Feb 2020 01:50:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j6PMP-000378-D8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 01:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPstBDWt6d6bgib6lzSxq/HWT4OJnZOw1KjPemQQZhk=; b=bvqQ6Jx9q0gwE0PEDx7FeO5C0G
 ekKFu7bIgTbCEDYEezN6ZuHBQ3HcP5YHNJt2ucw3KCiQRJZ/4o/uI5UGItnFae8mYINDzvyVJbXVn
 datBhHtqXkEs4+ccu5e6nXBb1I7bb5369vf5AUO+4c7Pd1dH+RMHQyQVYyDSrhApg/2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yPstBDWt6d6bgib6lzSxq/HWT4OJnZOw1KjPemQQZhk=; b=es7H0iZnOpHJZHfpPOiOlLZ4Td
 35sqKQPoB7vn8qdcDHvrU6VTBpFrvZ0xcITFccNKsroWJg7wGZ4X5PRU5eeaYX9zv3uN2Q4+l+pkM
 pS2zqJiUnnYlUwq9Gvmu7BxW+ZfuTaiO3UuRKPCFqV8ZjrmdCSIMfeusp4u2tagXDm10=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6PMM-0096iT-5N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 01:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yPstBDWt6d6bgib6lzSxq/HWT4OJnZOw1KjPemQQZhk=; b=nq6XE/tSepneJylkylrJT/pjX0
 Spd9n665DMmObVCAJQLiBcVE27W55R0GvvnwfhobI0nmTEDz86mNpQ7jYVEvZB4cBHnXuxzpqbtB2
 dztcP9+wnlj1Npzqvcvw4SBbhcPINCOrW5w/GB5Voz46hys+/yy1cVSQJnvnClSLqQV0BlbT/xSnd
 Nll+nW4Z23UwGg0w+NmFJ+j5Vj9uN8TwBH0aWud5eMbaqI91DlTxC7X8GQe99Ryifnf+8ekuv6cG5
 v3Zi+BLESY98iLiL33OQI7hDesuLmsELZwns1M2tRR8quGkyU/jgISoLGdMjNj/zL8NWKAboOxtDf
 qQluRdMA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j6PM5-0005vC-A1; Tue, 25 Feb 2020 01:49:49 +0000
Date: Mon, 24 Feb 2020 17:49:49 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200225014949.GS24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-22-willy@infradead.org>
 <20200220154741.GB19577@infradead.org>
 <20200220162404.GY24185@bombadil.infradead.org>
 <20200224221749.GA22231@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224221749.GA22231@infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6PMM-0096iT-5N
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

On Mon, Feb 24, 2020 at 02:17:49PM -0800, Christoph Hellwig wrote:
> On Thu, Feb 20, 2020 at 08:24:04AM -0800, Matthew Wilcox wrote:
> > On Thu, Feb 20, 2020 at 07:47:41AM -0800, Christoph Hellwig wrote:
> > > On Wed, Feb 19, 2020 at 01:01:00PM -0800, Matthew Wilcox wrote:
> > > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > > 
> > > > By putting the 'have we reached the end of the page' condition at the end
> > > > of the loop instead of the beginning, we can remove the 'submit the last
> > > > page' code from iomap_readpages().  Also check that iomap_readpage_actor()
> > > > didn't return 0, which would lead to an endless loop.
> > > 
> > > I'm obviously biassed a I wrote the original code, but I find the new
> > > very much harder to understand (not that the previous one was easy, this
> > > is tricky code..).
> > 
> > Agreed, I found the original code hard to understand.  I think this is
> > easier because now cur_page doesn't leak outside this loop, so it has
> > an obvious lifecycle.
> 
> I really don't like this patch, and would prefer if the series goes
> ahead without it, as the current sctructure works just fine even
> with the readahead changes.

Dave Chinner specifically asked me to do it this way, so please fight
amongst yourselves.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
