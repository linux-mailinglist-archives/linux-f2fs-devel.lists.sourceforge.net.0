Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010F4A792
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 18:50:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdHJX-0005zc-Ow; Tue, 18 Jun 2019 16:50:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hdHJW-0005zR-Fp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ysxHfotROWmWuyqIN27gFYLgoB6f/Wy1als74NS3R2c=; b=JBsn1TXdKOri6pQ4+kE5JDzaBT
 XuxfRD6BdZ9PisNzTbCiG6ltU6OSTo/LNlvyvodKog11jA/jLpiZEBV3UEPuVMF0f7lBrKlPlgagL
 HoUjIvOgzvy67dFhEn7qL8vJ3aneJQvb+/NAeVj8ljvWNHG6i2zbil12zT2/fVC9Azxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ysxHfotROWmWuyqIN27gFYLgoB6f/Wy1als74NS3R2c=; b=T1p4Y7/buOoNjGjgXx1YQ+aPWy
 J6rXtQ7exITszFdqLaInnu6tTGbTaP9Gr2E9tXaE9MVAa5JQuz/2yOlXAJYqj519nbTYWZjtuQCZG
 Js/2ZJmxdQZOW9BfzbRlbtXWlALeW3uEOUzGk8i8qvv230WnBBtMEpBC6biMSZwpwfMk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdHJS-003eW8-41
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:50:27 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2294820B1F;
 Tue, 18 Jun 2019 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560876620;
 bh=GRodt5tDc/AW8+vBdiHp5EsjdUNaksF6WM4rwQEZ+Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=niXLBzXQQhjC8yy28Wlih/3pIvXrtIPOVKOnPKbPT9I5MlbXb46hXNzTDk0uJD8cy
 K/c4coqlq2v7ksdZfYbX+2wuy/zniIofDJRHrXAlHbdQb+8pXwGhKMblVimnIOHrTO
 o7weio/pysxf1Dh03XJeNfOzq4LGSYeRQ7+bZLDs=
Date: Tue, 18 Jun 2019 09:50:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20190618165017.GD184520@gmail.com>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-11-ebiggers@kernel.org>
 <20190615150821.GK6142@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615150821.GK6142@mit.edu>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdHJS-003eW8-41
Subject: Re: [f2fs-dev] [PATCH v4 10/16] fs-verity: implement
 FS_IOC_ENABLE_VERITY ioctl
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

On Sat, Jun 15, 2019 at 11:08:21AM -0400, Theodore Ts'o wrote:
> On Thu, Jun 06, 2019 at 08:51:59AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add a function for filesystems to call to implement the
> > FS_IOC_ENABLE_VERITY ioctl.  This ioctl enables fs-verity on a file.
> > 
> > See the "FS_IOC_ENABLE_VERITY" section of
> > Documentation/filesystems/fsverity.rst for the documentation.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> > diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> > new file mode 100644
> > index 000000000000..7e7ef9d3c376
> > --- /dev/null
> > +++ b/fs/verity/enable.c
> > +	/* Tell the filesystem to finish enabling verity on the file */
> > +	err = vops->end_enable_verity(filp, desc, desc_size, params.tree_size);
> > +	if (err) {
> > +		fsverity_err(inode, "%ps() failed with err %d",
> > +			     vops->end_enable_verity, err);
> > +		fsverity_free_info(vi);
> > +	} else {
> > +		/* Successfully enabled verity */
> > +
> > +		WARN_ON(!IS_VERITY(inode));
> > +
> > +		/*
> > +		 * Readers can start using ->i_verity_info immediately, so it
> > +		 * can't be rolled back once set.  So don't set it until just
> > +		 * after the filesystem has successfully enabled verity.
> > +		 */
> > +		fsverity_set_info(inode, vi);
> > +	}
> 
> If end_enable_Verity() retuns success, and IS_VERITY is not set, I
> would think that we should report the error via fsverity_err() and
> return an error to userspace, and *not* call fsverity_set_info().  I
> don't think the stack trace printed by WARN_ON is going to very
> interesting, since the call path which gets us to enable_verity() is
> not going to be surprising.
> 

I want to keep it as WARN_ON() because if it happens it's a kernel bug, and
WARNs are reported as bugs by automated tools.  But I can do the following so it
returns an error code too:

@@ -229,11 +235,12 @@ static int enable_verity(struct file *filp,
 		fsverity_err(inode, "%ps() failed with err %d",
 			     vops->end_enable_verity, err);
 		fsverity_free_info(vi);
+	} else if (WARN_ON(!IS_VERITY(inode))) {
+		err = -EINVAL;
+		fsverity_free_info(vi);
 	} else {
 		/* Successfully enabled verity */
 
-		WARN_ON(!IS_VERITY(inode));
-
 		/*
 		 * Readers can start using ->i_verity_info immediately, so it
 		 * can't be rolled back once set.  So don't set it until just

> > +
> > +	if (inode->i_size <= 0) {
> > +		err = -EINVAL;
> > +		goto out_unlock;
> > +	}
> 
> How hard would it be to support fsverity for zero-length files?  There
> would be no Merkle tree, but there still would be an fsverity header
> file on which we can calculate a checksum for the digital signature.
> 
>      	      	     	       	 - Ted
> 

Empty files would have to be special-cased, e.g. defining the root hash to be
all 0's, since there are no blocks to checksum.  It would be straightforward,
but it would still be a special case, e.g.:

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index ee9dd578e59fb..e859a2b6a4310 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -112,6 +112,12 @@ static int build_merkle_tree(struct inode *inode,
 	unsigned int level;
 	int err = -ENOMEM;
 
+	if (inode->i_size == 0) {
+		/* Empty file is a special case; root hash is all 0's */
+		memset(root_hash, 0, params->digest_size);
+		return 0;
+	}
+

On the other hand, *not* supporting empty files is a special case from the
user's point of view.  It means that fs-verity isn't supported on every possible
file.  Thinking about it, that's probably worse than having a special case in
the *implementation*.

So now I'm leaning towards changing it to support empty files.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
