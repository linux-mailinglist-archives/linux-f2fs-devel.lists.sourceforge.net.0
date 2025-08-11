Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4757B2124D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 18:40:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTh/BaCZXLfn1jlKyGRVmOtq499P+Br8qxppqiiDsiw=; b=NntzprgC1+DzPc7UncJMD4e124
	vs0vdGva+NznopZNdO/pS85Mj1sWyM/3r/PeF/7QgFJ48hLrVtbgj+kLNxEIKKGylsiAk3KT3oo+Q
	kfYFlbzieUrCZ6OmTaPgbTk4cpueMnjuWXGxa5b0oAfW3/XcA8LRD/DyBSxMqhQOe4wo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulVZJ-0000OO-24;
	Mon, 11 Aug 2025 16:40:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ulVZH-0000OH-Jh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 16:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TcFYawCKlBU+EvI4OkNk8ImxWR9ERYxc0RFnlH7ptdI=; b=aK9FvY1rnGObkGHOliL4vyHSvm
 cDL6bydKtclQnkEVFtjNzqPv4rIO4tc6/kBjS+fkUPK3vtts9nwsug9bVTIG+ecPeKdvJ3GYEwtmG
 6Kni/tvDGdWSV8e2avJllwcx4fQ/O9Mt6m+9heQ8bg+Xq0Z3m8wbr9DmnTSrguoRy7iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TcFYawCKlBU+EvI4OkNk8ImxWR9ERYxc0RFnlH7ptdI=; b=loonvqg99Zs9wJl2rWHLUOZ66Q
 DQbGjGkU62VsdsTE9SLKx//g2uhgjfEtTAfy8X/OcIgE23UN3IBYktcNlTIviO4gcQBK+hJUtdpgT
 ctZWCSQCW0yXC5hKafDwBFWVa+jHkczumd2lWGNjSHeaReQA/rqr9+uCQ51HleyWej1o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulVZH-000571-0R for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 16:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E89D43DC5;
 Mon, 11 Aug 2025 16:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B361C4CEED;
 Mon, 11 Aug 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754930409;
 bh=yfY9fEwE5prSXu7c0Ar8fQ1UlOn+Yver65cw9lpRakc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pGsk5/BBpOcOyGSEi4YMVtKP9l1LnkIw0E8k1OWWmvEzjR8tWPYLRCdVWgDivYzB0
 QBjs/iXUHLQNSFF4scAcafi5A8kFz1Z8tWfjAEZfNb9NTb5L3WGctIErpbHiBvkSjS
 jAGC82roagiAIKtNyS3bUDO/rDabILKuUtEMC3vtmh4MpO1+42hJvpurkyNYZzA8f6
 uJ8+z6YbJb9LNnmANY2gQPZvA+X+dfQdOzHLdtSWb7wVG3CjCC6waAV6DvQSRz5Mm4
 JlzXaWwIgprKlf+tsPTkwngce/DAsh+8U1uF1N3mPSSegfPMWUPEc15lr9rK5LUNSN
 vJdnzKs0VS1gA==
Date: Mon, 11 Aug 2025 09:39:07 -0700
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20250811163907.GA1268@sol>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
 <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
 <20250811-unbedacht-vollmond-1a805b76212b@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-unbedacht-vollmond-1a805b76212b@brauner>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 11, 2025 at 03:34:35PM +0200, Christian Brauner
 wrote: > On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
 > > On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulVZH-000571-0R
Subject: Re: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out
 of struct inode
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 11, 2025 at 03:34:35PM +0200, Christian Brauner wrote:
> On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
> > On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> > > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > > > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > > > part of the inode, as proposed previously by Christian at
> > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > 
> > > > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > > > locate the pointer by adding an offset to the address of struct inode.
> > > > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > > > 
> > > > > I've cleaned up a lot of the details, including:
> > > > > - Grouped changes into patches differently
> > > > > - Rewrote commit messages and comments to be clearer
> > > > > - Adjusted code formatting to be consistent with existing code
> > > > > - Removed unneeded #ifdefs
> > > > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > > > - Moved field initialization to init_once functions when they exist
> > > > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > > > >   no longer think it's actually correct there.
> > > > > - verity_data_blocks() now keeps doing a raw dereference
> > > > > - Dropped fscrypt_set_inode_info() 
> > > > > - Renamed some functions
> > > > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > > > - And more.
> > > > > 
> > > > > For v4 and earlier, see
> > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > 
> > > > > I'd like to take this series through the fscrypt tree for 6.18.
> > > > > (fsverity normally has a separate tree, but by choosing just one tree
> > > > > for this, we'll avoid conflicts in some places.)
> > > > 
> > > > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > > > plan on taking over someone's series and resend then maybe ask the
> > > > author first whether that's ok or not. I haven't seen you do that. You
> > > > just caused duplicated work for no reason.
> > > 
> > > Ah, sorry about that.  When I started looking at it again yesterday
> > > there turned out to be way too many cleanups and fixes I wanted to make
> > > (beyond the comments I gave earlier), and I hadn't seen activity from
> > > you on it in a while.  So I figured it would be easier to just send a
> > > series myself.  But I should have asked you first, sorry.
> > 
> > So I started working on this pretty much right away. And I had planned
> > on sending it out rather soon but then thought to better wait for -rc1
> > to be released because I saw you had a bunch of crypto changes in for
> > -rc1 that would've caused merge conflicts. It's no big deal overall but
> > I just don't like that I wasted massaging all that stuff. So next time a
> > heads-up would be nice. Thank you!
> 
> I just pulled the series and now I see that you also changed the
> authorship of every single patch in the series from me to you and put my
> Co-developed-by in there.
> 
> I mean I acknowledge that there's changes between the branches and
> there's some function renaming but it's not to the point where
> authorship should be changed. And if you think that's necessary than it
> would be something you would want to talk to me about first.
> 
> I don't care about the stats but it was always hugely frustrating to me
> when I started kernel development when senior kernel developers waltzed
> in and thought they'd just take things over so I try very hard to not do
> that unless this is agreed upon first.

If you want to keep the authorship that's fine with me.  Make sure
you've checked the diff: the diff between v4 and v5 is larger than the
diff between the base and either version.  And as I mentioned, I rewrote
the commit messages and divided some of the changes into commits
differently as well.  If the situation was flipped, I wouldn't want to
be kept as the author.  But I realize there are different opinions about
this sort of thing, and I'm totally fine with whatever you prefer.

Thanks,

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
