Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48970611
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 18:54:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpbZo-0002fM-A1; Mon, 22 Jul 2019 16:54:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hpbZh-0002cH-Ig
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0OB37Oxzxq6uX0+iU4OmD3Dvs1xxfy8bRF2U4ctGNpM=; b=IiTcZDcN12ELcKJuOE0fzVmcFp
 G8rxztyGsCNm5M3d5SqKqSTqqRWIwnaDGHwOi6zeYCrySw1/NL6tPy/2TktLjD9euxQLOjOBLIVg4
 NfuYQk/qgFj0isyVQT+8RIuUMkqC7MHrm63FJ7BZQiIEKpyv71HnEOXr0bSLPf4P71qE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0OB37Oxzxq6uX0+iU4OmD3Dvs1xxfy8bRF2U4ctGNpM=; b=RIHlq6BWvyAPNSoIqSl9vMbBPD
 ZBzPBf5KHhtPsK/JDwNBJI13E6eHUBzJ5ZQa0MFuv/BAnAhRz408MyGMTDgaYbKDqFRZiZDqO2Tya
 VTdjs7p+SpWEapZWPKJsIS7439Dy7Rx2ZuuYO6AeYiA5voBD0e2q4sL54Ql5l1V+JDIk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpbZg-00AySE-AC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:09 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E20672239F;
 Mon, 22 Jul 2019 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563814437;
 bh=F6EBI6dUgeY45+1n89ADuV4BXmX2TtNKYqPP55mznxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xK/7YV4jWqcPW1ojUYsGbBK3swWROEk/+x7Up2IBPNn0+siZA0Wl+pTgWopInVabP
 rSMk03Xt9Vcxlx7060bd0YjTZ5YEnknFVqRCS7cZVzTjiMYTt1f8GgVK//gqLX/d1b
 lnfN064gcJ0z4KNiB2JyLgyML4TjubcHhBsv7Ztg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Jul 2019 09:51:00 -0700
Message-Id: <20190722165101.12840-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722165101.12840-1-ebiggers@kernel.org>
References: <20190722165101.12840-1-ebiggers@kernel.org>
MIME-Version: 1.0
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hpbZg-00AySE-AC
Subject: [f2fs-dev] [PATCH v7 16/17] ext4: update on-disk format
 documentation for fs-verity
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Document the format of verity files on ext4, and the corresponding inode
and superblock flags.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/ext4/inodes.rst   |  6 ++-
 Documentation/filesystems/ext4/overview.rst |  1 +
 Documentation/filesystems/ext4/super.rst    |  2 +
 Documentation/filesystems/ext4/verity.rst   | 41 +++++++++++++++++++++
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/filesystems/ext4/verity.rst

diff --git a/Documentation/filesystems/ext4/inodes.rst b/Documentation/filesystems/ext4/inodes.rst
index 6bd35e506b6fd..e851e6ca31fa0 100644
--- a/Documentation/filesystems/ext4/inodes.rst
+++ b/Documentation/filesystems/ext4/inodes.rst
@@ -277,6 +277,8 @@ The ``i_flags`` field is a combination of these values:
      - This is a huge file (EXT4\_HUGE\_FILE\_FL).
    * - 0x80000
      - Inode uses extents (EXT4\_EXTENTS\_FL).
+   * - 0x100000
+     - Verity protected file (EXT4\_VERITY\_FL).
    * - 0x200000
      - Inode stores a large extended attribute value in its data blocks
        (EXT4\_EA\_INODE\_FL).
@@ -299,9 +301,9 @@ The ``i_flags`` field is a combination of these values:
      - Reserved for ext4 library (EXT4\_RESERVED\_FL).
    * -
      - Aggregate flags:
-   * - 0x4BDFFF
+   * - 0x705BDFFF
      - User-visible flags.
-   * - 0x4B80FF
+   * - 0x604BC0FF
      - User-modifiable flags. Note that while EXT4\_JOURNAL\_DATA\_FL and
        EXT4\_EXTENTS\_FL can be set with setattr, they are not in the kernel's
        EXT4\_FL\_USER\_MODIFIABLE mask, since it needs to handle the setting of
diff --git a/Documentation/filesystems/ext4/overview.rst b/Documentation/filesystems/ext4/overview.rst
index cbab18baba121..123ebfde47ee1 100644
--- a/Documentation/filesystems/ext4/overview.rst
+++ b/Documentation/filesystems/ext4/overview.rst
@@ -24,3 +24,4 @@ order.
 .. include:: bigalloc.rst
 .. include:: inlinedata.rst
 .. include:: eainode.rst
+.. include:: verity.rst
diff --git a/Documentation/filesystems/ext4/super.rst b/Documentation/filesystems/ext4/super.rst
index 04ff079a2acf8..6eae920548278 100644
--- a/Documentation/filesystems/ext4/super.rst
+++ b/Documentation/filesystems/ext4/super.rst
@@ -696,6 +696,8 @@ the following:
        (RO\_COMPAT\_READONLY)
    * - 0x2000
      - Filesystem tracks project quotas. (RO\_COMPAT\_PROJECT)
+   * - 0x8000
+     - Verity inodes may be present on the filesystem. (RO\_COMPAT\_VERITY)
 
 .. _super_def_hash:
 
diff --git a/Documentation/filesystems/ext4/verity.rst b/Documentation/filesystems/ext4/verity.rst
new file mode 100644
index 0000000000000..3e4c0ee0e0683
--- /dev/null
+++ b/Documentation/filesystems/ext4/verity.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Verity files
+------------
+
+ext4 supports fs-verity, which is a filesystem feature that provides
+Merkle tree based hashing for individual readonly files.  Most of
+fs-verity is common to all filesystems that support it; see
+:ref:`Documentation/filesystems/fsverity.rst <fsverity>` for the
+fs-verity documentation.  However, the on-disk layout of the verity
+metadata is filesystem-specific.  On ext4, the verity metadata is
+stored after the end of the file data itself, in the following format:
+
+- Zero-padding to the next 65536-byte boundary.  This padding need not
+  actually be allocated on-disk, i.e. it may be a hole.
+
+- The Merkle tree, as documented in
+  :ref:`Documentation/filesystems/fsverity.rst
+  <fsverity_merkle_tree>`, with the tree levels stored in order from
+  root to leaf, and the tree blocks within each level stored in their
+  natural order.
+
+- Zero-padding to the next filesystem block boundary.
+
+- The verity descriptor, as documented in
+  :ref:`Documentation/filesystems/fsverity.rst <fsverity_descriptor>`,
+  with optionally appended signature blob.
+
+- Zero-padding to the next offset that is 4 bytes before a filesystem
+  block boundary.
+
+- The size of the verity descriptor in bytes, as a 4-byte little
+  endian integer.
+
+Verity inodes have EXT4_VERITY_FL set, and they must use extents, i.e.
+EXT4_EXTENTS_FL must be set and EXT4_INLINE_DATA_FL must be clear.
+They can have EXT4_ENCRYPT_FL set, in which case the verity metadata
+is encrypted as well as the data itself.
+
+Verity files cannot have blocks allocated past the end of the verity
+metadata.
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
