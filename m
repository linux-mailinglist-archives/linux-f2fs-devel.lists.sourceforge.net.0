Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F31C9BA7DE7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 05:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcOQ/biY0ILa34H/C+IC31K+sd+8KbHT1hebqJTgjnM=; b=e09qeFgNvUhiXZp8886pYhfyGD
	HunyUqkfACohC1dWUm4+vSoaVThv7NTVjsYJ3CRQFcWQPBA3O8bAUwZXhMfC2i9x23vV3sTjQ0/XT
	2UC1YMg3toTfmRN3NsJ+ifjzuqa+LdxpwAgbe436cdpE3ZSvfNuNOdbWFll+2eGBUuKE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v34dD-0007Z6-6e;
	Mon, 29 Sep 2025 03:32:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v34cj-0007Ye-66
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 03:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w11X4ysoe4M5ii1XQkSi7z8VceQcZ7jEAkoHTEla03U=; b=OM0CdHAH5nm7vB9oXi/e5D8i32
 QpRHnE/mh06SklBAdEeZSfem0SeNCI4/3tYh9gpJy0QLnRDmXVdraZegfkJ17gJOev1Z6beK2OPaC
 p3/GEkSxJ6kOyp7PgWKU2h2QMgSbAiFz5y48LZB8ymE6Ybw2OgHzBzO0WBYTmzsHzXbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w11X4ysoe4M5ii1XQkSi7z8VceQcZ7jEAkoHTEla03U=; b=V
 cLSqVBsYiAl92cGkC+OAyCYC+OdCYy6yxw+py44iXT+fiaUss9Y96g6tEPM/PDm7qu9PnShGiwgk3
 LfSOFJkFCTB4aQDOmFmGJVlRHyf2LyrB4xzrP6NZYo9jXQL/ZksTVNvqOX6hjCHRh1uWE3dgI+Wc+
 triyz7MKUJlElfig=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v34ci-00041S-Ms for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 03:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A6334391D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 03:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F61C4CEF0;
 Mon, 29 Sep 2025 03:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759116739;
 bh=PU1QNux6aoZAR6SFJ0X21Ec4Y+EpyDnrb6A4Oki76PA=;
 h=From:To:Cc:Subject:Date:From;
 b=DlqGzRdQxBiws8TPnPsTdVH20UQNNStgEljkCWqByFxaiXEPT6dKhPAk+Jkm/TM6n
 3zrs6dTmQPVag+XAzgkiXFw+euBIg38Fg5F+GOMIHjbhGABfxM6fLugvgqQ/YnR/bQ
 FWLk9fxpMlqgQTUomhowXBfbB90j6W9JStK0RagAEZuMXcQLc+X5dFr3+9Wl2NGKzj
 vCUWTycZVeXdWxaY3WVrhDWoNsKVypQL2cpgOMT9sTsV4rUCt99jzyytc457nC86hf
 KOGCOfpd+5tp8sdTF3rEQhcjYK2lNT1eNmUdDN45LvfceAEXgPQvuf0AYA/AXb0cAF
 CjDib0+LomEJA==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 29 Sep 2025 02:52:40 +0800
Message-Id: <20250928185240.57862-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce _require_inject_f2fs_command() to check whether
 inject.f2fs supports specific metaarea and member parameters. Cc: Jaegeuk
 Kim <jaegeuk@kernel.org> Signed-off-by: Chao Yu <chao@kernel.org> ---
 common/f2fs
 | 25 +++++++++++++++++++++++++ tests/f2fs/009 | 2 ++ tests/f2fs/012 | 2 ++
 tests/f2fs/019 | 2 ++ tests/f2f [...] 
 Content analysis details:   (0.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v34ci-00041S-Ms
Subject: [f2fs-dev] [PATCH] common/f2fs: introduce
 _require_inject_f2fs_command()
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

Introduce _require_inject_f2fs_command() to check whether inject.f2fs
supports specific metaarea and member parameters.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/f2fs    | 25 +++++++++++++++++++++++++
 tests/f2fs/009 |  2 ++
 tests/f2fs/012 |  2 ++
 tests/f2fs/019 |  2 ++
 tests/f2fs/020 |  2 ++
 tests/f2fs/022 |  2 ++
 6 files changed, 35 insertions(+)

diff --git a/common/f2fs b/common/f2fs
index 1b39d8ce..4b01e032 100644
--- a/common/f2fs
+++ b/common/f2fs
@@ -25,3 +25,28 @@ _require_scratch_f2fs_compression()
 		_scratch_unmount
 	fi
 }
+
+# check that inject.f2fs supports to inject specific field in specific meta area
+_require_inject_f2fs_command()
+{
+	if [ $# -ne 2 ]; then
+		echo "Usage: _require_inject_f2fs_command metaarea member" 1>&2
+		_exit 1
+	fi
+	metaarea=$1
+	member=$2
+
+	case $metaarea in
+	sb|cp|nat|sit)
+		val=0
+		;;
+	ssa|node|dent)
+		;;
+	*)
+		_notrun "unsupport metaarea: $metaarea"
+		;;
+	esac
+
+	$F2FS_INJECT_PROG "--$metaarea" "$val" "-h" | grep "$member:" > /dev/null || \
+		_notrun "--$metaarea --mb $member support is missing"
+}
diff --git a/tests/f2fs/009 b/tests/f2fs/009
index 7333d484..465be874 100755
--- a/tests/f2fs/009
+++ b/tests/f2fs/009
@@ -9,10 +9,12 @@
 # and expects fsck.f2fs can detect such corruption and do the repair.
 #
 . ./common/preamble
+. ./common/f2fs
 _begin_fstest auto quick
 
 _require_scratch
 _require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node i_links
 _require_command "$(type -P socket)" socket
 
 _fixed_by_git_commit f2fs-tools 958cd6e \
diff --git a/tests/f2fs/012 b/tests/f2fs/012
index 7438d9ce..8e156772 100755
--- a/tests/f2fs/012
+++ b/tests/f2fs/012
@@ -12,6 +12,7 @@
 # 4.enable linear lookup, expect lookup succeed
 #
 . ./common/preamble
+. ./common/f2fs
 _begin_fstest auto quick casefold
 
 _fixed_by_kernel_commit 91b587ba79e1 \
@@ -21,6 +22,7 @@ export LC_ALL=C.UTF-8
 _require_scratch_nocheck
 _require_command "$F2FS_IO_PROG" f2fs_io
 _require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command dent d_hash
 
 #check whether f2fs supports "lookup_mode=x" mount option
 mntopt=""
diff --git a/tests/f2fs/019 b/tests/f2fs/019
index 2307bd96..f6bb0b52 100755
--- a/tests/f2fs/019
+++ b/tests/f2fs/019
@@ -12,6 +12,7 @@
 #    corruption in the file
 #
 . ./common/preamble
+. ./common/f2fs
 _begin_fstest auto quick rw
 
 _fixed_by_kernel_commit 77de19b6867f \
@@ -19,6 +20,7 @@ _fixed_by_kernel_commit 77de19b6867f \
 
 _require_scratch_nocheck
 _require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node addr
 
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
diff --git a/tests/f2fs/020 b/tests/f2fs/020
index 38bc6582..332848d0 100755
--- a/tests/f2fs/020
+++ b/tests/f2fs/020
@@ -12,6 +12,7 @@
 #    corruption in the file
 #
 . ./common/preamble
+. ./common/f2fs
 _begin_fstest auto quick rw
 
 . ./common/attr
@@ -21,6 +22,7 @@ _fixed_by_kernel_commit 061cf3a84bde \
 
 _require_scratch_nocheck
 _require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node i_xattr_nid
 _require_attrs user
 
 # remove all mkfs options to avoid layout change of on-disk inode
diff --git a/tests/f2fs/022 b/tests/f2fs/022
index ed3b4f2b..f81180e8 100755
--- a/tests/f2fs/022
+++ b/tests/f2fs/022
@@ -11,6 +11,7 @@
 # 4. fpunch in foo w/ specified range
 #
 . ./common/preamble
+. ./common/f2fs
 _begin_fstest auto quick rw
 
 . ./common/attr
@@ -20,6 +21,7 @@ _fixed_by_kernel_commit xxxxxxxxxxxx \
 
 _require_scratch_nocheck
 _require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node i_nid
 
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
