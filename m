Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C7B3D683
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Sep 2025 04:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Idr/TSOfGU0oiwz1/r4aOlRxU95b2ZEwvqtgS/gmErM=; b=RYwU2Bt4wih3fNGhqQUSXP9v4k
	oAouVOS1FCEjEDX4JqNuzWIlxF35fGmIqFhwWtjexSf6aSM58ZpPDXG34zF6mvkYvZ/pOjrhGAkLb
	MuT+uEFS3rYKP+PyblX4u/X3X2wkgFilBLH/mtRQOCGRc28Pay1IQyJEOQPbafYiSdJw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ustth-0007qj-EA;
	Mon, 01 Sep 2025 02:03:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1usttg-0007qb-EP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wUeL/vMhL7uYsqLM7oG8iDjxF4P2h4qdasmsBF1/w8=; b=NjCESC3HqNyf0OmITSUxfHStb5
 Fl1/Y1JMQGd/UbAE0JVEMgqLy7tYXfqoiE9EuNhLZpXwMoAbe2eJYKZVBILrRhhHoPDKZyOccKN2x
 WlF9mlY/x5a8kMSE50gAArJmf51KMDuuFIGPyKrkyL/V/zgoY9es8n0CR+JFQlEFFQAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7wUeL/vMhL7uYsqLM7oG8iDjxF4P2h4qdasmsBF1/w8=; b=h
 QdLJNDsD0HL+MdYsz/zRdlSleieseeqdy8gw2KGJyknvS2c6mg9YXbJBgWv3juvvpFPeJUnkErv5Q
 ZnEh/Gz3FWkBL/FoMFIpsaF+yRPQrv4wqGdeSVvPR0E1qp7gHKRiMYF9afjcqGZXIfylBDlHoCBsu
 fLaKiGfDfigzp+TM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usttg-0004rv-1g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Sep 2025 02:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6BEA0601DF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Sep 2025 02:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F2FC4CEED;
 Mon,  1 Sep 2025 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756692221;
 bh=iLG451+50P0EKs0JV6qN5ndqwtac3Z7TuRAjBMlTWo0=;
 h=From:To:Cc:Subject:Date:From;
 b=gfT01AdPjt+T6zSrdukdX7IBclha5JM5dCRVM2zGdzkPUEXK8AaNtxFSTgPWIlLPx
 w628vmZeyZh0tOGf3zOjvyfmZ8Ss07SuTs+TwYz6Vq9c61Y/ZiD0t66FP2taqzQ71a
 L6+xqluuuZ9RvCe5eSpbdY8iFTCFEln+Wae0GMXn1OTVGhN5LB7OaFso27TBJU/L1K
 iFNK0vWFcnFBVqPZjKYyf4+VpDcnJZyPJ3bUREqw3BYID/BTLEXweFixAz3NwAffsc
 APcwcQqp6r6Q2ZWebS1j/2B34NgU+XdIIee8mSBn2oCiRGGffHrEVUw2OptjzsLRYT
 Uc3fXyJvS9k4w==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  1 Sep 2025 10:03:30 +0800
Message-ID: <20250901020331.2171502-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This testcase tries to check whether f2fs can handle
 "usrjquota=" during remount correctly,
 it expects kernel will encounter NULL pointer dereference
 bug w/o the fix ("f2fs: fix to avoid NULL pointer [...] 
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
X-Headers-End: 1usttg-0004rv-1g
Subject: [f2fs-dev] [PATCH 1/2] f2fs/021: test quota mount option
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

This testcase tries to check whether f2fs can handle "usrjquota="
during remount correctly, it expects kernel will encounter NULL
pointer dereference bug w/o the fix ("f2fs: fix to avoid NULL pointer
dereference in f2fs_check_quota_consistency()").

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/021     | 30 ++++++++++++++++++++++++++++++
 tests/f2fs/021.out |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100755 tests/f2fs/021
 create mode 100644 tests/f2fs/021.out

diff --git a/tests/f2fs/021 b/tests/f2fs/021
new file mode 100755
index 00000000..c41760fc
--- /dev/null
+++ b/tests/f2fs/021
@@ -0,0 +1,30 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/021
+#
+# This testcase tries to check whether f2fs can handle "usrjquota="
+# during remount correctly
+#
+. ./common/preamble
+_begin_fstest auto quick mount
+
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()"
+
+_require_scratch
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount "-o usrquota"
+quotacheck -uc $SCRATCH_MNT
+_scratch_unmount
+
+_scratch_mount "-o usrjquota=aquota.user,jqfmt=vfsold"
+_scratch_mount "-o remount,usrjquota=,jqfmt=vfsold"
+_scratch_unmount
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/021.out b/tests/f2fs/021.out
new file mode 100644
index 00000000..09f4062d
--- /dev/null
+++ b/tests/f2fs/021.out
@@ -0,0 +1,2 @@
+QA output created by 021
+Silence is golden
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
