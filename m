Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89A2A0F4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:05:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJK-0001cR-UK; Fri, 24 May 2019 22:05:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIJJ-0001cD-Po
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQvc/gF54pH6aB7pGvniXHpvommUiamlH7d7dHy2faI=; b=UCSvy4TVZCtyZF5YioFauERQkJ
 lOl4ziMox+yKEO0dlUwqZmitEQwEzxI/oZT4Ge+xRZburY75ghv8oOUm5aEFjHHSyFlVnXLaSvDyk
 zl6eiJvtIXSUNqg9z70Mi8A+jRpVrnhQfZFoNeKFiLTUnlVy3PPq4FjQv1jJw+ZW0Bxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQvc/gF54pH6aB7pGvniXHpvommUiamlH7d7dHy2faI=; b=NkUtkCxckypBz0cFaA4SNJ7M3g
 Qm/G+YtoPBprnpStXF86rFwW2js5ltA5vAdp96xF8zAw5dbz3jhk8ARpuagXSL1UebSIOHrkkBt1o
 AcnJTz9tC/6EPbr3BxMu7zz6/EEm8CblWboaRWDBkKMMDf9JrYmISKLz5HDbkyU4tF3w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIJ4-00EpFt-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:05:09 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9EB021871;
 Fri, 24 May 2019 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735483;
 bh=4kobK6WaFEHUuDwLE2PVnRKVqEJZDJRVWStRMFgZYxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZV0kbKK9YixF3Qc3T5LUtlf1LL50kOCfaG4h5IOigKGEmWrTztaOLF+kgBph+IQqz
 DkgJtu2nfMUwukNTeLttd+DrWjBMC+PWs4lTR+Li816NkedNnAApTjaXH6lfUociYE
 ChYReI+m0N98JjefafBJDiykKN1ilj7DBP4l0vJA=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:23 -0700
Message-Id: <20190524220425.201170-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524220425.201170-1-ebiggers@kernel.org>
References: <20190524220425.201170-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hUIJ4-00EpFt-Mq
Subject: [f2fs-dev] [PATCH v2 5/7] generic: verify ciphertext of v1
 encryption policies with AES-256
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

Verify ciphertext for v1 encryption policies that use AES-256-XTS to
encrypt file contents and AES-256-CTS-CBC to encrypt file names.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/700     | 41 +++++++++++++++++++++++++++++++++++++++++
 tests/generic/700.out |  5 +++++
 tests/generic/group   |  1 +
 3 files changed, 47 insertions(+)
 create mode 100755 tests/generic/700
 create mode 100644 tests/generic/700.out

diff --git a/tests/generic/700 b/tests/generic/700
new file mode 100755
index 00000000..c6dc8b90
--- /dev/null
+++ b/tests/generic/700
@@ -0,0 +1,41 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2019 Google LLC
+#
+# FS QA Test generic/700
+#
+# Verify ciphertext for v1 encryption policies that use AES-256-XTS to encrypt
+# file contents and AES-256-CTS-CBC to encrypt file names.
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
+_verify_ciphertext_for_encryption_policy AES-256-XTS AES-256-CTS-CBC
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/700.out b/tests/generic/700.out
new file mode 100644
index 00000000..ea2de143
--- /dev/null
+++ b/tests/generic/700.out
@@ -0,0 +1,5 @@
+QA output created by 700
+
+Verifying ciphertext with parameters:
+	contents_encryption_mode: AES-256-XTS
+	filenames_encryption_mode: AES-256-CTS-CBC
diff --git a/tests/generic/group b/tests/generic/group
index 49639fc9..69ed721a 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -550,3 +550,4 @@
 545 auto quick cap
 546 auto quick clone enospc log
 547 auto quick log
+700 auto quick encrypt
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
