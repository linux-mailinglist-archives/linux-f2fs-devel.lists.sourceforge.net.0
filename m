Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F75BC2A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 08:02:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oa9qn-0006qS-ED;
	Mon, 19 Sep 2022 06:02:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1oa9qm-0006qE-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 06:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUNrUwW6aGTkNv5R8wz2RoH/jwcu8ORGkBQQOXM7XrY=; b=SH+AoFZ/jpkYVJZnaGl9KmXsnP
 3/yhxnBsnFJxirQkAXjVGR3Mr9ka9cYqHwu6IR5+q+TOimvxeKIlg5e8g7C1msC8aSZ+dcAVcUoHM
 Zk3jSTzoW+Z1VTNQ5T9vCDHS5jQoaG9uStfiM5fFo3CC9d7TyMmWHhVe8AYWA6HEpKjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uUNrUwW6aGTkNv5R8wz2RoH/jwcu8ORGkBQQOXM7XrY=; b=D
 zEy3/wTLCj48ZOSeiSg83aNHOXuHnqzPywruR8Z0TrfbeXKjn3eKXKDO9LDmOmMTc9KlKQXQmpevo
 SCk1Q+ozlM83Q7M4u6EHaKNFS6u7kdjKPGMjCOrFc0ic09vWTsDWhoon8MOgdJ3HtBXZ3PcnchPRZ
 YgwUgTk9wO4Qb640=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oa9qx-0002Hr-Rt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 06:02:01 +0000
Received: from SHSend.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by SHSQR01.spreadtrum.com with ESMTPS id 28J611ob064546
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 19 Sep 2022 14:01:01 +0800 (CST)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from bj08434pcu.spreadtrum.com (10.0.74.109) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 19 Sep 2022 14:01:00 +0800
From: "zhiguo.niu" <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Mon, 19 Sep 2022 14:00:54 +0800
Message-ID: <1663567254-12338-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.74.109]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 28J611ob064546
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During GC,
 if segment type stored in SSA and SIT is inconsistent, 
 we set SBI_NEED_FSCK first and then stop checkpoint, this will cause the
 following issues: 1. SBI_NEED_FSCK can not be set to flash tr [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oa9qx-0002Hr-Rt
Subject: [f2fs-dev] [PATCH V2] f2fs: fix some error handling case in gc
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
Cc: xiuhong.wang@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During GC, if segment type stored in SSA and SIT is inconsistent,
we set SBI_NEED_FSCK first and then stop checkpoint, this will
cause the following issues:
1. SBI_NEED_FSCK can not be set to flash truly because of checkpoint
has been stopped.
2. Will cause more EIO error if user use f2fs because of CP_ERROR_FLAG
has been set in f2fs_stop_checkpoint, this is not reasonable.

So we fix this error handling case by recording current victim segment
as invalid for gc and do not stop checkpoint.
1. SBI_NEED_FSCK will still be set but not do f2fs_stop_checkpoint for
f2fs.fsck to have opportunity to fix the inconsistent segment type
in SSA and SIT.
2. Let user can still use fs, avoid EIO error for some operations such
as read and write,etc
3. If current segment has inconsistent segment type in SSA and SIT,
we add this segment segno in SIT_I(sbi)->invalid_segmap to skip this
segment to avoid deadloop in gc,similar as commit bbf9f7d90f21 ("f2fs:
Fix indefinite loop in f2fs_gc()")

Fixes: 793ab1c8a792 ("f2fs: fix to avoid deadloop in foreground GC")
Signed-off-by: zhiguo.niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/gc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d5fb426e0747..66bdf2678b5e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1700,10 +1700,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		sum = page_address(sum_page);
 		if (type != GET_SUM_TYPE((&sum->footer))) {
-			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
-				 segno, type, GET_SUM_TYPE((&sum->footer)));
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_stop_checkpoint(sbi, false);
+#ifdef CONFIG_F2FS_CHECK_FS
+			if (!test_and_set_bit(segno, SIT_I(sbi)->invalid_segmap)) {
+				f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
+					segno, type, GET_SUM_TYPE((&sum->footer)));
+				set_sbi_flag(sbi, SBI_NEED_FSCK);
+			}
+#endif
 			goto skip;
 		}
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
