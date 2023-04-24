Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CC6EC62E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 08:22:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqpaw-0007zZ-St;
	Mon, 24 Apr 2023 06:22:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1pqpaw-0007zT-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 06:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m2RVkRM/RRfziaaa7EwKPpi+1lzJHXGOtI0HTD/B43k=; b=Uzb09zP0g4GQRu+8LomImTVRYX
 zoihlDJDiEd2pDBGHtHDGEiEruvjVQwPbxXDvthCmBpNacsHSF5CesDlOeC97t9UGlrkdzjCvSGSx
 hRLKgGd8jsAyYID0JDjq6Ibx8n3dUj0ZQcep/y1bESi/HrnkWH54ObNdQ8peQDK4b1a8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m2RVkRM/RRfziaaa7EwKPpi+1lzJHXGOtI0HTD/B43k=; b=IvvDxY/0C79lr6FmSxFisXvD48
 KmJAy0+TbEKtkq12HtsDa2PxqE+orG3m9jK8XZCYRiY4z6aIihX71FZGnkY9IfMaelrPRZYVNJywk
 WjCpR1ZOj5xgU8VVFbM8iBgxLhv5EGeNLkqooi8z5Qq5cvXPjrA1lt/3mnGQUqGgCDPk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqpat-00HItc-AB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 06:22:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 50A3B68B05; Mon, 24 Apr 2023 08:22:20 +0200 (CEST)
Date: Mon, 24 Apr 2023 08:22:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230424062220.GA10368@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-12-hch@lst.de>
 <20230424061825.GO360889@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230424061825.GO360889@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Apr 23, 2023 at 11:18:25PM -0700, Darrick J. Wong
 wrote: > > @@ -876, 8 +877, 11 @@ iomap_file_buffered_write(struct kiocb *iocb,
 struct iov_iter *i, > > if (iocb->ki_flags & IOCB_NOWAIT) > > it [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1pqpat-00HItc-AB
Subject: Re: [f2fs-dev] [PATCH 11/17] iomap: assign
 current->backing_dev_info in iomap_file_buffered_write
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Apr 23, 2023 at 11:18:25PM -0700, Darrick J. Wong wrote:
> > @@ -876,8 +877,11 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
> >  	if (iocb->ki_flags & IOCB_NOWAIT)
> >  		iter.flags |= IOMAP_NOWAIT;
> >  
> > +	current->backing_dev_info = inode_to_bdi(iter.inode);
> 
> Dumb question from me late on a Sunday night, but does the iomap_unshare
> code need to set this too?  Since it works by dirtying pagecache folios
> without actually changing the contents?

A very good question that I have no answer for.  The
current->backing_dev_info mechanism confuses the heck out of me and
appears basically undocumented.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
