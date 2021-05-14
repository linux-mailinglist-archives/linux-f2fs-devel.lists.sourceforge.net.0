Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAEC380815
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 May 2021 13:07:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhVf3-0003IS-Az; Fri, 14 May 2021 11:07:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lhVf1-0003IB-TK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 11:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J7fqKdpg80TWgM1fzlC0KEIDrxDrwZ5e9fXWHt3GVjg=; b=koqp88GMkeH6Gg0kXmauaUdgIO
 hiEEaQXxoPHPmhiTYWwI76my91+8Qb6MjkOyZjntClesHlstrnk7OzqmYVms5FB5WrVddRNWOtivy
 Hm5iFI7k97TU7qVWnzcB/wQlueOFOkuLPfmaI8cHwGvZBeQQilpfbwLDLBrgee72NI/M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J7fqKdpg80TWgM1fzlC0KEIDrxDrwZ5e9fXWHt3GVjg=; b=WkN2/IZWlEQQYrk/4HViw3+enO
 XDdMp/OETONrr1szpV88rbgQEKVG/NW/nv/d/pBDdnir6PdHtoFREGznJAhfup4CF1X55yy/Ew4VS
 p0rrKlAgFAFDGqawHs8CgTSNpRqk/VGTLvjRAj/Xt1GOhL5Y62ddHpydEOsECN8PKPDo=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lhVew-0003cl-US
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 11:07:15 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 724A5AF11;
 Fri, 14 May 2021 11:07:02 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AB2D71F2B4A; Fri, 14 May 2021 13:07:00 +0200 (CEST)
Date: Fri, 14 May 2021 13:07:00 +0200
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210514110700.GA27655@quack2.suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
 <YJvo1bGG1tG+gtgC@casper.infradead.org>
 <20210513190114.GJ2734@quack2.suse.cz>
 <YJ2AR0IURFzz+52G@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ2AR0IURFzz+52G@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lhVew-0003cl-US
Subject: Re: [f2fs-dev] [PATCH 03/11] mm: Protect operations adding pages to
 page cache with invalidate_lock
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Ted Tso <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 13-05-21 20:38:47, Matthew Wilcox wrote:
> On Thu, May 13, 2021 at 09:01:14PM +0200, Jan Kara wrote:
> > On Wed 12-05-21 15:40:21, Matthew Wilcox wrote:
> > > Remind me (or, rather, add to the documentation) why we have to hold the
> > > invalidate_lock during the call to readpage / readahead, and we don't just
> > > hold it around the call to add_to_page_cache / add_to_page_cache_locked
> > > / add_to_page_cache_lru ?  I appreciate that ->readpages is still going
> > > to suck, but we're down to just three implementations of ->readpages now
> > > (9p, cifs & nfs).
> > 
> > There's a comment in filemap_create_page() trying to explain this. We need
> > to protect against cases like: Filesystem with 1k blocksize, file F has
> > page at index 0 with uptodate buffer at 0-1k, rest not uptodate. All blocks
> > underlying page are allocated. Now let read at offset 1k race with hole
> > punch at offset 1k, length 1k.
> > 
> > read()					hole punch
> > ...
> >   filemap_read()
> >     filemap_get_pages()
> >       - page found in the page cache but !Uptodate
> >       filemap_update_page()
> > 					  locks everything
> > 					  truncate_inode_pages_range()
> > 					    lock_page(page)
> > 					    do_invalidatepage()
> > 					    unlock_page(page)
> >         locks page
> >           filemap_read_page()
> 
> Ah, this is the partial_start case, which means that page->mapping
> is still valid.  But that means that do_invalidatepage() was called
> with (offset 1024, length 1024), immediately after we called
> zero_user_segment().  So isn't this a bug in the fs do_invalidatepage()?
> The range from 1k-2k _is_ uptodate.  It's been zeroed in memory,
> and if we were to run after the "free block" below, we'd get that
> memory zeroed again.

Well, yes, do_invalidatepage() could mark zeroed region as uptodate. But I
don't think we want to rely on 'uptodate' not getting spuriously cleared
(which would reopen the problem). Generally the assumption is that there's
no problem clearing (or not setting) uptodate flag of a clean buffer
because the fs can always provide the data again. Similarly, fs is free to
refetch data into clean & uptodate page, if it thinks it's worth it. Now
all these would become correctness issues. So IMHO the fragility is not
worth the shorter lock hold times. That's why I went for the rule that
read-IO submission is still protected by invalidate_lock to make things
simple.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
