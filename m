Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E131195126C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 04:32:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se3of-0007G7-A8;
	Wed, 14 Aug 2024 02:32:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1se3od-0007Fz-R6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AcPxhlT3vwNDfR8D6DWGk+04c1moSkfSKqi8ARDqwXs=; b=TqK3CPPwJSh0R9NpuyJPYX6c8F
 ioqJ4+jLP8xLe/piK9Cqm9lck6NMiDDPXGUwGvfcJwlgeBOkNcLgcdzlZyTf3nA84FPO+WA1MvD8Y
 4xfcBYr9uZX5Ppyg9KqfDcrL697EtYCeVgUywcA86KW5u1St0v4xDVEKgiFwwcRZQUqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AcPxhlT3vwNDfR8D6DWGk+04c1moSkfSKqi8ARDqwXs=; b=C2sm/AW9SEf+CwfZ3bRzdBlvfO
 W1ZTrxkKI+q9serzf5i4frCcVwhAjmrSLinre9KIKrn+ZT73GnuJkQe3zxedA0acb2K68EEE1bgTj
 fFgpUOI4ms6Lhd3MJiwyZEEPyHyzp3SoPiCaSSXDTd5yjw5HIY7W6/wi3NOt9RiUM9RI=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se3oc-0005Uz-6b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:47 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WkBxd4PHDz20lcQ;
 Wed, 14 Aug 2024 10:28:05 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 3622914037B;
 Wed, 14 Aug 2024 10:32:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 10:32:38 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 14 Aug 2024 10:39:06 +0800
Message-ID: <20240814023912.3959299-4-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814023912.3959299-1-lihongbo22@huawei.com>
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just move option validation out of parse_options(), and the
 validation logic is enclosed within f2fs_validate_options. Signed-off-by:
 Hongbo Li <lihongbo22@huawei.com> --- fs/f2fs/super.c | 22
 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [45.249.212.190 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1se3oc-0005Uz-6b
Subject: [f2fs-dev] [PATCH 3/9] f2fs: move option validation into a separate
 helper
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 lihongbo22@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just move option validation out of parse_options(), and the
validation logic is enclosed within f2fs_validate_options.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/f2fs/super.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 013b1078653f..8c8cd06a6d9c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -41,6 +41,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/f2fs.h>
 
+static int f2fs_validate_options(struct super_block *sb);
+
 static struct kmem_cache *f2fs_inode_cachep;
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
@@ -1418,7 +1420,15 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				return ret;
 		}
 	}
+
 default_check:
+	return f2fs_validate_options(sb);
+}
+
+static int f2fs_validate_options(struct super_block *sb)
+{
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+
 #ifdef CONFIG_QUOTA
 	if (f2fs_check_quota_options(sbi))
 		return -EINVAL;
@@ -1432,13 +1442,13 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 #endif
-
-	if (!IS_ENABLED(CONFIG_UNICODE) && f2fs_sb_has_casefold(sbi)) {
+#if !IS_ENABLED(CONFIG_UNICODE)
+	if (f2fs_sb_has_casefold(sbi)) {
 		f2fs_err(sbi,
 			"Filesystem with casefold feature cannot be mounted without CONFIG_UNICODE");
 		return -EINVAL;
 	}
-
+#endif
 	/*
 	 * The BLKZONED feature indicates that the drive was formatted with
 	 * zone alignment optimization. This is optional for host-aware
@@ -1458,10 +1468,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			return -EINVAL;
 		}
 #else
-		f2fs_err(sbi, "Zoned block device support is not enabled");
-		return -EINVAL;
+			f2fs_err(sbi, "Zoned block device support is not enabled");
+			return -EINVAL;
 #endif
-	}
+		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_test_compress_extension(sbi)) {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
