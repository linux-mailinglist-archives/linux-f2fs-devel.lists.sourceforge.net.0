Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D871500
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2019 11:26:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpr3X-000070-Np; Tue, 23 Jul 2019 09:25:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hpr3V-00006s-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 09:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KEI98Ub49rHsOY78C+nCtti6P/qLVHcMJOnFcDWvX6U=; b=AwffbBqkQMnrec+usjZ7ix/Mrz
 DjHPt8jPcKRYRi/bE1fMLsVM+xSw7Tx37+u59U6wXqZWBPjCF6tqRyYCTJzqZ8Sx3oOdFCCDIRDMg
 TkijbtgkHmMv6Bcq7DMDRnPslZaf/csJrStO7mqWu4J1LCKqOm22p2S0qJXCrAsePi/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KEI98Ub49rHsOY78C+nCtti6P/qLVHcMJOnFcDWvX6U=; b=Z
 8t0/sGTqfekHOVOu6SfNgOqcVvbxh4dwZhpb8AxX2ZGk0cQ5r0x2kZ4/guBjW23X8Bqu7prJRnrv2
 o3iuO+LffPmLUedCaHdxVkrnh29gCa1tvF4tr5xi6I1eWQjt9JXSs1NtEB8GiaGc/6pSMVZYTVAwj
 o4jGLvId8fBy5vro=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpr3S-00E3Ql-6j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 09:25:57 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 56DCFE290D39BCEC26F5;
 Tue, 23 Jul 2019 17:25:46 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 23 Jul 2019 17:25:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Tue, 23 Jul 2019 17:25:27 +0800
Message-ID: <20190723092529.112426-1-yuchao0@huawei.com>
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
X-Headers-End: 1hpr3S-00E3Ql-6j
Subject: [f2fs-dev] [PATCH 1/3] generic/38[3456]: adjust to check prjquota
 before mount
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
Cc: jaegeuk@kernel.org, chao@kernel.orga, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Move _require_prjquota() to front of _qmount() since we do the
check on device directly instead of mountpoint, it can avoid
potential failure if filesystem utils needs exclusive open on
device.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 tests/generic/383 | 2 +-
 tests/generic/384 | 2 +-
 tests/generic/385 | 2 +-
 tests/generic/386 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/generic/383 b/tests/generic/383
index 2c8c5923..cf5ac255 100755
--- a/tests/generic/383
+++ b/tests/generic/383
@@ -39,6 +39,7 @@ _require_xfs_quota_foreign
 
 _scratch_mkfs >/dev/null 2>&1
 _scratch_enable_pquota
+_require_prjquota $SCRATCH_DEV
 
 do_project_test()
 {
@@ -76,7 +77,6 @@ EOF
 # Test project
 _qmount_option "usrquota,prjquota"
 _qmount
-_require_prjquota $SCRATCH_DEV
 do_project_test
 
 # success, all done
diff --git a/tests/generic/384 b/tests/generic/384
index b7c940d7..2c0cd00b 100755
--- a/tests/generic/384
+++ b/tests/generic/384
@@ -57,10 +57,10 @@ chmod a+rwx $seqres.full	# arbitrary users will write here
 _require_scratch
 _scratch_mkfs >/dev/null 2>&1
 _scratch_enable_pquota
+_require_prjquota $SCRATCH_DEV
 
 _qmount_option "prjquota"
 _qmount
-_require_prjquota $SCRATCH_DEV
 
 report_quota()
 {
diff --git a/tests/generic/385 b/tests/generic/385
index 937131a9..56ce6eb0 100755
--- a/tests/generic/385
+++ b/tests/generic/385
@@ -56,9 +56,9 @@ quota_cmd="$XFS_QUOTA_PROG -D $tmp.projects -P $tmp.projid"
 
 _scratch_mkfs >/dev/null 2>&1
 _scratch_enable_pquota
+_require_prjquota $SCRATCH_DEV
 _qmount_option "prjquota"
 _qmount
-_require_prjquota $SCRATCH_DEV
 
 #
 # Create the project root
diff --git a/tests/generic/386 b/tests/generic/386
index 462c5869..e4f7d23b 100755
--- a/tests/generic/386
+++ b/tests/generic/386
@@ -112,10 +112,10 @@ echo $proj_num:$proj_dir > "$my_projects"
 
 _scratch_mkfs					>> "$seqres.full" 2>&1
 _scratch_enable_pquota
+_require_prjquota $SCRATCH_DEV
 
 _qmount_option "prjquota"
 _qmount
-_require_prjquota $SCRATCH_DEV
 
 mkdir -p "${proj_dir}"
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
