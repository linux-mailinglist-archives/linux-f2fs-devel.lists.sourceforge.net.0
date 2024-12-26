Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C59FCB34
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2024 14:37:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tQo2x-0001nq-Qh;
	Thu, 26 Dec 2024 13:37:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tQo2u-0001na-SK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Dec 2024 13:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6Jil/6c6kq8XH2UCZ4YHGERIpH1gREya/r3rdIQ5TI=; b=H8PIFu8LgKJqtv2CZEOUDCiA5Q
 UkJ9BpLMnTThpssByB7N9wZyvCUCDCybM/HyjWjrjqgOwF8QFYwgerZkxUuHJFqB4eOjx8TEtDTsO
 r7IspKvgu8C79JQzu1yS8YSNmKvMjRtywfa2quzItYhT+0DIvWKZ/bcym4NIoWRvKGWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o6Jil/6c6kq8XH2UCZ4YHGERIpH1gREya/r3rdIQ5TI=; b=Qmn1vf/8SFKbXcYfWxN/pdqM4F
 DEoX1beXD0b3mCLC7syJXXCbn9nQ6fYJ7IkzF1FVV4uXP4SzWv8UBXOBd9GlBmFqoce0PvFkAX3J8
 wpcna6mGOclEPK9zw0JNogyXGx1hLK2+slAYRMg2y+QwKSaHyvVjfRP/E4oukBw56cZo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tQo2t-0004HO-D8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Dec 2024 13:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D34E4A40DDA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2024 13:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8272C4CED4;
 Thu, 26 Dec 2024 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735220208;
 bh=BYUglw7DJWN7duggSCr6mnasekJoaUVqgYsQ7B7Q5Mo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJpIIpJh4WeKthGOv3lq/ddKyRreI1JC1F07iO4wa1FdV0QFoPNw642vHH8pCIK8c
 CAxHjvCBaApE1N8jidry7739R8/JhxKm+Avcsd9Kx0SehNwr4W/FHcm+SFzFMYqpJt
 32IfRjxRx+fhqby3z9EjCmSRBAR2w2vtVAVF5sj+3JYHz+2t2x5Q68W6tPAFWF4YQd
 VUVtCw3tgi3n7mMk4MtaGSOQghGpUyGAwEzFjlKBo+Xhtvosgycee4hiDLJoN950Ao
 6OU2iwMNzZJBUUfmMsBk56cXc8puL3ZZ3o13GaoyxbBa4QwtskaA1q61/zw45Gzf/X
 caUGewOauVwtg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu, 26 Dec 2024 21:36:31 +0800
Message-Id: <20241226133631.9486-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241226133631.9486-1-chao@kernel.org>
References: <20241226133631.9486-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduce a regression testcase to check whether
 f2fs can handle discard correctly once underlying lvm device changes to not
 support discard after user creates snapshot on it. Related bug was fixed
 by commit bc8aeb04fd80 ("f2fs: fix to drop all discards after creating
 snapshot on lvm device") 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tQo2t-0004HO-D8
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs/008: test snapshot creation/deletion
 on lvm device
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

This patch introduce a regression testcase to check whether
f2fs can handle discard correctly once underlying lvm device
changes to not support discard after user creates snapshot
on it.

Related bug was fixed by commit bc8aeb04fd80 ("f2fs: fix to
drop all discards after creating snapshot on lvm device")

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v4:
- use "lvcreate -y" to force wiping stale data in device.
 tests/f2fs/008     | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/008.out |  2 ++
 2 files changed, 59 insertions(+)
 create mode 100755 tests/f2fs/008
 create mode 100644 tests/f2fs/008.out

diff --git a/tests/f2fs/008 b/tests/f2fs/008
new file mode 100755
index 00000000..47696f2b
--- /dev/null
+++ b/tests/f2fs/008
@@ -0,0 +1,57 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Oppo.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/008
+#
+# This is a regression test to check whether f2fs can handle
+# discard correctly once underlying lvm device changes to not
+# support discard after user creates snapshot on it.
+#
+
+. ./common/preamble
+_begin_fstest auto quick rw
+
+_fixed_by_kernel_commit bc8aeb04fd80 \
+        "f2fs: fix to drop all discards after creating snapshot on lvm device"
+
+_require_scratch_nolvm
+_require_block_device $SCRATCH_DEV
+_require_command "$LVM_PROG" lvm
+
+lvname=lv_$seq
+vgname=vg_$seq
+testfile=$SCRATCH_MNT/testfile
+
+_cleanup()
+{
+	_unmount $SCRATCH_MNT >>$seqres.full 2>&1
+	$LVM_PROG lvremove -ff /dev/mapper/$lvname-snapshot $vgname >>$seqres.full 2>&1
+	$LVM_PROG lvremove -ff /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
+	$LVM_PROG vgremove -ff $vgname >>$seqres.full 2>&1
+	$LVM_PROG pvremove -ff $SCRATCH_DEV >>$seqres.full 2>&1
+	_udev_wait --removed /dev/mapper/$vgname-$lvname
+	cd /
+	rm -f $tmp.*
+}
+
+$LVM_PROG pvcreate -f $SCRATCH_DEV >>$seqres.full 2>&1
+$LVM_PROG vgcreate -f $vgname $SCRATCH_DEV >>$seqres.full 2>&1
+$LVM_PROG lvcreate -y -L 1024m -n $lvname $vgname >>$seqres.full 2>&1
+_udev_wait /dev/mapper/$vgname-$lvname
+
+_mkfs_dev /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
+_mount -o discard /dev/mapper/$vgname-$lvname $SCRATCH_MNT >>$seqres.full 2>&1
+
+dd if=/dev/zero of=$testfile bs=1M count=20 >>$seqres.full 2>&1
+sync
+rm -f $testfile
+sync
+
+# create a snapshot on lvm device
+$LVM_PROG lvcreate -L 1024m -s -n $lvname-snapshot /dev/mapper/$vgname-$lvname >>$seqres.full 2>&1
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/008.out b/tests/f2fs/008.out
new file mode 100644
index 00000000..dd68d5a4
--- /dev/null
+++ b/tests/f2fs/008.out
@@ -0,0 +1,2 @@
+QA output created by 008
+Silence is golden
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
