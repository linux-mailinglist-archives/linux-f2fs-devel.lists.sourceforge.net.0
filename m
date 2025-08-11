Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A387B20A4F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 15:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwAWaNBKfGexqKDvTRDvkjs83mwGgIDuMwYQhfbGCCU=; b=AuUNAGjbRsYleXB7mFp2D+Xzlk
	AxrmWf/vBGg+KyMDe4MEyhL6QAIa0tKX6IFarqI/ohtNXk2GwIVx6s6T8EG11uyTgITdUSX+3UAXO
	y1UTHh2/8NJswZFGsqEiJNaUXsBYSqlqy9KQ7thEzDSix7Nj3JeHyWQvInAWkF7C7moc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulSg3-0002hi-EZ;
	Mon, 11 Aug 2025 13:35:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1ulSfm-0002fk-Eh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 13:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9NKcbzMNK1dqdqxa+9jK+mYAujg4EnLVK62c/Rfcssw=; b=aqRl0atyWGXxpJH75QmR2i5t+X
 E3t3h1/cXx3nkU+PkZV/pe2BqzlNpvBUsXfbOuGjOoSp0g8Xts4kzUWXSWWXbZT5JjySx1hjXZSPm
 JpTOC53cYih8HEHI8+l7Z06dcCJlxYKcROypzhDzIlyM2PBHgaT//APpHa2hE5Wcy0Cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9NKcbzMNK1dqdqxa+9jK+mYAujg4EnLVK62c/Rfcssw=; b=aRe6PyX6LvTkEaCBBW27h2X1lz
 12jZu6SXutXE7Uit5DLue9hUJbGtvEHJuAuCbYxCKQG2uvBvY3Bkkr6N6R7zNZXSqF2C1L9q0PIEB
 WYmHLqpM4waVWhLm14Y4FEDzU823bl/ozy2tmdirkFIzZsIOEtX/doFJU+ImiMUp2Fm8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulSfm-0004U9-A1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 13:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A685BA4ED70;
 Mon, 11 Aug 2025 13:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB39C4CEED;
 Mon, 11 Aug 2025 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754919280;
 bh=Ba4T8JRIhY1ucolU1ke77/oTfZPh0CpkbfaJTVmXDGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OLF36AqIkTxYij3rbRxLgiTKeAc20fE19pNkSF+6AsTmK4O7x7hqc6h9W1w8JaKxB
 F6Yd6j+Zuz3C0Z725mv1ub40YX4pJKu9nCeUFh2JxNvosAsHrd4mTQ2qzKY1GIBjIw
 utXSwPyDvH5GbbB4gOpKORIsVNVeawQrxrddtJU038mcQ5W0vgkBBoWX+bWpmCh+K1
 wrIWKmD6rZBzQrW6phPG619xf0GlruQdThXJEfKIWfoZkrpK2I9COSa5cZMyFHZNg/
 LG8LJcdQ3DDiYJIXqSDznqH/6+C6ULpc7F7fNadE2owbTdrJ+LR0jcwygpsMArWBYA
 ZgrzYeoo58MPw==
Date: Mon, 11 Aug 2025 15:34:35 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20250811-unbedacht-vollmond-1a805b76212b@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
 <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner
 wrote: > On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote: >
 > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulSfm-0004U9-A1
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: fsverity@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
> On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > > part of the inode, as proposed previously by Christian at
> > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > 
> > > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > > locate the pointer by adding an offset to the address of struct inode.
> > > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > > 
> > > > I've cleaned up a lot of the details, including:
> > > > - Grouped changes into patches differently
> > > > - Rewrote commit messages and comments to be clearer
> > > > - Adjusted code formatting to be consistent with existing code
> > > > - Removed unneeded #ifdefs
> > > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > > - Moved field initialization to init_once functions when they exist
> > > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > > >   no longer think it's actually correct there.
> > > > - verity_data_blocks() now keeps doing a raw dereference
> > > > - Dropped fscrypt_set_inode_info() 
> > > > - Renamed some functions
> > > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > > - And more.
> > > > 
> > > > For v4 and earlier, see
> > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > 
> > > > I'd like to take this series through the fscrypt tree for 6.18.
> > > > (fsverity normally has a separate tree, but by choosing just one tree
> > > > for this, we'll avoid conflicts in some places.)
> > > 
> > > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > > plan on taking over someone's series and resend then maybe ask the
> > > author first whether that's ok or not. I haven't seen you do that. You
> > > just caused duplicated work for no reason.
> > 
> > Ah, sorry about that.  When I started looking at it again yesterday
> > there turned out to be way too many cleanups and fixes I wanted to make
> > (beyond the comments I gave earlier), and I hadn't seen activity from
> > you on it in a while.  So I figured it would be easier to just send a
> > series myself.  But I should have asked you first, sorry.
> 
> So I started working on this pretty much right away. And I had planned
> on sending it out rather soon but then thought to better wait for -rc1
> to be released because I saw you had a bunch of crypto changes in for
> -rc1 that would've caused merge conflicts. It's no big deal overall but
> I just don't like that I wasted massaging all that stuff. So next time a
> heads-up would be nice. Thank you!

I just pulled the series and now I see that you also changed the
authorship of every single patch in the series from me to you and put my
Co-developed-by in there.

I mean I acknowledge that there's changes between the branches and
there's some function renaming but it's not to the point where
authorship should be changed. And if you think that's necessary than it
would be something you would want to talk to me about first.

I don't care about the stats but it was always hugely frustrating to me
when I started kernel development when senior kernel developers waltzed
in and thought they'd just take things over so I try very hard to not do
that unless this is agreed upon first.

> > > And second general infrastructure changes that touch multiple fses and
> > > generic fs infrastructure I very much want to go through VFS trees.
> > > We'll simply use a shared tree.
> > 
> > So you'd like to discontinue the fscrypt and fsverity trees?  That's
> > what they are for: general infrastructure shared by multiple
> > filesystems.  Or is this comment just for this series in particular,
> > presumably because it touches 'struct inode'?
> 
> My comment just applies this series. I'm not here to take away your
> trees ofc unless you would like to have them go through the VFS batch.
> That's something that some people like Amir have started doing.
> 
> I'll put the series into vfs-6.17.inode and push it out then you can
> base any additional changes on top of that. I'll not touch it unless you
> tell me to. Linus knows that VFS trees often have work that is used as
> the base for other trees so he will merge VFS trees before any of the
> smaller trees and I always mention this to him.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
