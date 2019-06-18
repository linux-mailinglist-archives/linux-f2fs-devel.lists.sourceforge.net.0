Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A89814A6EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 18:31:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdH1A-0004L4-7r; Tue, 18 Jun 2019 16:31:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hdH19-0004Ks-0M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lnJzzJxH0PjPElVADiVN234Uxk+dte273/qhSae5ZgY=; b=H4fyqczdOCq4oVwzd1otJPJrtJ
 Kii3Nq83A5XgTXr1AQaNMTcqRTz6foF2QwuGHvrZVvChatmOqOxX6HOoVZ+COgmW6Z4GvsCrCQjQf
 9oBSMnK+rFfj9gbd0zoFs8d4tegpxW9askSQlSCWTuJwDG41/oZDFo3epMsirmBgqqH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lnJzzJxH0PjPElVADiVN234Uxk+dte273/qhSae5ZgY=; b=Q6y8c5NacwcJv83fZucFopG+mM
 ZWFeLks6lnHecMLHtDiYt98wq6MmI1/2SDuNGw58XPztD4MDtxcTqguPnkUGFiVUH8WwQwps7dWA8
 x9VbIWLcvUthadEfqmREorNT6NUPGoGdBb9Sb1K2t8p4L8auRg5mw7o+3ugCmXPM/2AM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdH14-003clu-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:31:31 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3AE32054F;
 Tue, 18 Jun 2019 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560875480;
 bh=8s8EM+uYReYgUA7GU9MPlmqiEwIExiskI/J8sVZVt2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wgRJzptgTLpjPDiEHTaZP7Qip+BiPwTjsvkocLXBfaZEI/gTRT5gSpoRGEMSpNuHe
 U5HifCFDwTn9R81SiN+y7/MXL3wJ9s2x4LNgLhYTvryiwZpwtId2IibVduHFLs4qAP
 P2C8p4W6B8LMCJMcvopWfhP9eOwKX0fxQoCm8fnE=
Date: Tue, 18 Jun 2019 09:31:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20190618163116.GA184520@gmail.com>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-2-ebiggers@kernel.org>
 <20190615123920.GB6142@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615123920.GB6142@mit.edu>
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
X-Headers-End: 1hdH14-003clu-Eg
Subject: Re: [f2fs-dev] [PATCH v4 01/16] fs-verity: add a documentation file
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

Hi Ted,

On Sat, Jun 15, 2019 at 08:39:20AM -0400, Theodore Ts'o wrote:
> On Thu, Jun 06, 2019 at 08:51:50AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add a documentation file for fs-verity, covering....
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Looks good; you can add:
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 
> 
> One minor design point below:
> 
> > +ext4 stores the verity metadata (Merkle tree and fsverity_descriptor)
> > +past the end of the file, starting at the first page fully beyond
>                                                    ^^^^
> > +i_size.  This approach works because (a) verity files are readonly,
> > +and (b) pages fully beyond i_size aren't visible to userspace but can
> > +be read/written internally by ext4 with only some relatively small
> > +changes to ext4.  This approach avoids having to depend on the
> > +EA_INODE feature and on rearchitecturing ext4's xattr support to
> > +support paging multi-gigabyte xattrs into memory, and to support
> > +encrypting xattrs.  Note that the verity metadata *must* be encrypted
> > +when the file is, since it contains hashes of the plaintext data.
> 
> If we ever want to support mounting, say, a file system with 4k blocks
> and fsverity enabled on a architecture with a 16k or 64k page size,
> then "page" in that first sentence will need to become "block".  At
> the moment we only support fsverity when page size == block size, so
> it's not an issue.
> 
> However, it's worth reflecting on what this means.  In order to
> satisfy this requirement (from the mmap man page):
> 
>        A file is mapped in multiples of the page size.  For a file
>        that is not a multiple of the page size, the remaining memory
>        is zeroed when mapped...
> 
> we're going to have to special case how the last page gets mmaped.
> The simplest way to do this will be to map in an anonymous page which
> just has the blocks that are part of the data block copied in, and the
> rest of the page can be zero'ed.
> 
> One thing we might consider doing just to make life much easier for
> ourselves (should we ever want to support page size != block size ---
> which I could imagine some folks like Chandan might find desirable) is
> to specify that the fsverity metadata begins at an offset which begins
> at i_size rounded up to the next 64k binary, which should handle all
> current and future architectures' page sizes.
> 

Thanks for the review.  Good point; I think we should just go with the "always
round up to the next 64K boundary" method.  Special-casing how the last page
gets mmap()ed seems it would be really painful.

Since there can be a hole between the end of the file and the start of the
verity metadata, this doesn't even necessarily use any additional disk space.

For consistency and since there is little downside I think I'll do the same for
f2fs too, though f2fs doesn't currently support PAGE_SIZE != 4096 at all anyway.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
