Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3720BAF91D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 13:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gGYqnH6ZPz/tA/JFA2h3fP6tFsNdf/BUWN4i9gqdsCw=; b=lZkYSOIbGhqBorNJyN8+Qnutd3
	99m3TK2HPlINgv+M9jV4wz5M6dCwTFlnKQwaFaHK3yIIHBWABleTsOV96w8aYmP9rDDKdcrrfCn/m
	21zqPy04ACHHlTgmdaVgu2iwyr4zUUJUX9GNanAnZxLJHNG0DgQqR3vqDtvJxYnf59BM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXeua-000559-Bc;
	Fri, 04 Jul 2025 11:49:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uXeuZ-000552-CX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 11:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yyzcKtZD2YyDgm56Ts7T9KUNTjnrYXziTSi8GQqSHq0=; b=TyxXvrpX1oje4jTgpzA0867I5d
 0J5ZDELn8mNHCKIvSUi/B+z3/o71YfLEHyMJO4sTdk3VlNqx1225/j87DfeT/629lMfVXOKXHyBoD
 QwR4L3Aq5ZEvoyvxxwwWogJF1g2OhMIurdZiGOrOwhqsjC4xWeniP9pc9/iXthAP73IQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yyzcKtZD2YyDgm56Ts7T9KUNTjnrYXziTSi8GQqSHq0=; b=T
 gAy1WpJao0UFxASUzQ7LWhYu1l0sIL288cBKkgrVkXvIXKVmiElhFDdOANvx0jDLJtqACronOFRpk
 5eG4LvsmnFARh7+ktP9lCiaisqkgniJrkjrMw3N5XPcCOq0xrF7mIgUAvBJyEYvUp4bBUIN/FeNix
 C31wSUpC0C3cZZDg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXeuY-0001Ja-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 11:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 348A75C56F7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Jul 2025 11:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7C9C4CEE3;
 Fri,  4 Jul 2025 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751629727;
 bh=v8oYqlQcWgUn8VtLMsN9ZNS+mEN6ulsKMdnTfoWan6c=;
 h=From:To:Cc:Subject:Date:From;
 b=js2JgbdFd29ohx1Mgv/U/LCs4snntEdOIrZgIuDMdGBkCtgRzukqFt7+9oSUG9SBl
 dD2tFN9raYGMvYlVq0VGZVituYQBvCc3gG9fFlIsPpniw65atCS00jCIS137A4kT0a
 pyekR1kuZOb0EZ5SASgm6S3qy6D/zt37aTa20S4/6frRcoWMGNpNnQghCeI7Ih1BqK
 9XV4HNWLy8BEZf+1NH9Cm2G4g6CNdfwK30Eeg/t5mSojtF5gzXAS4LFbzWyBe2r+6H
 XbfjJGB7gmEyhdo4yuAPvRgTDQS8N2ZxcVP5QJ+exHRSHxEfFVifvz2STwf0LcgqIM
 Jp2mmwc8NIllg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Fri,  4 Jul 2025 19:48:18 +0800
Message-ID: <20250704114818.1878294-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs changes to use new mount APIs,
 let's add a new testcase
 to check mount result for all f2fs supported mount options and their
 combinations, 
 in order to detect any inconsistency during mount. Cc: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - allow to check mount
 options w/ zoned device common/rc | 3 + tests/f2fs/015 | 159
 ++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXeuY-0001Ja-Ja
Subject: [f2fs-dev] [PATCH v2] f2fs/015: test mount options
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
to check mount result for all f2fs supported mount options and
their combinations, in order to detect any inconsistency during
mount.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- allow to check mount options w/ zoned device
 common/rc          |   3 +
 tests/f2fs/015     | 159 ++++++++++++++++++++++++++++++++
 tests/f2fs/015.out | 225 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 387 insertions(+)
 create mode 100755 tests/f2fs/015
 create mode 100644 tests/f2fs/015.out

diff --git a/common/rc b/common/rc
index f71cc8f0..94fdce7e 100644
--- a/common/rc
+++ b/common/rc
@@ -844,6 +844,9 @@ _test_mkfs()
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
index 00000000..746e79de
--- /dev/null
+++ b/tests/f2fs/015
@@ -0,0 +1,159 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/015
+#
+# This testcase tries to check stability of mount result
+# w/ all f2fs supported mount option and their combination.
+#
+. ./common/preamble
+_begin_fstest auto quick
+_require_kernel_config CONFIG_F2FS_FS_XATTR
+_require_kernel_config CONFIG_F2FS_FS_POSIX_ACL
+_require_kernel_config CONFIG_F2FS_FAULT_INJECTION
+_require_kernel_config CONFIG_F2FS_FS_COMPRESSION
+_require_kernel_config CONFIG_F2FS_FS_LZO
+_require_kernel_config CONFIG_F2FS_FS_LZORLE
+_require_kernel_config CONFIG_F2FS_FS_LZ4
+_require_kernel_config CONFIG_F2FS_FS_LZ4HC
+_require_kernel_config CONFIG_F2FS_FS_ZSTD
+
+_require_zoned_device "$TEST_DEV"
+_test_unmount >> $seqres.full 2>&1
+
+options=(
+#	mount_option			mkfs_option
+	"background_gc=on"		""			\
+	"background_gc=off"		""			\
+	"background_gc=sync"		""			\
+	"background_gc=on"		"blkzone"		\
+	"background_gc=off"		"blkzone"		\
+	"background_gc=sync"		"blkzone"		\
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
+	"inline_xattr_size=400"		"extra,flexible_inline_xattr"\
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
+	"mode=adaptive"			"blkzone"		\
+	"mode=lfs"			"blkzone"		\
+	"mode=fragment:segment"		"blkzone"		\
+	"mode=fragment:block"		"blkzone"		\
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
+	"compress_algorithm=lzo"	"extra,compression"	\
+	"compress_algorithm=lz4"	"extra,compression"	\
+	"compress_algorithm=zstd"	"extra,compression"	\
+	"compress_algorithm=lzo-rle"	"extra,compression"	\
+	"compress_algorithm=lz4:3"	"extra,compression"	\
+	"compress_algorithm=zstd:1"	"extra,compression"	\
+	"compress_log_size=8"		"extra,compression"	\
+	"compress_extension=so"		"extra,compression"	\
+	"nocompress_extension=so"	"extra,compression"	\
+	"nocompress_extension=*"	"extra,compression"	\
+	"compress_extension=so,nocompress_extension=so"		\
+					"extra,compression"	\
+	"compress_chksum"		"extra,compression"	\
+	"compress_mode=fs"		"extra,compression"	\
+	"compress_mode=user"		"extra,compression"	\
+	"compress_cache"		"extra,compression"	\
+	"inlinecrypt"			""			\
+	"atgc"				""			\
+	"discard_unit=block"		""			\
+	"discard_unit=segment"		""			\
+	"discard_unit=section"		""			\
+	"discard_unit=block"		"blkzone"		\
+	"discard_unit=segment"		"blkzone"		\
+	"discard_unit=section"		"blkzone"		\
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
+	if [ "${options[$((i+1))]}" == "blkzone" ]; then
+		_test_mkfs "-m" >> $seqres.full
+		_test_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+		echo $?
+		_test_unmount >> $seqres.full 2>&1
+	else
+		_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full
+		_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+		echo $?
+		_scratch_unmount >> $seqres.full 2>&1
+	fi
+done
+
+status=0
+exit
diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
new file mode 100644
index 00000000..d7f4e62a
--- /dev/null
+++ b/tests/f2fs/015.out
@@ -0,0 +1,225 @@
+QA output created by 015
+Option#0: background_gc=on : 
+0
+Option#2: background_gc=off : 
+0
+Option#4: background_gc=sync : 
+0
+Option#6: background_gc=on : blkzone
+0
+Option#8: background_gc=off : blkzone
+32
+Option#10: background_gc=sync : blkzone
+0
+Option#12: disable_roll_forward : 
+0
+Option#14: norecovery : 
+32
+Option#16: discard : 
+0
+Option#18: nodiscard : 
+0
+Option#20: no_heap : 
+0
+Option#22: heap : 
+0
+Option#24: user_xattr : 
+0
+Option#26: nouser_xattr : 
+0
+Option#28: acl : 
+0
+Option#30: noacl : 
+0
+Option#32: active_logs=2 : 
+0
+Option#34: active_logs=4 : 
+0
+Option#36: active_logs=6 : 
+0
+Option#38: disable_ext_identify : 
+0
+Option#40: inline_xattr : 
+0
+Option#42: noinline_xattr : 
+0
+Option#44: inline_xattr_size=400 : extra,flexible_inline_xattr
+32
+Option#46: inline_xattr_size=400 : 
+32
+Option#48: inline_data : 
+0
+Option#50: noinline_dentry : 
+0
+Option#52: inline_dentry : 
+0
+Option#54: noinline_dentry : 
+0
+Option#56: flush_merge : 
+0
+Option#58: noflush_merge : 
+0
+Option#60: barrier : 
+0
+Option#62: nobarrier : 
+0
+Option#64: fastboot : 
+0
+Option#66: extent_cache : 
+0
+Option#68: noextent_cache : 
+0
+Option#70: data_flush : 
+0
+Option#72: reserve_root=32768 : 
+0
+Option#74: resuid=1000 : 
+0
+Option#76: resgid=1000 : 
+0
+Option#78: fault_injection=100 : 
+0
+Option#80: fault_type=4095 : 
+0
+Option#82: mode=adaptive : 
+0
+Option#84: mode=lfs : 
+0
+Option#86: mode=fragment:segment : 
+0
+Option#88: mode=fragment:block : 
+0
+Option#90: mode=adaptive : blkzone
+32
+Option#92: mode=lfs : blkzone
+0
+Option#94: mode=fragment:segment : blkzone
+32
+Option#96: mode=fragment:block : blkzone
+32
+Option#98: usrquota : 
+0
+Option#100: grpquota : 
+0
+Option#102: prjquota : 
+32
+Option#104: usrjquota=ausrquota : 
+32
+Option#106: grpjquota=agrpquota : 
+32
+Option#108: prjjquota=aprjquota : 
+32
+Option#110: jqfmt=vfsold : 
+0
+Option#112: jqfmt=vfsv0 : 
+0
+Option#114: jqfmt=vfsv1 : 
+0
+Option#116: usrjquota= : 
+0
+Option#118: grpjquota= : 
+0
+Option#120: prjjquota= : 
+0
+Option#122: quota : 
+0
+Option#124: noquota : 
+0
+Option#126: alloc_mode=reuse : 
+0
+Option#128: alloc_mode=default : 
+0
+Option#130: fsync_mode=posix : 
+0
+Option#132: fsync_mode=strict : 
+0
+Option#134: fsync_mode=nobarrier : 
+0
+Option#136: test_dummy_encryption : 
+32
+Option#138: test_dummy_encryption=v1 : 
+32
+Option#140: test_dummy_encryption=v2 : 
+32
+Option#142: checkpoint=enable : 
+0
+Option#144: checkpoint=disable : 
+0
+Option#146: checkpoint=disable:32768 : 
+0
+Option#148: checkpoint=disable:50% : 
+0
+Option#150: checkpoint_merge : 
+0
+Option#152: nocheckpoint_merge : 
+0
+Option#154: compress_algorithm=lzo : 
+0
+Option#156: compress_algorithm=lzo : extra,compression
+0
+Option#158: compress_algorithm=lz4 : extra,compression
+0
+Option#160: compress_algorithm=zstd : extra,compression
+0
+Option#162: compress_algorithm=lzo-rle : extra,compression
+0
+Option#164: compress_algorithm=lz4:3 : extra,compression
+0
+Option#166: compress_algorithm=zstd:1 : extra,compression
+0
+Option#168: compress_log_size=8 : extra,compression
+0
+Option#170: compress_extension=so : extra,compression
+0
+Option#172: nocompress_extension=so : extra,compression
+0
+Option#174: nocompress_extension=* : extra,compression
+0
+Option#176: compress_extension=so,nocompress_extension=so : extra,compression
+0
+Option#178: compress_chksum : extra,compression
+0
+Option#180: compress_mode=fs : extra,compression
+0
+Option#182: compress_mode=user : extra,compression
+0
+Option#184: compress_cache : extra,compression
+0
+Option#186: inlinecrypt : 
+0
+Option#188: atgc : 
+0
+Option#190: discard_unit=block : 
+0
+Option#192: discard_unit=segment : 
+0
+Option#194: discard_unit=section : 
+0
+Option#196: discard_unit=block : blkzone
+0
+Option#198: discard_unit=segment : blkzone
+0
+Option#200: discard_unit=section : blkzone
+0
+Option#202: memory=normal : 
+0
+Option#204: memory=low : 
+0
+Option#206: age_extent_cache : 
+0
+Option#208: errors=panic : 
+0
+Option#210: errors=continue : 
+0
+Option#212: errors=remount-ro : 
+0
+Option#214: nat_bits : 
+0
+Option#216: atgc,mode=lfs : 
+32
+Option#218: ro,flush_merge : 
+32
+Option#220: rw : ro
+0
+Option#222: norecovery,ro : 
+0
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
