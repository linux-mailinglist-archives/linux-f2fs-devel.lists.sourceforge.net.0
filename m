Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AC9BCF290
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 10:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOWQ4WugaH5NPeeayENzqA3D8VD7SzsBepiMDWXxnp4=; b=G4LJWYoOFvHW/PLysiGFsIoV8o
	eHgBlBhzckorLz5u0tCaAkUCAIEgtSgwKLwmVh57J27SlHU4h4FzLNsUycwGRK6BCOOpcMoYC46o1
	6jcQ5/HWJlR+dsbsvKnAwg+mU3i17MlxTaoBVpTftGJwKpw/MF/iJ+T43s8UhnkL/SOk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7VGg-0006RL-Ch;
	Sat, 11 Oct 2025 08:47:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v7VGf-0006RB-GP
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 08:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZnX6MMApb6QcbHVcs29/I6X3Zy1xjTuF3iDemgCOS8=; b=Rw9SGLxLPrjuwYmOg8TwESIQDf
 b4JoNAjKjAa62Y00UHtNU3Wlo56eqHDM4DrP4DZNvzVLiOdLTbh7YSZ9NK0b/UW46T2iGWVGcqnki
 386UpOVFBXabNPQmILmmlFERuSe8xLtOdFmzfntmWE3oV9LH18RPSuWXujtfakAZp6Hw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZnX6MMApb6QcbHVcs29/I6X3Zy1xjTuF3iDemgCOS8=; b=c6XlGqdPc6VoAoEoHOOjIYBcct
 Iz8Fc8yBWb8EaIY8x9VkQUCC0Y8nPVeP5FYOI1TTJQBarFg9zKV8KwB/18VDJN3BJPgwANmACwqeJ
 v3M9/nTYjcatQPUSJJjGbw9G7NuSxY+iciOG1qTZ0C+Tu1BIDb3j0fMS0gtdEvPvT6Kw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7VGf-0004op-QL for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 08:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 879FA48AA5;
 Sat, 11 Oct 2025 08:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16739C113D0;
 Sat, 11 Oct 2025 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760172467;
 bh=ICK2QtCKRm4PbgXspSFQYE73re2fxQXKto45NArjRVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YQddnMhfbM7yUO5D/23J2itcNHIYcoirDPlT3n2lg39AiDJQDu6MytOKCzcpEjTcv
 ahdaN0G8Gq+/k4SrwKIzJU2ChpILNX26yN2HuOkzwJprsvwp2kIcXn7EI2Xwr38H12
 6LmiSCAZkEYJRjtekbaizcDpFtOe5pLvveFenfam46e2B2UdEOQ2OKACGuyuT/2Q0M
 RiIdcTSN+4uLXMR3Kvc6Hub+HTc18zqjtotdqTRSZboqys+gyzBXSe5USCXkDDBJ6V
 YgYVuQJoJHNLoNX/+g5mOjB8aAp93hUQ6Snv0tiAM8TcLWnJdWcKlVSpjG+TKGZg2R
 DYK7sRkeOE6zw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Sat, 11 Oct 2025 16:47:15 +0800
Message-ID: <20251011084715.608562-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
In-Reply-To: <20251011084715.608562-1-chao@kernel.org>
References: <20251011084715.608562-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test: 1. create foo & bar 2. write 8M
 data to foo 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar 4.
 fpunch in foo w/ specified range If we haven't applied kernel patch ("f2fs:
 fix to do sanity check on node footer for non inode dnode"), f2fs may missed
 to do sanity check on corrupted dnode, result in panic or deadloop in step
 4). Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1v7VGf-0004op-QL
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs/022: do sanity check on footer of
 non inode dnode
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test:
1. create foo & bar
2. write 8M data to foo
3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
4. fpunch in foo w/ specified range

If we haven't applied kernel patch ("f2fs: fix to do sanity check on
node footer for non inode dnode"), f2fs may missed to do sanity check
on corrupted dnode, result in panic or deadloop in step 4).

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
Reviewed-by: Zorro Lang <zlang@redhat.com>
---
v3:
- update commit id in _fixed_by_kernel_commit line
- fix to update output to "fallocate: Structure needs cleaning"
- fix typo for foo_path & bar_path
 tests/f2fs/022     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/022.out |  2 ++
 2 files changed, 54 insertions(+)
 create mode 100755 tests/f2fs/022
 create mode 100644 tests/f2fs/022.out

diff --git a/tests/f2fs/022 b/tests/f2fs/022
new file mode 100755
index 00000000..e5dd3077
--- /dev/null
+++ b/tests/f2fs/022
@@ -0,0 +1,52 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/022
+#
+# This is a regression test:
+# 1. create foo & bar
+# 2. write 8M data to foo
+# 3. use inject.f2fs to inject i_nid[0] of foo w/ ino of bar
+# 4. fpunch in foo w/ specified range
+#
+. ./common/preamble
+_begin_fstest auto quick rw
+
+. ./common/attr
+
+_fixed_by_kernel_commit c18ecd99e0c7 \
+	"f2fs: fix to do sanity check on node footer for non inode dnode"
+
+_require_scratch_nocheck
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+foo_path=$SCRATCH_MNT/foo
+bar_path=$SCRATCH_MNT/bar
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+touch $foo_path
+touch $bar_path
+$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
+sync
+foo_ino=`stat -c '%i' $foo_path`
+bar_ino=`stat -c '%i' $bar_path`
+_scratch_unmount
+
+# inject foo inode to replace i_nid[0] w/ to bar ino
+$F2FS_INJECT_PROG --node --mb i_nid --nid $foo_ino --idx 0 --val $bar_ino $SCRATCH_DEV >> $seqres.full || _fail "failed to inject"
+
+_scratch_mount
+
+# if CONFIG_F2FS_CHECK_FS is enabled, it will trigger a kernel panic,
+# otherwise, it will enter a deadloop.
+$XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
+_scratch_unmount
+
+status=0
+exit
diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
new file mode 100644
index 00000000..5307e3d7
--- /dev/null
+++ b/tests/f2fs/022.out
@@ -0,0 +1,2 @@
+QA output created by 022
+fallocate: Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
