Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5C192C98
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 16:32:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH81S-0005VV-OV; Wed, 25 Mar 2020 15:32:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jH81Q-0005VL-SJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8UzQwxATOZdjWZ+3tNM04b2mH/5tj4IRSDfIFAnCq4=; b=A9ERRu7af6JyjpwEtg0j6esX3J
 WDbWIj7mCxVHQP5sWJ9YsRy5qosZdWxNax5wf5PAWgtJnQ3B3Zw4PLzIiSLg5Z10NnX46DgRqYzUH
 ixXmNa+G6lNsEks2a0sErAf2R/+xmBsmVD1sU9LVEhp43nz44g6aMRuZgWaXA6ktgwBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L8UzQwxATOZdjWZ+3tNM04b2mH/5tj4IRSDfIFAnCq4=; b=WMID8SOlCr39n6MWZVSKlTXCgn
 qBEgDDBq3zRzTh8d9rboGJK/UUZ8gXDe3ogOMJz3dY4p7WfRHsvTRj7ruep95glWC7FRwsjkqHFaG
 tInmoV8kkKfJTQ3N+iCyEdZBe+vvJujL+ZfFCH3akXWlc1W0YDJTAfjCroYO45ZrDmxc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH81N-006lbF-99
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L8UzQwxATOZdjWZ+3tNM04b2mH/5tj4IRSDfIFAnCq4=; b=nwr8fvcCAKrcOHuwe8r/p16lMc
 bZh3DEdAU9aGBWN3F5ynv1Ne93Ij03ZhftdP2p/j/SwKFdDbTLj5/ZaltpVeKwhDVOtZpmt6dBgOM
 Y5kNAkTDyJM9LmxIOgZivD4BtHVK41PC4z2UtEwA8qUzMYjVHQwzjfESuvsJdyTL91AdLqA/lHmDm
 b4ONx8n6tUgKbzMesC9PHNx/tJe345Szba01BQVbNkeQ4aBKyS9/rqkTgJMFlzt5JsbGeTzjBPG19
 tW79XBGQHh8i08Okr8byBxVFG1QH7u5q9rAcay5PaTaRDoWupoIchhUNkRzhk4f/AQVLTP2rNvR7K
 5pnTChzQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jH816-0004oZ-U3; Wed, 25 Mar 2020 15:32:28 +0000
Date: Wed, 25 Mar 2020 08:32:28 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <20200325153228.GB22483@bombadil.infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
 <20200323202259.13363-25-willy@infradead.org>
 <CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
 <20200325120254.GA22483@bombadil.infradead.org>
 <CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpegshssCJiA8PBcq2XvBj3mR8dufHb0zWRFvvKKv82VQYsw@mail.gmail.com>
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
X-Headers-End: 1jH81N-006lbF-99
Subject: Re: [f2fs-dev] [PATCH v10 24/25] fuse: Convert from readpages to
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

On Wed, Mar 25, 2020 at 03:43:02PM +0100, Miklos Szeredi wrote:
> >
> > -       while ((page = readahead_page(rac))) {
> > -               if (fuse_readpages_fill(&data, page) != 0)
> > +               nr_pages = min(readahead_count(rac), fc->max_pages);
> 
> Missing fc->max_read clamp.

Yeah, I realised that.  I ended up doing ...

+       unsigned int i, max_pages, nr_pages = 0;
...
+       max_pages = min(fc->max_pages, fc->max_read / PAGE_SIZE);

> > +               ia = fuse_io_alloc(NULL, nr_pages);
> > +               if (!ia)
> >                         return;
> > +               ap = &ia->ap;
> > +               __readahead_batch(rac, ap->pages, nr_pages);
> 
> nr_pages = __readahead_batch(...)?

That's the other bug ... this was designed for btrfs which has a fixed-size
buffer.  But you want to dynamically allocate fuse_io_args(), so we need to
figure out the number of pages beforehand, which is a little awkward.  I've
settled on this for the moment:

        for (;;) {
               struct fuse_io_args *ia;
                struct fuse_args_pages *ap;

                nr_pages = readahead_count(rac) - nr_pages;
                if (nr_pages > max_pages)
                        nr_pages = max_pages;
                if (nr_pages == 0)
                        break;
                ia = fuse_io_alloc(NULL, nr_pages);
                if (!ia)
                        return;
                ap = &ia->ap;
                __readahead_batch(rac, ap->pages, nr_pages);
                for (i = 0; i < nr_pages; i++) {
                        fuse_wait_on_page_writeback(inode,
                                                    readahead_index(rac) + i);
                        ap->descs[i].length = PAGE_SIZE;
                }
                ap->num_pages = nr_pages;
                fuse_send_readpages(ia, rac->file);
        }

but I'm not entirely happy with that either.  Pondering better options.

> This will give consecutive pages, right?

readpages() was already being called with consecutive pages.  Several
filesystems had code to cope with the pages being non-consecutive, but
that wasn't how the core code worked; if there was a discontiguity it
would send off the pages that were consecutive and start a new batch.

__readahead_batch() can't return fewer than nr_pages, so you don't need
to check for that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
