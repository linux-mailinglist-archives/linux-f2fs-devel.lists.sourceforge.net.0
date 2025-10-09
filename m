Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD38BC832E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 11:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mT0cUKMd2A3dMgQZbthN3GL9caBvvYPDwZuKIOE9mk=; b=fApujWZZbm7iNu7IMzBZYorI3Z
	OijFIkjqRNQ2IclR5uzerqUJPgpGWHbtOX5BfR1gaS5L3Wl2qCdyv+/59bjYvfn1sKe5bL/MVHShJ
	8ZMVHhyYYutfyQWN9Y0tn+N+uEydmF/Mu64sweM1HS2DQZEaqdLSZZ5nTT/hVbi0lfVA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6me9-0006Ly-Iu;
	Thu, 09 Oct 2025 09:09:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6me0-0006LM-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i+fIgJTsbU5A5j9BLGd5/yHHkKgzK4Bwh50zzj7Gawo=; b=GLss3hGydRzC9/dqcU1iWzWuY2
 LZfQYm2JS4EWll8c9rcWpsMF665Eo2agm1DhH3DttaYyCR6XoCLHEn318wm7gDx0/xbW1VFVV1oE2
 xD92fkcx55twY3pWNDGSGgWSBUOTxcLqrAFUXbFaHJSeauwU0s38DYMbfau6aimWEUdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i+fIgJTsbU5A5j9BLGd5/yHHkKgzK4Bwh50zzj7Gawo=; b=lHMFLV/yMVtbR32cHLaQUwFqF4
 1tSmCuxYF9CrJSaeFqzGJOSdYSVMA1x9pwGyj+//pnvrA+JijJiUTWdV1aXZ6VgtcFcillQXh9+D/
 9P0f3yH+YU3s6LNUdNEOjf1FLxNKBMjR5xhd+pJ+DBRLq+JYQJbINaXKhEYrajYLlaDM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6me0-0006G2-H2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D8C356224C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 09:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15633C113D0;
 Thu,  9 Oct 2025 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760000933;
 bh=7qX7dSyEVqUMvvtMzL7YjED76he7BdxUoYprgSlpf9Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o7ehBCcI9x2GyzJeYX8iDpERFl/6bOwZJ/WqEsN2ORa+kPGudRDmZpWgyESSafqzx
 u8NcItMtmH8vDASt39/hOQ4Ge25S24XvVxH5MbgsjNQLi3wRgAY8Ib99FxErpuE94p
 O00XY9pkz82QeAyRc2ppobj2CvBvjLxQ1Sd9Oidd/vMvRuwXtp802kPdltugqVMFkN
 kCYLw/TGyoSCzUcoZ0ScuUMtvx/vo5/WGKi97KWChf4yS2ad6LNdiZsYfRu01gwpvI
 a6KI/zosBE0zJgIfH5CMVdzIGFDduTVrHcESQzcfQFWwz/JnRqIbSpV5ep+Y6GOE1U
 rybByh3Xr+WIQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu,  9 Oct 2025 16:50:42 +0800
Message-Id: <20251009085043.16910-2-chao@kernel.org>
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
 Content preview:  _check_f2fs_filesystem() is f2fs specific, it's better to
 move it to common/f2fs. Cc: Jaegeuk Kim <jaegeuk@kernel.org> Signed-off-by:
 Chao Yu <chao@kernel.org> --- common/f2fs | 44
 ++++++++++++++++++++++++++++++++++++++++++++
 common/rc | 44 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1v6me0-0006G2-H2
Subject: [f2fs-dev] [PATCH 2/3] common/rc: move _check_f2fs_filesystem() to
 common/f2fs
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

_check_f2fs_filesystem() is f2fs specific, it's better to move it to
common/f2fs.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/f2fs | 44 ++++++++++++++++++++++++++++++++++++++++++++
 common/rc   | 44 --------------------------------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/common/f2fs b/common/f2fs
index 1b39d8ce..4d0d688b 100644
--- a/common/f2fs
+++ b/common/f2fs
@@ -25,3 +25,47 @@ _require_scratch_f2fs_compression()
 		_scratch_unmount
 	fi
 }
+
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
diff --git a/common/rc b/common/rc
index 1ec84263..4d121a1b 100644
--- a/common/rc
+++ b/common/rc
@@ -3566,50 +3566,6 @@ _check_generic_filesystem()
     return 0
 }
 
-_check_f2fs_filesystem()
-{
-    local device=$1
-
-    # If type is set, we're mounted
-    local type=`_fs_type $device`
-    local ok=1
-
-    if [ "$type" = "f2fs" ]
-    then
-        # mounted ...
-        local mountpoint=`_umount_or_remount_ro $device`
-    fi
-
-    $F2FS_FSCK_PROG --dry-run $device >$tmp.fsck.f2fs 2>&1
-    if [ $? -ne 0 ];then
-        _log_err "_check_f2fs_filesystem: filesystem on $device is inconsistent"
-        echo "*** fsck.f2fs output ***" >>$seqres.full
-        cat $tmp.fsck.f2fs              >>$seqres.full
-        echo "*** end fsck.f2fs output" >>$seqres.full
-
-    ok=0
-    fi
-    rm -f $tmp.fsck.f2fs
-
-    if [ $ok -eq 0 ]
-    then
-        echo "*** mount output ***"		>>$seqres.full
-        _mount					>>$seqres.full
-        echo "*** end mount output"		>>$seqres.full
-    elif [ "$type" = "f2fs" ]
-    then
-	# was mounted ...
-	_mount_or_remount_rw "$MOUNT_OPTIONS" $device $mountpoint
-	ok=$?
-    fi
-
-    if [ $ok -eq 0 ]; then
-	return 1
-    fi
-
-    return 0
-}
-
 # Filter the knowen errors the UDF Verifier reports.
 _udf_test_known_error_filter()
 {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
