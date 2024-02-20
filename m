Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2DF85B2B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 07:12:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcJMc-0001Dd-C8;
	Tue, 20 Feb 2024 06:12:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rcJMa-0001DW-JV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJmU/JGYrJipuId2IQUMvtvuw0QCHKdxGPz7eiQJ7/k=; b=R6xfzCd+d2EXXPByoH8aE3yroy
 7DX1aHSqekbS/Av/MDxCaON6agUThbco4z1YyXB6fSXVpbbc8WJa0hycfobj4yJkzXup6ZwwJ5DIa
 yAFlbIvWjC20tydqjVoGb/XwsjzPIxbeTlkDq8lYyEvYbg5xTBMT4gKzYiMyoLszVLPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jJmU/JGYrJipuId2IQUMvtvuw0QCHKdxGPz7eiQJ7/k=; b=d
 vtG6n1M1SSyUmE84fgr1EfTQ2hYvbRpGu9MUW1OGNhtWx+n8k4HKr1MphaPsOEfA4R7TcLVYtcPpP
 7AdknPD/efxpnQbRopA4V8me8XCQXyKwmSkIn7Oii5ay3yjAYoUIH2AcKWcb3hRnQCBcsYUvais+7
 Rsb/zBROsm3eUh8o=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcJMY-0005Bm-46 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:12:21 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41K6BVwF081774;
 Tue, 20 Feb 2024 14:11:31 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Tf8D24k1Qz2K4gjL;
 Tue, 20 Feb 2024 14:10:58 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 20 Feb 2024 14:11:29 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 20 Feb 2024 14:11:24 +0800
Message-ID: <1708409484-27326-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41K6BVwF081774
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is low probability that an out-of-bounds segment will
 be got on a small-capacity device. In order to prevent subsequent write
 requests
 allocating block address from this invalid segment, which m [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcJMY-0005Bm-46
Subject: [f2fs-dev] [PATCH v4 4/4] f2fs: stop checkpoint when get a
 out-of-bounds segment
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
 zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is low probability that an out-of-bounds segment will be got
on a small-capacity device. In order to prevent subsequent write requests
allocating block address from this invalid segment, which may cause
unexpected issue, stop checkpoint should be performed.

Also introduce a new stop cp reason: STOP_CP_REASON_NO_SEGMENT.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
changes of v4: use more suitable MACRO name according to Chao's suggestions
changes of v3: correct MACRO spelling and update based on the lastes code
---
---
 fs/f2fs/segment.c       | 7 ++++++-
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c25aaec..e42e34c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2665,7 +2665,12 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 	if (secno >= MAIN_SECS(sbi)) {
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
-		f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
+		if (secno >= MAIN_SECS(sbi)) {
+			f2fs_stop_checkpoint(sbi, false,
+				STOP_CP_REASON_NO_SEGMENT);
+			f2fs_bug_on(sbi, 1);
+		}
+
 	}
 	segno = GET_SEG_FROM_SEC(sbi, secno);
 	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 9b69c50..755e9a4 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -75,6 +75,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_CORRUPTED_SUMMARY,
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_NO_SEGMENT,
 	STOP_CP_REASON_MAX,
 };
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
