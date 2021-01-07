Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3002ED082
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 14:19:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxVC2-0006py-Mb; Thu, 07 Jan 2021 13:19:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kxVC0-0006pr-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 13:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6w5EPe3u2kEIsuhAHgCf//J8LlMZwRrQB5I4LCozog=; b=VbTLtklWnCUNu0T1RIKeY79i5r
 5A38vTH6mL1l/fs9c1dDzK6NNXtDIs8Ng9kl6dexG/i5VNJpMuQ83nvzK2QU2Z9nAnjsiVXaQTer0
 H/XQo5HkoFQ9p2/TDVKvyqQqwmfOnYz7iUJf7Kwjao60q6NNBexk6MGkAsgLIBsy0FB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a6w5EPe3u2kEIsuhAHgCf//J8LlMZwRrQB5I4LCozog=; b=LpDbs/v9grVpUtnEqDaAP9ceXm
 RhX6Psnr1NwDJ7EOdJCKzKOpk3207ygSK2J4vQo1oe1rCbFRgXaV1XpZqawisbLN1pRet21qH+DTM
 jIiOYyd/8tv+2zU5exwFW+H1BIRMJFrpv/Ulzv3fpkV9/o6+XIsgCaw6c6Cz8Im8MRDs=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxVBs-0045tl-AS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 13:19:08 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05D4CAD12;
 Thu,  7 Jan 2021 13:18:54 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id C69871E0872; Thu,  7 Jan 2021 14:18:53 +0100 (CET)
Date: Thu, 7 Jan 2021 14:18:53 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210107131853.GA10535@quack2.suse.cz>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-6-ebiggers@kernel.org>
 <20210107131753.GD12990@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107131753.GD12990@quack2.suse.cz>
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
X-Headers-End: 1kxVBs-0045tl-AS
Subject: Re: [f2fs-dev] [PATCH 05/13] fs: don't call ->dirty_inode for
 lazytime timestamp updates
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 07-01-21 14:17:53, Jan Kara wrote:
> On Mon 04-01-21 16:54:44, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > There is no need to call ->dirty_inode for lazytime timestamp updates
> > (i.e. for __mark_inode_dirty(I_DIRTY_TIME)), since by the definition of
> > lazytime, filesystems must ignore these updates.  Filesystems only need
> > to care about the updated timestamps when they expire.
> > 
> > Therefore, only call ->dirty_inode when I_DIRTY_INODE is set.
> > 
> > Based on a patch from Christoph Hellwig:
> > https://lore.kernel.org/r/20200325122825.1086872-4-hch@lst.de
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> ...
> 
> > diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> > index 081e335cdee47..e3347fd6eb13a 100644
> > --- a/fs/fs-writeback.c
> > +++ b/fs/fs-writeback.c
> > @@ -2264,16 +2264,16 @@ void __mark_inode_dirty(struct inode *inode, int flags)
> >  	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
> >  	 * dirty the inode itself
> >  	 */
> > -	if (flags & (I_DIRTY_INODE | I_DIRTY_TIME)) {
> > +	if (flags & I_DIRTY_INODE) {
> >  		trace_writeback_dirty_inode_start(inode, flags);
> >  
> >  		if (sb->s_op->dirty_inode)
> >  			sb->s_op->dirty_inode(inode, flags);
> 
> OK, but shouldn't we pass just (flags & I_DIRTY_INODE) to ->dirty_inode().
> Just to make it clear what the filesystem is supposed to consume in
> 'flags'...

Aha, you just did that in the following patch ;) So taking back my comment.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
