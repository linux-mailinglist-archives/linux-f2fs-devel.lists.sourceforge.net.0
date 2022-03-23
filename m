Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48E4E4E19
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 09:22:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWw8U-0002NL-SK; Wed, 23 Mar 2022 08:22:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sunke32@huawei.com>) id 1nWw8U-0002NF-1E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 08:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpImjOK0dU/UFobQ9b0Qe6NwG0UIKhBo/Cj61EM8ZcM=; b=f3QYksqRye2lZ0l76rnU1u8zaH
 eK0POS6MX3mSTGRZW+f0ZvsgL4nxY6azqyRPNoFFH8wiyAL2Uc5WemErLOr/6fR/nKWTwJrCRPZlb
 nZIB/WyA4TWXHL1soMtctGWV0cJrEg6VLyoNWt+AofGwofMGsbiVZRCHPh1NycWP+uyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jpImjOK0dU/UFobQ9b0Qe6NwG0UIKhBo/Cj61EM8ZcM=; b=J
 6zFmUybchPq1jC0BEDLDz7cG/X++/9BF5lvdfXfWJvDf4b/5kECtlbnVwSQJiMFy5ztkb+LavMpNv
 epF76Zb4spCPq8UYwRBVzdIHFcA6rejSL1Inb4zpQYQewRUMCJ4D4AQ0/8NaY9B2XPLOLC0YQR+ED
 ASBBt0CQwS9RDc8E=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWwGN-0006r2-52
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 08:22:41 +0000
Received: from kwepemi100015.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KNhBZ44k3zfZ0d;
 Wed, 23 Mar 2022 16:20:54 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi100015.china.huawei.com (7.221.188.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Mar 2022 16:22:27 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Wed, 23 Mar
 2022 16:22:26 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>
Date: Wed, 23 Mar 2022 16:37:24 +0800
Message-ID: <20220323083724.55902-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The test fail on f2fs: xattr names and values after second
 fsync log replay: # file: SCRATCH_MNT/foobar +user.attr1="val1"
 user.attr3="val3"
 attr1 is still there after log replay. f2fs doesn't support fs-op level
 transaction
 functionality. so it have no way to persist all metadata updates in one
 transaction. We can use "fastboot" mountopti [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nWwGN-0006r2-52
Subject: [f2fs-dev] [PATCH v3] generic/066: attr1 is still there after log
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
Cc: jaegeuk@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The test fail on f2fs:
     xattr names and values after second fsync log replay:
     # file: SCRATCH_MNT/foobar
    +user.attr1="val1"
     user.attr3="val3"

attr1 is still there after log replay. f2fs doesn't support fs-op level
transaction functionality. so it have no way to persist all metadata
updates in one transaction.  We can use "fastboot" mountoption for this
case, so during last fsync on qwerty, f2fs can trigger a checkpoint
which will persist all metadata updates before fsync().

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
v3: merge "fastboot" with original mount options
 tests/generic/066 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/generic/066 b/tests/generic/066
index 105a7acd..d8a38655 100755
--- a/tests/generic/066
+++ b/tests/generic/066
@@ -56,6 +56,14 @@ sync
 $SETFATTR_PROG -x user.attr2 $SCRATCH_MNT/foobar
 $XFS_IO_PROG -c "fsync" $SCRATCH_MNT/foobar
 
+# f2fs doesn't support fs-op level transaction functionality. so it have no way
+# to persist all metadata updates in one transaction.  We can use "fastboot"
+# mountoption for this case, so during last fsync on qwerty, f2fs can trigger a
+# checkpoint which will persist all metadata updates before fsync().
+if [ $FSTYP = "f2fs" ]; then
+	export MOUNT_OPTIONS="-o fastboot $MOUNT_OPTIONS"
+fi
+
 _flakey_drop_and_remount
 
 # After the fsync log is replayed, the file should have only 2 xattrs, the ones
-- 
2.13.6



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
