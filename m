Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F89A5BA69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 09:05:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1truby-0006lB-Ik;
	Tue, 11 Mar 2025 08:05:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trubw-0006kx-0B
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 08:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HZmYTari1GqRF6rxjIvsZG/HRnlD0ZX+OCmiKthGHTM=; b=Mfz+e9dOjfu/LWFx4tEM8/UnWd
 uFtWxu0TQ15/AngscsyvHs3BC38l+bwTsDpx9Mv162U7CuQAbO1qriWHdpDwaIL28OVcwu++NVtb3
 TInlcp6PsvfPWRq+wpERizrBIShZIjSTjJdRzYcIjbFe+iX/KMEwuvXauBwqZljxIdic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HZmYTari1GqRF6rxjIvsZG/HRnlD0ZX+OCmiKthGHTM=; b=Ugtre/BRkQ0JlATvg18dF8obD4
 W4KcssnSrtWgiGhShXJvWavTGzGTm+KCskJ2WuqfX7mUXPkbH6nP7On9gGWiAnrGRM7Z+8wjdw0sW
 YezrYSLjjeo7kpx4ygrj4prSaNdqPr77qI3lVXT5SRoOBvRAKjqZSo4gExcE5p0Hd6cQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trubd-00052A-21 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 08:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF1685C4CC4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 08:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA8FC4CEF0;
 Tue, 11 Mar 2025 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741680282;
 bh=XMiIuJb3J5tTBjUVwyhd29X9iHjR/S3NZk4YUuvZCpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XaA2lejTGXmrf40Mt1xVI6zerzlXgWPl2CJ1mIBrRGv72vQKsnbLm8E4jJREm2s//
 DUAnRwaQAR653mnoL/2XTpn0F7BCxWtQj9BBgqqgQEUuvbXnsdm9fzzSqDqAYy4z8x
 HR6x0aE0c90f5/B8CKf/CFzuoHIkSx3vvaZekRJWn10ANNwisD0WKh48GltG7BzHrV
 XkssthhUZ4WJl2YjZYCp72ywouoh0lFPW424tOAYghwnoWOa5jC45E/+9k3/g9q6im
 0bc6oUINzIIAJuiXrUqpW/KVjkBXK61vsFUTqvif+tFsfW8NC+KG4DjtgFReiUGlY6
 BEw+cbtbM5VSw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue, 11 Mar 2025 16:04:29 +0800
Message-ID: <20250311080430.3696582-5-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250311080430.3696582-1-chao@kernel.org>
References: <20250311080430.3696582-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: _check_generic_filesystem() will fail the test once it
 detects
 corruption, let's introduce _check_f2fs_filesystem() to just check filesystem
 w/ --dry-run option, and return the error number, then let [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trubd-00052A-21
Subject: [f2fs-dev] [PATCH v3 5/6] common/rc: introduce
 _check_f2fs_filesystem()
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

_check_generic_filesystem() will fail the test once it detects
corruption, let's introduce _check_f2fs_filesystem() to just check
filesystem w/ --dry-run option, and return the error number, then
let caller to decide whether the corruption is as expected or not.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- introduce _check_f2fs_filesystem() to dry run on f2fs image
 common/rc | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/common/rc b/common/rc
index 23b642f4..00883eb7 100644
--- a/common/rc
+++ b/common/rc
@@ -3519,6 +3519,46 @@ _check_generic_filesystem()
     return 0
 }
 
+_check_f2fs_filesystem()
+{
+    local device=$1
+
+    # If type is set, we're mounted
+    local type=`_fs_type $device`
+    local ok=1
+
+    if [ "$type" = "$FSTYP" ]
+    then
+        # mounted ...
+        local mountpoint=`_umount_or_remount_ro $device`
+    fi
+
+    FSCK_OPTIONS="--dry-run"
+    $F2FS_FSCK_PROG $FSCK_OPTIONS $device >>$seqres.full 2>&1
+    if [ $? -ne 0 ]
+    then
+        ok=0
+    fi
+
+    if [ $ok -eq 0 ]
+    then
+        echo "*** mount output ***"		>>$seqres.full
+        _mount					>>$seqres.full
+        echo "*** end mount output"		>>$seqres.full
+    elif [ "$type" = "$FSTYP" ]
+    then
+	# was mounted ...
+	_mount_or_remount_rw "$MOUNT_OPTIONS" $device $mountpoint
+	ok=$?
+    fi
+
+    if [ $ok -eq 0 ]; then
+	return 1
+    fi
+
+    return 0
+}
+
 # Filter the knowen errors the UDF Verifier reports.
 _udf_test_known_error_filter()
 {
@@ -3623,6 +3663,9 @@ _check_test_fs()
     ubifs)
 	# there is no fsck program for ubifs yet
 	;;
+    f2fs)
+        _check_f2fs_filesystem $TEST_DEV
+        ;;
     *)
 	_check_generic_filesystem $TEST_DEV
 	;;
@@ -3679,6 +3722,9 @@ _check_scratch_fs()
     ubifs)
 	# there is no fsck program for ubifs yet
 	;;
+    f2fs)
+        _check_f2fs_filesystem $device
+        ;;
     *)
 	_check_generic_filesystem $device
 	;;
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
