Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCBB4AECD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 01:41:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdNjZ-00079L-9A; Tue, 18 Jun 2019 23:41:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hdNjX-00079D-FD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 23:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ZpRHdZbj/YSjofA1ykjqa7zath8AHHGOaBpe9ZI2KU=; b=N1BqRWgWlzuDqYV7ZuhaVbKS9f
 B8uWnRBgjaxD5HmV6fxBQfxyHayl+8/5Es91lS9lPjUsruAIorg5Xis4tZoIsryDDQn8ZFWoBqEs3
 RFM7j1smAOBVvhXoC3oYSP62hYUa4cRDYX3Spt5c8R+fE4KGLAnDhg8Xg79ooRQJTxIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3ZpRHdZbj/YSjofA1ykjqa7zath8AHHGOaBpe9ZI2KU=; b=Ct+8+n9CT8RFHUOtWJL4tnwrNz
 Qd6sxryr8huuQ63wrN35Kpg2zeWyW9yNWYV1qLrciwMVXv0axtZQvwHtMc8u9h7+xc/hh6RvJ1Wft
 rEXtPRKsm1ZXxDBUNwlbHqaBXm5jw0cpDqgmGWr69if9CHgE8oGW0HnvHvCVjSsqGztk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdNjT-003jFU-Bc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 23:41:44 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73DD02080C;
 Tue, 18 Jun 2019 23:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560901296;
 bh=JUDJyewBHmFtJkoI2vLr2zAbbPh3Fi6hkTWf+B7Ew6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZbYloxi7MOCwuUvW/nmSNQZQ4Yhb20pBMzG/c2xaN6MJitN9K2us5Gw4T3cJw3X1U
 xKnS6g1e8Cs7JWs0JdapN0ScnIMO+xV2wC5UiIyCkPxIGeuGoU3/c0RZDuRi6CptYJ
 x5eKyG+F+TZX/hs0+P92wWoWZFqhpXb876Nl1Y94=
Date: Tue, 18 Jun 2019 16:41:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20190618234133.GL184520@gmail.com>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-15-ebiggers@kernel.org>
 <20190615153112.GO6142@mit.edu> <20190618175117.GF184520@gmail.com>
 <20190618224615.GB4576@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618224615.GB4576@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.7 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdNjT-003jFU-Bc
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

On Tue, Jun 18, 2019 at 06:46:15PM -0400, Theodore Ts'o wrote:
> On Tue, Jun 18, 2019 at 10:51:18AM -0700, Eric Biggers wrote:
> > On Sat, Jun 15, 2019 at 11:31:12AM -0400, Theodore Ts'o wrote:
> > > On Thu, Jun 06, 2019 at 08:52:03AM -0700, Eric Biggers wrote:
> > > > +/*
> > > > + * Format of ext4 verity xattr.  This points to the location of the verity
> > > > + * descriptor within the file data rather than containing it directly because
> > > > + * the verity descriptor *must* be encrypted when ext4 encryption is used.  But,
> > > > + * ext4 encryption does not encrypt xattrs.
> > > > + */
> > > > +struct fsverity_descriptor_location {
> > > > +	__le32 version;
> > > > +	__le32 size;
> > > > +	__le64 pos;
> > > > +};
> > > 
> > > What's the benefit of storing the location in an xattr as opposed to
> > > just keying it off the end of i_size, rounded up to next page size (or
> > > 64k) as I had suggested earlier?
> > > 
> > > Using an xattr burns xattr space, which is a limited resource, and it
> > > adds some additional code complexity.  Does the benefits outweigh the
> > > added complexity?
> > > 
> > > 						- Ted
> > 
> > It means that only the fs/verity/ support layer has to be aware of the format of
> > the fsverity_descriptor, and the filesystem can just treat it an as opaque blob.
> > 
> > Otherwise the filesystem would need to read the first 'sizeof(struct
> > fsverity_descriptor)' bytes and use those to calculate the size as
> > 'sizeof(struct fsverity_descriptor) + le32_to_cpu(desc.sig_size)', then read the
> > rest.  Is this what you have in mind?
> 
> So right now, the way enable_verity() works is that it appends the
> Merkle tree to the data file, rounding up to the next page (but we
> might change so we round up to the next 64k boundary).  Then it calls
> end_enable_verity(), which is a file system specific function, passing
> in the descriptor and the descriptor size.
> 
> Today ext4 and f2fs appends the descriptor after the Merkle, and then
> sets the xattr containing the fsverity_descriptor_location.  Correct?

That's all correct, except that enable_verity() itself doesn't know or care that
the Merkle tree is being appended to the file.  That's up to the
->write_merkle_tree_block() and ->read_merkle_tree_page() methods which are
filesystem-specific.

> 
> What I'm suggesting that ext4 do instead is that it appends the
> descriptor to the Merkle tree, and then assuming that there is the
> (descriptor size % block_size) is less than PAGE_SIZE-4, we can write
> the descriptor size into the last 4 bytes of the last block in the
> file.  If there is not enough space at the end of the descriptor, then
> we append a block to the file, and then write the descriptor_size into
> last 4 bytes of that block.
> 
> When ext4 needs to find the descriptor, it simply reads the last block
> from the file, reads it into the page cache, reads the last 4 bytes
> from that block to fetch the descriptor size, and it can use the
> logical offset of the last block and the descriptor size to calculate
> the beginning offset of the descriptor size.
> 
> We can then fake up the fsverity_descriptor_location structure, and
> pass that into fsverity.
> 
> It does add a bit of extra complexity, but 99.9% of the time, it
> requires no extra space.  The last 0.098% of the time, the file size
> will grow by 4k, but if we can avoid spilling over to an external
> xattr block, it will all be worth it.
> 
> And in the V1 version of the fsverity code, I had already written the
> code to descend the extent tree to find the last logical block in the
> extent tree.
> 

I don't think your proposed solution is so simple.  By definition the last
extent ends on a filesystem block boundary, while the Merkle tree ends on a
Merkle tree block boundary.  In the future we might support the case where these
differ, so we don't want to preclude that in the on-disk format we choose now.
Therefore, just storing the desc_size isn't enough; we'd actually have to store
(desc_pos, desc_size), like I'm doing in the xattr.

Also, using ext4_find_extent() to find the last mapped block (as the v1 and v2
patchsets did) assumes the file actually uses extents.  So we'd have to forbid
non-extents based files as a special case, as the v2 patchset did.  We'd also
have to find a way to implement the same functionality on f2fs (which should be
possible, but it seems it would require some new code; there's nothing like
f2fs_get_extent()) unless we did something different for f2fs.

Note that on Android devices (the motivating use case for fs-verity), the xattrs
of user data files on ext4 already spill into an external xattr block, due to
the fscrypt and SELinux xattrs.  If/when people actually start caring about
this, they'll need to increase the inode size to 512 bytes anyway, in which case
there will be plenty of space for a few more in-line xattrs.  So I don't think
we should jump through too many hoops to avoid using an xattr.

> > It's also somewhat nice to have the version number in the xattr, in case we ever
> > introduce a new fs-verity format for ext4 or f2fs.
> 
> We already have a version number in the fsverity descriptor.  Surely
> that is what we would bump if we need to itnroduce a new fs-verity
> format?
> 

I'm talking about if we ever wanted to make a filesystem-specific change to
where the verity metadata is stored.  That's what the version number in the
filesystem-specific xattr is for.  The version number in the fsverity_descriptor
is different: that's for if we made a change to fs-verity for *all* filesystems.
We hopefully won't ever need the filesystem-specific version number, but as long
as we have to store the (desc_pos, desc_size) anyway, I think it's wise to add a
version number just in case; it doesn't really cost anything.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
