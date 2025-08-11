Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB0B20418
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 11:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oi51W5ZLcDMm82FaIUVj7wPFq3b7RU4QtPV9qgQtIA=; b=YJ9Uo7ReEqA42x1fv2qd/rgKgQ
	23REALp7EvEAyGD1RruLb66F2OEyOrVLRGQXF/eFWpID6eRSFpTK1Bo8dg6s3W4XvUqWCPWvqUQT1
	PKU9WggDFdVlwv+k51GA0fyaaCfkATBwpFwdSIaj4xT63TV3KkhG0n+lW42pXspGskHw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulP5Q-0007rj-II;
	Mon, 11 Aug 2025 09:45:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ulP5P-0007rC-4J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 09:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J4msbot4Z/hkHNTAmd6Yv7hvrmXYtIoxQ+E1pZzMzls=; b=T24mNhi19b8P7P2ud5sMVaZqMW
 GEO6Oi3WskrBxX0WHjwmIWm6AdekbC2gR/OKCckBm4PKohMwIgLOy2r/drqNlGneGcKqLzXpiWsMM
 Jp3D6tAODRGSOYnlfd/QO/aFXiDFowy9cJ+gjGaRCuhxAdgzHNRwuhEm0D17MC1JQq1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J4msbot4Z/hkHNTAmd6Yv7hvrmXYtIoxQ+E1pZzMzls=; b=hO91NW/NLvJYmphpcuukJUidB6
 5YH+r+WyAFyeyl66jgXo9Y1JKl+0266MtHKBJ0Vy41/3kc4zq8K5efRbbLIOCr7fo/OMz6SEEJQaJ
 8+loNSovlm0Z58qytzNySo5lTnhMg6VZ8jLfTl0VNaaZmXC0KLaloOLml6FnSEYomWlE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulP57-0001z5-3d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 09:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5CA4245BF9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Aug 2025 09:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD2EC4CEFB;
 Mon, 11 Aug 2025 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754905469;
 bh=SCX+YjKJkJ/VeztokqRniYPe2UUt02QoTX+IsmNZPMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=imYecZVxMec/Sl1bQn8PRf2MG90/oUrXlZXAt0x+OMZMXEHAyDHKzHYPDoY/I3Tzj
 phy0EN/RkRT3BLi9fbBx7W8iOUvlZWwU0yWzLovDRlq2tZVHD4aSM6FZk8wg7WxmFP
 3lZ/CRLp88Mllh/JWcYGoRo8FGM8GK+6ve4farZBLlTDCAg1DW96gxPNM7bTIyK643
 6wBtWHrztySEbbi3ZKKCmFd00GC+fGLsX+ydRJHKrmh2jufXXkKHetukkfmXH8+zj0
 DgM9WLYSpl4/7qBS1/lsFdWYngHL+c976wu99JZORaGt6uzgsdCpgE9D1NeMSVD0Hi
 6jdCHB7yoBlPQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 11 Aug 2025 17:44:14 +0800
Message-ID: <20250811094415.1053545-2-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
In-Reply-To: <20250811094415.1053545-1-chao@kernel.org>
References: <20250811094415.1053545-1-chao@kernel.org>
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
X-Headers-End: 1ulP57-0001z5-3d
Subject: [f2fs-dev] [PATCH 2/3] f2fs/019: do sanity check on mapping table
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test:
1. create a file
2. write file to create a direct node at special offset
3. use inject.f2fs to inject nid of direct node w/ ino of the inode
4. check whether f2fs kernel module will detect and report such
   corruption in the fil

Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/019     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/019.out |  2 ++
 2 files changed, 47 insertions(+)
 create mode 100755 tests/f2fs/019
 create mode 100644 tests/f2fs/019.out

diff --git a/tests/f2fs/019 b/tests/f2fs/019
new file mode 100755
index 00000000..0a02eb2f
--- /dev/null
+++ b/tests/f2fs/019
@@ -0,0 +1,45 @@
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
+_begin_fstest auto quick rw compress
+
+_cleanup()
+{
+	_scratch_mkfs >> $seqres.full
+}
+
+_fixed_by_kernel_commit 77de19b6867f \
+	"f2fs: fix to avoid out-of-boundary access in dnode page"
+
+export MKFS_OPTIONS=""
+_require_scratch
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+testfile=$SCRATCH_MNT/testfile
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+xfs_io -f -c "pwrite 3738M 1M" -c "fsync" $testfile >> $seqres.full
+
+_scratch_unmount
+
+$F2FS_INJECT_PROG --node --mb addr --nid 5 --idx 937 --val 4 $SCRATCH_DEV >> $seqres.full
+
+_scratch_mount
+xfs_io -c "pread 3700M 40M" $testfile
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
