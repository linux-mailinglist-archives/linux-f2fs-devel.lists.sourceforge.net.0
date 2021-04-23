Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB536A7B4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 16:10:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lafSn-00062W-Q6; Sun, 25 Apr 2021 14:10:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <willy@infradead.org>) id 1lafSl-00062I-0J
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 14:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=19MC/ECN3OWEttJSfNKYhsEBI3DWNTT+3puFZa754BA=; b=RuuIC6cC7l1J+uFgC7O10JxY3S
 03oZAQFewki0zWOhE+Vmnm9p0PBvKPoi1ORXma2vfutNmnEcwfqyuPPrdGk4Drh9c3Ucxs4H2tMKf
 +IH20JKjfKO/gUYtg/taa7XZYbliuxuwoXH2CEGU/WW3kMAKmOu2hZ96e/qgL7eLp9rw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=19MC/ECN3OWEttJSfNKYhsEBI3DWNTT+3puFZa754BA=; b=DStNRc1tn0SHsar3FnehHZRhEt
 ijrcI7uXkcxv9HrGKaJQN9UrShcpiwL7Qyf0emcWSWWrUfnVzTpFxKa1uiurn1n6JMsRL5Te/pKhU
 Fdq+VREys5BLXtF00xmP84YVAt/Tcvu95P7pmGgFddJDw4tzPgpkviqyo4I3LacrPkeE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lafSj-007AxW-Ki
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 14:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=19MC/ECN3OWEttJSfNKYhsEBI3DWNTT+3puFZa754BA=; b=q2fnOVoW6AVeExxSOF8pr+ERGP
 yfxbQCEhL3SoJ9S4pecr6zRB0GmmsCxrZukyAdiAMif6SHNvdOE1E7U120Ij1sP+Z3+wdrWsoURWi
 PmYCkHgT1eriQFe7P0ERXjHBCO+9JlTYV8aQVmtgIJjR8lvgL3cyavi3FEjHoHFTxc21WAQ4f2Zz+
 sV1Z4B6IbOjs6KU46Pmsh7fntCFyTamR96j2R8oTTo7FP6sAhPbe7AQKxieTOEdSvtIYQdjJzcTxN
 +xIAsRybN9Pq4T5YBkQNFpvPqSZSTBjscy226S2phOUwKGDjVYieWIwk09t7BsYB4/T18YLR5tOTh
 NjjW6VQg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1la0Zc-002EBZ-Af; Fri, 23 Apr 2021 18:30:48 +0000
Date: Fri, 23 Apr 2021 19:30:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210423183040.GD235567@casper.infradead.org>
References: <20210423171010.12-1-jack@suse.cz>
 <20210423173018.23133-2-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423173018.23133-2-jack@suse.cz>
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
X-Headers-End: 1lafSj-007AxW-Ki
Subject: Re: [f2fs-dev] [PATCH 02/12] mm: Protect operations adding pages to
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-cifs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@google.com>,
 linux-ext4@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, Steve French <sfrench@samba.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 23, 2021 at 07:29:31PM +0200, Jan Kara wrote:
> Currently, serializing operations such as page fault, read, or readahead
> against hole punching is rather difficult. The basic race scheme is
> like:
> 
> fallocate(FALLOC_FL_PUNCH_HOLE)			read / fault / ..
>   truncate_inode_pages_range()
> 						  <create pages in page
> 						   cache here>
>   <update fs block mapping and free blocks>
> 
> Now the problem is in this way read / page fault / readahead can
> instantiate pages in page cache with potentially stale data (if blocks
> get quickly reused). Avoiding this race is not simple - page locks do
> not work because we want to make sure there are *no* pages in given
> range.

One of the things I've had in mind for a while is moving the DAX locked
entry concept into the page cache proper.  It would avoid creating the
new semaphore, at the cost of taking the i_pages lock twice (once to
insert the entries that cover the range, and once to delete the entries).

It'd have pretty much the same effect, though -- read/fault/... would
block until the entry was deleted from the page cache.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
