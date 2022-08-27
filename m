Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46A5A3552
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 09:01:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRppD-0005pK-Vt;
	Sat, 27 Aug 2022 07:01:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oRppC-0005p8-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oU84gLJIY1xiUx1IW9KGTOreSjU6JCikJGOPJxtInHs=; b=fYOeKKc1ZVbVgZWoijv8Fvu1I+
 d59O0Fm1hBYxmsxRy67OUFOicsGp1w9XzD6N/t5lVjooLkopOMzwY6x0+l1wsilYhsA7ZGwH9s2Us
 n1X94cy35pubTq/9dwGx/FMrU/W1urrn0rGvRj6Y8LoPr4SuczBLLB/HHRIRRHwGUw48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oU84gLJIY1xiUx1IW9KGTOreSjU6JCikJGOPJxtInHs=; b=Q
 iz6BanS7qHKyGjzYq/r6rt6SVeSG0YXIUoIdudWruARqgpEzeu85uMIv9SZHL4Qmli3VqBFxzg6xx
 geg/zZ2oJTryVZ5FariQfsKnzEdlUJkFDGUIfgT4C2zj0txY49NuTiCKXa7WBzGD9AIPUUGqP/yG7
 HHP/VMXMxXA5KoEY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRppA-002PRT-Am for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 07:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB1E16100A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 07:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEACEC433C1;
 Sat, 27 Aug 2022 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661583690;
 bh=TD/VF5KHXD4wRG8Pr+H+EfaARgN73usGJgQBXXdf6qM=;
 h=From:To:Cc:Subject:Date:From;
 b=LWAceR3fhWYIDpnV9qqfOwOsgBjiLxafwZdx0ifwtHygtEzCeOTClFwZD/Q2YfBW7
 YPwl6lS4PhtvirZ8wp8caBSWY+mMIrSihflRr5bozhXZ5FK/PrU5FrIybPCGIXMjdH
 NLO2WO7PqCl+GYNxdjD0iXQmDmLF+2mMX0U/9Gz/r5eeXGdC6GxSbYNWyQaePi90hO
 J/qqblaICEwrvm0aWoDR+ropylNWmjuUSB4cM6fYqQS9BM1W0FRXtkr145+AZIC0uO
 VGSXaLiZabc1a9wD+g1cJ5gA5UmWKC6cQh9TW50atN2cCEtx/FUHMyWbtRid75dM6H
 aO8BLnX612WYQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 26 Aug 2022 23:58:43 -0700
Message-Id: <20220827065851.135710-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset makes the statx() system call return direct
 I/O (DIO) alignment information. This allows userspace to easily determine
 whether a file supports DIO, and if so with what alignment restrict [...]
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRppA-002PRT-Am
Subject: [f2fs-dev] [PATCH v5 0/8] make statx() return DIO alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset makes the statx() system call return direct I/O (DIO)
alignment information.  This allows userspace to easily determine
whether a file supports DIO, and if so with what alignment restrictions.

Patch 1 adds the basic VFS support for STATX_DIOALIGN.  Patch 2 wires it
up for all block device files.  The remaining patches wire it up for
regular files on ext4, f2fs, and xfs.  Support for regular files on
other filesystems can be added later.

I've also written a man-pages patch, which I sent separately:
https://lore.kernel.org/r/20220722074229.148925-1-ebiggers@kernel.org

Note, f2fs has a corner case where DIO reads are allowed but not DIO
writes.  The proposed statx fields can't represent this.  The current
proposal just reports that DIO is unsupported in this case.

This patchset applies to v6.0-rc2.

Changed in v5:
   - Accounted for the DIO changes in 6.0 by setting dio_mem_align to
     the DMA alignment instead of the logical block size where needed.

   - Dropped the patch "f2fs: don't allow DIO reads but not DIO writes".

   - Added some Reviewed-by and Acked-by tags.

Changed in v4:
   - Added xfs support.

   - Moved the helper function for block devices into block/bdev.c.
   
   - Adjusted the ext4 patch to not introduce a bug where misaligned DIO
     starts being allowed on encrypted files when it gets combined with
     the patch "iomap: add support for dma aligned direct-io" that is
     queued in the block tree for 5.20.

   - Made a simplification in fscrypt_dio_supported().

Changed in v3:
   - Dropped the stx_offset_align_optimal field, since its purpose
     wasn't clearly distinguished from the existing stx_blksize.

   - Renamed STATX_IOALIGN to STATX_DIOALIGN, to reflect the new focus
     on DIO only.

   - Similarly, renamed stx_{mem,offset}_align_dio to
     stx_dio_{mem,offset}_align, to reflect the new focus on DIO only.

   - Wired up STATX_DIOALIGN on block device files.

Changed in v2:
   - No changes.

Eric Biggers (8):
  statx: add direct I/O alignment information
  vfs: support STATX_DIOALIGN on block devices
  fscrypt: change fscrypt_dio_supported() to prepare for STATX_DIOALIGN
  ext4: support STATX_DIOALIGN
  f2fs: move f2fs_force_buffered_io() into file.c
  f2fs: simplify f2fs_force_buffered_io()
  f2fs: support STATX_DIOALIGN
  xfs: support STATX_DIOALIGN

 block/bdev.c              | 23 ++++++++++++++++++
 fs/crypto/inline_crypt.c  | 49 +++++++++++++++++++--------------------
 fs/ext4/ext4.h            |  1 +
 fs/ext4/file.c            | 37 ++++++++++++++++++++---------
 fs/ext4/inode.c           | 37 +++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h            | 40 --------------------------------
 fs/f2fs/file.c            | 43 +++++++++++++++++++++++++++++++++-
 fs/stat.c                 | 14 +++++++++++
 fs/xfs/xfs_iops.c         | 10 ++++++++
 include/linux/blkdev.h    |  4 ++++
 include/linux/fscrypt.h   |  7 ++----
 include/linux/stat.h      |  2 ++
 include/uapi/linux/stat.h |  4 +++-
 13 files changed, 188 insertions(+), 83 deletions(-)


base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
