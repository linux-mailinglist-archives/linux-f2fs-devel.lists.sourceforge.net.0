Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 161872A0F3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:05:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJH-0002UF-Rm; Fri, 24 May 2019 22:05:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIJH-0002U6-6e
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6r4iN4OxUmn6oQJqNcmR0Nh4qj2DzqTSSiOEx6DuzdE=; b=CcSZYqoxzEaO1gDV1ACk/YWuUw
 QmV5oB4On3wLcAWqzcfMUU+Jhxxj3Z4yT4KZBQzAwO5+5eTqDZKU1wt0AdimDY54pENwRNipEXxRg
 4UpGmZGz4Gb8v0jNmVOIKJ8BpVdDRzuAyQiBtxmyPUNbBAPAUjEwA8yQMTWpCB0r0F9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6r4iN4OxUmn6oQJqNcmR0Nh4qj2DzqTSSiOEx6DuzdE=; b=lomttwuiuyYANOv9Td3PqiARCd
 EVio71YittazL2Ygkpek2GtJOWcIFJO+QzC0WamSN/8XMyuOTjDkhiFioDKdQtoWFmURWuLZteBkh
 jF959wUlw4nTxdLnG1Sk9iJUjAMw+TWZ9OZgAsstoB2IzyuZvBer0P2q62VkM8Ft6I78=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIJ6-0083GJ-0Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:05:07 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8842D21874;
 Fri, 24 May 2019 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735483;
 bh=/1pMI+/AJcaGv7Uq6INHF/OBWwCAY0WN8cjrWI9b9vs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3UfYZlUpR9j8owmfdxnMkSRNotjhQvwppe76NenwOB+8cIkcHjn6R9An0rY0LBer
 e3ntDUjaa88tDOTopZXfWVrPjtXqnnZt/u+CYT2/nvrDnZ7WdHb9PQgs+mq4rIJyAV
 kOMpTxIA1c6ycaSWwbct6UnzpUGjZUziotiwfRh4=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:25 -0700
Message-Id: <20190524220425.201170-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524220425.201170-1-ebiggers@kernel.org>
References: <20190524220425.201170-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hUIJ6-0083GJ-0Q
Subject: [f2fs-dev] [PATCH v2 7/7] generic: verify ciphertext of v1
 encryption policies with Adiantum
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

Verify ciphertext for v1 encryption policies that use Adiantum to
encrypt file contents and file names.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/702     | 43 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/702.out | 10 ++++++++++
 tests/generic/group   |  1 +
 3 files changed, 54 insertions(+)
 create mode 100755 tests/generic/702
 create mode 100644 tests/generic/702.out

diff --git a/tests/generic/702 b/tests/generic/702
new file mode 100755
index 00000000..c7ac7be4
--- /dev/null
+++ b/tests/generic/702
@@ -0,0 +1,43 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2019 Google LLC
+#
+# FS QA Test generic/702
+#
+# Verify ciphertext for v1 encryption policies that use Adiantum to encrypt file
+# contents and file names.
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
+# Test both with and without the DIRECT_KEY flag.
+_verify_ciphertext_for_encryption_policy Adiantum Adiantum
+_verify_ciphertext_for_encryption_policy Adiantum Adiantum direct
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/702.out b/tests/generic/702.out
new file mode 100644
index 00000000..0dd80dae
--- /dev/null
+++ b/tests/generic/702.out
@@ -0,0 +1,10 @@
+QA output created by 702
+
+Verifying ciphertext with parameters:
+	contents_encryption_mode: Adiantum
+	filenames_encryption_mode: Adiantum
+
+Verifying ciphertext with parameters:
+	contents_encryption_mode: Adiantum
+	filenames_encryption_mode: Adiantum
+	options: direct
diff --git a/tests/generic/group b/tests/generic/group
index 85cc2165..2fe51dcc 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -552,3 +552,4 @@
 547 auto quick log
 700 auto quick encrypt
 701 auto quick encrypt
+702 auto quick encrypt
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
