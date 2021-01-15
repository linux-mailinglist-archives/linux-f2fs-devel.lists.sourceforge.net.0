Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 671602F8462
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:30:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0Trg-0005QU-E3; Fri, 15 Jan 2021 18:30:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0Trf-0005QE-IV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J1+IlV+unHHEqbbLStNxswQ0Zurf8oJp/kBe1W+rdik=; b=Ndog3VKZnln+Zt9AJQJcHNJ/YR
 Qqg1xyI9NNHLoN1Yln9ffS8bOS6ZUGJAolSR3yA8RXZScqd411PL4NryibVv3l5QNgrwwOK6Tvu83
 sMhzmhp5wQLLLinWn9DihUayz1B2AX5QnacCEgAHooZ4ucDLr/l2fCb9K4+mN6gQ9D4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J1+IlV+unHHEqbbLStNxswQ0Zurf8oJp/kBe1W+rdik=; b=OAb38phLMpGf5IXWjjZ4M6Zq32
 nk2UPI1vZ5m3hyn5Gh/prlBM+nVbsz8/XdlFopiDLbgX8z3ft8BzwCBZGZH88aSTSmioXFmbdvmd0
 T5D4n2GAoikKJ/gu1G5T1gIaziCsB6JdDcJwv+NgpNxhMxqB0PP8RhT836QP7sfxxJDI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0Trd-005QcV-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:30:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6BF823A59;
 Fri, 15 Jan 2021 18:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610735420;
 bh=TyRLY9HOrw4FJ9cPyh5lToCNCoiKY1YY9L+hh8t7VKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nqQdPkPoV2mj5m0otY41WNCWvsiLgZz7MBYQpxNhHdCJoOO6mD7OqYW5GvM/RqWmE
 cPoDBYi7yrsycvgzC2ZIj1m+7nOfcIwWvi/i/6HGElGqpkJVj5TkxLMyBk73Lx3DO1
 5iwLuXxxRzGa7JH1w/u7/XOS+OekMO3SEXuf/Pe8zo1KO4bBCcV91go6K/x8Xovgli
 gBaXkB3RzvCG1IAzfOmk3gGft3hC+9fPsouRQK1d4onid+y2fMorlpyA11LpB1PZMq
 n6N74gjuxMhWtw9MOPU4O4uAwFNL6w225KknoAKE26qtLju9ltei1A+liSWdsVl/Wg
 nV9CaMSg2poZw==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 15 Jan 2021 10:28:34 -0800
Message-Id: <20210115182837.36333-2-ebiggers@kernel.org>
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
X-Headers-End: 1l0Trd-005QcV-Hc
Subject: [f2fs-dev] [xfstests RFC PATCH 1/4] generic: factor out helpers for
 fs-verity built-in signatures
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

The test for retrieving a verity file's built-in signature using
FS_IOC_READ_VERITY_METADATA will need to set up a file with a built-in
signature, which requires the same commands that generic/577 does.
Factor this out into helper functions in common/verity.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/verity     | 37 ++++++++++++++++++++++++++++++++++++-
 tests/generic/577 | 15 +++------------
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/common/verity b/common/verity
index a8d3de06..9a182240 100644
--- a/common/verity
+++ b/common/verity
@@ -48,12 +48,47 @@ _require_scratch_verity()
 	FSV_BLOCK_SIZE=$(get_page_size)
 }
 
-# Check for CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y.
+# Check for CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y, as well as the userspace
+# commands needed to generate certificates and add them to the kernel.
 _require_fsverity_builtin_signatures()
 {
 	if [ ! -e /proc/sys/fs/verity/require_signatures ]; then
 		_notrun "kernel doesn't support fs-verity builtin signatures"
 	fi
+	_require_command "$OPENSSL_PROG" openssl
+	_require_command "$KEYCTL_PROG" keyctl
+}
+
+# Use the openssl program to generate a private key and a X.509 certificate for
+# use with fs-verity built-in signature verification, and convert the
+# certificate to DER format.
+_fsv_generate_cert()
+{
+	local keyfile=$1
+	local certfile=$2
+	local certfileder=$3
+
+	if ! $OPENSSL_PROG req -newkey rsa:4096 -nodes -batch -x509 \
+			-keyout $keyfile -out $certfile &>> $seqres.full; then
+		_fail "Failed to generate certificate and private key (see $seqres.full)"
+	fi
+	$OPENSSL_PROG x509 -in $certfile -out $certfileder -outform der
+}
+
+# Clear the .fs-verity keyring.
+_fsv_clear_keyring()
+{
+	$KEYCTL_PROG clear %keyring:.fs-verity
+}
+
+# Load the given X.509 certificate in DER format into the .fs-verity keyring so
+# that the kernel can use it to verify built-in signatures.
+_fsv_load_cert()
+{
+	local certfileder=$1
+
+	$KEYCTL_PROG padd asymmetric '' %keyring:.fs-verity \
+		< $certfileder >> $seqres.full
 }
 
 # Disable mandatory signatures for fs-verity files, if they are supported.
diff --git a/tests/generic/577 b/tests/generic/577
index 0e945942..114463be 100755
--- a/tests/generic/577
+++ b/tests/generic/577
@@ -34,8 +34,6 @@ rm -f $seqres.full
 _supported_fs generic
 _require_scratch_verity
 _require_fsverity_builtin_signatures
-_require_command "$OPENSSL_PROG" openssl
-_require_command "$KEYCTL_PROG" keyctl
 
 _scratch_mkfs_verity &>> $seqres.full
 _scratch_mount
@@ -53,21 +51,14 @@ othersigfile=$tmp.othersig
 
 echo -e "\n# Generating certificates and private keys"
 for suffix in '' '.2'; do
-	if ! $OPENSSL_PROG req -newkey rsa:4096 -nodes -batch -x509 \
-			-keyout $keyfile$suffix -out $certfile$suffix \
-			&>> $seqres.full; then
-		_fail "Failed to generate certificate and private key (see $seqres.full)"
-	fi
-	$OPENSSL_PROG x509 -in $certfile$suffix -out $certfileder$suffix \
-		-outform der
+	_fsv_generate_cert $keyfile$suffix $certfile$suffix $certfileder$suffix
 done
 
 echo -e "\n# Clearing fs-verity keyring"
-$KEYCTL_PROG clear %keyring:.fs-verity
+_fsv_clear_keyring
 
 echo -e "\n# Loading first certificate into fs-verity keyring"
-$KEYCTL_PROG padd asymmetric '' %keyring:.fs-verity \
-	< $certfileder >> $seqres.full
+_fsv_load_cert $certfileder
 
 echo -e "\n# Enabling fs.verity.require_signatures"
 _enable_fsverity_signatures
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
