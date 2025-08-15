Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D09B27AAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 10:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grWUspMemtkG3m3XWY486u9mWCQrlR07riVrXYH7jQ8=; b=V4SBzdeekCF4mjYZ1JuN2yxBY/
	iH9DLa/1H3aWb/v0oze1to3+AXpJyIYW2ux6aeS8L50H+q1KWl0byNwrLDFclzrJ6RclrblN3JnDp
	B4JwSNDGVkPwrE/t+PA95PelM3YxD/bPr6QS80TmhdBORid3jJJc4mplK5ARfsv0IrDA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umpZx-0002ay-7K;
	Fri, 15 Aug 2025 08:14:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umpZs-0002Yv-2M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rbVV8rRB4LBXqbQtONuvv44FJKMzOzDYOkbaOukCJw8=; b=NgLGdba+OtRAOt+aGB2bk/XFVF
 uCiJVmW/l5ycEsmagmtwEqzv4UJ1BMko36DXLdw0ND3MX+VKrfpvTedVueyKOEuXJ6MsRvN7RB3Li
 DeY+x1TOaVH2nZa0dmQQPIlissyrWY9bCmq5JccRFP+uQxOEH33cHzhMQckzJBNAXo3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rbVV8rRB4LBXqbQtONuvv44FJKMzOzDYOkbaOukCJw8=; b=nF3rMMxN+W+Y4PE836Z4TjVYW6
 YH/VWH64CY02ODjb/fwh15UPit4x70o+wd9b7XfrY25d1pxMjXZXFM2kGMdrDyFjIm5sXDqAf744b
 eMeoLNcDl2Z3MLEWmpQmdbRXl2IZeenTylPF+kRnSFbU/LLnGgABfIYIG3dlayYcwruA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umpZr-0006MT-MP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 614F6442EA;
 Fri, 15 Aug 2025 08:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC36BC4CEF5;
 Fri, 15 Aug 2025 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755245654;
 bh=Jk/PTYM7LNHgvScV6Rq83FBn8mQ58k5htqZ0llO0bwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OtFBOFoz0V5PbxV/gvJuuIikz2CQBu4kQvyZMmnZmFrBPbaahuDX0IIsj8WW+Assq
 T1EwWWWbe2ni+8mBaqW1IGdmozlEMe6FK3Yurx5lXrINj+zMr1ECWtNkrqC9B3XYXL
 4XSH0P0X55dUyr9gm95PT8ZMt8ZgjMFv0woPgxtqHkbgZiZkt9E07boeMH2FERLHtd
 B2YsF7fTEKP3rnPeCiqr5DF/8v3zAzq5Ge9GCUgU0e78adyAudJM6VmK3Tiox1L5fi
 hMo/k0E6Rvh5GZgUYjfH0dmzGfpb/PnOs48bZ/7T9S4FuaiDejOfM6emaIpilciWmN
 MFmaAKvG0FkNw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Fri, 15 Aug 2025 16:14:04 +0800
Message-ID: <20250815081405.2523015-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250815081405.2523015-1-chao@kernel.org>
References: <20250815081405.2523015-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test: 1. create a file 2. write file
 to create a direct node at special offset 3. use inject.f2fs to inject nid
 of direct node w/ ino of the inode 4. check whether f2fs kernel mod [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umpZr-0006MT-MP
Subject: [f2fs-dev] [PATCH v3 2/3] f2fs/019: do sanity check on mapping table
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test:
1. create a file
2. write file to create a direct node at special offset
3. use inject.f2fs to inject nid of direct node w/ ino of the inode
4. check whether f2fs kernel module will detect and report such
   corruption in the fil

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Reviewed-by: Zorro Lang <zlang@redhat.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add RVB tag from Zorro
 tests/f2fs/019     | 42 ++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/019.out |  2 ++
 2 files changed, 44 insertions(+)
 create mode 100755 tests/f2fs/019
 create mode 100644 tests/f2fs/019.out

diff --git a/tests/f2fs/019 b/tests/f2fs/019
new file mode 100755
index 00000000..2307bd96
--- /dev/null
+++ b/tests/f2fs/019
@@ -0,0 +1,42 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/019
+#
+# This is a regression test:
+# 1. create a file
+# 2. write file to create a direct node at special offset
+# 3. use inject.f2fs to inject nid of direct node w/ ino of the inode
+# 4. check whether f2fs kernel module will detect and report such
+#    corruption in the file
+#
+. ./common/preamble
+_begin_fstest auto quick rw
+
+_fixed_by_kernel_commit 77de19b6867f \
+	"f2fs: fix to avoid out-of-boundary access in dnode page"
+
+_require_scratch_nocheck
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+testfile=$SCRATCH_MNT/testfile
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+$XFS_IO_PROG -f -c "pwrite 3738M 1M" -c "fsync" $testfile >> $seqres.full
+
+_scratch_unmount
+
+$F2FS_INJECT_PROG --node --mb addr --nid 5 --idx 937 --val 4 $SCRATCH_DEV >> $seqres.full
+
+_scratch_mount
+$XFS_IO_PROG -c "pread 3700M 40M" $testfile
+_scratch_unmount
+
+status=0
+exit
diff --git a/tests/f2fs/019.out b/tests/f2fs/019.out
new file mode 100644
index 00000000..2f7469e2
--- /dev/null
+++ b/tests/f2fs/019.out
@@ -0,0 +1,2 @@
+QA output created by 019
+pread: Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
