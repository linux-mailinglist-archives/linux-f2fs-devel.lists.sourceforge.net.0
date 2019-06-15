Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D805247076
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jun 2019 16:42:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hc9t0-0007C9-TH; Sat, 15 Jun 2019 14:42:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hc9sz-0007Bh-5G
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Jun 2019 14:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nA9JxfTfr51pQSjJV4PSKlS3XDeD2p2ZLBk0qeHDK4E=; b=MSiqV7HxbgrSLhfggkHiLN464X
 LIc6GJewMIugFtoqjGuZirh02JmvPpZW5T20pRpHjf/dmDysDjQx17bvMt4Db9ECoq6QymsZAZf4c
 IHdW2zKeFDY2EZQfFiupEtAPQf+8KCPThhTKb7XJOk+P4PWMO3tQ4G4sxdWw04a1EMeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nA9JxfTfr51pQSjJV4PSKlS3XDeD2p2ZLBk0qeHDK4E=; b=TYA40ld1vfLH1q9ORY4c4q2Z8/
 GeUyGtwA2NJ3Lmvo2NjAAJKnnr6Vee0WuVickZ117d5obQlW0g0P62HVgbficN9WrdTPE73S+SgnF
 y7djcbob58H8mUTBbps1yGmlwpSf8Y3cIgOItd22E8SQVuxu2PXzlrLKRr7aheYweIsg=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hc9st-00F5eF-NB
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Jun 2019 14:42:28 +0000
Received: from callcc.thunk.org (rrcs-74-87-88-165.west.biz.rr.com
 [74.87.88.165]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5FEg8RS031455
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2019 10:42:09 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id AFE89420484; Sat, 15 Jun 2019 10:42:07 -0400 (EDT)
Date: Sat, 15 Jun 2019 10:42:07 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190615144207.GH6142@mit.edu>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606155205.2872-8-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hc9st-00F5eF-NB
Subject: Re: [f2fs-dev] [PATCH v4 07/16] fs-verity: add the hook for file
 ->open()
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

On Thu, Jun 06, 2019 at 08:51:56AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add the fsverity_file_open() function, which prepares an fs-verity file
> to be read from.  If not already done, it loads the fs-verity descriptor
> from the filesystem and sets up an fsverity_info structure for the inode
> which describes the Merkle tree and contains the file measurement.  It
> also denies all attempts to open verity files for writing.
> 
> This commit also begins the include/linux/fsverity.h header, which
> declares the interface between fs/verity/ and filesystems.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good; you can add:

Reviewed-off-by: Theodore Ts'o <tytso@mit.edu>

						- Ted

> +/*
> + * Validate the given fsverity_descriptor and create a new fsverity_info from
> + * it.  The signature (if present) is also checked.
> + */
> +struct fsverity_info *fsverity_create_info(const struct inode *inode,
> +					   const void *_desc, size_t desc_size)

Well, technically it's not checked (yet).  It doesn't get checked
until [PATCH 13/16]: support builtin file signatures.  If we want to
be really nit-picky, that portion of the comment could be moved to
later in the series.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
