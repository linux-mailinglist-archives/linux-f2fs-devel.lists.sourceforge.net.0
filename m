Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A469C28D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Feb 2023 21:48:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pTqby-0004Kh-I4;
	Sun, 19 Feb 2023 20:48:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pTqbx-0004Kb-00
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Feb 2023 20:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bIL+gC0ZV1/FdIey5KqDX1HK47h3GensHcWtFAxL880=; b=SzSheOWSNKz8W3JQXwJp0x9gGU
 eQnz19iac1Vhe0sv4ZUAOnPxCoNOat7kkknQ2oPMGTnvVsCImbe18E7go+QHsf4k/w7oP3agJ3zTc
 qo6/80K2uFEkhQ20Lln03/pdQcQ8mEkXA+aiIBb5JnqItn1CrXhwlB2x+8PHR9P2yD0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bIL+gC0ZV1/FdIey5KqDX1HK47h3GensHcWtFAxL880=; b=G
 Pt4HZDkvKugVvShVhELvs6+WFT7MaeI5ZvbwlJTubeB7fi1WUDx8P7ZBHAHnidW4flrbgs7o3s06A
 zhIocLzEnt8rGgBY979AnDMUGXMNlWTyRc3/Wt2KJynuDOB4xK5t/NXPTdoJSzPJbWa1Y9sezbe3G
 OsuXKvKQ3QE6vg/s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pTqbv-0007Vm-D9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Feb 2023 20:48:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49E25B80AB2;
 Sun, 19 Feb 2023 20:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A891DC433D2;
 Sun, 19 Feb 2023 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676839711;
 bh=pPKAZ01/fvm24mHTwEi4mThE8LjTnMIHE3uOq5HgJ2A=;
 h=Date:From:To:Cc:Subject:From;
 b=oSlao0JM5OYo6ACCVQAkZY5Q93HpYAmJpHW43ds1Q+OotpwLMAC3C9/0HAr7TFg3j
 6iIScv4Z4TH0wEmaVQkCJdPjTX6g/FquCqjZVYcGvxDH07+RM8m6LDrUySsLDBPuqi
 kx6b261+A/6sLtqlXctM6FSJAAIPJJv77aUq42aj0pCr5WDIc1kyWj5lhvOVYLkn0r
 cUh/UmZQFRoSM6xwvOh9KAflYXuOznidceBSBU+f2ggZiirn5X6fhwfMXGWTtNFT8S
 6TdKb8FV8xBjDKCf2hVWu6N3Wia/s6Wev2JmhPmVMgbPD47DmxWaULT29NvK4TcFeJ
 G9byS+5xJ9d0A==
Date: Sun, 19 Feb 2023 12:48:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Y/KLHT3zaA0QFhVJ@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following changes since commit
 88603b6dc419445847923fcb7fe5080067a30f98:
 Linux 6.2-rc2 (2023-01-01 13:53:16 -0800) are available in the Git repository
 at: Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pTqbv-0007Vm-D9
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 6.3
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
Cc: fsverity@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

for you to fetch changes up to 51e4e3153ebc32d3280d5d17418ae6f1a44f1ec1:

  fscrypt: support decrypting data from large folios (2023-01-28 15:10:12 -0800)

----------------------------------------------------------------

Fix the longstanding implementation limitation that fsverity was only
supported when the Merkle tree block size, filesystem block size, and
PAGE_SIZE were all equal.  Specifically, add support for Merkle tree
block sizes less than PAGE_SIZE, and make ext4 support fsverity on
filesystems where the filesystem block size is less than PAGE_SIZE.

Effectively, this means that fsverity can now be used on systems with
non-4K pages, at least on ext4.  These changes have been tested using
the verity group of xfstests, newly updated to cover the new code paths.

Also update fs/verity/ to support verifying data from large folios.
There's also a similar patch for fs/crypto/, to support decrypting data
from large folios, which I'm including in this pull request to avoid a
merge conflict between the fscrypt and fsverity branches.

There will be a merge conflict in fs/buffer.c with some of the foliation
work in the mm tree.  Please use the merge resolution from linux-next.

----------------------------------------------------------------
Eric Biggers (19):
      fsverity: optimize fsverity_file_open() on non-verity files
      fsverity: optimize fsverity_prepare_setattr() on non-verity files
      fsverity: optimize fsverity_cleanup_inode() on non-verity files
      fsverity: pass pos and size to ->write_merkle_tree_block
      fsverity: remove debug messages and CONFIG_FS_VERITY_DEBUG
      fsverity: use unsigned long for level_start
      fsverity: simplify Merkle tree readahead size calculation
      fsverity: store log2(digest_size) precomputed
      fsverity: use EFBIG for file too large to enable verity
      fsverity: replace fsverity_hash_page() with fsverity_hash_block()
      fsverity: support verification with tree block size < PAGE_SIZE
      fsverity: support enabling with tree block size < PAGE_SIZE
      ext4: simplify ext4_readpage_limit()
      f2fs: simplify f2fs_readpage_limit()
      fs/buffer.c: support fsverity in block_read_full_folio()
      ext4: allow verity with fs block size < PAGE_SIZE
      fsverity.rst: update git repo URL for fsverity-utils
      fsverity: support verifying data from large folios
      fscrypt: support decrypting data from large folios

 Documentation/filesystems/fscrypt.rst  |   4 +-
 Documentation/filesystems/fsverity.rst |  96 +++++----
 fs/btrfs/verity.c                      |  19 +-
 fs/buffer.c                            |  72 +++++--
 fs/crypto/bio.c                        |  10 +-
 fs/crypto/crypto.c                     |  28 +--
 fs/ext4/inode.c                        |   6 +-
 fs/ext4/readpage.c                     |   3 +-
 fs/ext4/super.c                        |   5 -
 fs/ext4/verity.c                       |   6 +-
 fs/f2fs/data.c                         |   3 +-
 fs/f2fs/verity.c                       |   6 +-
 fs/verity/Kconfig                      |   8 -
 fs/verity/enable.c                     | 271 ++++++++++++--------------
 fs/verity/fsverity_private.h           |  24 +--
 fs/verity/hash_algs.c                  |  24 ++-
 fs/verity/init.c                       |   1 -
 fs/verity/open.c                       | 163 +++++++++-------
 fs/verity/signature.c                  |   2 -
 fs/verity/verify.c                     | 346 ++++++++++++++++++++++-----------
 include/linux/fscrypt.h                |   9 +-
 include/linux/fsverity.h               |  93 +++++++--
 22 files changed, 699 insertions(+), 500 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
