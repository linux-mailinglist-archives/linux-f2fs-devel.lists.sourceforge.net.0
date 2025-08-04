Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C914CB1A0A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 13:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FNDIrsYz0OfFEvOIvn+wa9ag5iGU1U31wMdHjlT96iA=; b=bo941LdC9Phu86i/9Nbtr7skuj
	foVdW00GU1bYrIdx36mNaHUsU3GVkDhWN40LTXeTJ1PcH+C9NlgQODIqQB2H1YMyJDMfFJBHHH2tP
	Xium5w3TKy/WlCfn4niVctxmidHQ8QJtbgXo1TvdSByxkEsEqhtMuteazTDqiZkOGB98=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uitYS-0001hC-Cw;
	Mon, 04 Aug 2025 11:40:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uitYR-0001h6-Ct
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 11:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oxNM2uVVSR7ARIh4rvBewQOC/4Kip3Jqfu3DsesSB5I=; b=XnavE0/uMPQIz3xYDr9n+iCpwR
 x+bwRzUlr/vB4P05mVxVmiQBH/wk71kalsTxgU25DVwZqus/indsC0NTRcHuG+SnacjUgvpYiwXiR
 faIl7Ycscrqn/TTVF1qx5hfvO4M5LYcO2qXCB5awbaFEu4K5kUHUYoGn0dQm0F/EVrgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oxNM2uVVSR7ARIh4rvBewQOC/4Kip3Jqfu3DsesSB5I=; b=I
 uWhAzhamI4mELFveRKQhJN49B7QFaIPa965wP9aP5Y6Q15gjSH1PH1AZI9jki2Zh9wlvkGsAlndQq
 Qjr+5ZnIVyuCSo/xbdrmz9dyfI1B5U+pz0KzkRY0rXZWYjLytqbTI5jr6AZwliDayFKokYDUGH+tD
 eqvaKb+IW/IQ3HI0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uitYQ-0008GF-Le for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 11:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FBEF45A3C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Aug 2025 11:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB406C4CEE7;
 Mon,  4 Aug 2025 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754307624;
 bh=6gVCMue35jXZh2y+xilUsyrrR2boIXhGdo0dUWABY+M=;
 h=From:To:Cc:Subject:Date:From;
 b=YkhUsEIqN6tJQQFvYPoA4yJpNkwzoqdzvu/jczEFROwRMgLjTyjmS9UO5mR5CDbV8
 RL2YJ3hsHcyVRHdJs2wq0Jdww3NBjvxkOWVJkjwDQO4XIivP+a3Laf9Nut/hZEugM1
 vnnrui6Jk0Nu/5z8ALvSdlZt8GU9ZAaM+rwxHEZ6GsAuo1afMTstfg4sUuVbeyqxX3
 OS+DFovw4jgmBFDzi2DBJWXJpnvRnpQoo7nc+otRVmb/mGMLhcJWzKqFxJdUNkwFuW
 suhkuSqn+QAxFlqTino0ToDLy7K1HJQ6aHPj3iTZQsTO67LzAsLjBZL3yH5GWL9mFy
 0vIiR1DW9QTpg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  4 Aug 2025 19:40:14 +0800
Message-ID: <20250804114016.2734919-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs changes to use new mount APIs,
 let's add a new testcase
 to check mount result for all f2fs supported common mount options and their
 combinations, in order to detect any inconsistency during mo [...] 
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
X-Headers-End: 1uitYQ-0008GF-Le
Subject: [f2fs-dev] [PATCH v3 1/3] f2fs/015: test common mount options
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
to check mount result for all f2fs supported common mount options
and their combinations, in order to detect any inconsistency during
mount.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/rc          |   3 +
 tests/f2fs/015     | 121 +++++++++++++++++++++++++++++++
 tests/f2fs/015.out | 173 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 297 insertions(+)
 create mode 100755 tests/f2fs/015
 create mode 100644 tests/f2fs/015.out

diff --git a/common/rc b/common/rc
index ff5df203..81587dad 100644
--- a/common/rc
+++ b/common/rc
@@ -876,6 +876,9 @@ _test_mkfs()
     ext2|ext3|ext4)
 	$MKFS_PROG -t $FSTYP -- -F $MKFS_OPTIONS $* $TEST_DEV
 	;;
+    f2fs)
+	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $* $TEST_DEV
+	;;
     xfs)
 	_test_options mkfs
 	$MKFS_PROG -t $FSTYP -- -f $TEST_OPTIONS $MKFS_OPTIONS $* $TEST_DEV
diff --git a/tests/f2fs/015 b/tests/f2fs/015
new file mode 100755
index 00000000..73ac3d82
--- /dev/null
+++ b/tests/f2fs/015
@@ -0,0 +1,121 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/015
+#
+# This testcase tries to check stability of mount result
+# w/ common mount option and their combination.
+#
+. ./common/preamble
+_begin_fstest auto quick mount
+_require_kernel_config CONFIG_F2FS_FS_XATTR
+_require_kernel_config CONFIG_F2FS_FS_POSIX_ACL
+_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
+
+options=(
+#	mount_option			mkfs_option
+	"background_gc=on"		""			\
+	"background_gc=off"		""			\
+	"background_gc=sync"		""			\
+	"disable_roll_forward"		""			\
+	"norecovery"			""			\
+	"discard"			""			\
+	"nodiscard"			""			\
+	"no_heap"			""			\
+	"heap"				""			\
+	"user_xattr"			""			\
+	"nouser_xattr"			""			\
+	"acl"				""			\
+	"noacl"				""			\
+	"active_logs=2"			""			\
+	"active_logs=4"			""			\
+	"active_logs=6"			""			\
+	"disable_ext_identify"		""			\
+	"inline_xattr"			""			\
+	"noinline_xattr"		""			\
+	"inline_xattr_size=400"		""			\
+	"inline_data"			""			\
+	"noinline_dentry"		""			\
+	"inline_dentry"			""			\
+	"noinline_dentry"		""			\
+	"flush_merge"			""			\
+	"noflush_merge"			""			\
+	"barrier"			""			\
+	"nobarrier"			""			\
+	"fastboot"			""			\
+	"extent_cache"			""			\
+	"noextent_cache"		""			\
+	"data_flush"			""			\
+	"reserve_root=32768"		""			\
+	"resuid=1000"			""			\
+	"resgid=1000"			""			\
+	"fault_injection=100"		""			\
+	"fault_type=4095"		""			\
+	"mode=adaptive"			""			\
+	"mode=lfs"			""			\
+	"mode=fragment:segment"		""			\
+	"mode=fragment:block"		""			\
+	"usrquota"			""			\
+	"grpquota"			""			\
+	"prjquota"			""			\
+	"usrjquota=ausrquota"		""			\
+	"grpjquota=agrpquota"		""			\
+	"prjjquota=aprjquota"		""			\
+	"jqfmt=vfsold"			""			\
+	"jqfmt=vfsv0"			""			\
+	"jqfmt=vfsv1"			""			\
+	"usrjquota="			""			\
+	"grpjquota="			""			\
+	"prjjquota="			""			\
+	"quota"				""			\
+	"noquota"			""			\
+	"alloc_mode=reuse"		""			\
+	"alloc_mode=default"		""			\
+	"fsync_mode=posix"		""			\
+	"fsync_mode=strict"		""			\
+	"fsync_mode=nobarrier"		""			\
+	"test_dummy_encryption"		""			\
+	"test_dummy_encryption=v1"	""			\
+	"test_dummy_encryption=v2"	""			\
+	"checkpoint=enable"		""			\
+	"checkpoint=disable"		""			\
+	"checkpoint=disable:32768"	""			\
+	"checkpoint=disable:50%"	""			\
+	"checkpoint_merge"		""			\
+	"nocheckpoint_merge"		""			\
+	"compress_algorithm=lzo"	""			\
+	"inlinecrypt"			""			\
+	"atgc"				""			\
+	"discard_unit=block"		""			\
+	"discard_unit=segment"		""			\
+	"discard_unit=section"		""			\
+	"memory=normal"			""			\
+	"memory=low"			""			\
+	"age_extent_cache"		""			\
+	"errors=panic"			""			\
+	"errors=continue"		""			\
+	"errors=remount-ro"		""			\
+	"nat_bits"			""			\
+	"atgc,mode=lfs"			""			\
+	"ro,flush_merge"		""			\
+	"rw"				"ro"			\
+	"norecovery,ro"			""			\
+)
+
+for ((i=0;i<${#options[@]};i=i+2))
+do
+	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
+
+	if [ "${options[$((i+1))]}" ]; then
+		_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full || _fail "mkfs failed"
+	else
+		_scratch_mkfs >> $seqres.full || _fail "mkfs failed"
+	fi
+	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+	echo $?
+	_scratch_unmount >> $seqres.full 2>&1
+done
+
+status=0
+exit
diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
new file mode 100644
index 00000000..8d6712f0
--- /dev/null
+++ b/tests/f2fs/015.out
@@ -0,0 +1,173 @@
+QA output created by 015
+Option#0: background_gc=on : 
+0
+Option#2: background_gc=off : 
+0
+Option#4: background_gc=sync : 
+0
+Option#6: disable_roll_forward : 
+0
+Option#8: norecovery : 
+32
+Option#10: discard : 
+0
+Option#12: nodiscard : 
+0
+Option#14: no_heap : 
+0
+Option#16: heap : 
+0
+Option#18: user_xattr : 
+0
+Option#20: nouser_xattr : 
+0
+Option#22: acl : 
+0
+Option#24: noacl : 
+0
+Option#26: active_logs=2 : 
+0
+Option#28: active_logs=4 : 
+0
+Option#30: active_logs=6 : 
+0
+Option#32: disable_ext_identify : 
+0
+Option#34: inline_xattr : 
+0
+Option#36: noinline_xattr : 
+0
+Option#38: inline_xattr_size=400 : 
+0
+Option#40: inline_data : 
+0
+Option#42: noinline_dentry : 
+0
+Option#44: inline_dentry : 
+0
+Option#46: noinline_dentry : 
+0
+Option#48: flush_merge : 
+0
+Option#50: noflush_merge : 
+0
+Option#52: barrier : 
+0
+Option#54: nobarrier : 
+0
+Option#56: fastboot : 
+0
+Option#58: extent_cache : 
+0
+Option#60: noextent_cache : 
+0
+Option#62: data_flush : 
+0
+Option#64: reserve_root=32768 : 
+0
+Option#66: resuid=1000 : 
+0
+Option#68: resgid=1000 : 
+0
+Option#70: fault_injection=100 : 
+0
+Option#72: fault_type=4095 : 
+0
+Option#74: mode=adaptive : 
+0
+Option#76: mode=lfs : 
+0
+Option#78: mode=fragment:segment : 
+0
+Option#80: mode=fragment:block : 
+0
+Option#82: usrquota : 
+0
+Option#84: grpquota : 
+0
+Option#86: prjquota : 
+32
+Option#88: usrjquota=ausrquota : 
+32
+Option#90: grpjquota=agrpquota : 
+32
+Option#92: prjjquota=aprjquota : 
+32
+Option#94: jqfmt=vfsold : 
+0
+Option#96: jqfmt=vfsv0 : 
+0
+Option#98: jqfmt=vfsv1 : 
+0
+Option#100: usrjquota= : 
+0
+Option#102: grpjquota= : 
+0
+Option#104: prjjquota= : 
+0
+Option#106: quota : 
+0
+Option#108: noquota : 
+0
+Option#110: alloc_mode=reuse : 
+0
+Option#112: alloc_mode=default : 
+0
+Option#114: fsync_mode=posix : 
+0
+Option#116: fsync_mode=strict : 
+0
+Option#118: fsync_mode=nobarrier : 
+0
+Option#120: test_dummy_encryption : 
+0
+Option#122: test_dummy_encryption=v1 : 
+0
+Option#124: test_dummy_encryption=v2 : 
+0
+Option#126: checkpoint=enable : 
+0
+Option#128: checkpoint=disable : 
+0
+Option#130: checkpoint=disable:32768 : 
+0
+Option#132: checkpoint=disable:50% : 
+0
+Option#134: checkpoint_merge : 
+0
+Option#136: nocheckpoint_merge : 
+0
+Option#138: compress_algorithm=lzo : 
+0
+Option#140: inlinecrypt : 
+0
+Option#142: atgc : 
+0
+Option#144: discard_unit=block : 
+0
+Option#146: discard_unit=segment : 
+0
+Option#148: discard_unit=section : 
+0
+Option#150: memory=normal : 
+0
+Option#152: memory=low : 
+0
+Option#154: age_extent_cache : 
+0
+Option#156: errors=panic : 
+0
+Option#158: errors=continue : 
+0
+Option#160: errors=remount-ro : 
+0
+Option#162: nat_bits : 
+0
+Option#164: atgc,mode=lfs : 
+32
+Option#166: ro,flush_merge : 
+32
+Option#168: rw : ro
+0
+Option#170: norecovery,ro : 
+0
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
