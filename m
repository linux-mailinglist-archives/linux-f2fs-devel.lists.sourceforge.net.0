Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B865C2FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 20:27:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi11Q-0001b2-MU; Mon, 01 Jul 2019 18:27:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi11O-0001aY-Sa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uta6Rdg5FrrItafgRZuTqlZPe2DJ5924X6i/Q2sxkAQ=; b=PeWW2bu0MQrRe9EyG/gOIVz/OV
 ZvsFTvFO0ftoB0IRI+fnC6ZAjeasnha+E3GlfxUa/IbV8B4ySnwW8VUUiPO9lzNsv3P5LDW7N6Wqn
 3uyT0ob8d8X2jY/+sM2laseb6BkoPhKDeI9HS7fhh8fWQG7e4hKy4sxIpy5OrlpslS6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uta6Rdg5FrrItafgRZuTqlZPe2DJ5924X6i/Q2sxkAQ=; b=kHjJEtKVFKm1KL3iTKaZ2cWxyO
 1b52qSMJhrk1vVp1PsJL+U+oyyctU0M8524OalkbEfxsQIfiNf6nSzGxepMATa2K88aIWvEA04VgS
 ugfmd1pWQAhXsYo/wXTzzcYK6Dy5wL8qnOOQiJqR9dmBTZYT1NdqminSiE+h5EunA9nI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi11c-003hhU-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:37 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D28192184B;
 Mon,  1 Jul 2019 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562005649;
 bh=U7Gh8ir4OCdfKq36Q2cZ7i6ciRgLXwzUMHrcALWwhtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fdeR3+53dALQlSrstHrhaTNzqTtQy+1qRhfWxu06cMjNADYvl7kiGR6dfeeV9+3Fp
 JprVUMqM9SPxZ55N0ffcX6d9TYMdmfvX/mUB1/hu29zJhfv7YgiuRCMz/QJ3qslrN2
 N42qnZa+sUDixEp+Owwo4UmjjXf5I4I8+UQVs1kU=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Mon,  1 Jul 2019 11:25:43 -0700
Message-Id: <20190701182547.165856-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701182547.165856-1-ebiggers@kernel.org>
References: <20190701182547.165856-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hi11c-003hhU-Gi
Subject: [f2fs-dev] [RFC PATCH v3 4/8] generic: test access controls on the
 fs-verity ioctls
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Test access controls on the fs-verity ioctls.  FS_IOC_MEASURE_VERITY is
allowed on any file, whereas FS_IOC_ENABLE_VERITY requires write access.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/901     | 73 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/901.out | 14 +++++++++
 tests/generic/group   |  1 +
 3 files changed, 88 insertions(+)
 create mode 100755 tests/generic/901
 create mode 100644 tests/generic/901.out

diff --git a/tests/generic/901 b/tests/generic/901
new file mode 100755
index 00000000..56dab587
--- /dev/null
+++ b/tests/generic/901
@@ -0,0 +1,73 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2018 Google LLC
+#
+# FS QA Test generic/901
+#
+# Test access controls on the fs-verity ioctls.  FS_IOC_MEASURE_VERITY is
+# allowed on any file, whereas FS_IOC_ENABLE_VERITY requires write access.
+#
+seq=`basename $0`
+seqres=$RESULT_DIR/$seq
+echo "QA output created by $seq"
+
+here=`pwd`
+tmp=/tmp/$$
+status=1	# failure is the default!
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+_cleanup()
+{
+	cd /
+	rm -f $tmp.*
+}
+
+# get standard environment, filters and checks
+. ./common/rc
+. ./common/filter
+. ./common/verity
+
+# remove previous $seqres.full before test
+rm -f $seqres.full
+
+# real QA test starts here
+_supported_fs generic
+_supported_os Linux
+_require_scratch_verity
+_require_user
+_require_chattr ia
+
+_scratch_mkfs_verity &>> $seqres.full
+_scratch_mount
+fsv_file=$SCRATCH_MNT/file.fsv
+
+_fsv_scratch_begin_subtest "FS_IOC_ENABLE_VERITY doesn't require root"
+echo foo > $fsv_file
+chmod 666 $fsv_file
+_user_do "$FSVERITY_PROG enable $fsv_file"
+
+_fsv_scratch_begin_subtest "FS_IOC_ENABLE_VERITY requires write access"
+echo foo > $fsv_file >> $seqres.full
+chmod 444 $fsv_file
+_user_do "$FSVERITY_PROG enable $fsv_file" |& _filter_scratch
+
+_fsv_scratch_begin_subtest "FS_IOC_ENABLE_VERITY requires !append-only"
+echo foo > $fsv_file >> $seqres.full
+$CHATTR_PROG +a $fsv_file
+$FSVERITY_PROG enable $fsv_file |& _filter_scratch
+$CHATTR_PROG -a $fsv_file
+
+_fsv_scratch_begin_subtest "FS_IOC_ENABLE_VERITY requires !immutable"
+echo foo > $fsv_file >> $seqres.full
+$CHATTR_PROG +i $fsv_file
+$FSVERITY_PROG enable $fsv_file |& _filter_scratch
+$CHATTR_PROG -i $fsv_file
+
+_fsv_scratch_begin_subtest "FS_IOC_MEASURE_VERITY doesn't require root"
+_fsv_create_enable_file $fsv_file >> $seqres.full
+chmod 444 $fsv_file
+su $qa_user -c "$FSVERITY_PROG measure $fsv_file" >> $seqres.full
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/901.out b/tests/generic/901.out
new file mode 100644
index 00000000..a9e4c364
--- /dev/null
+++ b/tests/generic/901.out
@@ -0,0 +1,14 @@
+QA output created by 901
+
+# FS_IOC_ENABLE_VERITY doesn't require root
+
+# FS_IOC_ENABLE_VERITY requires write access
+Permission denied
+
+# FS_IOC_ENABLE_VERITY requires !append-only
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Operation not permitted
+
+# FS_IOC_ENABLE_VERITY requires !immutable
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Operation not permitted
+
+# FS_IOC_MEASURE_VERITY doesn't require root
diff --git a/tests/generic/group b/tests/generic/group
index 7f72b304..df074d86 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -561,3 +561,4 @@
 556 auto quick casefold
 557 auto quick log
 900 auto quick verity
+901 auto quick verity
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
