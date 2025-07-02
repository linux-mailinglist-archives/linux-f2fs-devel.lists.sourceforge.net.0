Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EAAAF1317
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jul 2025 13:03:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uE7DptV8iTlY3kCR4CLmJu652+RoO85Rg9YBm0mYcQk=; b=SYi+nPjwhW7ol9SoWtjSzIt1IX
	JopuZ9QMzVj8SwZPaBNSuk1HvphI2PQ5veSNQVlOyeJkhRV8VSOOxJfdkfMazRkw6SByzMfeMTXoO
	Rz2rErQBq/6YXibBJb+i4E7uWzAgiuemMKhT4QN1l54k40wxoEeefs+yKcA3yVnvNnd0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWvFd-0007Fb-NB;
	Wed, 02 Jul 2025 11:03:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWvFc-0007FV-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 11:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bHEgxPoeADEC2WSQBxxtVs3KHft0Nbhon5AQnHaCjlM=; b=lFt6hoCUrnIcwZaDNb5GawUD1F
 ivk+D4zjoK1fzC5hYgsKUaOaYvoiyN9vi+seL+bBuXvycExaGJEoA53DP2fapOp6hBWBbzk7bSgfI
 L4mTmu48aXO3ZFINyQBybpyOEfpNTc9iYVh+vYo5PUkW4mMUBwcNgC0i4YGTk4UNv6GY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bHEgxPoeADEC2WSQBxxtVs3KHft0Nbhon5AQnHaCjlM=; b=O
 toE8Z2EB4ZGTtwDwdmea+g8wvish3u0gevIMTrSGqWrUGHPGPK60JUodPrJld8KBGCMPFcHljZA0c
 HOvHoGuf+rdd5A6Kv9O9pnab10J+jnsoXhjOQmxT3moSRBRcNXTvUgi3idfySVzcVhaQMHEB4KqCW
 rCp3QulNb23SdC3E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWvFb-00011p-Em for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Jul 2025 11:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F4DA5C58CC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Jul 2025 11:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8751C4CEF0;
 Wed,  2 Jul 2025 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751454208;
 bh=1ejaeF3d+CsdtlVB90ag4XAq4kvdFO3BaHrUfsuNpWU=;
 h=From:To:Cc:Subject:Date:From;
 b=VyRSg2tO0BUI4Cxe2ULHBodVAeHLeFW4NUotqvyKvRTCPl9p1M8wF+4LiX63j39dt
 pfV4Ac3esFQk6a+EPekJsvonarqkiD96BHzDV/0/684eHVt0m4khRAuxoBsZKqrECx
 jnkzK9EWK2teJA5pfveX3rmgVXzFrBIEpHi8cl88qxR4mRqCu3dTpGTlTgrcnNTkhw
 WEMjI3OA2NJMnhdBZ2EFjfnsrEp2zBXhMoTtMZxCtLVohcmLyefNOlLqcxGFEPAv1A
 KKh9pqeE09pBILUa3K6/ofWIeW4N0B6yQ8jpe+hl/TUfY6FoyhcAH47sbKo5W1tuyo
 n6ASTpSMeD7Aw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Wed,  2 Jul 2025 19:02:04 +0800
Message-ID: <20250702110204.1063796-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 Signed-off-by: Chao Yu <chao@kernel.org> --- tests/f2fs/015 | 141
 ++++++++++++++++++++++++++++++
 tests/f2fs/015.out | 207 +++++++++++++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWvFb-00011p-Em
Subject: [f2fs-dev] [PATCH] f2fs/015: test mount options
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
 tests/f2fs/015     | 141 ++++++++++++++++++++++++++++++
 tests/f2fs/015.out | 207 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 348 insertions(+)
 create mode 100755 tests/f2fs/015
 create mode 100644 tests/f2fs/015.out

diff --git a/tests/f2fs/015 b/tests/f2fs/015
new file mode 100755
index 00000000..86f0ef9e
--- /dev/null
+++ b/tests/f2fs/015
@@ -0,0 +1,141 @@
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
+_require_scratch
+
+options=(
+#	mount_option			mkfs_option
+	"background_gc=on"		""			\
+	"background_gc=off"		""			\
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
+	"compress_algorithm=ztsd:1"	"extra,compression"	\
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
+	_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full
+	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
+	echo $?
+	_scratch_unmount
+done
+
+status=0
+exit
diff --git a/tests/f2fs/015.out b/tests/f2fs/015.out
new file mode 100644
index 00000000..83e6ad51
--- /dev/null
+++ b/tests/f2fs/015.out
@@ -0,0 +1,207 @@
+QA output created by 015
+Option#0: background_gc=on : 
+0
+Option#2: background_gc=off : 
+0
+Option#4: background_gc=off : 
+0
+Option#6: background_gc=sync : 
+0
+Option#8: disable_roll_forward : 
+0
+Option#10: norecovery : 
+32
+Option#12: discard : 
+0
+Option#14: nodiscard : 
+0
+Option#16: no_heap : 
+0
+Option#18: heap : 
+0
+Option#20: user_xattr : 
+0
+Option#22: nouser_xattr : 
+0
+Option#24: acl : 
+0
+Option#26: noacl : 
+0
+Option#28: active_logs=2 : 
+0
+Option#30: active_logs=4 : 
+0
+Option#32: active_logs=6 : 
+0
+Option#34: disable_ext_identify : 
+0
+Option#36: inline_xattr : 
+0
+Option#38: noinline_xattr : 
+0
+Option#40: inline_xattr_size=400 : extra,flexible_inline_xattr
+0
+Option#42: inline_xattr_size=400 : 
+0
+Option#44: inline_data : 
+0
+Option#46: noinline_dentry : 
+0
+Option#48: inline_dentry : 
+0
+Option#50: noinline_dentry : 
+0
+Option#52: flush_merge : 
+0
+Option#54: noflush_merge : 
+0
+Option#56: barrier : 
+0
+Option#58: nobarrier : 
+0
+Option#60: fastboot : 
+0
+Option#62: extent_cache : 
+0
+Option#64: noextent_cache : 
+0
+Option#66: data_flush : 
+0
+Option#68: reserve_root=32768 : 
+0
+Option#70: resuid=1000 : 
+0
+Option#72: resgid=1000 : 
+0
+Option#74: fault_injection=100 : 
+0
+Option#76: fault_type=4095 : 
+0
+Option#78: mode=adaptive : 
+0
+Option#80: mode=lfs : 
+0
+Option#82: mode=fragment:segment : 
+0
+Option#84: mode=fragment:block : 
+0
+Option#86: usrquota : 
+0
+Option#88: grpquota : 
+0
+Option#90: prjquota : 
+32
+Option#92: usrjquota=ausrquota : 
+32
+Option#94: grpjquota=agrpquota : 
+32
+Option#96: prjjquota=aprjquota : 
+32
+Option#98: jqfmt=vfsold : 
+0
+Option#100: jqfmt=vfsv0 : 
+0
+Option#102: jqfmt=vfsv1 : 
+0
+Option#104: usrjquota= : 
+0
+Option#106: grpjquota= : 
+0
+Option#108: prjjquota= : 
+0
+Option#110: quota : 
+0
+Option#112: noquota : 
+0
+Option#114: alloc_mode=reuse : 
+0
+Option#116: alloc_mode=default : 
+0
+Option#118: fsync_mode=posix : 
+0
+Option#120: fsync_mode=strict : 
+0
+Option#122: fsync_mode=nobarrier : 
+0
+Option#124: test_dummy_encryption : 
+0
+Option#126: test_dummy_encryption=v1 : 
+0
+Option#128: test_dummy_encryption=v2 : 
+0
+Option#130: checkpoint=enable : 
+0
+Option#132: checkpoint=disable : 
+0
+Option#134: checkpoint=disable:32768 : 
+0
+Option#136: checkpoint=disable:50% : 
+0
+Option#138: checkpoint_merge : 
+0
+Option#140: nocheckpoint_merge : 
+0
+Option#142: compress_algorithm=lzo : 
+0
+Option#144: compress_algorithm=lzo : extra,compression
+0
+Option#146: compress_algorithm=lz4 : extra,compression
+0
+Option#148: compress_algorithm=zstd : extra,compression
+0
+Option#150: compress_algorithm=lzo-rle : extra,compression
+0
+Option#152: compress_algorithm=lz4:3 : extra,compression
+0
+Option#154: compress_algorithm=ztsd:1 : extra,compression
+32
+Option#156: compress_log_size=8 : extra,compression
+0
+Option#158: compress_extension=so : extra,compression
+0
+Option#160: nocompress_extension=so : extra,compression
+0
+Option#162: nocompress_extension=* : extra,compression
+32
+Option#164: compress_extension=so,nocompress_extension=so : extra,compression
+32
+Option#166: compress_chksum : extra,compression
+0
+Option#168: compress_mode=fs : extra,compression
+0
+Option#170: compress_mode=user : extra,compression
+0
+Option#172: compress_cache : extra,compression
+0
+Option#174: inlinecrypt : 
+0
+Option#176: atgc : 
+0
+Option#178: discard_unit=block : 
+0
+Option#180: discard_unit=segment : 
+0
+Option#182: discard_unit=section : 
+0
+Option#184: memory=normal : 
+0
+Option#186: memory=low : 
+0
+Option#188: age_extent_cache : 
+0
+Option#190: errors=panic : 
+0
+Option#192: errors=continue : 
+0
+Option#194: errors=remount-ro : 
+0
+Option#196: nat_bits : 
+0
+Option#198: atgc,mode=lfs : 
+32
+Option#200: ro,flush_merge : 
+32
+Option#202: rw : ro
+0
+Option#204: norecovery,ro : 
+0
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
