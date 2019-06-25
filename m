Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8952406
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 09:08:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hffYo-0001oW-26; Tue, 25 Jun 2019 07:08:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1hffYm-0001nt-3L
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 07:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ywoJoB1QtyyrG5KEQvKI03l1UYF9axIDMCYfP3oZi1M=; b=PH2mOQgrMcWKXwin3mg0Gh7X0W
 gInd+DIwiMucDa+ru2Vt0rsxJEyqZAbHU6RewXVGy3WWaSSJE4upnPf65jWQNcc3/MhDRLiA+ncsW
 MJL7/t6L/jwRh+rPqxdEmjfty4F2v5sgIPUShzJdqDEmq9MQ06kEthY/ZJg8TP0+rV/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ywoJoB1QtyyrG5KEQvKI03l1UYF9axIDMCYfP3oZi1M=; b=WlFQcp7yIxPXLieKBNdSTkCrxg
 FU2M9ZV47TtN4rt3vEA5yrpnZyHYTB0f2ri2xWDR6tiY0YwPaLgAMaAQFZMjPLE4mc97I6D8gUmNx
 PcJITSN9GhC/0b5zQHgDM60+4tS5WYhK77r3knkVlfoGrx1nmetyR4ofilL7ab6Xn9bg=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hffYr-00D7xk-4O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 07:08:15 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05584ADF2;
 Tue, 25 Jun 2019 07:08:05 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E62D81E2F23; Tue, 25 Jun 2019 09:08:04 +0200 (CEST)
Date: Tue, 25 Jun 2019 09:08:04 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190625070804.GA31527@quack2.suse.cz>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <156116142734.1664939.5074567130774423066.stgit@magnolia>
 <20190624113737.GG32376@quack2.suse.cz>
 <20190624215817.GE1611011@magnolia>
 <20190625030439.GA5379@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625030439.GA5379@magnolia>
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
X-Headers-End: 1hffYr-00D7xk-4O
Subject: Re: [f2fs-dev] [Ocfs2-devel] [PATCH 2/7] vfs: flush and wait for io
 when setting the immutable flag via SETFLAGS
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
Cc: linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
 clm@fb.com, adilger.kernel@dilger.ca, ocfs2-devel@oss.oracle.com,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 24-06-19 20:04:39, Darrick J. Wong wrote:
> On Mon, Jun 24, 2019 at 02:58:17PM -0700, Darrick J. Wong wrote:
> > On Mon, Jun 24, 2019 at 01:37:37PM +0200, Jan Kara wrote:
> > > On Fri 21-06-19 16:57:07, Darrick J. Wong wrote:
> > > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > > 
> > > > When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
> > > > need to ensure that userspace can't continue to write the file after the
> > > > file becomes immutable.  To make that happen, we have to flush all the
> > > > dirty pagecache pages to disk to ensure that we can fail a page fault on
> > > > a mmap'd region, wait for pending directio to complete, and hope the
> > > > caller locked out any new writes by holding the inode lock.
> > > > 
> > > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > 
> > > Seeing the way this worked out, is there a reason to have separate
> > > vfs_ioc_setflags_flush_data() instead of folding the functionality in
> > > vfs_ioc_setflags_check() (possibly renaming it to
> > > vfs_ioc_setflags_prepare() to indicate it does already some changes)? I
> > > don't see any place that would need these two separated...
> > 
> > XFS needs them to be separated.
> > 
> > If we even /think/ that we're going to be setting the immutable flag
> > then we need to grab the IOLOCK and the MMAPLOCK to prevent further
> > writes while we drain all the directio writes and dirty data.  IO
> > completions for the write draining can take the ILOCK, which means that
> > we can't have grabbed it yet.
> > 
> > Next, we grab the ILOCK so we can check the new flags against the inode
> > and then update the inode core.
> > 
> > For most filesystems I think it suffices to inode_lock and then do both,
> > though.
> 
> Heh, lol, that applies to fssetxattr, not to setflags, because xfs
> setflags implementation open-codes the relevant fssetxattr pieces.
> So for setflags we can combine both parts into a single _prepare
> function.

Yeah. Also for fssetxattr we could use the prepare helper at least for
ext4, f2fs, and btrfs where the situation isn't so complex as for xfs to
save some boilerplate code.

								Honza

> > > > +/*
> > > > + * Flush all pending IO and dirty mappings before setting S_IMMUTABLE on an
> > > > + * inode via FS_IOC_SETFLAGS.  If the flush fails we'll clear the flag before
> > > > + * returning error.
> > > > + *
> > > > + * Note: the caller should be holding i_mutex, or else be sure that
> > > > + * they have exclusive access to the inode structure.
> > > > + */
> > > > +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (!vfs_ioc_setflags_need_flush(inode, flags))
> > > > +		return 0;
> > > > +
> > > > +	inode_set_flags(inode, S_IMMUTABLE, S_IMMUTABLE);
> > > > +	ret = inode_flush_data(inode);
> > > > +	if (ret)
> > > > +		inode_set_flags(inode, 0, S_IMMUTABLE);
> > > > +	return ret;
> > > > +}
> > > 
> > > Also this sets S_IMMUTABLE whenever vfs_ioc_setflags_need_flush() returns
> > > true. That is currently the right thing but seems like a landmine waiting
> > > to trip? So I'd just drop the vfs_ioc_setflags_need_flush() abstraction to
> > > make it clear what's going on.
> > 
> > Ok.
> > 
> > --D
> > 
> > > 
> > > 								Honza
> > > -- 
> > > Jan Kara <jack@suse.com>
> > > SUSE Labs, CR
> > 
> > _______________________________________________
> > Ocfs2-devel mailing list
> > Ocfs2-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/ocfs2-devel
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
