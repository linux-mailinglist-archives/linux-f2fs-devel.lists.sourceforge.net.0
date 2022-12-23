Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 100EB655483
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8onJ-0000p8-Qm;
	Fri, 23 Dec 2022 20:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omy-0000oS-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wiQPotQZ2G9Fw66RPEDxqUP+lv8gEWdFUv8fhYg5rM=; b=N53oQZU+SE00G9iLz9NAt01093
 jYI+oxiZQfNSH5ndFhCU4lbyZF6cW+Zw1b3yObLm9IycAuWxJ4wpqXm0j2711wGkF/yx6lhrhbtmN
 f/vwrcy5Dv21lL7LxVNczz41KBIQmyF6ohdwBx2AU7/fgI3WMInfFlDXMp38/f8icSsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8wiQPotQZ2G9Fw66RPEDxqUP+lv8gEWdFUv8fhYg5rM=; b=W
 2/cidDJ5f5hYJ0N3irrCSKtrYAjCXStvfEM3NZXkjfJkUb8NSFSlJpyhVLKcm1ezx4MIbVRglUJdc
 6ql+LhzGboIF7u1tMgev9NGnrc7jo4d//QCPLehCXOp/0V5ff/elUyoQixgICULtMKycC+wTwuda3
 OIKzyDTa6AwHarhU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8omu-009S2E-Ts for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EF10B8210B;
 Fri, 23 Dec 2022 20:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1111C433D2;
 Fri, 23 Dec 2022 20:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827816;
 bh=kuHoLDiwzIWt/yosaiuNbL76iPgmKQeB3oMrh4p5xhg=;
 h=From:To:Cc:Subject:Date:From;
 b=B7Cu5MHwFXyHpkWZYORJe5npw6Jrf1ax1VKcHSg3IFIcJDzGR9a97Ncit2dNZPAIn
 zchceSAsxgUW9LWZwY+Qs21W42THfLhyb73HWKYCQMD6C3nyrNmv03p6rEqIKff2vX
 rGocAZ5zYfyRKsGNeRx5kmBn6OpsxJaxvfI0pqee3hx1HNdZXebmxhO1m0ANxY9Osp
 w/RSqDNgQw3oGnoM8VKaM1pEOZnyb0VQUtFSgmrbPXZ4DFlh6cLeHnmzpgqJ0IJS7e
 oHfsWT1U3jch+XCx3vCHk3VC1pQueY3KEUpgWxfGU6DxWmkttz2NYAqCwQeIyJzmL0
 RCxP/GM9U3Qmg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:27 -0800
Message-Id: <20221223203638.41293-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [This patchset applies to mainline + some fsverity cleanups
 I sent out recently. You can get everything from tag "fsverity-non4k-v2"
 of https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ] Currently,
 filesystems
 (ext4, f2fs, and btrfs) only support fsverity when the Merkle tree block
 size, filesystem block size, and page size are all the same. In practice that
 means 4K, since increasing [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8omu-009S2E-Ts
Subject: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[This patchset applies to mainline + some fsverity cleanups I sent out
 recently.  You can get everything from tag "fsverity-non4k-v2" of
 https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ]

Currently, filesystems (ext4, f2fs, and btrfs) only support fsverity
when the Merkle tree block size, filesystem block size, and page size
are all the same.  In practice that means 4K, since increasing the page
size, e.g. to 16K, forces the Merkle tree block size and filesystem
block size to be increased accordingly.  That can be impractical; for
one, users want the same file signatures to work on all systems.

Therefore, this patchset reduces the coupling between these sizes.

First, patches 1-4 are cleanups.

Second, patches 5-9 allow the Merkle tree block size to be less than the
page size or filesystem block size, provided that it's not larger than
either one.  This involves, among other things, changing the way that
fs/verity/verify.c tracks which hash blocks have been verified.

Finally, patches 10-11 make ext4 support fsverity when the filesystem
block size is less than the page size.  Note, f2fs doesn't need similar
changes because f2fs always assumes that the filesystem block size and
page size are the same anyway.  I haven't looked into btrfs yet.

I've tested this patchset using the "verity" group of tests in xfstests
with the following xfstests patchset applied:
"[PATCH v2 00/10] xfstests: update verity tests for non-4K block and page size"
(https://lore.kernel.org/fstests/20221223010554.281679-1-ebiggers@kernel.org/T/#u)

Note: on the thread "[RFC PATCH 00/11] fs-verity support for XFS"
(https://lore.kernel.org/linux-xfs/20221213172935.680971-1-aalbersh@redhat.com/T/#u)
there have been many requests for other things to support, including:

  * folios in the pagecache
  * alternative Merkle tree caching methods
  * direct I/O
  * merkle_tree_block_size > page_size
  * extremely large files, using a reclaimable bitmap

We shouldn't try to boil the ocean, though, so to keep the scope of this
patchset manageable I haven't changed it significantly from v1.  This
patchset does bring us closer to many of the above, just not all the way
there.  I'd like to follow up this patchset with a change to support
folios, which should be straightforward.  Next, we can do a change to
generalize the Merkle tree interface to allow XFS to use an alternative
caching method, as that sounds like the highest priority item for XFS.

Anyway, the changelog is:

Changed in v2:
   - Rebased onto the recent fsverity cleanups.
   - Split some parts of the big "support verification" patch into
     separate patches.
   - Passed the data_pos to verify_data_block() instead of computing it
     using page->index, to make it ready for folio and DIO support.
   - Eliminated some unnecessary arithmetic in verify_data_block().
   - Changed the log_* fields in merkle_tree_params to u8.
   - Restored PageLocked and !PageUptodate checks for pagecache pages.
   - Eliminated the change to fsverity_hash_buffer().
   - Other small cleanups

Eric Biggers (11):
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

 Documentation/filesystems/fsverity.rst |  76 +++---
 fs/buffer.c                            |  67 ++++-
 fs/ext4/readpage.c                     |   3 +-
 fs/ext4/super.c                        |   5 -
 fs/f2fs/data.c                         |   3 +-
 fs/verity/enable.c                     | 260 ++++++++++----------
 fs/verity/fsverity_private.h           |  20 +-
 fs/verity/hash_algs.c                  |  24 +-
 fs/verity/open.c                       |  98 ++++++--
 fs/verity/verify.c                     | 325 +++++++++++++++++--------
 include/linux/fsverity.h               |  14 +-
 11 files changed, 565 insertions(+), 330 deletions(-)

-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
