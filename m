Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIUpMli/F2ryPQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B45EC65A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9N6Cd29yJ2F7mpLH9ISMXdgPsntEmFAMveN9I/n7Bc=; b=eMLKVAuoUZMevH8OX2Po/r5lsP
	jDXSeUr7OBQmk2pQnv4EEMzNFk3Vv3yfQjKIcmjbeeRbzsyS+tbEBXgKY3r5Aw9awLLGOx0CLVkGB
	dTttfg5n3dFwVJRHQqSwTB8HWu/R/xjdBoRiGkKEEKAA/5k9RIYVmaatoeYw6Ty7nXRk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSS18-0003Ud-1L;
	Thu, 28 May 2026 04:06:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wSS16-0003UR-7I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cA76/PYw1pPj8n2hc9fHEPPWqFsIP0EVym6yQnBFCxU=; b=Idv0OZ/uvZRVsj5LJtyxqjkHCE
 4IUbmkRo/zHqyz4x6u2iVNwPfTio0Xj6Lab/VKrKffO5iiONCbKz+SyIcdRvU1FkG5OC5b3Jmowhs
 x+7Tgr8LRqMsL/OghoqFzg8ps/LEFTikeB1bcwqMseXhGfgmHHZq51QS8qyjhhSYbdDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cA76/PYw1pPj8n2hc9fHEPPWqFsIP0EVym6yQnBFCxU=; b=aIz/YZCPt13KBBDKHb0Jch+rzQ
 GQMg9aC3F4J0MM2BdrNMHPaxo7314cJxTQZQnCVGeJVb8xL6NvV1qPexNTr2uT0Z/cqO4UMhrjQX1
 VM64TYxRKyNOo1Sl6G2kuGsSZ5PaWVkH8Y9UmSMJP66A3mAoL37XFAQmqxNWZx09i1f0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSS13-0002Bm-57 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FA1444546;
 Thu, 28 May 2026 04:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE521F00A3A;
 Thu, 28 May 2026 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779941191;
 bh=cA76/PYw1pPj8n2hc9fHEPPWqFsIP0EVym6yQnBFCxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iLjlDQz+bwVuH+CLTRgxwCKHxBT6/CSFYZy5OGndfsskO37Nsv468yumlcUrD8ahQ
 JEkii97cPaPADyAY6OCOXP/SUNJYqWd9c8rlwHwxlRLbGwItizEw+nODpw4zYV7ctn
 RSD4m/k5gy5el5lTSWbFKgd4Cl5ABdpaw6VGtzyM5l1N2L7reBv4R7/MdrmI6yyRbK
 8dthUojsqc1ueAFjThviKUdCRtEKynycQbUiJBBzAcTWD4pfcAJM/6i1Y97s0nvkjd
 n2/DwxZLcqX65h39sBadH/ebny2QFN7y/kSuVmJryQ7I2C4xRc7zYod60hSrSDWcAV
 6HoR2T3wP6rRg==
To: fstests@vger.kernel.org
Date: Thu, 28 May 2026 12:05:40 +0800
Message-ID: <3d74747ec4149c9166ee9db301b8e4533f822085.1779939330.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779939330.git.asj@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ensure that exportfs can correctly decode file handles on
 a cloned filesystem across a mount cycle, by file handles generated on a cloned
 device remain valid after mount cycle. Signed-off-by: Anand Jain
 <asj@kernel.org>
 --- tests/generic/805 | 80 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/805.out
 | 2 ++ 2 files changed, 82 insertions(+) create mode 100644 test [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wSS13-0002Bm-57
Subject: [f2fs-dev] [PATCH v6 09/11] fstests: verify exportfs file handles
 on cloned filesystems
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
From: Anand Jain via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Jain <asj@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[asj@kernel.org]
X-Rspamd-Queue-Id: 670B45EC65A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that exportfs can correctly decode file handles on a cloned
filesystem across a mount cycle, by file handles generated on a
cloned device remain valid after mount cycle.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 tests/generic/805     | 80 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/805.out |  2 ++
 2 files changed, 82 insertions(+)
 create mode 100644 tests/generic/805
 create mode 100644 tests/generic/805.out

diff --git a/tests/generic/805 b/tests/generic/805
new file mode 100644
index 000000000000..5827eee039df
--- /dev/null
+++ b/tests/generic/805
@@ -0,0 +1,80 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2026 Anand Jain <asj@kernel.org>.  All Rights Reserved.
+#
+# FS QA Test No. 805
+# Verify that file handles encoded on a cloned filesystem remain valid and
+# resolvable via open_by_handle across a mount cycle and mount order swap.
+
+. ./common/preamble
+
+_begin_fstest auto quick exportfs clone
+
+_require_test
+_require_block_device $TEST_DEV
+_require_exportfs
+_require_loop
+_require_test_program "open_by_handle"
+
+_cleanup()
+{
+	cd /
+	rm -r -f $tmp.*
+	_unmount $mnt1 2>/dev/null
+	_unmount $mnt2 2>/dev/null
+	_loop_image_destroy "${devs[@]}" 2> /dev/null
+}
+
+# Create test dir and test files, encode file handles and store to tmp file
+create_test_files()
+{
+	rm -rf $testdir
+	mkdir -p $testdir
+	$here/src/open_by_handle -cwp -o $tmp.handles_file $testdir $NUMFILES
+}
+
+# Attempt to read and decode the saved file handles on the targeted mount point.
+test_file_handles()
+{
+	local opt=$1
+	local when=$2
+
+	echo test_file_handles after $when
+	$here/src/open_by_handle $opt -i $tmp.handles_file $mnt2 $NUMFILES
+}
+
+# Setup base loop device and its clone
+devs=()
+_loop_image_create_clone devs
+mkdir -p $TEST_DIR/$seq
+mnt1=$TEST_DIR/$seq/mnt1
+mnt2=$TEST_DIR/$seq/mnt2
+mkdir -p $mnt1
+mkdir -p $mnt2
+
+# Mount both identical UUID filesystems simultaneously
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
+						_fail "Failed to mount dev1"
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
+						_fail "Failed to mount dev2"
+
+NUMFILES=1
+testdir=$mnt2/testdir
+
+# Decode file handles of files/dir after cycle mount
+create_test_files
+
+# Cycle mounts and reverse initialization sequence to check if
+# file handle lookups are okay
+_unmount $mnt1
+_unmount $mnt2
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[1]} $mnt2 || \
+						_fail "Failed to mount dev2"
+_mount $(_common_dev_mount_options) $(_clone_mount_option) ${devs[0]} $mnt1 || \
+						_fail "Failed to mount dev1"
+
+# Verify file handles can still be resolved post-mount-cycle
+test_file_handles -rp "cycle mount"
+
+status=0
+exit
diff --git a/tests/generic/805.out b/tests/generic/805.out
new file mode 100644
index 000000000000..29b11ec77ffb
--- /dev/null
+++ b/tests/generic/805.out
@@ -0,0 +1,2 @@
+QA output created by 805
+test_file_handles after cycle mount
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
