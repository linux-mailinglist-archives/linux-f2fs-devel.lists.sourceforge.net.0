Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0844DCC8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 23:38:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1he4lf-0004Pc-BY; Thu, 20 Jun 2019 21:38:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1he4ld-0004PS-Or
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1/7JLbHeSYzPxATJSJmlTlksE7ELoAm3lhN33d85tq0=; b=lzRN0we26zkbYP1vhw5RsWzXxS
 xVl/zym9MQ8YP1Usn8DoQyfmRJdCMLwhRFahzpcXpOyWzyFMCHCLR9IVN7jFE6rVPH0CSFbIZilj/
 H8JHX0gbkmBX0kee2ZLUDcwX+ogIwA6XuCuGQ50xpdhFopFu1mPXpN/1I9aZty0YWr/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1/7JLbHeSYzPxATJSJmlTlksE7ELoAm3lhN33d85tq0=; b=iP0ioZW3fq4SQo//xi6Z6+BG8P
 35F98Ouc0VHY1ZUfSrfjLoyRiRcQSLXDn0Q4S88fj/Q66fZ+cBgLlg44/ROSEq4mb7Tlbzlky1CuE
 ZwfFU+K497R4Sdi+1Vt5mUajb+nccg0af5ZR/mJt1AY8/lXMsOZtI4z8YbnEd3i2HSbw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1he4le-006yPo-8t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:51 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E485521530;
 Thu, 20 Jun 2019 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561066720;
 bh=tD13SQPiq6U//Di45+l/aLXBU1zkuW4qczDAR3KDkUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OHRKAUozrSLQsYLc+Vn9OWH/pKZWtrUwNpbkGoIc6ngnZUxSmkx0Cv0OzmA4eYuPL
 zc6dpyYI7P1ohPcYsAgLTsfxsQ42hQdtrcuAJbw7txyT+3r4HlfINrFI3CioLYXPtC
 bhnYKW4PJKS/lur1AfMSSKKpCkvvwLtfFcL6u8Fs=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Thu, 20 Jun 2019 14:36:14 -0700
Message-Id: <20190620213614.113685-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190620213614.113685-1-ebiggers@kernel.org>
References: <20190620213614.113685-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
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
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1he4le-006yPo-8t
Subject: [f2fs-dev] [RFC PATCH v2 8/8] generic: test the fs-verity built-in
 signature verification support
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

Add a basic test for the fs-verity built-in signature verification
support, which is an optional feature where the kernel can be configured
to enforce that all verity files are accompanied with a valid signature
by a key that has been loaded into the fs-verity keyring.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/config         |   1 +
 common/verity         |  11 ++++
 tests/generic/905     | 141 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/905.out |  34 ++++++++++
 tests/generic/group   |   1 +
 5 files changed, 188 insertions(+)
 create mode 100755 tests/generic/905
 create mode 100644 tests/generic/905.out

diff --git a/common/config b/common/config
index 001ddc45..1aaf0a75 100644
--- a/common/config
+++ b/common/config
@@ -213,6 +213,7 @@ export XFS_INFO_PROG="$(type -P xfs_info)"
 export DUPEREMOVE_PROG="$(type -P duperemove)"
 export CC_PROG="$(type -P cc)"
 export FSVERITY_PROG="$(type -P fsverity)"
+export OPENSSL_PROG="$(type -P openssl)"
 
 # use 'udevadm settle' or 'udevsettle' to wait for lv to be settled.
 # newer systems have udevadm command but older systems like RHEL5 don't.
diff --git a/common/verity b/common/verity
index 86fb6585..edd7e523 100644
--- a/common/verity
+++ b/common/verity
@@ -35,6 +35,17 @@ _require_scratch_verity()
 	FSV_BLOCK_SIZE=$(get_page_size)
 }
 
+# Check for CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y.
+_require_fsverity_builtin_signatures()
+{
+	if [ ! -e /proc/keys ]; then
+		_notrun "kernel doesn't support keyrings"
+	fi
+	if ! awk '{print $9}' /proc/keys | grep -q '^\.fs-verity:$'; then
+		_notrun "kernel doesn't support fs-verity builtin signatures"
+	fi
+}
+
 _scratch_mkfs_verity()
 {
 	case $FSTYP in
diff --git a/tests/generic/905 b/tests/generic/905
new file mode 100755
index 00000000..db83d221
--- /dev/null
+++ b/tests/generic/905
@@ -0,0 +1,141 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2019 Google LLC
+#
+# FS QA Test generic/905
+#
+# Test the fs-verity built-in signature verification support.
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
+	sysctl -w fs.verity.require_signatures=0 &>/dev/null
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
+_require_fsverity_builtin_signatures
+_require_command "$OPENSSL_PROG" openssl
+_require_command "$KEYCTL_PROG" keyctl
+
+_scratch_mkfs_verity &>> $seqres.full
+_scratch_mount
+
+fsv_file=$SCRATCH_MNT/file.fsv
+fsv_orig_file=$SCRATCH_MNT/file
+keyfile=$tmp.key.pem
+certfile=$tmp.cert.pem
+certfileder=$tmp.cert.der
+sigfile=$tmp.sig
+othersigfile=$tmp.othersig
+tmpfile=$tmp.tmp
+
+# Setup
+
+echo -e "\n# Generating certificates and private keys"
+for suffix in '' '.2'; do
+	if ! $OPENSSL_PROG req -newkey rsa:4096 -nodes -batch -x509 \
+			-keyout $keyfile$suffix -out $certfile$suffix \
+			&>> $seqres.full; then
+		_fail "Failed to generate certificate and private key (see $seqres.full)"
+	fi
+	$OPENSSL_PROG x509 -in $certfile$suffix -out $certfileder$suffix \
+		-outform der
+done
+
+echo -e "\n# Clearing fs-verity keyring"
+$KEYCTL_PROG clear %keyring:.fs-verity
+
+echo -e "\n# Loading first certificate into fs-verity keyring"
+$KEYCTL_PROG padd asymmetric '' %keyring:.fs-verity \
+	< $certfileder >> $seqres.full
+
+echo -e "\n# Enabling fs.verity.require_signatures"
+sysctl -w fs.verity.require_signatures=1
+
+echo -e "\n# Generating file and signing it for fs-verity"
+head -c 100000 /dev/urandom > $fsv_orig_file
+for suffix in '' '.2'; do
+	$FSVERITY_PROG sign $fsv_orig_file $sigfile$suffix \
+		--key=$keyfile$suffix --cert=$certfile$suffix
+done
+
+echo -e "\n# Signing a different file for fs-verity"
+head -c 100000 /dev/zero > $tmpfile
+$FSVERITY_PROG sign $tmpfile $othersigfile --key=$keyfile --cert=$certfile
+
+# Actual tests
+
+reset_fsv_file()
+{
+	rm -f $fsv_file
+	cp $fsv_orig_file $fsv_file
+}
+
+echo -e "\n# Enabling verity with valid signature (should succeed)"
+reset_fsv_file
+_fsv_enable $fsv_file --signature=$sigfile
+cmp $fsv_file $fsv_orig_file
+
+echo -e "\n# Enabling verity without signature (should fail)"
+reset_fsv_file
+_fsv_enable $fsv_file |& _filter_scratch
+
+echo -e "\n# Opening verity file without signature (should fail)"
+reset_fsv_file
+sysctl -w fs.verity.require_signatures=0 &>> $seqres.full
+_fsv_enable $fsv_file
+sysctl -w fs.verity.require_signatures=1 &>> $seqres.full
+_scratch_cycle_mount
+md5sum $fsv_file |& _filter_scratch
+
+echo -e "\n# Enabling verity with wrong file's signature (should fail)"
+reset_fsv_file
+_fsv_enable $fsv_file --signature=$othersigfile |& _filter_scratch
+
+echo -e "\n# Enabling verity with untrusted signature (should fail)"
+reset_fsv_file
+_fsv_enable $fsv_file --signature=$sigfile.2 |& _filter_scratch
+
+echo -e "\n# Testing salt"
+reset_fsv_file
+$FSVERITY_PROG sign $fsv_orig_file $sigfile.salted \
+	--key=$keyfile --cert=$certfile --salt=abcd
+_fsv_enable $fsv_file --signature=$sigfile.salted --salt=abcd
+
+echo -e "\n# Testing non-default hash algorithm"
+if _fsv_have_hash_algorithm sha512 $fsv_file; then
+	reset_fsv_file
+	$FSVERITY_PROG sign $fsv_orig_file $sigfile.sha512 \
+		--key=$keyfile --cert=$certfile --hash-alg=sha512
+	_fsv_enable $fsv_file --signature=$sigfile.sha512 --hash-alg=sha512
+fi
+
+echo -e "\n# Testing empty file"
+echo -n > $fsv_file
+$FSVERITY_PROG sign $fsv_file $sigfile.emptyfile --key=$keyfile --cert=$certfile
+_fsv_enable $fsv_file --signature=$sigfile.emptyfile
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/905.out b/tests/generic/905.out
new file mode 100644
index 00000000..76707b5c
--- /dev/null
+++ b/tests/generic/905.out
@@ -0,0 +1,34 @@
+QA output created by 905
+
+# Generating certificates and private keys
+
+# Clearing fs-verity keyring
+
+# Loading first certificate into fs-verity keyring
+
+# Enabling fs.verity.require_signatures
+fs.verity.require_signatures = 1
+
+# Generating file and signing it for fs-verity
+
+# Signing a different file for fs-verity
+
+# Enabling verity with valid signature (should succeed)
+
+# Enabling verity without signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Bad message
+
+# Opening verity file without signature (should fail)
+md5sum: SCRATCH_MNT/file.fsv: Bad message
+
+# Enabling verity with wrong file's signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Bad message
+
+# Enabling verity with untrusted signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Required key not available
+
+# Testing salt
+
+# Testing non-default hash algorithm
+
+# Testing empty file
diff --git a/tests/generic/group b/tests/generic/group
index 5b4c32ff..bfbb4957 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -564,3 +564,4 @@
 902 auto quick verity
 903 auto quick verity
 904 auto quick verity encrypt
+905 auto quick verity
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
