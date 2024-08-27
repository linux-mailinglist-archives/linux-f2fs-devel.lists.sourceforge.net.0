Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C7D960217
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2024 08:43:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sipux-0002hj-D5;
	Tue, 27 Aug 2024 06:43:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1sipuv-0002hS-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 06:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Bb2EojZ8NdwV6SpZUitilwwiTYftjULQ+lnsjoXY8M=; b=I3Atye/RlMcran9LXAEs+zciGq
 Up4ZMmjRH5gkEgv2My+M3OI7ewEi3glD1kFa8PzofiBmz56xTSa4EibHOMyetS+6FM3mHEFs3kMqb
 BHJ9k0BaP3zSfd1oN1LIJ0y9HOj3TUe+EM3R3XbgmnM71cJdTXbbY7odbRK8xiF0XGwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1Bb2EojZ8NdwV6SpZUitilwwiTYftjULQ+lnsjoXY8M=; b=b
 zhVduEAOU0z4yaOJ2b/qXTfg072pvhSHhCcZRZHOSM89N3vp/B09R09NwYY1B8Ig6EA6l3FRjktOR
 hloutWXEgXyKVSXxJAMXRAbiwYR9Pct0XYK/ZLTgaawHUVo0UijuSMX+eAC+xXUSyviIIWPTVmuZl
 ZS+iB79hccgbtg+E=;
Received: from mta21.honor.com ([81.70.160.142] helo=mta21.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sipuv-0006GA-K1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 06:43:02 +0000
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4WtHVp4j8xzYl3hf;
 Tue, 27 Aug 2024 14:21:22 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 14:22:45 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 14:22:44 +0800
From: wangzijie <wangzijie1@honor.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Tue, 27 Aug 2024 14:22:42 +0800
Message-ID: <20240827062242.776881-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Thread A -dquot_initialize -dqget -f2fs_dquot_acquire
 -v2_read_dquot
 -qtree_read_dquot -find_tree_dqentry -f2fs_quota_read -read_cache_page_gfp
 -do_read_cache_folio -fiemap_read_folio -folio_wait_lock [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [81.70.160.142 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.160.142 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.160.142 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.160.142 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sipuv-0006GA-K1
Subject: [f2fs-dev] [RFC PATCH] f2fs: don't set SBI_QUOTA_NEED_REPAIR flag
 if receive SIGKILL
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thread A
-dquot_initialize
 -dqget
  -f2fs_dquot_acquire
   -v2_read_dquot
    -qtree_read_dquot
     -find_tree_dqentry
      -f2fs_quota_read
       -read_cache_page_gfp
        -do_read_cache_folio
         -fiemap_read_folio
          -folio_wait_locked_killable
           -receive SIGKILL : return -EINTR
       -set SBI_QUOTA_NEED_REPAIR
   -set SBI_QUOTA_NEED_REPAIR

When calling read_cache_page_gfp in quota read, thread may receive SIGKILL and
set SBI_QUOTA_NEED_REPAIR, should we set SBI_QUOTA_NEED_REPAIR in this error path?

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/inode.c | 3 ++-
 fs/f2fs/super.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ed629dabb..2af98e2b7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -837,8 +837,9 @@ void f2fs_evict_inode(struct inode *inode)
 
 	err = f2fs_dquot_initialize(inode);
 	if (err) {
+		if (err != -EINTR)
+			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 		err = 0;
-		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 	}
 
 	f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f1b3647a..f99a36ff3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2650,8 +2650,8 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 			if (PTR_ERR(page) == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto repeat;
-			}
-			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
+			} else if (PTR_ERR(page) != -EINTR)
+				set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
 			return PTR_ERR(page);
 		}
 
@@ -3070,7 +3070,7 @@ static int f2fs_dquot_acquire(struct dquot *dquot)
 
 	f2fs_down_read(&sbi->quota_sem);
 	ret = dquot_acquire(dquot);
-	if (ret < 0)
+	if (ret < 0 && ret != -EINTR)
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 	f2fs_up_read(&sbi->quota_sem);
 	return ret;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
