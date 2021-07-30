Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D13DC0D3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jul 2021 00:12:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9ak2-0005iL-Cp; Fri, 30 Jul 2021 22:12:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m9ak1-0005iD-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 22:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=brcM5lZSHsaI54PEDG56CKlE0X+6aPjSxjf3C0xBYaA=; b=AZrwbrWDbyC8r49so0Nu0/Hr4R
 dMmcR9DHLMUvUlP1Dz4VZbWoIxlevpzvheFXcmniSOL6RV8I9i2ymbZzER1DlX9bJVhmouRP76JBC
 qBioamvImDxfyeDZGo4Gvk47WsNrPinXkAZ3kSvb0++UNbeHUoICdqdeHPpWuvKeciH0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=brcM5lZSHsaI54PEDG56CKlE0X+6aPjSxjf3C0xBYaA=; b=RNEfwG/nqq/1Ywot2VqWGyd7mI
 vP4DpS/F2mzGoDO2/wtifrfg1LB+HnyXshqgOJ6K+Jhzgg6yjyIjZlKJW5njfDE/L8kgAuqC58D4H
 SRsVyb3Q1OdfMcURccCUnIfSqhSLOG+nYAOhJjfnL6XLqO930vJwrQQeTHxSz+eOhOmg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9aju-0003fI-P0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 22:12:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3409C60F01;
 Fri, 30 Jul 2021 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627683137;
 bh=z5hNmJdN8BGjw8r8v9HzovZwX29btJP0uJDcs7J+trA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AaivHF8bsl58yq6tjanaqzWD5gLJr8HgM735hZbIElwJGvp/ZMQ1KjvzyTsFlR8PX
 7CruPxkf07BFQlExyqEZozNfX1ZQU4E5K2ldMDwVpypeGf8x/6PEs1C0yqVUtqU6f0
 2pdz9bc1+laAaQ7VfpeBopksqZkLJ1gLtCQRH4RE9WkpP0Y/UawQKJblM4MCOeiQDC
 x+WO2yFr0p6dI1r8NlmFmy6O5WNJDeCyEAYUfwt5Fg+vMzoZVgjQI3CA0IiAKn0dnc
 kBl0vxfMyZ8SSvwSYQb0l6F78I1G1gZ8g1h+fk+tGyqQRO6Xd8oGYfViCUhkxGqacj
 FzP0g8mNi9nNQ==
Date: Fri, 30 Jul 2021 15:12:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YQR5P6aMxhOL+6os@google.com>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQRQRh1zUHSIzcC/@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9aju-0003fI-P0
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/30, Eric Biggers wrote:
> On Tue, Jul 27, 2021 at 06:51:54PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
> > they require preallocating blocks, but f2fs doesn't support unwritten
> > blocks and therefore has to preallocate the blocks as regular blocks.
> > f2fs has no way to reliably roll back such preallocations, so as a

Hmm, I'm still wondering why this becomes a problem. And, do we really need
to roll back the preallocated blocks?

> > result, f2fs will leak uninitialized blocks to users if a DIO write
> > doesn't fully complete.  This can be easily reproduced by issuing a DIO
> > write that will fail due to misalignment, e.g.:

If there's any error, truncating blocks having NEW_ADDR could address this?

> > 
> > 	rm -f file
> > 	truncate -s 1000000 file
> > 	dd if=/dev/zero bs=999999 oflag=direct conv=notrunc of=file
> > 	od -tx1 file  # shows uninitialized disk blocks
> > 
> > Until a proper design for non-overwrite DIO writes on f2fs can be
> > designed and implemented, remove support for them and make them fall
> > back to buffered I/O.  This is what other filesystems that don't support
> > unwritten blocks, e.g. ext2, also do, at least for non-extending DIO
> > writes.  However, f2fs can't do extending DIO writes either, as f2fs
> > appears to have no mechanism for guaranteeing that leftover allocated
> > blocks past EOF will get truncated.  (f2fs does have an orphan list, but
> > it's only used for deleting inodes, not truncating them.)
> > 
> > This patch doesn't attempt to remove the F2FS_GET_BLOCK_{DIO,PRE_DIO}
> > cases in f2fs_map_blocks(); that can be cleaned up later.
> > 
> > Fixes: bfad7c2d4033 ("f2fs: introduce a new direct_IO write path")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> 
> Any opinion on this patch?  This really needs to be fixed one way or another.
> Probably before the conversion to iomap, as this fix will need to be backported.
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
