Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E41638F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 02:04:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4DnA-0006ZL-H1; Wed, 19 Feb 2020 01:04:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j4Dn9-0006ZD-7F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0P8kXEphX0Bo54UkfRtPgvbODxf5K74L2bNQivkGKvE=; b=JduMel4X/LSYBiYUNZaVQGk2f+
 RHcuguqjt610qRxVhnppYvuZinWkNSmIqsYoWhIyOYsRPsJoCrTfmHiw0BQzxmjcvFyZmkq1fAZ+K
 SOyl+bt6t9XOiHImx6ftYSSd79O66i+PzUDRK+vAy/+7gbduNluc2WNUZyJlNGLstPMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0P8kXEphX0Bo54UkfRtPgvbODxf5K74L2bNQivkGKvE=; b=Pm/47WgmH0521ZbkfEK2J7jkHB
 BVol1kC0vi5ND6bvEu17TiXS4fY9hX8NGzSscw9s3Pci7Gv5USuRNndDiCCz5JTpI8W9Zk09huzOG
 DpmuBxUBCPL4iQcaFBO/jlfKXrYwJcpCBVXkgOxk5j/N/DxHdfyxugths/Jlx1qlQJgE=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j4Dn6-007ToV-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 01:04:43 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 832B83A331C;
 Wed, 19 Feb 2020 12:04:32 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j4Dmx-0004dF-Ul; Wed, 19 Feb 2020 12:04:31 +1100
Date: Wed, 19 Feb 2020 12:04:31 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219010431.GW10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-14-willy@infradead.org>
 <20200218062147.GN10776@dread.disaster.area>
 <20200218161004.GR7778@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218161004.GR7778@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=J8tHrh_ofsGOLyDWh6kA:9
 a=ffwTswad_GV-5CZc:21 a=o0rOaByW-dbbsVyy:21 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [211.29.132.249 listed in wl.mailspike.net]
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Dn6-007ToV-Hy
Subject: Re: [f2fs-dev] [PATCH v6 08/19] mm: Add readahead address space
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

On Tue, Feb 18, 2020 at 08:10:04AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 05:21:47PM +1100, Dave Chinner wrote:
> > On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > 
> > > This replaces ->readpages with a saner interface:
> > >  - Return void instead of an ignored error code.
> > >  - Pages are already in the page cache when ->readahead is called.
> > 
> > Might read better as:
> > 
> >  - Page cache is already populates with locked pages when
> >    ->readahead is called.
> 
> Will do.
> 
> > >  - Implementation looks up the pages in the page cache instead of
> > >    having them passed in a linked list.
> > 
> > Add:
> > 
> >  - cleanup of unused readahead handled by ->readahead caller, not
> >    the method implementation.
> 
> The readpages caller does that cleanup too, so it's not an advantage
> to the readahead interface.

Right. I kinda of read the list as "the reasons the new API is sane"
not as "how readahead is different to readpages"....

> > >  ``readpages``
> > >  	called by the VM to read pages associated with the address_space
> > >  	object.  This is essentially just a vector version of readpage.
> > >  	Instead of just one page, several pages are requested.
> > >  	readpages is only used for read-ahead, so read errors are
> > >  	ignored.  If anything goes wrong, feel free to give up.
> > > +	This interface is deprecated; implement readahead instead.
> > 
> > What is the removal schedule for the deprecated interface? 
> 
> I mentioned that in the cover letter; once Dave Howells has the fscache
> branch merged, I'll do the remaining filesystems.  Should be within the
> next couple of merge windows.

Sure, but I like to see actual release tags with the deprecation
notice so that it's obvious to the reader as to whether this is
something new and/or when they can expect it to go away.

> > > +/* The byte offset into the file of this readahead block */
> > > +static inline loff_t readahead_offset(struct readahead_control *rac)
> > > +{
> > > +	return (loff_t)rac->_start * PAGE_SIZE;
> > > +}
> > 
> > Urk. Didn't an early page use "offset" for the page index? That
> > was was "mm: Remove 'page_offset' from readahead loop" did, right?
> > 
> > That's just going to cause confusion to have different units for
> > readahead "offsets"....
> 
> We are ... not consistent anywhere in the VM/VFS with our naming.
> Unfortunately.
> 
> $ grep -n offset mm/filemap.c 
> 391: * @start:	offset in bytes where the range starts
> ...
> 815:	pgoff_t offset = old->index;
> ...
> 2020:	unsigned long offset;      /* offset into pagecache page */
> ...
> 2257:	*ppos = ((loff_t)index << PAGE_SHIFT) + offset;
> 
> That last one's my favourite.  Not to mention the fine distinction you
> and I discussed recently between offset_in_page() and page_offset().
> 
> Best of all, even our types encode the ambiguity of an 'offset'.  We have
> pgoff_t and loff_t (replacing the earlier off_t).
> 
> So, new rule.  'pos' is the number of bytes into a file.  'index' is the
> number of PAGE_SIZE pages into a file.  We don't use the word 'offset'
> at all.  'length' as a byte count and 'count' as a page count seem like
> fine names to me.

That sounds very reasonable to me. Another patchset in the making? :)

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
