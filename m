Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8086DD0A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Mar 2024 09:27:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfyEE-0003J7-Jh;
	Fri, 01 Mar 2024 08:26:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rfyEC-0003Ix-5Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 08:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jU8T3b75g+vGsqrESHmfwveJMe4oiSv4D3tDmEcEXDQ=; b=FRjbS6MjgYcn1+/LoSvPYhmMb3
 fTUHFoAKOeqD24hA3jylusIQDxGbOwhymhHe3lY6to4b0JOY34xAVgQsv1LIsx8pgNbq3b9alHh/P
 YE+gV+M5XCsKcJroMEML84/2dtmB6dydu1eLZpd14L6/7WeJ7tdhpIfYO3jxS2dWBh3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jU8T3b75g+vGsqrESHmfwveJMe4oiSv4D3tDmEcEXDQ=; b=K
 xswEYfhMU1dXPrGbUPrtYbBYTcJRxWXPL7KpQIWfvj8CHYCisZyWOX4eS/zS4clCQrPYQkIzBU5Bp
 7zHhNRMdLcQZtFd+YFz/WidVxnJgwqUIJIwhOCVLiZE5bvcPwuJbkupggY0idY4gj5HhgLCFuWgZ9
 s4vR+Uhk9yHUF6YA=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfyEB-0004ZW-2k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Mar 2024 08:26:48 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 4218Q82T055542;
 Fri, 1 Mar 2024 16:26:08 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TmLkN0Dccz2KQsFF;
 Fri,  1 Mar 2024 16:25:16 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 1 Mar 2024 16:26:05 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 1 Mar 2024 16:25:54 +0800
Message-ID: <1709281555-11373-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 4218Q82T055542
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __allocate_new_segment may return error when get_new_segment
 fails, so its caller should check its return value. Signed-off-by: Zhiguo
 Niu <zhiguo.niu@unisoc.com> --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/recovery.c
 | 2 +- fs/f2fs/segment.c | 7 +++++-- 3 files changed, 7 insertions(+),
 4 deletions(-)
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfyEB-0004ZW-2k
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to check return value
 __allocate_new_segment
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__allocate_new_segment may return error when get_new_segment
fails, so its caller should check its return value.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/f2fs.h     | 2 +-
 fs/f2fs/recovery.c | 2 +-
 fs/f2fs/segment.c  | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index db05fd0..4331012 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3705,7 +3705,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
 int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
 int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi);
-void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
+int f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 3078d56..c381f0a 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -851,7 +851,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
 	}
 	if (!err)
-		f2fs_allocate_new_segments(sbi);
+		err = f2fs_allocate_new_segments(sbi);
 	return err;
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cdac4cb..72f6ee3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3163,16 +3163,19 @@ int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi)
 	return err;
 }
 
-void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
+int f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 {
 	int i;
+	int err = 0;
 
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 	down_write(&SIT_I(sbi)->sentry_lock);
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++)
-		__allocate_new_segment(sbi, i, false, false);
+		err += __allocate_new_segment(sbi, i, false, false);
 	up_write(&SIT_I(sbi)->sentry_lock);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
+
+	return err;
 }
 
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
