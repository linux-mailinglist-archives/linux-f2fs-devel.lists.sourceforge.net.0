Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38832B281A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 16:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U90eY4dCBjDKjxAmQJ1xNzfesfzZqhKrEbj0kPtxUFQ=; b=Sjv9Q8Dl8PooYxvUdZ+fLSxKcQ
	CYmGPJ+erCymA8b7MgITS+acHQKe2q8yp7Y1TdlibsREa/wrQkJxWYoOpW/mv+p0YM9X5SsVL4CTr
	sQjdwCR9YPjtKZIQ5RYs/HPdaW+ZwQZnoNmprB27+UZoaBJCrAT4C0iWnMtLh5jh/shQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umvQ2-000071-RL;
	Fri, 15 Aug 2025 14:28:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1umvQ1-00006v-62
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 14:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XJHTcR5eWz9xdz40rfIjfrnsum+s7ZfxJFs3OK2K8tA=; b=MyF+Kaj0Camku9YSiP/HZ1/cyn
 MOA70JpT/onGPHWdnPaPoARcunoU3YwwSjK0J2aKtAZoRGBiJ5HT3lcSmtyyQIdvx3j9HtlnVo3Ab
 tdxkVHLJ+A/+W6JMhNAROqsblqbKCyfWjtmXGuqqxUT6YyOSozA1SLgh+u0ipddQzjmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XJHTcR5eWz9xdz40rfIjfrnsum+s7ZfxJFs3OK2K8tA=; b=JvCRJC1ccS42SOgeXl+jUGcn8y
 38HmB/9zkyG1R79eBvb98Csk1s1rWDasm8nYULcpzl22cFYAkaCHHs5i/bmH0zgeuC5/P4pNozFDH
 kU07FzhbxzTEgTOV51WgHnf14sZEUPA4t3P38lBjC2r9skTBUWmo5kvdAbBR88v3F7D8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umvQ0-0002cr-KK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 14:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A4084527F;
 Fri, 15 Aug 2025 14:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BE4C4CEF5;
 Fri, 15 Aug 2025 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755268102;
 bh=NjlA2V0nQx0tBL4rAiZ29YI48biAV1hmLhasXfWKjKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vi/jyHyCpW3IS1hb6zQ4jJ+oAYD0DXsY2Im5ys51K44DIEZQHnGkTVraWsoFcqbwC
 JxJq03+C9R3fjpoMc9nQd4QG10bfgmJDeOjpatQAYOyzqylhQ1n0AYRglhszfcGetS
 FjhIcW7orUVId79eVQDk4m6yVnMF8nfROWLKKC2DlG1gQDlsTg5ndmXNr61rMo4qLc
 FwgVzCRxDCjKmjVaJfryczmqUHzyfxIQC23QMXOHkNvThADLMLAyeNAgSC/7uGhDd7
 iOBJ7p+fW43/8ExrYdQawHBPv3mNoLE+f/MSAzjfGGQ+rUABw1kKle6THgz2+iucuP
 LOrp6gISP0oAQ==
Date: Fri, 15 Aug 2025 16:28:17 +0200
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20250815-pension-geleugnet-0b0502f0555c@brauner>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
 <20250810090302.GA1274@sol>
 <20250811-distribuieren-nilpferd-bef047fa7992@brauner>
 <20250811-unbedacht-vollmond-1a805b76212b@brauner>
 <20250811163907.GA1268@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811163907.GA1268@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 11, 2025 at 09:39:07AM -0700, Eric Biggers wrote:
 > On Mon, Aug 11, 2025 at 03:34:35PM +0200, Christian Brauner wrote: > >
 On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote [...] 
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
X-Headers-End: 1umvQ0-0002cr-KK
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

On Mon, Aug 11, 2025 at 09:39:07AM -0700, Eric Biggers wrote:
> On Mon, Aug 11, 2025 at 03:34:35PM +0200, Christian Brauner wrote:
> > On Mon, Aug 11, 2025 at 03:17:01PM +0200, Christian Brauner wrote:
> > > On Sun, Aug 10, 2025 at 02:03:02AM -0700, Eric Biggers wrote:
> > > > On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> > > > > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > > > > > This is a cleaned-up implementation of moving the i_crypt_info and
> > > > > > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > > > > > part of the inode, as proposed previously by Christian at
> > > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > > 
> > > > > > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > > > > > locate the pointer by adding an offset to the address of struct inode.
> > > > > > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > > > > > 
> > > > > > I've cleaned up a lot of the details, including:
> > > > > > - Grouped changes into patches differently
> > > > > > - Rewrote commit messages and comments to be clearer
> > > > > > - Adjusted code formatting to be consistent with existing code
> > > > > > - Removed unneeded #ifdefs
> > > > > > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > > > > > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > > > > > - Moved field initialization to init_once functions when they exist
> > > > > > - Improved ceph offset calculation and removed unneeded static_asserts
> > > > > > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > > > > > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> > > > > >   no longer think it's actually correct there.
> > > > > > - verity_data_blocks() now keeps doing a raw dereference
> > > > > > - Dropped fscrypt_set_inode_info() 
> > > > > > - Renamed some functions
> > > > > > - Do offset calculation using int, so we don't rely on unsigned overflow
> > > > > > - And more.
> > > > > > 
> > > > > > For v4 and earlier, see
> > > > > > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > > > > > 
> > > > > > I'd like to take this series through the fscrypt tree for 6.18.
> > > > > > (fsverity normally has a separate tree, but by choosing just one tree
> > > > > > for this, we'll avoid conflicts in some places.)
> > > > > 
> > > > > Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> > > > > plan on taking over someone's series and resend then maybe ask the
> > > > > author first whether that's ok or not. I haven't seen you do that. You
> > > > > just caused duplicated work for no reason.
> > > > 
> > > > Ah, sorry about that.  When I started looking at it again yesterday
> > > > there turned out to be way too many cleanups and fixes I wanted to make
> > > > (beyond the comments I gave earlier), and I hadn't seen activity from
> > > > you on it in a while.  So I figured it would be easier to just send a
> > > > series myself.  But I should have asked you first, sorry.
> > > 
> > > So I started working on this pretty much right away. And I had planned
> > > on sending it out rather soon but then thought to better wait for -rc1
> > > to be released because I saw you had a bunch of crypto changes in for
> > > -rc1 that would've caused merge conflicts. It's no big deal overall but
> > > I just don't like that I wasted massaging all that stuff. So next time a
> > > heads-up would be nice. Thank you!
> > 
> > I just pulled the series and now I see that you also changed the
> > authorship of every single patch in the series from me to you and put my
> > Co-developed-by in there.
> > 
> > I mean I acknowledge that there's changes between the branches and
> > there's some function renaming but it's not to the point where
> > authorship should be changed. And if you think that's necessary than it
> > would be something you would want to talk to me about first.
> > 
> > I don't care about the stats but it was always hugely frustrating to me
> > when I started kernel development when senior kernel developers waltzed
> > in and thought they'd just take things over so I try very hard to not do
> > that unless this is agreed upon first.
> 
> If you want to keep the authorship that's fine with me.  Make sure
> you've checked the diff: the diff between v4 and v5 is larger than the
> diff between the base and either version.  And as I mentioned, I rewrote
> the commit messages and divided some of the changes into commits
> differently as well.  If the situation was flipped, I wouldn't want to
> be kept as the author.  But I realize there are different opinions about
> this sort of thing, and I'm totally fine with whatever you prefer.

It's not that I oppose it per se it's just that it would be nice to have
gotten a heads-up about both the rewrite and the authorship change.
(Sorry, still on vacation and so answers are delayed.)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
