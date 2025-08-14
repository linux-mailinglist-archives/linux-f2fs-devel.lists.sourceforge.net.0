Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 387ABB26026
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 11:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYdMb8Dq3wuuagn9eK/2nx0C7Bl047x/QcZWhelYi0E=; b=e3wNYHOIktV2ii0iXqXFbbDXGs
	sIiU6HV+4XLJzsjHiwXa33TCiqJti37b0ECs+Sjm0/8iLo2b/wEXBkncXteKtfUHdHSVp2b9QZcaC
	m9ig/FIOvm+XkndzUA45l82H7fjtfQ3PV2WkPrcJb50ufPRSmsG9DwET/Xn+toKs0f8g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umTvq-0003yd-9X;
	Thu, 14 Aug 2025 09:07:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umTvo-0003yS-Tu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 09:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/gmLwUL9zNxj6Z8S0/me8Wci6AHQhZZrIqHje8fvxc=; b=iZD4IjO9Rrzudn10BSHrpkcvKC
 aSF5nBIPW0js+GPoouw0jsQsq52wXASSQJCglFS/yN6sN51BEc8Cm8V/N6WWHc60TQwLNhmwGYBVp
 HuYp1dSfsYmaNngX/RdVm+7QV0uEpOqi018C0D/VDe8BP/v0Oq+o/80ynobfTJvvdGAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X/gmLwUL9zNxj6Z8S0/me8Wci6AHQhZZrIqHje8fvxc=; b=DkTlQwoB3ZAr3jXMOrSs4fGWug
 WtSPO66G2jM6zM0Te5Zo7r3ugUYd+ubzpn0hG0UFV9BSR1U50lx3bxS9ircUgK08vAdpGv33Y2JQb
 OnJehMQgrSWoR2pi7xkMZPzkpfTLrMxDHAnk51+TVRHAlm0+DrUS+EN9dF/fNxA8ib5o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umTvo-0000e2-Fl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 09:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D3163A5602F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 09:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D144C4CEED;
 Thu, 14 Aug 2025 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755162446;
 bh=bvKDV0EG2kLIX5QM3RKwjkNu18T+4tLdYQJQooGxJzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vFXuVIQRjUYfjaGzu1aaTjF7GjP1ZGOeVaLft7ZnlvV0w96+ow6Jg6t5cRVfVJVDz
 bQUoZZ8XAKJK1cbQSkAgg3njCeyAXrS5+5TYZbl9Vl6FkwaQ1WuOi48Z9lMiQTMXGB
 XxnBBS49OlPYglQYdGMp7ntYeXFzY2QAI4jvwAqCDsTVLM/BsKnmVwpO3tSz5XGcj9
 R5VtqYhzZifcev69YiAGhWEqifbDMG1pP2vmUu7NFXp3JxnhiCLITGIZksFs2kmWHT
 SVMV10Qn01MfcIqdf6LJd5RxmEi+EzBLLPc55eFg9xX50RI8awuQxU3LUx32FT0LvZ
 PFU3bpBSQGBcA==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu, 14 Aug 2025 17:07:12 +0800
Message-ID: <20250814090712.2119455-3-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
In-Reply-To: <20250814090712.2119455-1-chao@kernel.org>
References: <20250814090712.2119455-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umTvo-0000e2-Fl
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs/020: do sanity check on i_xattr_nid
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
- use _require_scratch_nocheck instead of _require_scratch
- add missing _require_attrs user
- add comments for why exporting MKFS_OPTIONS=""
 tests/f2fs/020     | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/020.out |  2 ++
 2 files changed, 53 insertions(+)
 create mode 100755 tests/f2fs/020
 create mode 100644 tests/f2fs/020.out

diff --git a/tests/f2fs/020 b/tests/f2fs/020
new file mode 100755
index 00000000..7ce1f92f
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
+$F2FS_INJECT_PROG --node --mb i_xattr_nid --nid 4 --val 4 $SCRATCH_DEV >> $seqres.full
+
+_scratch_mount
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
