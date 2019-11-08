Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20BF549A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 20:36:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTA3G-0002jB-Qz; Fri, 08 Nov 2019 19:36:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iTA3F-0002j4-2m
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 19:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cT9IMQmPXWmRWcPSDiG0Jc1J3JR/SC6oMnL0qIY8dVs=; b=ZSGe3yOYLz7xUD/xcHW6NJfPNL
 Qq80GkxzHFTLRcUtvP3HNuvS+btVZx9HzKXZUvkkj1yDcw6HhLWiadE2QxkbMlQJokAE965akWBo5
 UiiODCuLepxvCxFg78Ktwoi4SEwCg5HWQkm9KkzjvCv0BVgngLUHJvlxaScGsslBuwpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cT9IMQmPXWmRWcPSDiG0Jc1J3JR/SC6oMnL0qIY8dVs=; b=fkuehjvZF/kTu3BqylQkgSgO4v
 lVvE6gdRHQYv7Jo+vtzbxeIrle2OjVtEb9RTQ/EKNFwZcFZN64mFFo7cEqs6CFf/qV9a+DB1L/kyo
 kV/Q6k0vrh6t5LcETQiSdMW+Ge1im9/hkJyAOGSwqdRlHf3lc9R6JHvE3Jd39r4abMg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTA3B-00602r-GC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 19:36:09 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87FDD206A3;
 Fri,  8 Nov 2019 19:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573241759;
 bh=98CTD1etW9H20E3cCNEDvFQ8V8zeVFrjcPnYMXN0TNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YL8EudJ2mTqL3pUp/TSoID2WBaJpPHg+ADaqLXn1jqLGmHvlaLYR3UnW2P6DQsqDy
 hV8LrIuDKB+LHVoJFh1iFtkiQLVDIi+oDuT9s4TmmuxU74xjAfDqCvjqIb+aPmQQuO
 imgrJJhWQe+dSiyRjbRkA+rBs9WhRvt9xvMGvGas=
Date: Fri, 8 Nov 2019 11:35:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: walter harms <wharms@bfs.de>
Message-ID: <20191108193557.GA12997@gmail.com>
Mail-Followup-To: walter harms <wharms@bfs.de>, linux-man@vger.kernel.org,
 darrick.wong@oracle.com, dhowells@redhat.com, jaegeuk@kernel.org,
 linux-api@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 tytso@mit.edu, victorhsieh@google.com
References: <20191107014420.GD15212@magnolia>
 <20191107220248.32025-1-ebiggers@kernel.org>
 <5DC525E8.4060705@bfs.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5DC525E8.4060705@bfs.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.3 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTA3B-00602r-GC
Subject: Re: [f2fs-dev] [man-pages RFC PATCH] statx.2: document
 STATX_ATTR_VERITY
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
Cc: linux-man@vger.kernel.org, tytso@mit.edu, darrick.wong@oracle.com,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 dhowells@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 victorhsieh@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 08, 2019 at 09:23:04AM +0100, walter harms wrote:
> 
> 
> Am 07.11.2019 23:02, schrieb Eric Biggers:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Document the verity attribute for statx().
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  man2/statx.2 | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > RFC since the kernel patches are currently under review.
> > The kernel patches can be found here:
> > https://lkml.kernel.org/linux-fscrypt/20191029204141.145309-1-ebiggers@kernel.org/T/#u
> > 
> > diff --git a/man2/statx.2 b/man2/statx.2
> > index d2f1b07b8..713bd1260 100644
> > --- a/man2/statx.2
> > +++ b/man2/statx.2
> > @@ -461,6 +461,10 @@ See
> >  .TP
> >  .B STATX_ATTR_ENCRYPTED
> >  A key is required for the file to be encrypted by the filesystem.
> > +.TP
> > +.B STATX_ATTR_VERITY
> > +The file has fs-verity enabled.  It cannot be written to, and all reads from it
> > +will be verified against a Merkle tree.
> 
> Using "Merkle tree" opens a can of worm and what will happen when the methode will change ?
> Does it matter at all ? i would suggest "filesystem" here.
> 

Fundamentally, fs-verity guarantees that all data read is verified against a
cryptographic hash that covers the entire file.  I think it will be helpful to
convey that here, e.g. to avoid confusion with non-cryptographic, individual
block checksums supported by filesystems like btrfs and zfs.

Now, the only sane way to implement this model is with a Merkle tree, and this
is part of the fs-verity UAPI (via the file hash), so that's where I'm coming
from here.  Perhaps the phrase "Merkle tree" could be interpreted too strictly,
though, so it would be better to emphasize the more abstract model.  How about
the following?:

	The file has fs-verity enabled.  It cannot be written to, and all reads
	from it will be verified against a cryptographic hash that covers the
	entire file, e.g. via a Merkle tree.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
