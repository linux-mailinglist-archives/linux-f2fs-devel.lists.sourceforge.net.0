Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB6A5D738
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 08:23:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsGRL-0004Yq-Ru;
	Wed, 12 Mar 2025 07:23:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsGRK-0004Yk-7J
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 07:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzc+z9WXoLmtQ/5EgkHxddlZ9BKnpwKg92DJ7ZW0qmQ=; b=YznpD2Uj85FIPyYPObdRWMkJ44
 MUBCRKpHDLWfF633V9udCFDtRK1e60tRAlh5+mABeguZcHAoJRvtiy8tO7lPVaGbMVSXVssOEyuVy
 Qi6ZBYzwpeNLljvPcP+pP7htHUMSJzMVMWPVrmuDi1+MSPw6lLxWIob7VoY8h23oY028=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jzc+z9WXoLmtQ/5EgkHxddlZ9BKnpwKg92DJ7ZW0qmQ=; b=SUzpFwbLwhQDxal+pxq+m9kwEo
 lQ5jqmnqjij7++sMd2CCdP66LkkGvRmdaH4hD7iBC4uVgBwoLYwrkmAgwMGdE23pGaezyZ2Eo6B3P
 jjJaxwCHjT/rE7EYJQ+fbFqlkm2Kc21laICj+xEPC3X6+gjc9KzoBRrjAOytOXI1+F/s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsGRI-0005Ao-VR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 07:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52F29A46DB5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Mar 2025 07:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C42EC4CEEF;
 Wed, 12 Mar 2025 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741764210;
 bh=rUFbyS396/sAmJoxRgTRC+6vktKpSWiwYEa3MZG65Hs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCS71PevJK9ox8DcOaq2rjd1Y/hplk+iwSQf6DkBKulbfHhBJLr2+HQnOeBnRXglA
 8kWB4u7fOFESxlNua6ZmQm5mU9RHC+Az15zkD7VuRBu41B/Mfu38xsXw9cmeRYv2Ye
 ygayEhAqWwulT7Cr1gegCrIlysP3jdYywW8wUyWOLz/3XYqzHPad1O2UhA00VXYL2K
 vgLu1hy2cO8SWfUhJQeE1ktJKf9HkHryWis64fKzFNYsuHKl1f6Ky35oIGo4AWCCDk
 Oqcm8lTkh/KNWSa9OqdSpGNzBfMxUOxtRDrrs/B44ml6CRhHWz/8IZaFlJmQ15jFFD
 VAqlVtQ19+Z0A==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Wed, 12 Mar 2025 15:23:08 +0800
Message-ID: <20250312072309.3989074-5-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312072309.3989074-1-chao@kernel.org>
References: <20250312072309.3989074-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: _check_generic_filesystem() will fail the test once it
 detects
 corruption, let's introduce _check_f2fs_filesystem() to just check filesystem
 w/ --dry-run option, and return the error number, then let [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsGRI-0005Ao-VR
Subject: [f2fs-dev] [PATCH v4 5/6] common/rc: introduce
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
v4:
- clean up $FSTYP and $FSCK_OPTIONS
- dump formated logs to seqres.full once fsck detects the corruption.
 common/rc | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/common/rc b/common/rc
index 23b642f4..43d3fe42 100644
--- a/common/rc
+++ b/common/rc
@@ -3519,6 +3519,50 @@ _check_generic_filesystem()
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
+    if [ "$type" = "f2fs" ]
+    then
+        # mounted ...
+        local mountpoint=`_umount_or_remount_ro $device`
+    fi
+
+    $F2FS_FSCK_PROG --dry-run $device >$tmp.fsck.f2fs 2>&1
+    if [ $? -ne 0 ];then
+        _log_err "_check_f2fs_filesystem: filesystem on $device is inconsistent"
+        echo "*** fsck.f2fs output ***" >>$seqres.full
+        cat $tmp.fsck.f2fs              >>$seqres.full
+        echo "*** end fsck.f2fs output" >>$seqres.full
+
+    ok=0
+    fi
+    rm -f $tmp.fsck.f2fs
+
+    if [ $ok -eq 0 ]
+    then
+        echo "*** mount output ***"		>>$seqres.full
+        _mount					>>$seqres.full
+        echo "*** end mount output"		>>$seqres.full
+    elif [ "$type" = "f2fs" ]
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
@@ -3623,6 +3667,9 @@ _check_test_fs()
     ubifs)
 	# there is no fsck program for ubifs yet
 	;;
+    f2fs)
+        _check_f2fs_filesystem $TEST_DEV
+        ;;
     *)
 	_check_generic_filesystem $TEST_DEV
 	;;
@@ -3679,6 +3726,9 @@ _check_scratch_fs()
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
