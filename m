Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2CD72E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 12:12:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKJoZ-0007fw-8Z; Tue, 15 Oct 2019 10:12:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKJoX-0007fX-TS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7cl/sGleEuzf6Sh1QnpZRauQQcl0wNkvkYfizLvka8=; b=ZpEfVOzhQUrBJqan5XijbSXJSw
 0XNyD6gny4Yym6dskRKy5sJxy6RFwi8qJV5BXGn96J6pjq6zmm/Q5GFPe51hymCZpB1t5wXYu0Vt2
 +Nab43lF8MF9fQw0FDma3HeZ2gtRxCfS0OkUBeDnxVd2PhXpGGCgQDMcJLCUqd+a8AlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i7cl/sGleEuzf6Sh1QnpZRauQQcl0wNkvkYfizLvka8=; b=R
 ZhQF8FklwybUSYb5KEI3CQegBDm+HkAg7Z0A/gSe4oplZrkxD4P0CyHFDk7MakzRdd876OAkKBfxp
 9OdZq4ruJb+/aTenL52N35C26zoS893Tme71+RGg4nAsIB3YlfP7CXttO3Fh/XzFz8Vm0XKBMdz8P
 lTQKpuGHNPVg+HHA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKJoW-001yHX-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:12:25 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9914840AE17C4FF6D7AA;
 Tue, 15 Oct 2019 18:12:17 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Tue, 15 Oct 2019 18:12:09 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Tue, 15 Oct 2019 18:11:49 +0800
Message-ID: <20191015101149.127599-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKJoW-001yHX-Dz
Subject: [f2fs-dev] [PATCH v2] common/rc: generalize _get_filesize()
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are some testcases use below command to get file size, generalize
it as global function _get_filesize()

ls -l $1 | $AWK_PROG '{print $5}'

And in addition, using more simple command "stat -c %s" instead.

- adjust common/defrag, generic/275 and generic/315 to use it
- remove unused _filesize in generic/013

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- As suggested by Eryu, let's use "stat -c %s" instead of original
complicated one.

 common/defrag     | 2 +-
 common/rc         | 5 +++++
 tests/generic/013 | 5 -----
 tests/generic/275 | 2 +-
 tests/generic/315 | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/common/defrag b/common/defrag
index 1381a4dd..1769013b 100644
--- a/common/defrag
+++ b/common/defrag
@@ -145,7 +145,7 @@ _defrag()
 	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
 
 	if [ $FSTYP == "f2fs" ]; then
-		local filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
+		local filesize=`_get_filesize $1`
 		$DEFRAG_PROG 0 $filesize $1 >> $seqres.full 2>&1
 	else
 		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
diff --git a/common/rc b/common/rc
index cfaabf10..bd388a4c 100644
--- a/common/rc
+++ b/common/rc
@@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
 	_assert_report_list
 fi
 
+_get_filesize()
+{
+    echo `stat -c %s $1`
+}
+
 _mount()
 {
     $MOUNT_PROG `_mount_ops_filter $*`
diff --git a/tests/generic/013 b/tests/generic/013
index 9e533ee8..bc596102 100755
--- a/tests/generic/013
+++ b/tests/generic/013
@@ -24,11 +24,6 @@ _cleanup()
     rm -rf $TEST_DIR/fsstress.$$.*
 }
 
-_filesize()
-{
-    ls -l $1 | $AWK_PROG '{print "    filesize = " $5}'
-}
-
 # get standard environment, filters and checks
 . ./common/rc
 . ./common/filter
diff --git a/tests/generic/275 b/tests/generic/275
index a934c19c..adc82856 100755
--- a/tests/generic/275
+++ b/tests/generic/275
@@ -73,7 +73,7 @@ echo "Bytes written until ENOSPC:" >>$seqres.full
 du $SCRATCH_MNT/tmp1 >>$seqres.full
 
 # And at least some of it should succeed.
-_filesize=`ls -l $SCRATCH_MNT/tmp1 | awk '{print $5}'`
+_filesize=`_get_filesize $SCRATCH_MNT/tmp1`
 [ $_filesize -lt $((128 * 1024)) ] && \
 	_fail "Partial write until enospc failed; wrote $_filesize bytes."
 
diff --git a/tests/generic/315 b/tests/generic/315
index fd49b579..808d7d74 100755
--- a/tests/generic/315
+++ b/tests/generic/315
@@ -52,7 +52,7 @@ $XFS_IO_PROG -f -c 'falloc -k 0 $(($avail_begin/2))' \
 	$TEST_DIR/testfile.$seq >>$seqres.full 2>&1
 
 # Verify the file size, it should keep unchanged as 0 in this case
-fsize=`ls -l $TEST_DIR/testfile.$seq | awk '{print $5}'`
+fsize=`_get_filesize $TEST_DIR/testfile.$seq`
 [ "$fsize" -eq 0 ] || _fail "File size is changed to ($fsize Bytes)"
 
 # Truncate the file size back to 0
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
