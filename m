Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D76FD72D4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 12:10:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKJmR-0003s9-JY; Tue, 15 Oct 2019 10:10:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKJmP-0003s1-UL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gph7sd5Sj2I6Iwm2k/7sSSGJnFgPZVXP/20QF+8emgo=; b=EksDoQnW3V6FIubTTVoow3Qns8
 zhkWpq4UINNqKj8rIaWaNxnyjlL/G5W0t3MT1gwfItLOLMNfHLPelZNubAOaibPcujVRPjfnvLY6Y
 RTBwii9ItOqw0rZ8z9j1ghi0JEPXnRor4WO1tMWQbWDyXeJjfYPh8zHRWWisAWiUPui8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gph7sd5Sj2I6Iwm2k/7sSSGJnFgPZVXP/20QF+8emgo=; b=k
 uV/UzwWnyqHRLEKMKAFarOsRnGhqwLhC4gdrvUcQ7DL+7i8ocZLJDrwey9BH5vCI0xO69R43Tw+f1
 rBB7SffADLkuXSSewa3aG3lX90nWzeMXLNY8/IS0WwpZohCdgRpaxTNZ4XtFSUzHBzUBAGEOWWNOO
 /giJh4VJ+fVDWB9A=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKJmM-009yAB-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:10:13 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 59D5769221E3251C0F2B;
 Tue, 15 Oct 2019 18:10:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 15 Oct 2019 18:09:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Tue, 15 Oct 2019 18:09:37 +0800
Message-ID: <20191015100938.123519-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKJmM-009yAB-Bd
Subject: [f2fs-dev] [PATCH v2 1/2] common/defrag: support f2fs
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

F2FS supports defragment based on file granularity, adjust test suit
to support f2fs.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- use local variable in function
 common/config |  2 ++
 common/defrag | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/common/config b/common/config
index a0d58bde..22592cec 100644
--- a/common/config
+++ b/common/config
@@ -176,6 +176,7 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
 export FSTRIM_PROG="$(type -P fstrim)"
 export DUMPE2FS_PROG="$(type -P dumpe2fs)"
 export RESIZE2FS_PROG="$(type -P resize2fs)"
+export F2FS_IO_PROG="$(type -P f2fs_io)"
 export FIO_PROG="$(type -P fio)"
 export FILEFRAG_PROG="$(type -P filefrag)"
 export E4DEFRAG_PROG="$(type -P e4defrag)"
@@ -242,6 +243,7 @@ case "$HOSTOS" in
 	export MKFS_BTRFS_PROG=$(set_mkfs_prog_path_with_opts btrfs)
 	export MKFS_F2FS_PROG=$(set_mkfs_prog_path_with_opts f2fs)
 	export DUMP_F2FS_PROG=$(type -P dump.f2fs)
+	export F2FS_IO_PROG=$(type -P f2fs_io)
 	export BTRFS_UTIL_PROG=$(type -P btrfs)
 	export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
 	export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)
diff --git a/common/defrag b/common/defrag
index 2bd739c0..1381a4dd 100644
--- a/common/defrag
+++ b/common/defrag
@@ -27,6 +27,9 @@ _require_defrag()
 	rm -f $testfile $donorfile 2>&1 > /dev/null
 	DEFRAG_PROG="$E4DEFRAG_PROG"
 	;;
+    f2fs)
+	DEFRAG_PROG="$F2FS_IO_PROG defrag_file"
+	;;
     btrfs)
 	DEFRAG_PROG="$BTRFS_UTIL_PROG filesystem defragment"
 	;;
@@ -140,7 +143,13 @@ _defrag()
 
 	[ ! -z $csum ] && CSUM_BEFORE=`md5sum $1`
 	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
-	$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
+
+	if [ $FSTYP == "f2fs" ]; then
+		local filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
+		$DEFRAG_PROG 0 $filesize $1 >> $seqres.full 2>&1
+	else
+		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
+	fi
 
 	_scratch_cycle_mount
 	STAT_AFTER=`stat -c "a: %x m: %y c: %z" $1`
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
