Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9D4AD1D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Feb 2022 08:00:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHKUZ-0006FG-Ro; Tue, 08 Feb 2022 07:00:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sunke32@huawei.com>) id 1nHKUY-0006F2-Hd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 07:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bVfknSmfKzV/9wGv7AnX2Cgl6tnnbVzF3/onryS04y0=; b=ICXUfAj4vlgRWDEjcT+Vv44S8M
 OhL7I4RT8JEAubrjwCdBIebL1Tfbebr69LleWW/SFq8KV0Y5ehkYmyQ1AJNmQ+bJJ/h+XCA8oZNwB
 8kzAhkxaKfya93dVDbLPLZs8VVWt7WD0ZuZhOyumi7rfMMq1JEEOnYBluVHlCEnhcS8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bVfknSmfKzV/9wGv7AnX2Cgl6tnnbVzF3/onryS04y0=; b=c
 9fi1swQfluExxxQbMj4rIum99Hw5XNQEOmnivdkNeUYQ3W5cB7SnNfI8sWe4dWVSR+7MOR03vuSwE
 aMDRhC6ziy3xm0i72JRPAGqKKzXQsAZYfLs3g1LPodW6yMZXnoRPLHw8HFwoUSuVJ3FAVvvPz6Z+1
 rPOod9T8tnvBM3lc=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHKUR-009C5m-R0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 07:00:45 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JtDPt0YmCz9sWK;
 Tue,  8 Feb 2022 14:58:58 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Feb 2022 15:00:28 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 8 Feb
 2022 15:00:28 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>
Date: Tue, 8 Feb 2022 15:16:24 +0800
Message-ID: <20220208071624.1095904-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs has set inline_xattr as a default option, and introduced
 a new option named 'noinline_xattr' for disabling default inline_xattr option.
 So in _acl_get_max we need to check 'noinline_xattr' string [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1nHKUR-009C5m-R0
Subject: [f2fs-dev] [PATCH] common/attr: adbjust acl_max of f2fs
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
Cc: sunke32@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs has set inline_xattr as a default option, and introduced a new
option named 'noinline_xattr' for disabling default inline_xattr option.
So in _acl_get_max we need to check 'noinline_xattr' string in fs
option, otherwise we may select the wrong max acl number since we always
found the string 'inline_xattr' in fs option.

Additionally, f2fs has changed disk layout of xattr block a bit, so will
contain one more entry in both inline and noinline xattr inode, this
patch will modify the max acl number to adjust it.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 common/attr | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/common/attr b/common/attr
index 35682d7c..dae8a1bb 100644
--- a/common/attr
+++ b/common/attr
@@ -26,11 +26,24 @@ _acl_get_max()
 		echo 8191
 		;;
 	f2fs)
-		_fs_options $TEST_DEV | grep "inline_xattr" >/dev/null 2>&1
+		# If noinline_xattr is enabled, max xattr size should be:
+		# (4096 - 24) - (24 + 4) = 4044
+		# then ACL_MAX_ENTRIES should be:
+		# (4044 - (4 + 4 * 4)) / 8 + 4 = 507
+		_fs_options $TEST_DEV | grep "noinline_xattr" >/dev/null 2>&1
 		if [ $? -eq 0 ]; then
-			echo 531
+			echo 507
 		else
-			echo 506
+			# If inline_xattr is enabled, max xattr size should be:
+			# (4096 - 24 + 200) - (24 + 4) = 4244
+			# then ACL_MAX_ENTRIES should be:
+			# (4244 - (4 + 4 * 4)) / 8 + 4 = 532
+			_fs_options $TEST_DEV | grep "inline_xattr" >/dev/null 2>&1
+			if [ $? -eq 0 ]; then
+				echo 532
+			else
+				echo 507
+			fi
 		fi
 		;;
 	bcachefs)
-- 
2.13.6



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
