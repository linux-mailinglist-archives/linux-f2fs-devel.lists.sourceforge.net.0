Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE26B1F96F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 11:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iN3N3cwE95ZdXSOVNN+0vyw6e0h9p9Xb0xCtk9iGKw=; b=btHuhWfE0NYrcxc0p17+pDvKv5
	yqP0MIKXOqVqS2nXonqsXyRf3FutYoi9bgvUHGDHFG4RLC8ljtaANl2BSdhlWIeA8TWCylFbTtryz
	Gvsia0gguUjTlSMnq/mUXZ76TL6fP03rzs6YfIpIOLF1Bj1pX4v8YDuueEiAydtZakIQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul1yN-0003UE-Do;
	Sun, 10 Aug 2025 09:04:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul1yL-0003U8-Fw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 09:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1uyyWZMWxnWIvR4WQdz4GSEfW3Cb1VWxPZgl6c4HkU=; b=Da/9ydsYw5YGYzgsiUD4Sx7334
 kCxO8oJY+jnnJW2IfHKLjXLJ8RkAzuhezOJx2eTm0quxCeTs17CTI9Sk4+mLPTvTg/Srj+39gaUM/
 moLRe92DKLFbb4HcIxBsw1o4fPMKDw1W1qNVx0v0F0bKYUO6scCLR6budwPLJIsC3Pzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z1uyyWZMWxnWIvR4WQdz4GSEfW3Cb1VWxPZgl6c4HkU=; b=cwuhPs9k+tMGIdxK6/5g7M6+xv
 YOCaaL5HMSNvxwjfc+lDbnqJLBsgw31fhkX2Wu3TJlwfZ6xvyIapN2rtmpyrRyaIJnVbM06PUyMgb
 9J5p16Gl3ewOsThtHTpn+xnizGpkFobQDpazgboKAPs19GdTmnSQiljiBBycD3ybpqq4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul1yK-00075Y-Rx for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 09:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E166457A1;
 Sun, 10 Aug 2025 09:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1526CC4CEEB;
 Sun, 10 Aug 2025 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754816643;
 bh=1uk+L/4UCvC2YL4rDydg69JfuP7irpTtoBtvSgNeL/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LjfGKeZQqiIXfnvbaJEgwYP+/u4ykE3RMP5XuJzst3yu07DMinG6FVd0er4RWR7oT
 8rY+yL96FW8wFvnuHh6n/P2s+zyfPAo9USy6Gr5e8LHi9ieo1muby/ThPMT0jC2MJ6
 +BlYRh3l88+NlLoHLFQJG3gzW5nF6vc4t6gkOhKIHNw3TiipDPKog5V9JjwNkUWtz3
 zCiZEvSodHKopxJzcGudkBciWnHKKucIFIE0/37Uv9R1AJd8/jKkBRWXDhzx62YRFE
 ckhJ7XvPfWXPJA+9rnHx/WIF2A1CRYUoHGhVluTekBsgPvo1ZHEvNC53HIiH5g5ol/
 j4fq4OzXJw1Ng==
Date: Sun, 10 Aug 2025 02:03:02 -0700
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20250810090302.GA1274@sol>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810-tortur-gerammt-8d9ffd00da19@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810-tortur-gerammt-8d9ffd00da19@brauner>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner
 wrote: > On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote: >
 > This is a cleaned-up implementation of moving the i_crypt_info an [...] 
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
X-Headers-End: 1ul1yK-00075Y-Rx
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

On Sun, Aug 10, 2025 at 10:47:32AM +0200, Christian Brauner wrote:
> On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> > This is a cleaned-up implementation of moving the i_crypt_info and
> > i_verity_info pointers out of 'struct inode' and into the fs-specific
> > part of the inode, as proposed previously by Christian at
> > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > 
> > The high-level concept is still the same: fs/crypto/ and fs/verity/
> > locate the pointer by adding an offset to the address of struct inode.
> > The offset is retrieved from fscrypt_operations or fsverity_operations.
> > 
> > I've cleaned up a lot of the details, including:
> > - Grouped changes into patches differently
> > - Rewrote commit messages and comments to be clearer
> > - Adjusted code formatting to be consistent with existing code
> > - Removed unneeded #ifdefs
> > - Improved choice and location of VFS_WARN_ON_ONCE() statements
> > - Added missing kerneldoc for ubifs_inode::i_crypt_info
> > - Moved field initialization to init_once functions when they exist
> > - Improved ceph offset calculation and removed unneeded static_asserts
> > - fsverity_get_info() now checks IS_VERITY() instead of v_ops
> > - fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
> >   no longer think it's actually correct there.
> > - verity_data_blocks() now keeps doing a raw dereference
> > - Dropped fscrypt_set_inode_info() 
> > - Renamed some functions
> > - Do offset calculation using int, so we don't rely on unsigned overflow
> > - And more.
> > 
> > For v4 and earlier, see
> > https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/
> > 
> > I'd like to take this series through the fscrypt tree for 6.18.
> > (fsverity normally has a separate tree, but by choosing just one tree
> > for this, we'll avoid conflicts in some places.)
> 
> Woh woh. First, I had a cleaned up version ready for v6.18 so if you
> plan on taking over someone's series and resend then maybe ask the
> author first whether that's ok or not. I haven't seen you do that. You
> just caused duplicated work for no reason.

Ah, sorry about that.  When I started looking at it again yesterday
there turned out to be way too many cleanups and fixes I wanted to make
(beyond the comments I gave earlier), and I hadn't seen activity from
you on it in a while.  So I figured it would be easier to just send a
series myself.  But I should have asked you first, sorry.

> And second general infrastructure changes that touch multiple fses and
> generic fs infrastructure I very much want to go through VFS trees.
> We'll simply use a shared tree.

So you'd like to discontinue the fscrypt and fsverity trees?  That's
what they are for: general infrastructure shared by multiple
filesystems.  Or is this comment just for this series in particular,
presumably because it touches 'struct inode'?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
