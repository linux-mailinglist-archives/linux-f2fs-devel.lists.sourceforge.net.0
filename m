Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97D7F94E8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Nov 2023 19:42:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7K50-0004Wi-GJ;
	Sun, 26 Nov 2023 18:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r7K4s-0004WN-Vz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Nov 2023 18:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SjbDkmPx2n6JHS7S/0Pm5UBLkdkT/hge08q6RFQNKe0=; b=YQxWY5QZMlELRNyyWwWlMmPIs7
 jdBljMwsRYPAgpaL3MNNblA0UbxuVJKUxtN3qRHkCxsXDRzR/wBeV8p0kbo3Mo4VTFOW3xpug4E8O
 6gFbM8+laC1j9LtP/U5hVfwSA+4oAZ6ox5lhWbjAmbsb+Zhn2PvOamuXZepXQX6mDXII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SjbDkmPx2n6JHS7S/0Pm5UBLkdkT/hge08q6RFQNKe0=; b=QXVCw0pQ7EV0iipta+KbRTlHiy
 QvAtea3ubSeDqtdywHCJofK7vYW08+zJBbKjohX5YwB/Du8cykoKCmhqvgRBfAD0PBedEqMfBflBq
 X7Ij72brz77IG04XRnCbuFeaKCXDa54ME8I3Q8TUV0OdrM2fRjqW+9sy//KSRNQr69us=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7K4s-0004Xb-H6 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Nov 2023 18:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SjbDkmPx2n6JHS7S/0Pm5UBLkdkT/hge08q6RFQNKe0=; b=HV//Ul+xzPA90R8NEL2txf0vbw
 Ni13I5DWfId03j1Sl/JmzbeMYNUxASAFoF3NsW5W1sRH0JfoUQO6Q5b2BQtdwb+T3gEmObsysMx5M
 rY6RX30yucyMrcvTjahz7MZewrgjTQz76FFAoi/4wOUV2DgI0dXevZ4UQwXZL2PBSmVQzfPLyMzgK
 RNXtAhvrT2WKFx4PHwzEPdAJteFz+XlbifTqWOaVfuhaCRhhEXeKR32C8ZN0t3+5804hk3xKeF0Y/
 ndYe/ymX9Lc0ebybI5KDmHi63hLm+hrhjzE2F0viydpx3/DezVGqtsT1jMsbfY8pJbzZ7zMUPfl6K
 lWKPq4FQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r7K4b-003cjp-3A; Sun, 26 Nov 2023 18:41:42 +0000
Date: Sun, 26 Nov 2023 18:41:41 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <gabriel@krisman.be>
Message-ID: <20231126184141.GF38156@ZenIV>
References: <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <87leangoqe.fsf@>
 <20231125220136.GB38156@ZenIV> <20231126045219.GD38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126045219.GD38156@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [folks involved into d_invalidate()/submount eviction stuff
 Cc'd] On Sun, Nov 26, 2023 at 04:52:19AM +0000, Al Viro wrote: > PS: as the
 matter of fact, it might be a good idea to pass the parent > as [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r7K4s-0004Xb-H6
Subject: [f2fs-dev] fun with d_invalidate() vs. d_splice_alias() was Re:
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[folks involved into d_invalidate()/submount eviction stuff Cc'd]
On Sun, Nov 26, 2023 at 04:52:19AM +0000, Al Viro wrote:
> PS: as the matter of fact, it might be a good idea to pass the parent
> as explicit argument to ->d_revalidate(), now that we are passing the
> name as well.  Look at the boilerplate in the instances; all that
>         parent = READ_ONCE(dentry->d_parent);
> 	dir = d_inode_rcu(parent);
> 	if (!dir)
> 		return -ECHILD;
> 	...
> on the RCU side combined with
> 	parent = dget_parent(dentry);
> 	dir = d_inode(parent);
> 	...
> 	dput(dir);
> stuff.
> 
> It's needed only because the caller had not told us which directory
> is that thing supposed to be in; in non-RCU mode the parent is
> explicitly pinned down, no need to play those games.  All we need
> is
> 	dir = d_inode_rcu(parent);
> 	if (!dir) // could happen only in RCU mode
> 		return -ECHILD;
> assuming we need the parent inode, that is.
> 
> So... how about
> 	int (*d_revalidate)(struct dentry *dentry, struct dentry *parent,
> 			  const struct qstr *name, unsigned int flags);
> since we are touching all instances anyway?

OK, it's definitely a good idea for simplifying ->d_revalidate() instances
and I think we should go for it on thes grounds alone.  I'll do that.

d_invalidate() situation is more subtle - we need to sort out its interplay
with d_splice_alias().

More concise variant of the scenario in question:
* we have /mnt/foo/bar and a lot of its descendents in dcache on client
* server does a rename, after which what used to be /mnt/foo/bar is /mnt/foo/baz
* somebody on the client does a lookup of /mnt/foo/bar and gets told by
the server that there's no directory with that name anymore.
* that somebody hits d_invalidate(), unhashes /mnt/foo/bar and starts
evicting its descendents
* We try to mount something on /mnt/foo/baz/blah.  We look up baz, get
an fhandle and notice that there's a directory inode for it (/mnt/foo/bar).
d_splice_alias() picks the bugger and moves it to /mnt/foo/baz, rehashing
it in process, as it ought to.  Then we find /mnt/foo/baz/blah in dcache and 
mount on top of it.
* d_invalidate() finishes shrink_dcache_parent() and starts hunting for
submounts to dissolve.  And finds the mount we'd done.  Which mount quietly
disappears.

Note that from the server POV the thing had been moved quite a while ago.
No server-side races involved - all it seeem is a couple of LOOKUP in the
same directory, one for the old name, one for the new.

On the client on the mounter side we have an uneventful mount on /mnt/foo/baz,
which had been there on server at the time we started and which remains in
place after mount we'd created suddenly disappears.

For the thread that ended up calling d_invalidate(), they'd been doing e.g.
stat on a pathname that used to be there a while ago, but currently isn't.
They get -ENOENT and no indication that something odd might have happened.

From ->d_revalidate() point of view there's also nothing odd happening -
dentry is not a mountpoint, it stays in place until we return and there's
no directory entry with that name on in its parent.  It's as clear-cut
as it gets - dentry is stale.

The only overlap happening there is d_splice_alias() hitting in the middle
of already started d_invalidate().

For a while I thought that ff17fa561a04 "d_invalidate(): unhash immediately"
and 3a8e3611e0ba "d_walk(): kill 'finish' callback" might have something
to do with it, but the same problem existed prior to that.

FWIW, I suspect that the right answer would be along the lines of
	* if d_splice_alias() does move an exsiting (attached) alias in
place, it ought to dissolve all mountpoints in subtree being moved.
There might be subtleties, but in case when that __d_unalias() happens
due to rename on server this is definitely the right thing to do.
	* d_invalidate() should *NOT* do anything with dentry that
got moved (including moved by d_splice_alias()) from the place we'd
found it in dcache.  At least d_invalidate() done due to having
->d_revalidate() return 0.
	* d_invalidate() should dissolve all mountpoints in the
subtree that existed when it got started (and found the victim
still unmoved, that is).  It should (as it does) prevent any
new mountpoints added in that subtree, unless the mountpoint
to be had been moved (spliced) out.  What it really shouldn't
do is touch the mountpoints that are currently outside of it
due to moves.

I'm going to look around and see if we have any weird cases where
d_splice_alias() is used for things like "correct the case of
dentry name on a case-mangled filesystem" - that would presumably
not want to dissolve any submounts.  I seem to recall seeing
some shite of that sort, but that was a long time ago.

Eric, Miklos - it might be a good idea if you at least took a
look at whatever comes out of that (sub)thread; I'm trying to
reconstruct the picture, but the last round of serious reworking
of that area had been almost 10 years ago and your recollections
of the considerations back then might help.  I realize that they
are probably rather fragmentary (mine definitely are) and any
analysis will need to be redone on the current tree, but...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
