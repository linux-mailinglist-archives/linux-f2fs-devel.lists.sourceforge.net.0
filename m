Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA1F14ADBE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2020 02:50:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwG0s-0007uX-HZ; Tue, 28 Jan 2020 01:49:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iwG0r-0007uJ-BF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 01:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qy+VOSkDFmJFEIp1pyfM6GyyGFDgpRhz5WRRVJ6zMYQ=; b=McR31vhPT7lA5lRAO3HqsruwIF
 VCDPueWqQK+2TjsWLstC+H8THqvpJLLEaSQZtt8hgaQnftCimlcNLg3ViW3zqHQyQQSZfVM9zqc9y
 4aTNvmlMqBm6MkS0dSoF/CFS+HKG62KUQ2fq2LHgZwDxtq9FhCB00xH2IUccClNOHKxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qy+VOSkDFmJFEIp1pyfM6GyyGFDgpRhz5WRRVJ6zMYQ=; b=m
 +4ODrYiyQtClCIN+DZf5Y+K9j6JvvZtFbgWDDFs2IruHslu8qNgggYluLE4dlrHjR3ZS5ArFt2w5b
 XPHGHrXQoy7cvTHT34bdfJtweg7Rqg+ugIfeCM23sopc7KzRSLL6oXVnNniwl38dzuE94uJPfAw60
 jyGL7CxgicYb9uAo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iwG0m-002ZIO-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 01:49:57 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 171B6214AF;
 Tue, 28 Jan 2020 01:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580176186;
 bh=LG/91wYLxxcYT1svtlzLQ/c/hCjXKTZSNlbksK28KB8=;
 h=Date:From:To:Cc:Subject:From;
 b=O1F0TfY1lPK6UDP2+cAy1qiAe5gEdKKYy0ffpzRZKA6oCncfLoLhWr1QrWxf7ooi5
 HL4jFb0D2IC39TmP0BOa2trGbZYvJJ4O5lDnJJZFdddcuERLlqKFMkhjVIRBAO1muy
 oUfSt9noSUuHQmMW4oTq+ajZAVYQ8yqB791BiJ48=
Date: Mon, 27 Jan 2020 17:49:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200128014944.GB960@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iwG0m-002ZIO-Ty
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 5.6
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to da3a3da4e6c68459618a1043dcb12b450312a4e2:

  fs-verity: use u64_to_user_ptr() (2020-01-14 13:28:28 -0800)

----------------------------------------------------------------

- Optimize fs-verity sequential read performance by implementing
  readahead of Merkle tree pages.  This allows the Merkle tree to be
  read in larger chunks.

- Optimize FS_IOC_ENABLE_VERITY performance in the uncached case by
  implementing readahead of data pages.

- Allocate the hash requests from a mempool in order to eliminate the
  possibility of allocation failures during I/O.

----------------------------------------------------------------
Eric Biggers (4):
      fs-verity: implement readahead for FS_IOC_ENABLE_VERITY
      fs-verity: implement readahead of Merkle tree pages
      fs-verity: use mempool for hash requests
      fs-verity: use u64_to_user_ptr()

 fs/ext4/verity.c             | 47 ++++++++++++++++++++-
 fs/f2fs/data.c               |  2 +-
 fs/f2fs/f2fs.h               |  3 ++
 fs/f2fs/verity.c             | 47 ++++++++++++++++++++-
 fs/verity/enable.c           | 67 +++++++++++++++++++++++-------
 fs/verity/fsverity_private.h | 17 +++++---
 fs/verity/hash_algs.c        | 98 +++++++++++++++++++++++++++++++++-----------
 fs/verity/open.c             |  5 ++-
 fs/verity/verify.c           | 47 ++++++++++++++-------
 include/linux/fsverity.h     |  7 +++-
 10 files changed, 273 insertions(+), 67 deletions(-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
