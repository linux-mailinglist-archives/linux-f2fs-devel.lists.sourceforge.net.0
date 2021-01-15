Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3EE2F8464
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:30:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0Trn-0002iB-0U; Fri, 15 Jan 2021 18:30:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0Tri-0002hw-KV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKPBHFvknLrD71ME2SKASmi3G70OJXG3V2O9wwnRgZ4=; b=NAK+9om0MK3S79jkEq/Xxa90xe
 iKSJDHyG70SwEsonwKvnTcqnyOdFSzfk0NdijeGEWJEA56Rr2HybAV9jOo0P7Okmvx9uNsDL37Dps
 znxR3n9nYoBjgsTYdT14sOeaTi3143+LhvbcnXDqYA5+D6T6BsaJcEbMwSo+dtylX9mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKPBHFvknLrD71ME2SKASmi3G70OJXG3V2O9wwnRgZ4=; b=litgAOqoH154l8kkQOm6Ia74hn
 cNXQx4HpN9Oeqnr8iMtCvGMRAbjkeVgXoBoENxe5sRYN/gWGtRI0fAxO420bdYU3EK35gngVJtBvN
 108fSgGsg/co6H41yfeTuNZ7gaYLnXR/MFtqq87pj0ir6kaHrUrnVmeMcgvyoOY8zgng=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0Tre-005Qca-HG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:30:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB83523A7C;
 Fri, 15 Jan 2021 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610735421;
 bh=Zx+DKeYBgI/GfjZ0hi4SNhfY3GNWutg/K/C8V9kfqdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N0L4j8OcdiQhWhaA3lFznkCBSPrE6zUF8PqcJjOuy1RL3ttPOC2xIxraA2lLNPOWD
 hR7vaqwtorwbVYMC5g71KuX9G821NatdnGeMVjOeHfY8L9txlCRz2kjuPQpAY0NuID
 wNFRErvojCbHW/gQVQuFeagBwyiZ7dJWeH5yA6wps6dRULQgss1JrWJz0dR6AscPon
 sJ1km6FSX2KsF3KAmFjS97xPA1km91yX6tofMy6L/koqPj52vinla0ljeLky5eHBSQ
 mWVSzaPV7aJ/PqiFWrTwxeN1kN/QJ5ubDeAkCzAs30mzm+qdazEiHX/jjUROAJmWpE
 qkIFNWUiidusQ==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 15 Jan 2021 10:28:37 -0800
Message-Id: <20210115182837.36333-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115182837.36333-1-ebiggers@kernel.org>
References: <20210115182837.36333-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0Tre-005Qca-HG
Subject: [f2fs-dev] [xfstests RFC PATCH 4/4] generic: test retrieving verity
 signature
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a test which tests dumping the built-in signature of a verity file
using the new FS_IOC_READ_VERITY_METADATA ioctl.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/902     | 66 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/902.out |  7 +++++
 tests/generic/group   |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 tests/generic/902
 create mode 100644 tests/generic/902.out

diff --git a/tests/generic/902 b/tests/generic/902
new file mode 100644
index 00000000..ee1096df
--- /dev/null
+++ b/tests/generic/902
@@ -0,0 +1,66 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2021 Google LLC
+#
+# FS QA Test No. 902
+#
+# Test retrieving the built-in signature of a verity file using
+# FS_IOC_READ_VERITY_METADATA.
+#
+# This is separate from the other tests for FS_IOC_READ_VERITY_METADATA because
+# the fs-verity built-in signature support is optional.
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
+. ./common/rc
+. ./common/filter
+. ./common/verity
+
+rm -f $seqres.full
+
+_supported_fs generic
+_require_scratch_verity
+_require_fsverity_builtin_signatures
+
+_scratch_mkfs_verity &>> $seqres.full
+_scratch_mount
+
+echo -e "\n# Setting up signed verity file"
+_fsv_generate_cert $tmp.key $tmp.cert $tmp.cert.der
+_fsv_clear_keyring
+_fsv_load_cert $tmp.cert.der
+fsv_file=$SCRATCH_MNT/file
+echo foo > $fsv_file
+_fsv_sign $fsv_file $tmp.sig --key=$tmp.key --cert=$tmp.cert >> $seqres.full
+_fsv_enable $fsv_file --signature=$tmp.sig
+_require_fsverity_dump_metadata $fsv_file
+
+echo -e "\n# Dumping and comparing signature"
+_fsv_dump_signature $fsv_file > $tmp.sig2
+# The signature returned by FS_IOC_READ_VERITY_METADATA should exactly match the
+# one we passed to FS_IOC_ENABLE_VERITY earlier.
+cmp $tmp.sig $tmp.sig2
+
+echo -e "\n# Dumping and comparing signature (in chunks)"
+sig_size=$(stat -c %s $tmp.sig)
+for (( i = 0; i < sig_size; i += 13 )); do
+	_fsv_dump_signature $fsv_file --offset=$i --length=13
+done > $tmp.sig2
+cmp $tmp.sig $tmp.sig2
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/902.out b/tests/generic/902.out
new file mode 100644
index 00000000..4b8d9f6e
--- /dev/null
+++ b/tests/generic/902.out
@@ -0,0 +1,7 @@
+QA output created by 902
+
+# Setting up signed verity file
+
+# Dumping and comparing signature
+
+# Dumping and comparing signature (in chunks)
diff --git a/tests/generic/group b/tests/generic/group
index 3f2edfc0..84fec240 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -625,3 +625,4 @@
 620 auto mount quick
 621 auto quick encrypt
 901 auto quick verity
+902 auto quick verity
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
