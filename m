Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C052F7EC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 May 2022 05:16:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nsFbc-0005rB-GC; Sat, 21 May 2022 03:16:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nsFbb-0005r5-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 May 2022 03:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qI+X16NPVZDCB5SfCWMoqIAv0uQihHhfnTR7N4AC3w4=; b=Bi/k/7a6jWjzMso3naf+UPaSYN
 Y8oWhI5XujRSKZEJiYOaR28xhspCW26HupVf8FKuTaap6s+DPM1lxp/ThO+D4qhuzUycqS7Di755e
 8eN7BGwxkduPCwHferPQ41S3EeVu33SbmHHXUB+bBRoCgpAMzCS+rVBVPck45xi85QvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qI+X16NPVZDCB5SfCWMoqIAv0uQihHhfnTR7N4AC3w4=; b=k
 8X+92BGT/ZBe1KIENIp1K4xdWwEQe7dKTHjAkOHwg9h3E0vRiqjtRSRH/L8KsOl2cRPUL7wzgTL/N
 ZnAxqqXLMTc3Ab7t7LCBGCTp44IndC/Zc0ocVuAYB5+VKLg5YXWgzOIs5HFRwu21ZgSr0on3qLOuY
 sp9O7Q17P3wWWjxM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nsFbZ-0001mX-QU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 May 2022 03:16:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D135861EF3;
 Sat, 21 May 2022 03:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09380C385A9;
 Sat, 21 May 2022 03:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653102986;
 bh=ENwzOGpVtswbhZkusJzc+HiUHn7828mw/1GZFXMVmTw=;
 h=From:To:Cc:Subject:Date:From;
 b=V7vIitlFW+J/0GcomcA23R966E6SOhhK4fjhm/XlV94XiL9G8DGV+GGQbq59lyWHo
 MmNc3QULDk2qDtNqCoy8s0IaIWs4NuWk0QFPe0UmS0MEntAuEl9cnPa0EK5rLo+YhM
 1kxJdAyq8kFojjj4p/AMxokHJH+yNtelPvb/itj5if4UqDsIR0d0UuY1PE6gpzWZVb
 AjVAovLldAO134eWGCikjyVLook9R/HpD+hdLkBDpOyDnuMHjaWtucOBG0e3PjVYiO
 aCswzylgsVTRqJGS+nuEK3h68dcPLRwxC5Moa1nTuRtEKdUfptIKycAm4ejAOs/Fk5
 hxW3nhzOYuQ9g==
From: Chao Yu <chao@kernel.org>
To: fstests@vger.kernel.org
Date: Sat, 21 May 2022 11:16:21 +0800
Message-Id: <20220521031621.3494402-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Testcases like generic 342/502/526/527 expect that
 filesystems
 will recover all related metadata changes to the file which was fsynced before
 sudden power off. This patch adjusts to use "fsync_mode=strict" mountoption
 for f2fs to pass these testcases. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nsFbZ-0001mX-QU
Subject: [f2fs-dev] [PATCH] generic: adjust strict SPO recovery testcases
 for f2fs
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
Cc: guan@eryu.me, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Testcases like generic 342/502/526/527 expect that filesystems will
recover all related metadata changes to the file which was fsynced
before sudden power off.

This patch adjusts to use "fsync_mode=strict" mountoption for f2fs
to pass these testcases.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/generic/342 | 5 +++++
 tests/generic/502 | 5 +++++
 tests/generic/526 | 5 +++++
 tests/generic/527 | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/tests/generic/342 b/tests/generic/342
index 676b876b..cdffaaf3 100755
--- a/tests/generic/342
+++ b/tests/generic/342
@@ -31,6 +31,11 @@ _require_dm_target flakey
 
 _scratch_mkfs >>$seqres.full 2>&1
 _require_metadata_journaling $SCRATCH_DEV
+
+if [ $FSTYP = "f2fs" ]; then
+	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
+fi
+
 _init_flakey
 _mount_flakey
 
diff --git a/tests/generic/502 b/tests/generic/502
index b0f9077f..b5589b81 100755
--- a/tests/generic/502
+++ b/tests/generic/502
@@ -34,6 +34,11 @@ _require_dm_target flakey
 
 _scratch_mkfs >>$seqres.full 2>&1
 _require_metadata_journaling $SCRATCH_DEV
+
+if [ $FSTYP = "f2fs" ]; then
+	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
+fi
+
 _init_flakey
 _mount_flakey
 
diff --git a/tests/generic/526 b/tests/generic/526
index dc7cb36c..ada4dbee 100755
--- a/tests/generic/526
+++ b/tests/generic/526
@@ -32,6 +32,11 @@ _require_dm_target flakey
 
 _scratch_mkfs >>$seqres.full 2>&1
 _require_metadata_journaling $SCRATCH_DEV
+
+if [ $FSTYP = "f2fs" ]; then
+	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
+fi
+
 _init_flakey
 _mount_flakey
 
diff --git a/tests/generic/527 b/tests/generic/527
index 40cd1c6a..de09d171 100755
--- a/tests/generic/527
+++ b/tests/generic/527
@@ -32,6 +32,11 @@ _require_dm_target flakey
 
 _scratch_mkfs >>$seqres.full 2>&1
 _require_metadata_journaling $SCRATCH_DEV
+
+if [ $FSTYP = "f2fs" ]; then
+	export MOUNT_OPTIONS="-o fsync_mode=strict $MOUNT_OPTIONS"
+fi
+
 _init_flakey
 _mount_flakey
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
