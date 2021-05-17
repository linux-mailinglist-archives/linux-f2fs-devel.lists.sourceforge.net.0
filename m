Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A55382AD1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 May 2021 13:21:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1libJX-0007bv-7y; Mon, 17 May 2021 11:21:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1libJU-0007bU-RJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 May 2021 11:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QP4OjDET8BQ5uApdcIrdgvHNn5bel6y9WRlouuY+4gw=; b=jBtlyIr0W47lsop7W7y/RT9yUd
 JKgZUmgpiH/OR+LrYs8XMF1gouX36yTeQA695IkMW8nsKX6n6YJa1AillbzwuJRQ8FWzzxuNzeptC
 QSBryQYYbp5rgJ7yezjJEPNaqGdlXQhV0sbN52dCrLV7lSi6PGQvJVDR3XgHHgdgDMjc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QP4OjDET8BQ5uApdcIrdgvHNn5bel6y9WRlouuY+4gw=; b=FmZO+1QpqRxgdx4QfiDaroLjnH
 x+iWf7T/FCsJWYIb4ykq6tNGt65w+FA8FSQwFchuRT1MygTA5rQwFiDfIsfZHUZ1DB2idFCPR82H5
 vN8DNWRkAdojWf5NIclY0EgKKzK2yqiHN2lwbwp4lsb9M7h1PiHjDDOKcfHWqaRJpujY=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1libJP-00BNH9-U1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 May 2021 11:21:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7294AED7;
 Mon, 17 May 2021 11:21:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 56F6D1F2CA4; Mon, 17 May 2021 13:21:15 +0200 (CEST)
Date: Mon, 17 May 2021 13:21:15 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210517112115.GC31755@quack2.suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
 <20210512152345.GE8606@magnolia>
 <20210513174459.GH2734@quack2.suse.cz>
 <20210513185252.GB9675@magnolia>
 <20210513231945.GD2893@dread.disaster.area>
 <20210514161730.GL9675@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210514161730.GL9675@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1libJP-00BNH9-U1
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ted Tso <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 14-05-21 09:17:30, Darrick J. Wong wrote:
> On Fri, May 14, 2021 at 09:19:45AM +1000, Dave Chinner wrote:
> > We've been down this path before more than a decade ago when the
> > powers that be decreed that inode locking order is to be "by
> > structure address" rather than inode number, because "inode number
> > is not unique across multiple superblocks".
> > 
> > I'm not sure that there is anywhere that locks multiple inodes
> > across different superblocks, but here we are again....
> 
> Hm.  Are there situations where one would want to lock multiple
> /mappings/ across different superblocks?  The remapping code doesn't
> allow cross-super operations, so ... pipes and splice, maybe?  I don't
> remember that code well enough to say for sure.

Splice and friends work one file at a time. I.e., first they fill a pipe
from the file with ->read_iter, then they flush the pipe to the target file
with ->write_iter. So file locking doesn't get coupled there.

> I've been operating under the assumption that as long as one takes all
> the same class of lock at the same time (e.g. all the IOLOCKs, then all
> the MMAPLOCKs, then all the ILOCKs, like reflink does) that the
> incongruency in locking order rules within a class shouldn't be a
> problem.

That's my understanding as well.

> > > It might simply be time to convert all
> > > three XFS inode locks to use the same ordering rules.
> > 
> > Careful, there lie dragons along that path because of things like
> > how the inode cluster buffer operations work - they all assume
> > ascending inode number traversal within and across inode cluster
> > buffers and hence we do have locking order constraints based on
> > inode number...
> 
> Fair enough, I'll leave the ILOCK alone. :)

OK, so should I change the order for invalidate_lock or shall we just leave
that alone as it is not a practical problem AFAICT.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
