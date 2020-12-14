Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 877B92D92FF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Dec 2020 06:53:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kognu-0003SB-OQ; Mon, 14 Dec 2020 05:53:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kognt-0003Rz-W1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 05:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dp+nU55IT4YkVFkL5ZNB+8NNZt/ADeTRdb/5UMcxfpw=; b=RX8V18oQW03NY0PgjYG5jLXswA
 XNEJff1omh3qF6imbzKsBErb3mAFk1qoHSC2UAj8T+s/+CUQ2KRcftGEw8RWw2oKLLe9NyfwmnnjW
 n88xSJ9fnfEOfD/1HxVPnGcki+7hqHRl8WD5YckOCoXrUx29pgcq32oRlts6mCys6DgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Dp+nU55IT4YkVFkL5ZNB+8NNZt/ADeTRdb/5UMcxfpw=; b=G
 p/YZQK1b6CzM6Gfvq+c1t+ISx6GQr+5FqyFhFl5bZekAupn/dY77+nPzoGaXbFo/uTRlcsPl9IA1L
 09w7SA7sU9WEUAQTnzio06txJzfKHxHweqiFWxQWyKOVGTVpE99sdMw5TH30yAGbz6/JLc+X201rM
 tip27CKtEiIUge7Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kognk-00DDqU-AR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 05:53:49 +0000
Date: Sun, 13 Dec 2020 21:53:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607925209;
 bh=i16BifUJiG908ADKX33lN3E+d1H+NPST+DKFRlua0sc=;
 h=From:To:Cc:Subject:From;
 b=Vz742K6NGVNpmN1b2Mu7MfDQY8/MpslxDH3rDOKvNd87Tq2HQdUGp9Zb28PahoBTo
 9KPjGVineDijLgwV+U7csBNuX0nb9QN6k83hjaxFeZNk2GTahWNQFC71XfcguogXN8
 +trPJwx0qNFUM8+41Iv05enSTy0VwY4KkCf/G/1i8NTMKV0TNzg7yRbHKXd9MN43wh
 po+FoQ3oHkG05hHTVnwWwtKuf+W4TvAE0FIZV7YWp16KTnzUOa8xR21rrX8gQn/3lF
 RbpB4SoHtb7EzqCCoueVr6+UL4NR02NttEHOBGIwt2+YnC4k2oUvX7yo4kzowW8Ygr
 wlnxN5hS3PGqg==
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <X9b910/Ldj6kdljm@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kognk-00DDqU-AR
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 5.11
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to bde493349025ca0559e2fff88592935af3b8df19:

  fs-verity: move structs needed for file signing to UAPI header (2020-11-23 19:30:14 -0800)

----------------------------------------------------------------

Some cleanups for fs-verity:

- Rename some names that have been causing confusion.

- Move structs needed for file signing to the UAPI header.

----------------------------------------------------------------
Eric Biggers (4):
      fs-verity: remove filenames from file comments
      fs-verity: rename fsverity_signed_digest to fsverity_formatted_digest
      fs-verity: rename "file measurement" to "file digest"
      fs-verity: move structs needed for file signing to UAPI header

 Documentation/filesystems/fsverity.rst | 68 ++++++++++++++++------------------
 fs/verity/enable.c                     |  8 ++--
 fs/verity/fsverity_private.h           | 36 ++----------------
 fs/verity/hash_algs.c                  |  2 +-
 fs/verity/init.c                       |  2 +-
 fs/verity/measure.c                    | 12 +++---
 fs/verity/open.c                       | 24 ++++++------
 fs/verity/signature.c                  | 14 +++----
 fs/verity/verify.c                     |  2 +-
 include/uapi/linux/fsverity.h          | 49 ++++++++++++++++++++++++
 10 files changed, 116 insertions(+), 101 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
