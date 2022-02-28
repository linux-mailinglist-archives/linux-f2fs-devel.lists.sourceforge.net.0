Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 757364C61E2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 04:42:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOWvH-0001jD-MT; Mon, 28 Feb 2022 03:42:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sunke32@huawei.com>) id 1nOWvG-0001j0-IK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 03:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AcLYsN524xdYwhWAt88RZZ632Lu02Mbvpky6zdHOrA8=; b=TvfkceQPjn74uEy/KrL6nZ0ift
 aGTuGuSxRuKmasTd5pDcwE0lKCiKLUb91gh1lWZtMQkFFatOzBCslrIa3zCI6JPljFZrPII6KVSX6
 SSeMDsv28b8+eZCyeO3+BKfP2Jlnzi037FxZzemMXkIXEjVewGYhXFtylZJNY05jXiHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AcLYsN524xdYwhWAt88RZZ632Lu02Mbvpky6zdHOrA8=; b=c
 7b0DQF3vo5qhwo+r4OU6uDjzezUkd8RYYYqRvnx/oNjxSefw44hSIN5QLAs/RBxAaHxJ1PJ8s7Mk9
 mbfomXyS3N0GTaAr8syIrquuvWotnlALOh1T/POIL0G4nni5eJD1iKZU23g8v4OmVNat0d4C+1xja
 cscYlRGxJsHLG/3s=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOWvC-0000il-68
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 03:42:04 +0000
Received: from kwepemi100013.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K6R374Pd5zBrKD;
 Mon, 28 Feb 2022 11:40:03 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi100013.china.huawei.com (7.221.188.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 11:41:50 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 28 Feb
 2022 11:41:50 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>
Date: Mon, 28 Feb 2022 11:57:19 +0800
Message-ID: <20220228035719.4102745-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The test fail on f2fs: xattr names and values after second
 fsync log replay: # file: SCRATCH_MNT/foobar +user.attr1="val1"
 user.attr3="val3"
 attr1 is still there after log replay. I guess it is f2fs's special feature
 to improve the performance. 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nOWvC-0000il-68
Subject: [f2fs-dev] [PATCH] generic/066: attr1 is still there after log
 replay on f2fs
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
From: Sun Ke via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sun Ke <sunke32@huawei.com>
Cc: sunke32@huawei.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The test fail on f2fs:
     xattr names and values after second fsync log replay:
     # file: SCRATCH_MNT/foobar
    +user.attr1="val1"
     user.attr3="val3"

attr1 is still there after log replay.
I guess it is f2fs's special feature to improve the performance.

Signed-off-by: Sun Ke <sunke32@huawei.com>
---

Is it a BUG on f2fs?
 .gitignore                                 |  1 +
 tests/generic/066                          |  3 +++
 tests/generic/066.cfg                      |  1 +
 tests/generic/{066.out => 066.out.default} |  0
 tests/generic/066.out.f2fs                 | 11 +++++++++++
 5 files changed, 16 insertions(+)
 create mode 100644 tests/generic/066.cfg
 rename tests/generic/{066.out => 066.out.default} (100%)
 create mode 100644 tests/generic/066.out.f2fs

diff --git a/.gitignore b/.gitignore
index 65b93307..135742f5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -194,6 +194,7 @@ tags
 /src/perf/*.pyc
 
 # Symlinked files
+/tests/generic/066.out
 /tests/generic/035.out
 /tests/generic/050.out
 /tests/xfs/033.out
diff --git a/tests/generic/066 b/tests/generic/066
index 105a7acd..524dc82d 100755
--- a/tests/generic/066
+++ b/tests/generic/066
@@ -17,6 +17,7 @@
 #
 #  Btrfs: remove deleted xattrs on fsync log replay
 #
+seqfull=$0
 . ./common/preamble
 _begin_fstest auto quick attr metadata log
 
@@ -32,6 +33,8 @@ _cleanup()
 . ./common/dmflakey
 . ./common/attr
 
+# Select appropriate golden output based on fstype
+_link_out_file
 # real QA test starts here
 _supported_fs generic
 _require_scratch
diff --git a/tests/generic/066.cfg b/tests/generic/066.cfg
new file mode 100644
index 00000000..c25641be
--- /dev/null
+++ b/tests/generic/066.cfg
@@ -0,0 +1 @@
+f2fs: f2fs
diff --git a/tests/generic/066.out b/tests/generic/066.out.default
similarity index 100%
rename from tests/generic/066.out
rename to tests/generic/066.out.default
diff --git a/tests/generic/066.out.f2fs b/tests/generic/066.out.f2fs
new file mode 100644
index 00000000..8fc58693
--- /dev/null
+++ b/tests/generic/066.out.f2fs
@@ -0,0 +1,11 @@
+QA output created by 066
+xattr names and values after first fsync log replay:
+# file: SCRATCH_MNT/foobar
+user.attr1="val1"
+user.attr3="val3"
+
+xattr names and values after second fsync log replay:
+# file: SCRATCH_MNT/foobar
+user.attr1="val1"
+user.attr3="val3"
+
-- 
2.13.6



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
