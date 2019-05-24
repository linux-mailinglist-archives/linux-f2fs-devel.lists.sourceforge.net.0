Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1F2A0F5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:05:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJR-0005o5-JX; Fri, 24 May 2019 22:05:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIJQ-0005nz-R1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TXie0EmLvQ8Ff2gD9Rqk1g6YTMhAYdMnZKVx0QfsKS0=; b=Ucfb9jC35yVD/Z0Fu0gEaQPqrF
 FJ59SZReRUK7m7wQddQd5kK/2+KOKyzElhPr1YLk8hFUFlTdsz6Jt0368eIhZO107tM4HdgDBQNLR
 ubyPRPAMrXyN+eD3SCyiBqnXqjtsXM/6f7vP+Eyu39WK6mSp11IyUY0WARMNOzc5A8+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TXie0EmLvQ8Ff2gD9Rqk1g6YTMhAYdMnZKVx0QfsKS0=; b=mqUaxV//BggVkIxTZnIxTUDGru
 TvI3R5sQJPmImSvhotiz71h3fOV/OwphtOY3zdKWd3x9mw3h656tHOKT/uw0IrgU+h6YGsbeT5bkE
 Bz18ZJXIKxdIMhwTotkRNeYgIbeEOq33f43GqPcmtzsE1xXhb+1+fxEwgxSsMW3Oe1IA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIJ4-007hMJ-L9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:05:16 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DD1521872;
 Fri, 24 May 2019 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735483;
 bh=9FcqD00Z+Ip5/7Ffbq/BiFfLb5UyVB8AgSEaW5tLU7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gz+8FgQEr45RNqE5A0k3QVUpmgKWrbuOUQzcqwEVyCAWmxKU00kuzxS5q31Bhnazr
 P93LIko2SO7LkbG+y39db7FGec4oEZa0cWkjUmERDqaBHnjifo+pMph/JKwsjqNjRt
 uqXHdlQ3TdzIMHOp1qTn6I3SD3t+R37NoU9QQzTk=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:24 -0700
Message-Id: <20190524220425.201170-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524220425.201170-1-ebiggers@kernel.org>
References: <20190524220425.201170-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hUIJ4-007hMJ-L9
Subject: [f2fs-dev] [PATCH v2 6/7] generic: verify ciphertext of v1
 encryption policies with AES-128
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Verify ciphertext for v1 encryption policies that use AES-128-CBC-ESSIV
to encrypt file contents and AES-128-CTS-CBC to encrypt file names.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/701     | 41 +++++++++++++++++++++++++++++++++++++++++
 tests/generic/701.out |  5 +++++
 tests/generic/group   |  1 +
 3 files changed, 47 insertions(+)
 create mode 100755 tests/generic/701
 create mode 100644 tests/generic/701.out

diff --git a/tests/generic/701 b/tests/generic/701
new file mode 100755
index 00000000..d477f5bd
--- /dev/null
+++ b/tests/generic/701
@@ -0,0 +1,41 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2019 Google LLC
+#
+# FS QA Test generic/701
+#
+# Verify ciphertext for v1 encryption policies that use AES-128-CBC-ESSIV to
+# encrypt file contents and AES-128-CTS-CBC to encrypt file names.
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
+. ./common/encrypt
+
+# remove previous $seqres.full before test
+rm -f $seqres.full
+
+# real QA test starts here
+_supported_fs generic
+_supported_os Linux
+
+_verify_ciphertext_for_encryption_policy AES-128-CBC-ESSIV AES-128-CTS-CBC
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/701.out b/tests/generic/701.out
new file mode 100644
index 00000000..cfb6c924
--- /dev/null
+++ b/tests/generic/701.out
@@ -0,0 +1,5 @@
+QA output created by 701
+
+Verifying ciphertext with parameters:
+	contents_encryption_mode: AES-128-CBC-ESSIV
+	filenames_encryption_mode: AES-128-CTS-CBC
diff --git a/tests/generic/group b/tests/generic/group
index 69ed721a..85cc2165 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -551,3 +551,4 @@
 546 auto quick clone enospc log
 547 auto quick log
 700 auto quick encrypt
+701 auto quick encrypt
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
