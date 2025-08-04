Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0BCB1A0A4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 13:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lEsxWftIhUfbBrAIdf3gfA/xQt/bv102AkIcZein+s=; b=JDK0SvqN+yW/atk5IAF+HGR4VT
	7IwALvhaKPAZv3PuLUeWAbyHPNU8klTgcG2Ovz56RSqgkc1U6i7INduBxJ9/9FC7YiqUw/h02YpAe
	v38UtEz2FZAH4BNDxca2oVerh0Qh/qKcqjW5t+71SgyOJ2ECOiN3mKoZ20gI2xI8Igdg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uitYW-0005Ey-GO;
	Mon, 04 Aug 2025 11:40:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uitYV-0005Em-5m
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 11:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gzm4AQQ+FoHr1N0/i2gls9tvqoqnFALTGgmvz20xsac=; b=S6rABxVRj+kHkXhtdmq/8RDJdE
 b+9HhJShD95ZIpHKZOkX4IPhXrYT8E07vNuyt5m4xAxDtWLrtarryV12J6uYoTfrzCUZaxZz73gAw
 Q92vcZ41P1WbAT1j5JRiT3uKj1DBSbTqSMHB6q9MI3EQH8LiMIer25DRUyRMOCOfdvy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gzm4AQQ+FoHr1N0/i2gls9tvqoqnFALTGgmvz20xsac=; b=Di+lPZOxaaFAeDxxuf41w7/1LD
 +X+1fd43GVYCgUaRArAfpRFmZrKMoT+TIvSxrPO7+Ph62Hod9upLEnRTM7DlrUcKcS98oF/m0uBkL
 79CX1ucEgqqUTLHc9tB7WMnObS9ACFyv0/lY3nFR7Q3mnpYJRRHZFyX62LhYA8cTiWzQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uitYU-0008Gt-M7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 11:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B8A260008
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Aug 2025 11:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C893C4CEE7;
 Mon,  4 Aug 2025 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754307627;
 bh=hFks3NyqWVlUlptsrN8TMupvkN80DLByWlaShd7hXuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PVIwDQxiRvRlC06gQ9gN3GVsDP/ursYqRo8/3qsgUH1rghI4WiGcCSm7pbpmwv7wW
 N4aXHnxmkWZKAi/J4saC+d6hHAAv4dE4VJDbvXcYxcCqSNM1p7jEo20OnFjn3aXBwB
 9wiEDboKxk1XDDyvtgo51uvbjbq2a1JEF9CYkoaAKvarNIvfPIgA+H0UqH1qSvCXHE
 ZMlFvX/l/cd+E0KhIUXh+oOkiNmbujPDMgXIPVXyq71Q3xFTBLGm4vsEiGMEghGT+y
 NSWBZgtOzjvaskTPGGSS74H2LlPWaNy0Aw9QTteCtBxo9SI47OEUMECxyCWuFvbc9p
 08o5FxA9d7qkw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  4 Aug 2025 19:40:16 +0800
Message-ID: <20250804114016.2734919-3-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804114016.2734919-1-chao@kernel.org>
References: <20250804114016.2734919-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs changes to use new mount APIs,
 let's add a new testcase
 to check mount result for special mount options for zoned device and their
 combinations, in order to detect any inconsistency during mou [...] 
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
X-Headers-End: 1uitYU-0008Gt-M7
Subject: [f2fs-dev] [PATCH v3 3/3] f2fs/017: test mount options for zoned
 device
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

As f2fs changes to use new mount APIs, let's add a new testcase
to check mount result for special mount options for zoned device
and their combinations, in order to detect any inconsistency during
mount.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/017     | 40 ++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/017.out | 21 +++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100755 tests/f2fs/017
 create mode 100644 tests/f2fs/017.out

diff --git a/tests/f2fs/017 b/tests/f2fs/017
new file mode 100755
index 00000000..cdf42fc8
--- /dev/null
+++ b/tests/f2fs/017
@@ -0,0 +1,40 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/017
+#
+# This testcase tries to check stability of mount result
+# w/ mount options for zoned device and their combination.
+#
+. ./common/preamble
+_begin_fstest auto quick mount
+
+_require_zoned_device "$TEST_DEV"
+_test_unmount >> $seqres.full 2>&1
+
+options=(
+#	mount_option			mkfs_option
+	"background_gc=on"		"blkzone"		\
+	"background_gc=off"		"blkzone"		\
+	"background_gc=sync"		"blkzone"		\
+	"mode=adaptive"			"blkzone"		\
+	"mode=lfs"			"blkzone"		\
+	"mode=fragment:segment"		"blkzone"		\
+	"mode=fragment:block"		"blkzone"		\
+	"discard_unit=block"		"blkzone"		\
+	"discard_unit=segment"		"blkzone"		\
+	"discard_unit=section"		"blkzone"		\
+)
+
+for ((i=0;i<${#options[@]};i=i+2))
+do
+	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
+	_test_mkfs "-m" >> $seqres.full || _fail "mkfs failed"
+	_test_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+	echo $?
+	_test_unmount >> $seqres.full 2>&1
+done
+
+status=0
+exit
diff --git a/tests/f2fs/017.out b/tests/f2fs/017.out
new file mode 100644
index 00000000..c260e0b1
--- /dev/null
+++ b/tests/f2fs/017.out
@@ -0,0 +1,21 @@
+QA output created by 017
+Option#0: background_gc=on : blkzone
+0
+Option#2: background_gc=off : blkzone
+32
+Option#4: background_gc=sync : blkzone
+0
+Option#6: mode=adaptive : blkzone
+32
+Option#8: mode=lfs : blkzone
+0
+Option#10: mode=fragment:segment : blkzone
+32
+Option#12: mode=fragment:block : blkzone
+32
+Option#14: discard_unit=block : blkzone
+0
+Option#16: discard_unit=segment : blkzone
+0
+Option#18: discard_unit=section : blkzone
+0
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
