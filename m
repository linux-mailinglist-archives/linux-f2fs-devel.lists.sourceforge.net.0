Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147337FCD0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 May 2021 19:49:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhFT2-0002h3-TL; Thu, 13 May 2021 17:49:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1lhFT0-0002gv-NH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 17:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G7y4WzOlxpF/7KXfCGzr0omNw0h1rmWzHZpZNtewbxE=; b=dU8AvlTIgGOR0YXhC4DMYX0GsK
 TWJ5IpUZ51CD4odZBx9AkMNmxcwYwjHun4wXwp6zaepAc82EOKgczC44mbFtnHoER87td5O4ffzhe
 yNtXhm+1uiARj1hAwOCxiPAatZqAq96CML3tUx8POaB0SUG3y9kAj5t9K9wJz+D3sOFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G7y4WzOlxpF/7KXfCGzr0omNw0h1rmWzHZpZNtewbxE=; b=mb8K6Hq503SmvLaz3Ec2zEQedp
 RmRr3o6JQ3iebSzgpd3XOMa4v3LgGdt1GwwIJBQ61bt8+Si++QyBSKB1RxO4DWxcji8ANyhVBq/5p
 u04IraaejTnG2BPyYrcyV53U8HGhHv1YxaXNiizkVy9FMZjGjwPekaCQ08DEB1r/V2RU=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lhFSv-0006o0-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 May 2021 17:49:46 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F23DAF83;
 Thu, 13 May 2021 17:49:36 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0670B1E0D30; Thu, 13 May 2021 19:49:36 +0200 (CEST)
Date: Thu, 13 May 2021 19:49:35 +0200
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210513174935.GI2734@quack2.suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
 <YJvkPEAdVhM9JsbN@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJvkPEAdVhM9JsbN@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lhFSv-0006o0-Ss
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

On Wed 12-05-21 15:20:44, Matthew Wilcox wrote:
> On Wed, May 12, 2021 at 03:46:11PM +0200, Jan Kara wrote:
> 
> > diff --git a/mm/truncate.c b/mm/truncate.c
> > index 57a618c4a0d6..93bde2741e0e 100644
> > --- a/mm/truncate.c
> > +++ b/mm/truncate.c
> > @@ -415,7 +415,7 @@ EXPORT_SYMBOL(truncate_inode_pages_range);
> >   * @mapping: mapping to truncate
> >   * @lstart: offset from which to truncate
> >   *
> > - * Called under (and serialised by) inode->i_rwsem.
> > + * Called under (and serialised by) inode->i_rwsem and inode->i_mapping_rwsem.
> 
> mapping->invalidate_lock, surely?

Right, thanks for noticing. 

> And could we ask lockdep to assert this for us instead of just a comment?

That's the plan but currently it would trip for filesystems unaware of
invalidate_lock. Once all filesystems are converted I plan to transform the
comments into actual asserts. In this series I aim at fixing the data
corruption issues, I plan the cleanups for later...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
