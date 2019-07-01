Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 850915C2FE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 20:27:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi11b-0007Yr-JU; Mon, 01 Jul 2019 18:27:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi11a-0007YR-2D
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q/wwZl4woho0jZy9xLP+yvpDb7mbXpgxtWWU0sDIjjY=; b=R9AyFV5rK/7/DsDlc9aGCTfz8V
 Nl3qKg2gjrr0YVTjAkG2PkmK/FO8wUhC0Jhhl9dXhz0eJ2CDV1NqKwKzXOXmqRnUyQHU1+Gj+Slr4
 YUKTUEVy+N/BfoF0M4IIXWbDTRwU6izWECPVfGvMsYCEl+8D/0eivvvRmu9bIcRr3y3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q/wwZl4woho0jZy9xLP+yvpDb7mbXpgxtWWU0sDIjjY=; b=dtd6AqVLt2V1XKDBf6nGukLB0N
 NgM1x9ZFlc1RdcFxLlKZsmoLU9Z1NTS4adIgrImLWTzzUI0cBWfe7PgADUOxLZj+Yfc+QsEb6L8re
 WnAFCC3kQeS5D0c0EVXOB8YTRvL9VfJkP5EYMSAewnSkzGRW9RkgMMfdiVM5TAgR4hxg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi11h-003hhj-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:42 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24C862184E;
 Mon,  1 Jul 2019 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562005650;
 bh=LW1cLobwlu4UZ3TbH32CQVjHGPAq9KW+Q1sSn2ZIHfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ER7i0UGRYJcqw70OZO3ohEnIpncPf/uDVCzrZJtupa1tWPxqE+gtRCtIIVdKtFDx2
 sALnx7XFGq1Ke8LdI1Ry099fMJcJaUUavCK7eewRi6aA1BYvla/anFaD+h62/s1pWF
 FbxZLRzoeex7cystlPieHWUHNLn8JR4mEC8H4EOg=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Mon,  1 Jul 2019 11:25:47 -0700
Message-Id: <20190701182547.165856-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701182547.165856-1-ebiggers@kernel.org>
References: <20190701182547.165856-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
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
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hi11h-003hhj-Dl
Subject: [f2fs-dev] [RFC PATCH v3 8/8] generic: test the fs-verity built-in
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
 common/verity         |  16 +++++
 tests/generic/905     | 150 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/905.out |  42 ++++++++++++
 tests/generic/group   |   1 +
 5 files changed, 210 insertions(+)
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
index a8aae51e..bcb5670d 100644
--- a/common/verity
+++ b/common/verity
@@ -45,6 +45,17 @@ _require_scratch_verity()
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
@@ -92,6 +103,11 @@ _fsv_measure()
         $FSVERITY_PROG measure "$@" | awk '{print $1}'
 }
 
+_fsv_sign()
+{
+	$FSVERITY_PROG sign "$@"
+}
+
 # Generate a file, then enable verity on it.
 _fsv_create_enable_file()
 {
diff --git a/tests/generic/905 b/tests/generic/905
new file mode 100755
index 00000000..e42b012d
--- /dev/null
+++ b/tests/generic/905
@@ -0,0 +1,150 @@
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
+otherfile=$SCRATCH_MNT/otherfile
+othersigfile=$tmp.othersig
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
+head -c 100000 /dev/zero > $fsv_orig_file
+for suffix in '' '.2'; do
+	_fsv_sign $fsv_orig_file $sigfile$suffix --key=$keyfile$suffix \
+		--cert=$certfile$suffix | _filter_scratch
+done
+
+echo -e "\n# Signing a different file for fs-verity"
+head -c 100000 /dev/zero | tr '\0' 'X' > $otherfile
+_fsv_sign $otherfile $othersigfile --key=$keyfile --cert=$certfile \
+	| _filter_scratch
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
+echo -e "\n# Enabling verity with untrusted signature (should fail)"
+reset_fsv_file
+_fsv_enable $fsv_file --signature=$sigfile.2 |& _filter_scratch
+
+echo -e "\n# Enabling verity with wrong file's signature (should fail)"
+reset_fsv_file
+_fsv_enable $fsv_file --signature=$othersigfile |& _filter_scratch
+
+echo -e "\n# Enabling verity with malformed signature (should fail)"
+echo foobarbaz > $tmp.malformed_sig
+reset_fsv_file
+_fsv_enable $fsv_file --signature=$tmp.malformed_sig |& _filter_scratch
+
+echo -e "\n# Testing salt"
+reset_fsv_file
+_fsv_sign $fsv_orig_file $sigfile.salted --key=$keyfile --cert=$certfile \
+	--salt=abcd | _filter_scratch
+_fsv_enable $fsv_file --signature=$sigfile.salted --salt=abcd
+cmp $fsv_file $fsv_orig_file
+
+echo -e "\n# Testing non-default hash algorithm"
+if _fsv_have_hash_algorithm sha512 $fsv_file; then
+	reset_fsv_file
+	_fsv_sign $fsv_orig_file $sigfile.sha512 --key=$keyfile \
+		--cert=$certfile --hash-alg=sha512 > /dev/null
+	_fsv_enable $fsv_file --signature=$sigfile.sha512 --hash-alg=sha512
+	cmp $fsv_file $fsv_orig_file
+fi
+
+echo -e "\n# Testing empty file"
+echo -n > $fsv_file
+_fsv_sign $fsv_file $sigfile.emptyfile --key=$keyfile --cert=$certfile | \
+		_filter_scratch
+_fsv_enable $fsv_file --signature=$sigfile.emptyfile
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/905.out b/tests/generic/905.out
new file mode 100644
index 00000000..4b28757a
--- /dev/null
+++ b/tests/generic/905.out
@@ -0,0 +1,42 @@
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
+Signed file 'SCRATCH_MNT/file' (sha256:ecabbfca4efd69a721be824965da10d27900b109549f96687b35a4d91d810dac)
+Signed file 'SCRATCH_MNT/file' (sha256:ecabbfca4efd69a721be824965da10d27900b109549f96687b35a4d91d810dac)
+
+# Signing a different file for fs-verity
+Signed file 'SCRATCH_MNT/otherfile' (sha256:b2a419c5a8c767a78c6275d6729794bf51e52ddf8713e31d12a93d61d961f49f)
+
+# Enabling verity with valid signature (should succeed)
+
+# Enabling verity without signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Operation not permitted
+
+# Opening verity file without signature (should fail)
+md5sum: SCRATCH_MNT/file.fsv: Operation not permitted
+
+# Enabling verity with untrusted signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Required key not available
+
+# Enabling verity with wrong file's signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Key was rejected by service
+
+# Enabling verity with malformed signature (should fail)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Bad message
+
+# Testing salt
+Signed file 'SCRATCH_MNT/file' (sha256:1cb173bcd199133eb80e9ea4f0f741001b9e73227aa8812685156f2bc8ff45f5)
+
+# Testing non-default hash algorithm
+
+# Testing empty file
+Signed file 'SCRATCH_MNT/file.fsv' (sha256:3d248ca542a24fc62d1c43b916eae5016878e2533c88238480b26128a1f1af95)
diff --git a/tests/generic/group b/tests/generic/group
index cc30a30b..a24fc997 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -565,3 +565,4 @@
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
