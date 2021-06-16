Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374C3AA067
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 17:50:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltXoL-0003dY-Ng; Wed, 16 Jun 2021 15:50:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <djwong@kernel.org>) id 1ltXoK-0003cb-MX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 15:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+htH99SFU1rmFKZ2VaNhlf/2ZMxeOPC6APaQGNynreo=; b=NzjEXQy0Q/fZRALZEiAxbLbVwq
 ruv8BDES8Y4iTMIO8Tnz68OwXw5bkthOx7aTi3kK2BN/YQHVfz9oto82/ng72sb1zTURefCzRzw7a
 RCX0ChhfWzxsci9jdVK/a3IYCSxX6i7WB25kQvbFNX53cmh3g2q4DgUnbpSLjME3Vkfg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+htH99SFU1rmFKZ2VaNhlf/2ZMxeOPC6APaQGNynreo=; b=jSDfQpVxPIqaJOEEc0v1y4fJPz
 baYZLDO93MNNmRWMe7s1tEEPu94dFF7EmCBFOs10y66uVY6oSc57bpIzWm9gwlSAL8w/KtN8UcM0G
 +8moc4zjtEAjxgop4TFyeNeU0lUU7C5i6IAAEh1J9K7RKfKIkXBCdsdsvzrTH/yr6JqU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltXl0-00084f-0l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 15:47:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE66F61027;
 Wed, 16 Jun 2021 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623858425;
 bh=OHnFfLs1QbSWuvd+00QSmxA7rj2+r71j9JxqIC1dccs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cm9BcOlm6gd25cL9Pa/hoPc8RYWVSw4N7Ny2T14PC0IS5cEEKEAGVJSkSivywsUMG
 u1I+5M+S3w4H9xm0XXvSaG/eYLypq966O1/gB/og7CP7v7LQfI0gmF81TfvWwHMulQ
 +8ZHAH7F+vVf9Jsx0tkuGVjciUErP0ANSrnHaR1QB7uXaz8hX8talAwZMqD/4nt/vg
 uXS6pjhRhAVPdC8/OKpqsAtGsOM3IHzZ4cHjKAt/AJrAXmYYUf4ECPGbYh3tScVu1X
 oAjQegVZuY98P7j8xq+U+nKaGh+CfwxlZjVcSTxYrIsY3RStpHq5x4KYVvrcVtoI1E
 c9FsYX78QhScg==
Date: Wed, 16 Jun 2021 08:47:05 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210616154705.GE158209@locust>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMmOCK4wHc9lerEc@infradead.org>
 <20210616085304.GA28250@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616085304.GA28250@quack2.suse.cz>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ltXl0-00084f-0l
Subject: Re: [f2fs-dev] [PATCH 07/14] xfs: Refactor xfs_isilocked()
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>,
 Dave Chinner <dchinner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Pavel Reichl <preichl@redhat.com>,
 Johannes Thumshirn <jth@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 16, 2021 at 10:53:04AM +0200, Jan Kara wrote:
> On Wed 16-06-21 06:37:12, Christoph Hellwig wrote:
> > On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > > From: Pavel Reichl <preichl@redhat.com>
> > > 
> > > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > > state of rw_semaphores hold by inode.
> > 
> > __xfs_rwsem_islocked doesn't seem to actually existing in any tree I
> > checked yet?
> 
> __xfs_rwsem_islocked is introduced by this patch so I'm not sure what are
> you asking about... :)

The sentence structure implies that __xfs_rwsem_islocked was previously
introduced.  You might change the commit message to read:

"Introduce a new __xfs_rwsem_islocked predicate to encapsulate checking
the state of a rw_semaphore, then refactor xfs_isilocked to use it."

Since it's not quite a straight copy-paste of the old code.

--D

> 
> 								Honza
> 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
