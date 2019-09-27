Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBD1C02F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 12:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDnAb-0006I1-Va; Fri, 27 Sep 2019 10:08:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iDnAa-0006Hu-R8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 10:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A565AxJDYLIT6qXe6YO90IwXPt5qhsiZOrHJnxQOCpU=; b=QnU+VnhXu6mA9kVY370LmZ61ne
 mJ0XD8sdaVbPPrRqEZyRnM+oYrt2epMiZzLY8lwmvKdFxlqBWJUjP7igC0iL448LTT/UALxXqb2AZ
 ZivoBk9EdBILQzV8SONEU5fQWsP5E3MxxB0afmVvAlb156xCVIcC7cEIfKcRyV15GXno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A565AxJDYLIT6qXe6YO90IwXPt5qhsiZOrHJnxQOCpU=; b=l
 WVSZV3f+9+VHMtXOPM+ZDFO7vU0XBm1hXBxpSfjTxLMK2ICvGjh0XErpRwgOr+RjQdJU62vonq+a+
 HVWSxKCpgSkPUan+zFHIxn8U5nsf/pC7a+qern9jaPY7MhvSllvTbdQO8bBLDD9pHHDH4F9uDpYlI
 0xwDFAKYBpo4AvRw=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDnAZ-008BtW-4F
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 10:08:12 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DD07883C419AF77F4883;
 Fri, 27 Sep 2019 18:08:01 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 27 Sep 2019 18:07:48 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Fri, 27 Sep 2019 18:07:42 +0800
Message-ID: <20190927100742.9266-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iDnAZ-008BtW-4F
Subject: [f2fs-dev] [PATCH] common/rc: generalize _get_filesize()
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

- adjust common/defrag, generic/275 and generic/315 to use it
- remove unused _filesize in generic/013

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 common/defrag     | 2 +-
 common/rc         | 5 +++++
 tests/generic/013 | 5 -----
 tests/generic/275 | 2 +-
 tests/generic/315 | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/common/defrag b/common/defrag
index 9866d3da..50596f70 100644
--- a/common/defrag
+++ b/common/defrag
@@ -145,7 +145,7 @@ _defrag()
 	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
 
 	if [ $FSTYP == "f2fs" ]; then
-		_filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
+		_filesize=`_get_filesize $1`
 		$DEFRAG_PROG 0 $_filesize $1 >> $seqres.full 2>&1
 	else
 		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
diff --git a/common/rc b/common/rc
index 66c7fd4d..69735ae6 100644
--- a/common/rc
+++ b/common/rc
@@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
 	_assert_report_list
 fi
 
+_get_filesize()
+{
+    echo `ls -l $1 | $AWK_PROG '{print $5}'`
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
