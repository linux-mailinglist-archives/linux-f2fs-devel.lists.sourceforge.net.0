Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291B39146D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 12:07:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llqRd-0003Tv-7H; Wed, 26 May 2021 10:07:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1llqRZ-0003Th-MC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 10:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZxNqCRr5czRb56ktpxOWnOSu0fMulpRezdytlVC9QQ=; b=Nvo46on+7KETyR0Uu7+4mUA354
 RWEbNeWwkMXH4euB3Q7Hw3B8oXGcSB/hNuy9KOC6oy9M0eYzp+CVjtAP43iSL255G/r82yVujAu7Q
 pyHNiVaMH5MIo2rlyfD6gZKU/JUmcDcAj/bWIElnregR6GRzft82mf+HtfzBGJcbqmQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CZxNqCRr5czRb56ktpxOWnOSu0fMulpRezdytlVC9QQ=; b=HOllwaK7UYm81seQyEJeCb2upf
 4OJrs0h1Hewc/rIVrMWGr9u7YhbFj/93YX/9zKevJ1jpAf9ThQIStJDcde/oplks9hlfgMdZMkgox
 /p8H9WjU7LBBl3ng8JrjVciL48hOHDndYgfhl045DlNDgR0GtORqT+zzPf3MH+PlKKXA=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1llqRT-0006nu-7m
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 10:07:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622023623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZxNqCRr5czRb56ktpxOWnOSu0fMulpRezdytlVC9QQ=;
 b=MUD4K8oZyRkdjWXxo9HyOuILAC4V4vxmrSA2puCD1iiJPv8jaP+OiF8l+HEBDcKpaVp3/h
 7onqU4PqBHfM45G/uKaLxUlJv3zQzDi8HpsqqlwG/16TY4CmFD/oNOcXgIeoljs82BjeKG
 BWqBVJ7bKd8IeS58qNbom5KI0ThJpMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622023623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZxNqCRr5czRb56ktpxOWnOSu0fMulpRezdytlVC9QQ=;
 b=hZUsEKYXJUCCkMAN57O+Y8WvBmPX15w3AXW2eO+doBR566bf0sVhZ7r7OxXtui0gC6+R4Q
 /hxlBSr/JveL4MCQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D67DB237;
 Wed, 26 May 2021 10:07:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0EB141F2CAC; Wed, 26 May 2021 12:07:02 +0200 (CEST)
Date: Wed, 26 May 2021 12:07:02 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210526100702.GB30369@quack2.suse.cz>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-4-jack@suse.cz>
 <20210525204805.GM202121@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525204805.GM202121@locust>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llqRT-0006nu-7m
Subject: Re: [f2fs-dev] [PATCH 04/13] mm: Add functions to lock
 invalidate_lock for two mappings
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ted Tso <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 25-05-21 13:48:05, Darrick J. Wong wrote:
> On Tue, May 25, 2021 at 03:50:41PM +0200, Jan Kara wrote:
> > Some operations such as reflinking blocks among files will need to lock
> > invalidate_lock for two mappings. Add helper functions to do that.
> > 
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  include/linux/fs.h |  6 ++++++
> >  mm/filemap.c       | 38 ++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index 897238d9f1e0..e6f7447505f5 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -822,6 +822,12 @@ static inline void inode_lock_shared_nested(struct inode *inode, unsigned subcla
> >  void lock_two_nondirectories(struct inode *, struct inode*);
> >  void unlock_two_nondirectories(struct inode *, struct inode*);
> >  
> > +void filemap_invalidate_down_write_two(struct address_space *mapping1,
> > +				       struct address_space *mapping2);
> > +void filemap_invalidate_up_write_two(struct address_space *mapping1,
> 
> TBH I find myself wishing that the invalidate_lock used the same
> lock/unlock style wrappers that we use for i_rwsem.
> 
> filemap_invalidate_lock(inode1->mapping);
> filemap_invalidate_lock_two(inode1->i_mapping, inode2->i_mapping);

OK, and filemap_invalidate_lock_shared() for down_read()? I guess that
works for me.

								Honza

 
> To be fair, I've never been able to keep straight that down means lock
> and up means unlock.  Ah well, at least you didn't use "p" and "v".
> 
> Mechanically, the changes look ok to me.
> Acked-by: Darrick J. Wong <djwong@kernel.org>
> 
> --D
> 
> > +				     struct address_space *mapping2);
> > +
> > +
> >  /*
> >   * NOTE: in a 32bit arch with a preemptable kernel and
> >   * an UP compile the i_size_read/write must be atomic
> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index 4d9ec4c6cc34..d3801a9739aa 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -1009,6 +1009,44 @@ struct page *__page_cache_alloc(gfp_t gfp)
> >  EXPORT_SYMBOL(__page_cache_alloc);
> >  #endif
> >  
> > +/*
> > + * filemap_invalidate_down_write_two - lock invalidate_lock for two mappings
> > + *
> > + * Lock exclusively invalidate_lock of any passed mapping that is not NULL.
> > + *
> > + * @mapping1: the first mapping to lock
> > + * @mapping2: the second mapping to lock
> > + */
> > +void filemap_invalidate_down_write_two(struct address_space *mapping1,
> > +				       struct address_space *mapping2)
> > +{
> > +	if (mapping1 > mapping2)
> > +		swap(mapping1, mapping2);
> > +	if (mapping1)
> > +		down_write(&mapping1->invalidate_lock);
> > +	if (mapping2 && mapping1 != mapping2)
> > +		down_write_nested(&mapping2->invalidate_lock, 1);
> > +}
> > +EXPORT_SYMBOL(filemap_invalidate_down_write_two);
> > +
> > +/*
> > + * filemap_invalidate_up_write_two - unlock invalidate_lock for two mappings
> > + *
> > + * Unlock exclusive invalidate_lock of any passed mapping that is not NULL.
> > + *
> > + * @mapping1: the first mapping to unlock
> > + * @mapping2: the second mapping to unlock
> > + */
> > +void filemap_invalidate_up_write_two(struct address_space *mapping1,
> > +				     struct address_space *mapping2)
> > +{
> > +	if (mapping1)
> > +		up_write(&mapping1->invalidate_lock);
> > +	if (mapping2 && mapping1 != mapping2)
> > +		up_write(&mapping2->invalidate_lock);
> > +}
> > +EXPORT_SYMBOL(filemap_invalidate_up_write_two);
> > +
> >  /*
> >   * In order to wait for pages to become available there must be
> >   * waitqueues associated with pages. By using a hash table of
> > -- 
> > 2.26.2
> > 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
