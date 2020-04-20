Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9071B07D1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2020 13:43:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQUpc-0005dG-KS; Mon, 20 Apr 2020 11:43:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jQUpb-0005dA-UN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Apr 2020 11:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y3v9H7gulitO+Y85OVNVzldz0TRWO8cQsHtyyEuI5ig=; b=FSzxmdW/QhaTYItRi5wW2f7zJ7
 YAFa4a4tlO1ziJsH9zevnMUELru+GpMHm76F2EVkGjBpOzxKizX+zuAcv+6GChZlkcteiZBvp9AeX
 q0ndNnK49+fQA4hkD15VinpNcm8ArE/XYGJLhj3lchmv4a0XdEbu6/H6T5uu34iw7RQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y3v9H7gulitO+Y85OVNVzldz0TRWO8cQsHtyyEuI5ig=; b=Ll3HZVda+oCvzmMqHhM7Y+km9c
 81A8+HPWpqzVlHsOkzMyHSBSt6tYQqvjxb1xsY4YhzcoFEXQeBITw6SADxTqJgdPe88zO6p5ZObzO
 u4LW3191zBGWyfsNj0gHQadJHYo3gchDpKBZlbMzMM189tXHYpknH3lcE5DPOyjOW+XU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jQUpa-004MU2-5L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Apr 2020 11:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y3v9H7gulitO+Y85OVNVzldz0TRWO8cQsHtyyEuI5ig=; b=g7JEJ58UfwyeWV04dJy7haqXcR
 FkY7TCFjfydjy7CUKLk2sKTRTGMeWlNvIH6QaFdDcJ6LNamrUKqVtRcrYX13W0QaBjHoZgQRwTrWr
 pFMw6Zh2CU0LWD4TLAEVKbFuQrrB+5ujPnG45zzsqeSt+qZFmCfJvo+ZWZer92aHWA9AX6zXTHxmR
 SZTQ0uswpYDxkQli+e+cy4XXvjLfdwzNe85/eZjU4D+5T9gllu2ggGK4e+wrNS8ioWTjEeUaLiDp9
 BBpgydRU02eR0+H8csye5k3wOpZi5BcrTH2LP3QdS1jLAlgaTQNjvb0utJkJEpp5gVZ/qj8/l1oQZ
 Kc/2zb2Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jQUpI-0006Jo-4N; Mon, 20 Apr 2020 11:43:00 +0000
Date: Mon, 20 Apr 2020 04:43:00 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20200420114300.GB5820@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
 <20200414150233.24495-25-willy@infradead.org>
 <CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jQUpa-004MU2-5L
Subject: Re: [f2fs-dev] [PATCH v11 24/25] fuse: Convert from readpages to
 readahead
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
 William Kucharski <william.kucharski@oracle.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 20, 2020 at 01:14:17PM +0200, Miklos Szeredi wrote:
> > +       for (;;) {
> > +               struct fuse_io_args *ia;
> > +               struct fuse_args_pages *ap;
> > +
> > +               nr_pages = readahead_count(rac) - nr_pages;
> 
> Hmm.  I see what's going on here, but it's confusing.   Why is
> __readahead_batch() decrementing the readahead count at the start,
> rather than at the end?
> 
> At the very least it needs a comment about why nr_pages is calculated this way.

Because usually that's what we want.  See, for example, fs/mpage.c:

        while ((page = readahead_page(rac))) {
                prefetchw(&page->flags);
                args.page = page;
                args.nr_pages = readahead_count(rac);
                args.bio = do_mpage_readpage(&args);
                put_page(page);
        }

fuse is different because it's trying to allocate for the next batch,
not for the batch we're currently on.

I'm a little annoyed because I posted almost this exact loop here:

https://lore.kernel.org/linux-fsdevel/CAJfpegtrhGamoSqD-3Svfj3-iTdAbfD8TP44H_o+HE+g+CAnCA@mail.gmail.com/

and you said "I think that's fine", modified only by your concern
for it not being obvious that nr_pages couldn't be decremented by
__readahead_batch(), so I modified the loop slightly to assign to
nr_pages.  The part you're now complaining about is unchanged.

> > +               if (nr_pages > max_pages)
> > +                       nr_pages = max_pages;
> > +               if (nr_pages == 0)
> > +                       break;
> > +               ia = fuse_io_alloc(NULL, nr_pages);
> > +               if (!ia)
> > +                       return;
> > +               ap = &ia->ap;
> > +               nr_pages = __readahead_batch(rac, ap->pages, nr_pages);
> > +               for (i = 0; i < nr_pages; i++) {
> > +                       fuse_wait_on_page_writeback(inode,
> > +                                                   readahead_index(rac) + i);
> 
> What's wrong with ap->pages[i]->index?  Are we trying to wean off using ->index?

It saves reading from a cacheline?  I wouldn't be surprised if the
compiler hoisted the read from rac->_index to outside the loop and just
iterated from rac->_index to rac->_index + nr_pages.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
