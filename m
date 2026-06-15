Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tPNOMmjAL2oYFwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 11:05:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA58684DE7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 11:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=MeJqKuJy;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=meH4KAG1;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="l BFOZ7L";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Iy3KlnaY;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N7hHnS+MyHocaqMDT/Fd1hweO+6wtBED9mulATUdZzw=; b=MeJqKuJy1rMo62shmHkE+uw/C5
	zW6HouQ3sHaNvDFQSw76QPbEHme4pBSYYA5HkX558+q8iwZdrtnutsT9mL+ePr+uP/oLAtjlFDoff
	kOzJ/FXBGjd2r9fI+RbmtdskexUihHPaj0HKtrbmOWG+3+P1PfKwk4iTwsYS9vP2BRE8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ3G9-0002zh-FD;
	Mon, 15 Jun 2026 09:05:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ3G8-0002zY-O1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 09:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ME1/S/TriG2c+6aYaVUnTJ4FsRAfSoAwJMhNU9vY5q0=; b=meH4KAG1RbNctfNGQHDZXqr2dc
 oyjtu3MB8Efg12vlHerFLQXO/fNUU70kKfgQHR9e7I/xPkwsH4JLXUhzv4ruCDiMZ6V9IclAVZWdC
 /f475VHhy1GnB+nD4USGPYdxnd33K8oghsXKZ+1DEAft4ZdHSoVNQjOw9TET4dTIIEAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ME1/S/TriG2c+6aYaVUnTJ4FsRAfSoAwJMhNU9vY5q0=; b=l
 BFOZ7LpMvMtBezswyCs2e0jSl8qVWBbrYRYb/zlbx3mVM2ZCD5XWG+6SViPR9JFEYi2YHIS1mf9Fl
 2cwJOZw27d1ed2gpHYP624mWwCFEHJ4iCayy/SUJuVMeJR+YmwxhNG+Mx/UCoJb9wWL15Yge51U41
 HWDDSzEx8PxET0vs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ3G6-0000YU-SR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 09:05:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A4D4660132
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 09:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7141F00A3E;
 Mon, 15 Jun 2026 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781514320;
 bh=ME1/S/TriG2c+6aYaVUnTJ4FsRAfSoAwJMhNU9vY5q0=;
 h=From:To:Cc:Subject:Date;
 b=Iy3KlnaY+JoDT9oIwOkbOkG1wgZ4/G90bC6prgqs/+hmgmo5Z9Od2QEFGxufYzZ+t
 /6iWxML0VV/Ab9NNJ4S2Mb027ZBYRBY048PG32fu+W3bnuY34kBikual4TnGBz3jZE
 tRHdrvLW9NCsCg5pWGUQltueLiGjwSlkhSDOo76ugl3t9s7wmoQgXlbJqT7K5acvl4
 QMyOKQn573pJY10WJZUhwnWImYOpuZCuzTJUxRokF7WIVtzYSEckYc5tJ1F1F+bUmy
 4+yEV0SagpYcc5JiMfdVVy2H+PVMeKDeN1z3IyBNrB1BfQFdTFzh8wynoIWb8eiF3N
 fHt3h3g0WSCfg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 15 Jun 2026 09:05:11 +0000
Message-ID: <20260615090511.1626551-1-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Without commit 520760b9f915 ("f2fs: optimize representative
 type determination in GC"), f2fs GC will report inconsistent segment type
 in large section issue, and then it will force to shutdown filesys [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ3G6-0000YU-SR
Subject: [f2fs-dev] [PATCH v3] f2fs/025: test to do sanity check section
 type correctly in f2fs GC
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDA58684DE7

Without commit 520760b9f915 ("f2fs: optimize representative type determination
in GC"), f2fs GC will report inconsistent segment type in large section issue,
and then it will force to shutdown filesystem.

[  768.190903] F2FS-fs (loop51): Inconsistent segment (3) type [1, 0] in SIT and SSA

The reason is f2fs kernel will assume all segment type inside large section is
the same, during GC it loads type from one segment and compare it to other
segments' type, however due to recovery flow, the chosen segment may has zero
valid blocks w/ different segment type, since the segment is invalid(free) one,
it will never be migrated, so that we should not treat such state as abnormal
condition.

This testcase is created to simulate above condition to see whether f2fs kernel
module can handle it correctly

Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- remove unnecessary code
- use common help _scratch_shutdown() instead of "$F2FS_IO_PROG shutdown"
- use $F2FS_IO_PROG gc_urgent" instead of "echo > <sysfs_path>; sleep x" commands
 tests/f2fs/025     | 81 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/025.out |  2 ++
 2 files changed, 83 insertions(+)
 create mode 100644 tests/f2fs/025
 create mode 100644 tests/f2fs/025.out

diff --git a/tests/f2fs/025 b/tests/f2fs/025
new file mode 100644
index 000000000..2327db10b
--- /dev/null
+++ b/tests/f2fs/025
@@ -0,0 +1,81 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2026 Chao Yu <chao@kernel.org>
+#
+# FS QA Test No. f2fs/025
+#
+# Check whether f2fs will encounter cp_error (Inconsistent segment type)
+# when doing sanity check on type of segments inside large section during
+# garbage collection.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_fixed_by_kernel_commit 520760b9f915 \
+	"f2fs: optimize representative type determination in GC"
+
+. ./common/filter
+
+_require_scratch
+_require_scratch_shutdown
+_require_xfs_io_command "pwrite"
+_require_xfs_io_command "truncate"
+_require_command "$F2FS_IO_PROG" f2fs_io
+_require_check_dmesg
+
+# Clear options to avoid interference from external configurations
+export MKFS_OPTIONS=""
+export MOUNT_OPTIONS=""
+
+# Format with 96MB size and 2 segments per section
+_scratch_mkfs_sized $((96 * 1024 * 1024)) "" "-s 2" >> $seqres.full 2>&1
+
+# Mount with mode=lfs
+_scratch_mount -o mode=lfs
+
+# Create files to fill whole filesystem, then segment type will be changed to node type
+for ((i=0;i<5120;i++)) do
+	touch $SCRATCH_MNT/$i >> $seqres.full 2>&1
+done
+sync
+
+# Remove all files to create free(empty) node segments
+rm -f $SCRATCH_MNT/*
+sync
+
+# Allocate free space so that we have chance to reuse free(empty) node segments
+$XFS_IO_PROG -f -c "pwrite -b 4k 0 1928k" $SCRATCH_MNT/file >> $seqres.full 2>&1
+sync
+
+$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -d -c "pwrite -b 4k 0 16M" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -d -c "pwrite -b 4k 0 16M" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
+sync
+
+$XFS_IO_PROG -d -c "pwrite -b 4k 0 8M" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -d -c "pwrite -b 4k 0 32K" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -c "truncate 0" $SCRATCH_MNT/file >> $seqres.full 2>&1
+$XFS_IO_PROG -d -c "pwrite -b 4k 0 2M" -c "fsync" $SCRATCH_MNT/file >> $seqres.full 2>&1
+
+# Shutdown the filesystem without checkpoint
+_scratch_shutdown
+
+_scratch_unmount
+
+_scratch_mount -o mode=lfs
+
+# Run urgent_gc mode to trigger garbage collection
+dev_name=$(_short_dev $SCRATCH_DEV)
+$F2FS_IO_PROG gc_urgent $dev_name run 5 >> $seqres.full
+
+_scratch_unmount
+
+# Check whether the dmesg has the warning indicating the bug
+_check_dmesg_for "F2FS-fs \($dev_name\): Inconsistent segment" && \
+	_fail "F2FS-fs ($dev_name): Inconsistent segment type detected in dmesg!"
+
+echo "Silence is golden"
+_exit 0
diff --git a/tests/f2fs/025.out b/tests/f2fs/025.out
new file mode 100644
index 000000000..3d70951ef
--- /dev/null
+++ b/tests/f2fs/025.out
@@ -0,0 +1,2 @@
+QA output created by 025
+Silence is golden
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
