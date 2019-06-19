Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE54B050
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 05:05:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdQuu-00072m-P8; Wed, 19 Jun 2019 03:05:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hdQut-00072f-5i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 03:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kfOJNKn5L42t6JV/uOUUWCnuOchSOhTE4YESkrP06JI=; b=QD33TCnboaEzhrm4y+bPrWtzi8
 1mABEn+gOrV5pqeWQipV17EQwoOCUAQLZ7nuhsfP248Vyh3peAgeirE0ON2pAaK5rpFHqj+ruvQjB
 BbfOSXNdG8wHwDTvPHfC6Yl7Ecwwcb0ZeHJNkTEwbi4wIY3efgDg8h5jQ7SBPnDMibJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kfOJNKn5L42t6JV/uOUUWCnuOchSOhTE4YESkrP06JI=; b=ejxrOcaZFDhW/o9k74eS289HMo
 /AHWnWGxa6+m6IS4pHvbuxJ1Dqbxz81WIjLW0LlOXv3YCC53ySiwio73K1FFecM/bR9lHE/fH7SpK
 /g00QUkpplGJQQV+5KGgmYQJAoeVM9vfja7b8h4NYDYnkLMZxCAc/LoNTv9YQ6TjLBiQ=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdQur-004MnX-86
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 03:05:42 +0000
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5J35NPK021631
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2019 23:05:24 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id C0BD1420484; Tue, 18 Jun 2019 23:05:22 -0400 (EDT)
Date: Tue, 18 Jun 2019 23:05:22 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190619030522.GA28351@mit.edu>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-15-ebiggers@kernel.org>
 <20190615153112.GO6142@mit.edu> <20190618175117.GF184520@gmail.com>
 <20190618224615.GB4576@mit.edu> <20190618234133.GL184520@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618234133.GL184520@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hdQur-004MnX-86
Subject: Re: [f2fs-dev] [PATCH v4 14/16] ext4: add basic fs-verity support
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 18, 2019 at 04:41:34PM -0700, Eric Biggers wrote:
> 
> I don't think your proposed solution is so simple.  By definition the last
> extent ends on a filesystem block boundary, while the Merkle tree ends on a
> Merkle tree block boundary.  In the future we might support the case where these
> differ, so we don't want to preclude that in the on-disk format we choose now.
> Therefore, just storing the desc_size isn't enough; we'd actually have to store
> (desc_pos, desc_size), like I'm doing in the xattr.

I don't think any of this matters much, since what you're describing
above is all about the Merkle tree, and that doesn't affect how we
find the fsverity descriptor information.  We can just say that
fsverity descriptor block begins on the next file system block
boundary after the Merkle tree.  And in the case where say, the Merkle
tree is 4k and the file system block size is 64k, that's fine --- the
fs descriptor would just begin at the next 64k (fs blocksize)
boundary.

> Also, using ext4_find_extent() to find the last mapped block (as the v1 and v2
> patchsets did) assumes the file actually uses extents.  So we'd have to forbid
> non-extents based files as a special case, as the v2 patchset did.  We'd also
> have to find a way to implement the same functionality on f2fs (which should be
> possible, but it seems it would require some new code; there's nothing like
> f2fs_get_extent()) unless we did something different for f2fs.

So first, if f2fs wants to continue using the xattr, that's fine.  The
code to write and fetch the fsverity descriptor is in file system
specific code, and so this is something I'm happy to support just for
ext4, and it shouldn't require any special changes in the common
fsverity code at all.  Secondly, I suspect it's not *that* hard to
find the last logical block mapping in f2fs, but I'll let Jaeguk
comment on that.

Finally, it's not that hard to find the last mapped block for indirect
blocks, if we really care about supporting that combination.  (There
are enough other things --- like fallocate --- which don't work with
indirect mapped files, so I don't feel especially bad forbidding that
combination.  A quick check in enable_verity() to return EOPNOTSUPP if
the EXTENTS_FL flag is not present is not all that different from what
we do with fallocate today.)

But if we *did* want to support it, it's actually quite easy to find
the last mapped block for an indirect mapped inode.  I just didn't
bother to write the code, but it requires at most 3 block reads if
there is a triple indirection block.  Otherwise, if there is a double
indirection block in the inode, it requires at most 2 block reads, and
otherwise, at most a single block read.

> Note that on Android devices (the motivating use case for fs-verity), the xattrs
> of user data files on ext4 already spill into an external xattr block, due to
> the fscrypt and SELinux xattrs.  If/when people actually start caring about
> this, they'll need to increase the inode size to 512 bytes anyway, in which case
> there will be plenty of space for a few more in-line xattrs.  So I don't think
> we should jump through too many hoops to avoid using an xattr.

I'm thinking about other cases where we might not be using fscrypt,
but where we might still be using fsverity and SELinux --- or maybe
cases where the file systems are using 128 byte inodes, and where only
fsverity is required.  (There are a *vast* number of production file
systems using 128 byte inodes.)

Cheers,

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
