Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA37EBC8332
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 11:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dLUZIXO/CKPq7oY6y2bwuThUAB2vpTQPoyRdxViK78=; b=a6FMLJtvyYM4/b+DggsTECnf+e
	v/PYcLF1GN+dNzUEJYg0JDTnqYJJdfVm5xEMPSwfd5Lu7HPx8NEsmFdiUSf+o8/EOaxoAc1chaIbT
	qjmFC6BISqurUyGlYEpsd7CdGoG1CanpeY+dJjC+uXYlQMa0CR0LglE546AAXSr2hI2c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6me9-0006X1-06;
	Thu, 09 Oct 2025 09:09:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6me2-0006Wq-Ib
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CSgD+9+aQAwz/DjysHKRXOk3FriccGBhKvK/xLT3d2s=; b=FjgR2RCom1Sl4T++cbo3Ts5bxO
 58D92f/VAcsRHnudRAsjAH54gSNmlp7Rhzwqt7MGl65C9K3ZsV8qO2orXZuD4VtZm6bn5bsr6TTHS
 JJ0rdvaw7a+knxLoV90uxgUopB0xgxocblamTnWfQCs+j13F4s8S+1yoP7V4P0TQxJdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CSgD+9+aQAwz/DjysHKRXOk3FriccGBhKvK/xLT3d2s=; b=MA2skSafbnTjrcVeWBnviW43uI
 LLH+sAjCVvXEtgJ28vZxSbdQxx5JwOjUTT2JW+ROdQ1yiXxpmoP6OiPq/+HyRw79qfpG7RpWBQNK2
 7qce1tbrzWpUR2hB3wJRjDcKXp6OWzSD67M3kkwe15q7wLhWH9rbb2JoildXYf90CBJI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6me2-0006GJ-0b for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6C371602BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 09:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098EEC4CEE7;
 Thu,  9 Oct 2025 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760000935;
 bh=rafZBb+BEGY7+V0BVWM7lcH+DPHEnQbVHTH/W0YjSso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iDTogICeHrWrW6XWrY/ZcJyC39NGqE8RfRAnZzTN3aOg0jpDnmCdH/rSHPxKS+y5L
 /N+F3OjHSEFeHyfiF+exNeHHILbLKNcdmZV/KwBg0OadLKNcxfeybTJXUaKG9ggPSU
 TA00VzmGvOcE1Bt2nijfuqVhkuSoNwEcbGIWLN35S/Z1O1FE2VwxMsR1fyBiVeHLk5
 JDgBNneGscFKu2MO2Q2kGK/Cyb3gtD5MAHBsLBWrftTeFuhZIVV+JHDnJ4QpOcVKRz
 1HsFQ9Rh0E0xNlr/q/CZ4tOFwe08AGSC+KV+VIOCxBPzvt9vkG4PoAH6Xoh3xdAEX7
 YKGTy4GOiP2iw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu,  9 Oct 2025 16:50:43 +0800
Message-Id: <20251009085043.16910-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251009085043.16910-1-chao@kernel.org>
References: <20251009085043.16910-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce _require_inject_f2fs_command() to check whether
 inject.f2fs supports specific metaarea and member parameters. Meanwhile, let's
 check inject.f2fs requirement inside _require_inject_f2fs_command() for
 cleanup. Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6me2-0006GJ-0b
Subject: [f2fs-dev] [PATCH 3/3] common/f2fs: introduce
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

Meanwhile, let's check inject.f2fs requirement inside
_require_inject_f2fs_command() for cleanup.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/f2fs    | 27 +++++++++++++++++++++++++++
 tests/f2fs/009 |  2 +-
 tests/f2fs/012 |  2 +-
 tests/f2fs/019 |  2 +-
 tests/f2fs/020 |  2 +-
 tests/f2fs/022 |  2 +-
 6 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/common/f2fs b/common/f2fs
index 4d0d688b..82d3102e 100644
--- a/common/f2fs
+++ b/common/f2fs
@@ -69,3 +69,30 @@ _check_f2fs_filesystem()
 
     return 0
 }
+
+# check that inject.f2fs supports to inject specific field in specific meta area
+_require_inject_f2fs_command()
+{
+	_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
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
index 7333d484..4c179f2d 100755
--- a/tests/f2fs/009
+++ b/tests/f2fs/009
@@ -12,7 +12,7 @@
 _begin_fstest auto quick
 
 _require_scratch
-_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node i_links
 _require_command "$(type -P socket)" socket
 
 _fixed_by_git_commit f2fs-tools 958cd6e \
diff --git a/tests/f2fs/012 b/tests/f2fs/012
index 7438d9ce..53d54bf6 100755
--- a/tests/f2fs/012
+++ b/tests/f2fs/012
@@ -20,7 +20,7 @@ _fixed_by_kernel_commit 91b587ba79e1 \
 export LC_ALL=C.UTF-8
 _require_scratch_nocheck
 _require_command "$F2FS_IO_PROG" f2fs_io
-_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command dent d_hash
 
 #check whether f2fs supports "lookup_mode=x" mount option
 mntopt=""
diff --git a/tests/f2fs/019 b/tests/f2fs/019
index 2307bd96..a6e6e38c 100755
--- a/tests/f2fs/019
+++ b/tests/f2fs/019
@@ -18,7 +18,7 @@ _fixed_by_kernel_commit 77de19b6867f \
 	"f2fs: fix to avoid out-of-boundary access in dnode page"
 
 _require_scratch_nocheck
-_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node addr
 
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
diff --git a/tests/f2fs/020 b/tests/f2fs/020
index 38bc6582..a6933134 100755
--- a/tests/f2fs/020
+++ b/tests/f2fs/020
@@ -20,7 +20,7 @@ _fixed_by_kernel_commit 061cf3a84bde \
 	"f2fs: fix to do sanity check on ino and xnid"
 
 _require_scratch_nocheck
-_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node i_xattr_nid
 _require_attrs user
 
 # remove all mkfs options to avoid layout change of on-disk inode
diff --git a/tests/f2fs/022 b/tests/f2fs/022
index ed3b4f2b..48a8386b 100755
--- a/tests/f2fs/022
+++ b/tests/f2fs/022
@@ -19,7 +19,7 @@ _fixed_by_kernel_commit xxxxxxxxxxxx \
 	"f2fs: fix to do sanity check on node footer for non inode dnode"
 
 _require_scratch_nocheck
-_require_command "$F2FS_INJECT_PROG" inject.f2fs
+_require_inject_f2fs_command node i_nid
 
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
