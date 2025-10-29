Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F188C1A1FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 12:54:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zALkY81XX3YqSqs8BdddvJBiNzzkFD170XppIy5WJSk=; b=OHkaS6BxKTXhzCu2E17sHhJ40Q
	9od33sQfBnowOYG0zpflx0ylJz3fg1e9uaTuEzLbJgLmXxwbMouV+b8WDE5SLx6pv5RUE50vFT/T1
	RQmQmU45GuaG8YmFa1oRCpm2cORSzsCwDm+L+onyMF9r6VoWmXAcWDFebvwhRkDE09fk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE4l2-0004gX-Th;
	Wed, 29 Oct 2025 11:54:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vE4l1-0004gL-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 11:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJDuAVGpi0Gi8TxzDOaYkBhvqfd2exxF26PzAR4YwHE=; b=frQawNLYx1uJCqtH/O9fzBsGmC
 yElnBfUEGjPVpllMycjqyzxNkIqdCysYr2eFNc8u8/N4G/Ta++3OjuDdkoY7v5ZMl6npjciROiMnr
 aoMNr712HIJUNDkZJ2NSRGjLUmSaCs9eSnK7ZLjCDnXlvn/cQ96NWQe5or/I3rfwAQgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IJDuAVGpi0Gi8TxzDOaYkBhvqfd2exxF26PzAR4YwHE=; b=A
 8uF7pxSP+r+nEkpDpWnr1DeNn3ezbEgr7JR5hP7wQ3MjxplzP+I3ItolrqQLBej99DFETlXntlcwA
 xhpZTvGieazFyx1SIO0jNtjlDQGMPRpE1a+FpaNMNV8eP0XzpDtNO6gVCR/AM9/KRC7DpG5byBYD7
 bCXg/TiM4HrrGbP4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vE4l2-0000U6-2O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 11:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC19143270
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 11:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA8EC4CEF7;
 Wed, 29 Oct 2025 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761738862;
 bh=QYWNcLUo1Xo3vHpwv4dqRFJ8Nq83iubr9cMZzymfZkg=;
 h=From:To:Cc:Subject:Date:From;
 b=PQUWMLGeW9qxxL5p8urexuWi7vtflz7CHm83HfSJeXr7Ur1TBquTPW8oGwv7nqr9e
 niojTbZzHamkt07AMUT3kvliHLszdn4HUwhpaxNL8saZXUEtvXUs11nz+jcav5+UGv
 I8jvbm4JmrxhEzSbd+HdNjg1L8e1l+fBTf1Nk2kopzgFMDr2+La9USjKrBRuIWBOhD
 12bZFPOUVUesE+HvgUvHOiWcTSQWBG/Ybgv2+vezHHWgJijrnhFbbR3PFfQW7TmvMy
 FDAGm4/rPTsuVrjppAHd6fM7udDf3sGH49qxPeQ3PNbhkjRrBpvfNGHJmMgY5r3Tz+
 Yadj345HoB/Yw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Wed, 29 Oct 2025 19:54:13 +0800
Message-ID: <20251029115413.1085987-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 5c1768b67250 ("f2fs: fix to do sanity check
 correctly
 on i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
 correctly, let's add this regression testcase to check tha [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vE4l2-0000U6-2O
Subject: [f2fs-dev] [PATCH] f2fs/023: test sanity check condition w/ error
 injection
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

After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on
i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
correctly, let's add this regression testcase to check that.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/023     | 44 ++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/023.out |  2 ++
 2 files changed, 46 insertions(+)
 create mode 100755 tests/f2fs/023
 create mode 100644 tests/f2fs/023.out

diff --git a/tests/f2fs/023 b/tests/f2fs/023
new file mode 100755
index 00000000..d1b7df32
--- /dev/null
+++ b/tests/f2fs/023
@@ -0,0 +1,44 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu <chao@kernel.org>
+#
+# FS QA Test No. f2fs/023
+#
+# This testcase tries to inject fault into inode.i_inline_xattr_size,
+# and check whether sanity check of f2fs can handle fault correctly.
+#
+
+. ./common/preamble
+_begin_fstest auto quick rw
+
+_fixed_by_kernel_commit 5c1768b67250 \
+        "f2fs: fix to do sanity check correctly on i_inline_xattr_size"
+
+_require_scratch_nocheck
+_require_inject_f2fs_command node i_inline
+_require_inject_f2fs_command node i_inline_xattr_size
+
+testfile=$SCRATCH_MNT/testfile
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+_scratch_mkfs "-O extra_attr,flexible_inline_xattr" >> $seqres.full
+_scratch_mount "-o inline_xattr_size=512" >>$seqres.full 2>&1
+touch $testfile
+_scratch_unmount
+
+# inject .i_inline field: clear F2FS_EXTRA_ATTR bit
+$F2FS_INJECT_PROG --node --mb i_inline --nid 4 --val 0x1 $SCRATCH_DEV \
+		>>$seqres.full || _fail "failed to inject i_inline"
+
+# inject .i_inline_xattr_size field from 512 to 2048
+$F2FS_INJECT_PROG --node --mb i_inline_xattr_size --nid 4 --val 2048 $SCRATCH_DEV \
+		>>$seqres.full || _fail "failed to inject i_inline_xattr_size"
+
+_scratch_mount
+
+getfattr -n user.test "$testfile" 2>&1 | awk -F ': ' '/Structure needs cleaning/ { print $NF }'
+
+status=0
+exit
diff --git a/tests/f2fs/023.out b/tests/f2fs/023.out
new file mode 100644
index 00000000..7f16f33f
--- /dev/null
+++ b/tests/f2fs/023.out
@@ -0,0 +1,2 @@
+QA output created by 023
+Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
