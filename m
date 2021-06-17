Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 037003AB9B6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 18:29:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltutc-0006X9-6A; Thu, 17 Jun 2021 16:29:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1ltutb-0006X2-A5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 16:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EapT3vh63pjhkWk8H9+mA1mJtnf35my7OcqokMI0/ZE=; b=QyG0I2cqx0RfKd8v7v5OogB7cp
 T3XOa5PJKo/FqDkRWRIVbarEKuyoraTv1TmvLB7BtE0/GJKj8mWV3L+G9J9epK5mlfzyQfES+b7VG
 xmkzo9a8nCqqjKtqn5fdPSMEdwjSvwB52UU0cNkTPqBm4SG3c0vZbNJEBiUS6V8hOS1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EapT3vh63pjhkWk8H9+mA1mJtnf35my7OcqokMI0/ZE=; b=RCutruBXKxZHRAgFTDtvcF1mum
 ZNbQx1CBUPxcoWR3vqBN1fM6pb+BEihrWrsJVZl9STDsW/fDO2pAIRdJC4mlKmrmTP/t1hoO+pfDh
 9YdiMx1R/f3nFWYD4Stw76gZIy2Vhfc8GAGzR030zoPIL0igj6jtqLJoxJM5dex6KKFg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltutR-00DyNn-V8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 16:29:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79A94613BA;
 Thu, 17 Jun 2021 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623947360;
 bh=mJZQV1vxocj7euRW0nT/05QY8fLmBObA9PEvkSXwGbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lf2U+HBBUGC5z5kAj9MHkK5HIcDDz7Up0PvUr7OeUCUcRar04h4Lc3Gd+yRgPfJH0
 2Hi/Pi+0IQXA4diDwHG8bIkqmmaVYowxNLbSmIFcHKgl1mxu6koWmIT/eTjlLAKMst
 7P5g8Ydyakv+C3mBPX2AcnZsh6vM7Jy/EysUA4bvy5DynhGcC1rLUa4NV/2nJ/8YV8
 p2W7L88KQrXkqQ4aDaEH1hsd4evJuWvtj5PQQDEKZPed8IObhikWe2bNv05Ot1AnjN
 SoMF+Afdi6x2tubNbWPyIRlBkg3AidNGZOgcBGJu+d7lGY5r/ZMyg0Ylhhsi12qGwG
 hIQfFYtezV2dg==
Date: Thu, 17 Jun 2021 09:29:20 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210617162920.GQ158209@locust>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMmOCK4wHc9lerEc@infradead.org>
 <20210616085304.GA28250@quack2.suse.cz>
 <20210616154705.GE158209@locust>
 <20210616155712.GC28250@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616155712.GC28250@quack2.suse.cz>
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
X-Headers-End: 1ltutR-00DyNn-V8
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

On Wed, Jun 16, 2021 at 05:57:12PM +0200, Jan Kara wrote:
> On Wed 16-06-21 08:47:05, Darrick J. Wong wrote:
> > On Wed, Jun 16, 2021 at 10:53:04AM +0200, Jan Kara wrote:
> > > On Wed 16-06-21 06:37:12, Christoph Hellwig wrote:
> > > > On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > > > > From: Pavel Reichl <preichl@redhat.com>
> > > > > 
> > > > > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > > > > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > > > > state of rw_semaphores hold by inode.
> > > > 
> > > > __xfs_rwsem_islocked doesn't seem to actually existing in any tree I
> > > > checked yet?
> > > 
> > > __xfs_rwsem_islocked is introduced by this patch so I'm not sure what are
> > > you asking about... :)
> > 
> > The sentence structure implies that __xfs_rwsem_islocked was previously
> > introduced.  You might change the commit message to read:
> > 
> > "Introduce a new __xfs_rwsem_islocked predicate to encapsulate checking
> > the state of a rw_semaphore, then refactor xfs_isilocked to use it."
> > 
> > Since it's not quite a straight copy-paste of the old code.
> 
> Ah, ok. Sure, I can rephrase the changelog (or we can just update it on
> commit if that's the only problem with this series...). Oh, now I've
> remembered I've promised you a branch to pull :) Here it is with this
> change and Christoph's Reviewed-by tags:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git hole_punch_fixes

To catch-up the list with the ext4 concall:

Dave Chinner and I have been experimenting with accepting tagged pull
requests, where the tag message is the most recent cover letter so that
the git history can capture the broader justification for the series and
the development revision history.  Signed tags would be ideal too,
though given the impossibility of meeting in person to exchange gnupg
keys (and the fact that one has to verify that the patches in the branch
more or less match what's on the list) I don't consider that an
impediment.

Also, if you want me to take this through the xfs tree then it would
make things much easier if you could base this branch off 5.13-rc4, or
something that won't cause a merge request to pull in a bunch of
unrelated upstream changes.

--D

> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
