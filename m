Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A4F61628
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Jul 2019 20:51:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkCG2-0006xU-Mr; Sun, 07 Jul 2019 18:51:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hkCG1-0006xH-HP
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Jul 2019 18:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pOZUnXzQy8pM4hC1E9Q3b5x4/DgBQWX+zV03BRpyKSM=; b=g7l4Yd50TKMgbE7PW5/O4/08XB
 6OLuB8zKsP3gulSKrukzmMTLChWYZdxzBIvgW4bLWs9XMcIvKyOTTUfIUj23VGSq1g58XThx+ocFl
 nWWNPEfJKfK7jQK2cdHydWzTPdvDw4aaLRnYNs2pekUcY5KuB1xUCNGX2yED685ZTFPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pOZUnXzQy8pM4hC1E9Q3b5x4/DgBQWX+zV03BRpyKSM=; b=Apcz29jD33/xIjrTJYDQEXp+82
 nKPXiVXyoylssPGph+2Gzp9YH+DZwvB8wMI2FVENtZEMqBs/cbjP1Kb1lwYGOsvIElUQz3UE02hnZ
 3btYZ+Py2wDGDquIDC0/exvxtzlITzhbBJH4by66lqnqJhno77ok6WURgknSv1XRPzF8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hkCGC-009Jxf-UH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Jul 2019 18:51:44 +0000
Received: from callcc.thunk.org (75-104-86-74.mobility.exede.net
 [75.104.86.74] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x67IpJhW015414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 7 Jul 2019 14:51:25 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id CD13542002E; Sun,  7 Jul 2019 14:51:17 -0400 (EDT)
Date: Sun, 7 Jul 2019 14:51:17 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190707185117.GC19775@mit.edu>
References: <20190701153237.1777-1-ebiggers@kernel.org>
 <20190701153237.1777-15-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701153237.1777-15-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hkCGC-009Jxf-UH
Subject: Re: [f2fs-dev] [PATCH v6 14/17] ext4: add basic fs-verity support
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

On Mon, Jul 01, 2019 at 08:32:34AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add most of fs-verity support to ext4.  fs-verity is a filesystem
> feature that enables transparent integrity protection and authentication
> of read-only files.  It uses a dm-verity like mechanism at the file
> level: a Merkle tree is used to verify any block in the file in
> log(filesize) time.  It is implemented mainly by helper functions in
> fs/verity/.  See Documentation/filesystems/fsverity.rst for the full
> documentation.
> 
> This commit adds all of ext4 fs-verity support except for the actual
> data verification, including:
> 
> - Adding a filesystem feature flag and an inode flag for fs-verity.
> 
> - Implementing the fsverity_operations to support enabling verity on an
>   inode and reading/writing the verity metadata.
> 
> - Updating ->write_begin(), ->write_end(), and ->writepages() to support
>   writing verity metadata pages.
> 
> - Calling the fs-verity hooks for ->open(), ->setattr(), and ->ioctl().
> 
> ext4 stores the verity metadata (Merkle tree and fsverity_descriptor)
> past the end of the file, starting at the first 64K boundary beyond
> i_size.  This approach works because (a) verity files are readonly, and
> (b) pages fully beyond i_size aren't visible to userspace but can be
> read/written internally by ext4 with only some relatively small changes
> to ext4.  This approach avoids having to depend on the EA_INODE feature
> and on rearchitecturing ext4's xattr support to support paging
> multi-gigabyte xattrs into memory, and to support encrypting xattrs.
> Note that the verity metadata *must* be encrypted when the file is,
> since it contains hashes of the plaintext data.
> 
> This patch incorporates work by Theodore Ts'o and Chandan Rajendra.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good.  You can add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Thanks,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
