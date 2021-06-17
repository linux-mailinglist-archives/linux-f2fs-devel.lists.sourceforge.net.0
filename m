Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6B3AB9C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 18:32:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltuwH-00011S-Jg; Thu, 17 Jun 2021 16:32:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1ltuwF-00010w-Gv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 16:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wr3uTtdWs6Pgr+PaUs+rolxZJ6JqfWbNoU6Tugbxqic=; b=NPNBMItfuwCZAA6dw33kztNeYa
 nrlzY64pf9DVfoFP5MmCnc8MyrMk/qC9wzhYP7pVGjYabRf+6dn8CMOvFJumgr1ZyeSbQYxjiMRz2
 1LARy01v0kbsM/0an8TV18xAFRTuvRyQ9B67bKQOu4DniSAyiGqHxqCdlYONW8yQ+KIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wr3uTtdWs6Pgr+PaUs+rolxZJ6JqfWbNoU6Tugbxqic=; b=RXKhRS01Ck+aSoBzJyRpp9mReV
 lv8V4vtPgLFsvpdPd5NyIJqOFIF9hvlOfGQG1Bg8+4XCzpzYF0EsvdnJs4t276eNLD8bA4QX0gR2C
 Zf8ITOWj3I+ZYCk+AXYAfVZwDz/ipVzZHQIt+YP74UerkU3OxVu8k3HiSQHwjugGOUgk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltuw3-0005Gm-6E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 16:32:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 004F760C40;
 Thu, 17 Jun 2021 16:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623947523;
 bh=Y9MAkFl/jnxhmbGYvknaytrWo1sMhzoDXlpyvDJDLcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p1laN/brbSgTDibxAQsTLRdkRN1MnOew8tSgdgKlVCVI1MlEEp0L2hf9ikKetvaC4
 uAgyrjowzm3LPxP/J+eYqNIucqkz0C/S3fiHpcih0eSCHg6B11tohcBFVkMZHtKhTm
 l6BPc1pt3LwR2/XCYAVMVdMD/rgSdXONuFnWdar8RvHsBC5EXWSMBQ3a8FJSsm+lj/
 E0OJ3YtI8D4CVDXkemlPhdYj3nnnWMruPPmhm0sKGiemcFZo/CPWeA8a+MqOgVJovq
 a2w24VN/WMnn2gVQgd9XAl+SCK74GV7QGWtqz0qQwCZ5ENt0n3IvCmmHSGIt9zYbjZ
 X+UHvUa1UU8aw==
Date: Thu, 17 Jun 2021 09:32:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210617163202.GR158209@locust>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMmOCK4wHc9lerEc@infradead.org>
 <20210616085304.GA28250@quack2.suse.cz>
 <20210616154705.GE158209@locust>
 <20210616155712.GC28250@quack2.suse.cz>
 <20210617162920.GQ158209@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617162920.GQ158209@locust>
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
X-Headers-End: 1ltuw3-0005Gm-6E
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

On Thu, Jun 17, 2021 at 09:29:20AM -0700, Darrick J. Wong wrote:
> On Wed, Jun 16, 2021 at 05:57:12PM +0200, Jan Kara wrote:
> > On Wed 16-06-21 08:47:05, Darrick J. Wong wrote:
> > > On Wed, Jun 16, 2021 at 10:53:04AM +0200, Jan Kara wrote:
> > > > On Wed 16-06-21 06:37:12, Christoph Hellwig wrote:
> > > > > On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > > > > > From: Pavel Reichl <preichl@redhat.com>
> > > > > > 
> > > > > > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > > > > > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > > > > > state of rw_semaphores hold by inode.
> > > > > 
> > > > > __xfs_rwsem_islocked doesn't seem to actually existing in any tree I
> > > > > checked yet?
> > > > 
> > > > __xfs_rwsem_islocked is introduced by this patch so I'm not sure what are
> > > > you asking about... :)
> > > 
> > > The sentence structure implies that __xfs_rwsem_islocked was previously
> > > introduced.  You might change the commit message to read:
> > > 
> > > "Introduce a new __xfs_rwsem_islocked predicate to encapsulate checking
> > > the state of a rw_semaphore, then refactor xfs_isilocked to use it."
> > > 
> > > Since it's not quite a straight copy-paste of the old code.
> > 
> > Ah, ok. Sure, I can rephrase the changelog (or we can just update it on
> > commit if that's the only problem with this series...). Oh, now I've
> > remembered I've promised you a branch to pull :) Here it is with this
> > change and Christoph's Reviewed-by tags:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git hole_punch_fixes
> 
> To catch-up the list with the ext4 concall:
> 
> Dave Chinner and I have been experimenting with accepting tagged pull
> requests, where the tag message is the most recent cover letter so that
> the git history can capture the broader justification for the series and
> the development revision history.  Signed tags would be ideal too,
> though given the impossibility of meeting in person to exchange gnupg
> keys (and the fact that one has to verify that the patches in the branch
> more or less match what's on the list) I don't consider that an
> impediment.
> 
> Also, if you want me to take this through the xfs tree then it would
> make things much easier if you could base this branch off 5.13-rc4, or
> something that won't cause a merge request to pull in a bunch of
> unrelated upstream changes.

Oh, and also: Please send pull requests as a new thread tagged '[GIT
PULL]' so the requests don't get buried in a patch reply thread.

--D

> --D
> 
> > 
> > 								Honza
> > -- 
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
