Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A937FA692
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 17:34:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7eYV-0006aY-EX;
	Mon, 27 Nov 2023 16:33:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1r7eYP-0006aD-LG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 16:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=myDkryiWrW7/jfvDLq6z3l1ZBn8K8kvBT3Ozs0QpG20=; b=LENXYZF4TDwS/G17w0dHWFUz2v
 f94UYkUjbhBapJhQQq79N+tsRVzXJlrnCJ3AFi3Yup+oS73NIBwOrfMRWJ2Ahc6Z//Qbcf67L7d1P
 LL7TS7BCy7t7xoagcEVjyfnI9j4k4q0TxkszzjxHFkCgetNts9ubEizPYoavlGiAiau4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=myDkryiWrW7/jfvDLq6z3l1ZBn8K8kvBT3Ozs0QpG20=; b=enMFaV9yczpvLHJD0ib6UIZZzT
 G17Q3q/xrW1QeK9rC8440PJyi6qutSCtgGW/V6ZDjj8itx43sa1cYAl0GdTwWKLQW90+alO2Zbclx
 PGQm6l4HmLgzQqCK3hDES07h6emSLK8/pahoKQUmnIIWqK3wD2WC11PxVBUaETiOHry0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7eYP-00H9Ee-29 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 16:33:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B4ABBB836A2;
 Mon, 27 Nov 2023 16:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9D7C433C7;
 Mon, 27 Nov 2023 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701102822;
 bh=nCgDLV4MczD4XXDGX2/XHEoKN2tlT2ANR9j1sp/JHUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFFKt82Ms150CvjVEeU6o98B2y1TL/JwPx0YRqcQVdG8iJkBiOQcN3+5puAZ5n6m0
 PSTMGt4yddACqFs40bXtKXKwDgZf1WeiA2VLfaiHZiPzLnDBC4WBQFXYPdDNQ1wE/X
 jZ6siYJv98pd/+Yga09t/YorVmsnU5qNQOwbguwgJeYM/LkLYnw6dOuYDLZsil3d6V
 MDcrWbbqdB1e9ZLlcP3zw0RRR/AvLvXaxbJxpbc6q3PUlUmwGSmo8WiWFe+N12zGdD
 DBGuAbVXfz9Bcxw4vpZPquCJ8bTPlXfKrnBQzPZEtfY6cqU9ebaqbTHCsMJ2HhL6MU
 tK+Er2jvGJovw==
Date: Mon, 27 Nov 2023 17:33:36 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20231127-lahmlegen-redeverbot-43de4b46063c@brauner>
References: <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <87leangoqe.fsf@>
 <20231125220136.GB38156@ZenIV> <20231126045219.GD38156@ZenIV>
 <20231126184141.GF38156@ZenIV> <20231127063842.GG38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127063842.GG38156@ZenIV>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 27, 2023 at 06:38:42AM +0000, Al Viro wrote: >
 On Sun, Nov 26, 2023 at 06:41:41PM +0000, Al Viro wrote: > > > d_invalidate()
 situation is more subtle - we need to sort out its interplay > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7eYP-00H9Ee-29
Subject: Re: [f2fs-dev] fun with d_invalidate() vs. d_splice_alias() was Re:
 [PATCH v6 0/9] Support negative dentries on case-insensitive ext4 and f2fs
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
Cc: tytso@mit.edu, Miklos Szeredi <miklos@szeredi.hu>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 27, 2023 at 06:38:42AM +0000, Al Viro wrote:
> On Sun, Nov 26, 2023 at 06:41:41PM +0000, Al Viro wrote:
> 
> > d_invalidate() situation is more subtle - we need to sort out its interplay
> > with d_splice_alias().
> > 
> > More concise variant of the scenario in question:
> > * we have /mnt/foo/bar and a lot of its descendents in dcache on client
> > * server does a rename, after which what used to be /mnt/foo/bar is /mnt/foo/baz
> > * somebody on the client does a lookup of /mnt/foo/bar and gets told by
> > the server that there's no directory with that name anymore.
> > * that somebody hits d_invalidate(), unhashes /mnt/foo/bar and starts
> > evicting its descendents
> > * We try to mount something on /mnt/foo/baz/blah.  We look up baz, get
> > an fhandle and notice that there's a directory inode for it (/mnt/foo/bar).
> > d_splice_alias() picks the bugger and moves it to /mnt/foo/baz, rehashing
> > it in process, as it ought to.  Then we find /mnt/foo/baz/blah in dcache and 
> > mount on top of it.
> > * d_invalidate() finishes shrink_dcache_parent() and starts hunting for
> > submounts to dissolve.  And finds the mount we'd done.  Which mount quietly
> > disappears.
> > 
> > Note that from the server POV the thing had been moved quite a while ago.
> > No server-side races involved - all it seeem is a couple of LOOKUP in the
> > same directory, one for the old name, one for the new.
> > 
> > On the client on the mounter side we have an uneventful mount on /mnt/foo/baz,
> > which had been there on server at the time we started and which remains in
> > place after mount we'd created suddenly disappears.
> > 
> > For the thread that ended up calling d_invalidate(), they'd been doing e.g.
> > stat on a pathname that used to be there a while ago, but currently isn't.
> > They get -ENOENT and no indication that something odd might have happened.
> > 
> > >From ->d_revalidate() point of view there's also nothing odd happening -
> > dentry is not a mountpoint, it stays in place until we return and there's
> > no directory entry with that name on in its parent.  It's as clear-cut
> > as it gets - dentry is stale.
> > 
> > The only overlap happening there is d_splice_alias() hitting in the middle
> > of already started d_invalidate().
> > 
> > For a while I thought that ff17fa561a04 "d_invalidate(): unhash immediately"
> > and 3a8e3611e0ba "d_walk(): kill 'finish' callback" might have something
> > to do with it, but the same problem existed prior to that.
> > 
> > FWIW, I suspect that the right answer would be along the lines of
> > 	* if d_splice_alias() does move an exsiting (attached) alias in
> > place, it ought to dissolve all mountpoints in subtree being moved.
> > There might be subtleties, but in case when that __d_unalias() happens
> > due to rename on server this is definitely the right thing to do.
> > 	* d_invalidate() should *NOT* do anything with dentry that
> > got moved (including moved by d_splice_alias()) from the place we'd
> > found it in dcache.  At least d_invalidate() done due to having
> > ->d_revalidate() return 0.
> > 	* d_invalidate() should dissolve all mountpoints in the
> > subtree that existed when it got started (and found the victim
> > still unmoved, that is).  It should (as it does) prevent any
> > new mountpoints added in that subtree, unless the mountpoint
> > to be had been moved (spliced) out.  What it really shouldn't
> > do is touch the mountpoints that are currently outside of it
> > due to moves.
> > 
> > I'm going to look around and see if we have any weird cases where
> > d_splice_alias() is used for things like "correct the case of
> > dentry name on a case-mangled filesystem" - that would presumably
> > not want to dissolve any submounts.  I seem to recall seeing
> > some shite of that sort, but that was a long time ago.
> > 
> > Eric, Miklos - it might be a good idea if you at least took a
> > look at whatever comes out of that (sub)thread; I'm trying to
> > reconstruct the picture, but the last round of serious reworking
> > of that area had been almost 10 years ago and your recollections
> > of the considerations back then might help.  I realize that they
> > are probably rather fragmentary (mine definitely are) and any
> > analysis will need to be redone on the current tree, but...
> 
> TBH, I wonder if we ought to have d_invalidate() variant that would
> unhash the dentry in question, do a variant of shrink_dcache_parent()
> that would report if there had been any mountpoints and if there
> had been any, do namespace_lock() and go hunting for mounts in that
> subtree, moving corresponding struct mountpoint to a private list
> as we go (removing them from mountpoint hash chains, that it).  Then
> have them all evicted after we'd finished walking the subtree...

That sounds reasonable.

> 
> The tricky part will be lock ordering - right now we have the
> mountpoint hash protected by mount_lock (same as mount hash, probably
> worth splitting anyway) and that nests outside of ->d_lock.
> 
> Note that we don't do mountpoint hash lookups on mountpoint crossing
> - it's nowhere near the really hot paths.  What we have is
> 	lookup_mountpoint() - plain hash lookup.  Always
> under namespace_lock() and mount_lock.
> 	get_mountpoint() - there's an insertion into hash chain,
> with dentry passed through the d_set_mounted(), which would
> fail if we have d_invalidate() on the subtree.
> Also always under namespace_lock() and mount_lock.
> 	__put_mountpoint() - removal from the hash chain.
> We remove from hash chain after having cleared DCACHE_MOUNTED.
> _That_ can happen under mount_lock alone (taking out the stuck
> submounts on final mntput()).
> 
> So convert the mountpoint hash chains to hlist_bl, bitlocks nesting under
> ->d_lock.  Introduce a new dentry flag (DCHACE_MOUNT_INVALIDATION?)
> In d_walk() callback we would
> 	* do nothing if DCACHE_MOUNT is not set or DCACHE_MOUNT_INVALIDATION
> is.
> 	* otherwise set DCACHE_MOUNT_INVALIDATION, grab the bitlock on the
> mountpoint hash chain matching that dentry, find struct mountpoint in it,
> remove it from the chain and insert into a separate "collector" chain, all
> without messing with refcount.

Ok.

> In lookup_mountpoint() and get_mountpoint() take the bitlock on chain.
> In __put_mountpoint(), once it has grabbed ->d_lock
> 	* check if it has DCACHE_MOUNT_INVALIDATION, use that to
> decide which chain we are locking - the normal one or the collector
> 	* clear both DCACHE_MOUNT and DCACHE_MOUNT_INVALIDATION
> 	* remove from chain
> 	* unlock the chain
> 	* drop ->d_lock.
> 
> Once we are finished walking the tree, go over the collector list
> and do what __detach_mount() guts do.  We are no longer under
> any ->d_lock, so locking is not a problem.  namespace_unlock() will
> flush them all, same as it does for __detach_mount().

Ok.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
