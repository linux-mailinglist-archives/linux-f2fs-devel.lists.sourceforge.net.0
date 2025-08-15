Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E2B27AB0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 10:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41+mhJITvaLHYz4NzMl7DlIPlM1qUJ21LYKPNDtRLFQ=; b=HDboBYWYsYa07rOztMGiWO2gMq
	7tTnHnYGbMoS8Wt2yqYDXkzSz4u3r44j5/794ExZDtZsuGmuxI4PRFPcsV2XOLN8nF7t8BXg6sOV3
	I+dmyvyaifcA5WLcccK7suRisqCCxFXNtQxFp3A+98ooGt4GQlOfnbcFZtkiGdQunyUc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umpZv-0003zU-8a;
	Fri, 15 Aug 2025 08:14:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umpZt-0003zG-Hs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yn/A7kPTkuEdT4ng6RzxvZF9RiAgXp98mgE8bHHjqwM=; b=mCl4MdQP1hhpf1/qI6A3PVkC7S
 b5vIe2Iu6YKJ9qwZOP+Dw1Zl2eZoWocursbxUNTruE5AuULvDwXuEUDVMo9lg2jkOkRmBZMITTGbY
 8KP4xOTT82o91Z4psnRBobXD42NkUUjKUmEbYbVtjLKdz7A1GxRXNkgbx9eMHEFgIk0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yn/A7kPTkuEdT4ng6RzxvZF9RiAgXp98mgE8bHHjqwM=; b=OuIYlFRUA9ZlmtBYyTwfPgy4dE
 pMXIX26KmnymRZshFXzv35wTnjeX2TWOLkvVvL4K+HOAZ7mkDH+/vYXiUxDGbSBsmRfPSpJqtyeCu
 zGWqZHw7ztMmmGU+5fopSCdJmepmUvqDKpr5CuXncrBclNGJ9nWOrV5fNNaXADEuGzO4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umpZt-0006MY-Sx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54DE26115D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 08:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C08C4CEEB;
 Fri, 15 Aug 2025 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755245656;
 bh=g9W+KR8VTvP30/K9dU4YxJpyh9Nh4m0whgOQj9vtep4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xe1ZY7ocA4eVqD0VIZOqT0p0FLTSczacl0u+lLog0Mn0ZJnsUscUDf9EAx+Zy/yud
 fT4r45qYWpJplFkdiSRvcoxD9eF7HAbgDRh6kBW1MqUke3FnYLItZIp+tO4Gl+NY64
 0nu6Gs3oEPfAjb/zm31fsPTBAdhebGfTAAGdIGbbbkIrO2vx87+HTDdt8mMfWVrhjs
 PR6Bx9oUH+0fWoMTVu+i1ibwvOV3D0ZlzhzNa/AxY3qvI/jNvvm5KNVDG0Ln3GvPlB
 CiTGLPyal3xcc5MlV3FICrYcXHipQdNxajm0yKnhOf5GdQ5w+5PbBSIUTNcqOwuXqG
 hIQF1is1ndlpg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Fri, 15 Aug 2025 16:14:05 +0800
Message-ID: <20250815081405.2523015-3-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250815081405.2523015-1-chao@kernel.org>
References: <20250815081405.2523015-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test: 1. create directory 2. add a new
 xattr entry to create xattr node 3. use inject.f2fs to inject nid of xattr
 node w/ ino in a file 4. check whether f2fs kernel module will de [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umpZt-0006MY-Sx
Subject: [f2fs-dev] [PATCH v3 3/3] f2fs/020: do sanity check on i_xattr_nid
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
1. create directory
2. add a new xattr entry to create xattr node
3. use inject.f2fs to inject nid of xattr node w/ ino in a file
4. check whether f2fs kernel module will detect and report such
   corruption in the file

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- fix mount option
- check return value of inject.f2fs
 tests/f2fs/020     | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/020.out |  2 ++
 2 files changed, 53 insertions(+)
 create mode 100755 tests/f2fs/020
 create mode 100644 tests/f2fs/020.out

diff --git a/tests/f2fs/020 b/tests/f2fs/020
new file mode 100755
index 00000000..38bc6582
--- /dev/null
+++ b/tests/f2fs/020
@@ -0,0 +1,51 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/020
+#
+# This is a regression test:
+# 1. create directory
+# 2. add a new xattr entry to create xattr node
+# 3. use inject.f2fs to inject nid of xattr node w/ ino in a file
+# 4. check whether f2fs kernel module will detect and report such
+#    corruption in the file
+#
+. ./common/preamble
+_begin_fstest auto quick rw
+
+. ./common/attr
+
+_fixed_by_kernel_commit 061cf3a84bde \
+	"f2fs: fix to do sanity check on ino and xnid"
+
+_require_scratch_nocheck
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_attrs user
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+testdir=$SCRATCH_MNT/testdir
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount "-o user_xattr,noinline_xattr"
+
+mkdir $testdir
+# add a new xattr entry to create xattr node
+$SETFATTR_PROG -n user.abc -v 123 $testdir
+
+_scratch_unmount
+
+# inject i_xattr_nid w/ nid of inode node
+$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
+
+_scratch_mount "-o acl,user_xattr"
+# may potentially trigger a deadlock w/ double inode_lock on parent's inode
+mkdir $testdir/dir >> $seqres.full 2>&1
+_scratch_unmount
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/020.out b/tests/f2fs/020.out
new file mode 100644
index 00000000..20d7944e
--- /dev/null
+++ b/tests/f2fs/020.out
@@ -0,0 +1,2 @@
+QA output created by 020
+Silence is golden
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
