Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 789787F55C5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 02:12:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5yGW-00079U-UJ;
	Thu, 23 Nov 2023 01:12:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r5yGV-00079O-5E
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 01:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PY9S8RVi0dnKEfdrmFsdECJKTXexMrbF0x58rHr1R88=; b=WgBiRa8E4GwL0QrSxKAig271Ce
 pKzAgXLqyqW8tfgLQCzvKBs6hurOilvlODaGh2axZp3iSZNzbwjA+x4CYl9uhQUvvEYkudY/0bgX/
 1xPEOA28qpZPOlhk1xdPdQhxXQRH2lNepR5A6rqwDgo6itT3lairK73pDGeUX968/Xfo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PY9S8RVi0dnKEfdrmFsdECJKTXexMrbF0x58rHr1R88=; b=Iss/G7mpbgWPhyKg94eWrNmnjU
 qBjput1bNVGTtWZ9nIbbJN+GKh3NCpkLwEqI7Op6vushi0Z3dVWXrPo6V2fHxbdjeKxQZIwfU4KmY
 2In/W8mTN6P35dOkGBmPPnPVxnr9ieHWbpS5ItukfRv21d2ByNdoYy/foLJeggyeBSrw=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5yGT-00DB2t-7p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 01:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PY9S8RVi0dnKEfdrmFsdECJKTXexMrbF0x58rHr1R88=; b=Wxreso/B/Dh4LiFC6ky64hsoHG
 DKfrqS4iEfOeCiGHQM3PUKYAigdumD8QkqkM/jQrNnbtL9PALDBmElowJuy/vjcngWK/ssk9wCGgQ
 9pha+U/3DXFwYydFhuh4n7vom/JGSpqnpVBwi+vRhCN8hnowSDsERumqVCzFcF7HL6DLpsuRZubIe
 uJoNVzHTqKya2IYBdJncmhtD0Bn+TQOhAMAr00YOEQHEi8wtDoZdFTERTgT8I5sMuO+JlcgvipYjn
 EkSBN+YD++43nTzDFqkcoWXhZ5Q2CL49AFsyyFeDNtwvVfXowGcRIQ0Ki4Id8+pI9hJb3vx5I5gQL
 SNSRS68A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r5yGG-001rH6-1H; Thu, 23 Nov 2023 01:12:08 +0000
Date: Thu, 23 Nov 2023 01:12:08 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231123011208.GK38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122211901.GJ38156@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 22, 2023 at 09:19:01PM +0000, Al Viro wrote: >
 On Tue, Nov 21, 2023 at 02:27:34AM +0000, Al Viro wrote: > > > I will review
 that series; my impression from the previous iterations > > had [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5yGT-00DB2t-7p
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 22, 2023 at 09:19:01PM +0000, Al Viro wrote:
> On Tue, Nov 21, 2023 at 02:27:34AM +0000, Al Viro wrote:
> 
> > I will review that series; my impression from the previous iterations
> > had been fairly unpleasant, TBH, but I hadn't rechecked since April
> > or so.
> 
> The serious gap, AFAICS, is the interplay with open-by-fhandle.
> It's not unfixable, but we need to figure out what to do when
> lookup runs into a disconnected directory alias.  d_splice_alias()
> will move it in place, all right, but any state ->lookup() has
> hung off the dentry that had been passed to it will be lost.
> 
> And I seriously suspect that we want to combine that state
> propagation with d_splice_alias() (or its variant to be used in
> such cases), rather than fixing the things up afterwards.
> 
> In particular, propagating ->d_op is really not trivial at that
> point; it is safe to do to ->lookup() argument prior to d_splice_alias()
> (even though that's too subtle and brittle, IMO), but after
> d_splice_alias() has succeeded, the damn thing is live and can
> be hit by hash lookups, revalidate, etc.
> 
> The only things that can't happen to it are ->d_delete(), ->d_prune(),
> ->d_iput() and ->d_init().  Everything else is fair game.
> 
> And then there's an interesting question about the interplay with
> reparenting.  It's OK to return an error rather than reparent,
> but we need some way to tell if we need to do so.

Hmm... int (*d_transfer)(struct dentry *alias, struct dentry *new)?
Called if d_splice_alias() picks that sucker, under rename_lock,
before the call of __d_move().  Can check IS_ROOT(alias) (due to
rename_lock), so can tell attaching from reparenting, returning
an error - failed d_splice_alias().

Perhaps would be even better inside __d_move(), once all ->d_lock
are taken...  Turn the current bool exchange in there into honest
enum (exchange/move/splice) and call ->d_transfer() on splice.
In case of failure it's still not too late to back out - __d_move()
would return an int, ignored in d_move() and d_exchange() and
treated as "fail in unlikely case it's non-zero" in d_splice_alias()
and __d_unalias()...

Comments?  Note that e.g.
        res = d_splice_alias(inode, dentry);
        if (!IS_ERR(fid)) {
                if (!res)
                        v9fs_fid_add(dentry, &fid);
                else if (!IS_ERR(res))
                        v9fs_fid_add(res, &fid);
                else
                        p9_fid_put(fid);
        }

in 9p ->lookup() would turn into

	v9fs_fid_add(dentry, &fid);
        return d_splice_alias(inode, dentry);

with ->d_transfer(alias, new) being simply

	struct hlist_node *p = new->d_fsdata;
	hlist_del_init(p);
	__add_fid(alias, hlist_entry(p, struct p9_fid, dlist));
	return 0;

assuming the call from __d_move()...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
