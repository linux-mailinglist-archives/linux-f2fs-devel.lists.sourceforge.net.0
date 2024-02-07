Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE584C22F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 03:02:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXXGO-0001iw-Bf;
	Wed, 07 Feb 2024 02:02:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rXXGN-0001ip-EG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUapLQNZ1dFdUivHxq6wW1o7ulSeHAgqxA8ZephskyA=; b=HrC8uGgtL7mPNiE4tImQcFXcnv
 yOtxp/dxR3o1Bnn9CuTc4mTC7IeEU9R8oXQs/yWh7xybvYcBNmRpaXEACeDCxT00fc5iLV1n5qwEm
 k5kRykg77JLlmu0xAbT0xRsDQ56/nV7xvl0gZIk18JKres416klKZVMdAWddvoJbot5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UUapLQNZ1dFdUivHxq6wW1o7ulSeHAgqxA8ZephskyA=; b=Br8V6Yp/M42lb3ypYwyOtqxPJm
 kJBYbBrB2lECoEPsVxYiWHs1OJIrjKLJ2oLVjRA+VO1eXQ4hTC8AtcCjCVh01Yth+zzTd68A/+5bz
 oczXbQcmhwJq4YYhVi2HnGUxlWEQSX8rDO8eiDi78mJ+ZafCvrKZjFC1VGHvuMiBtnz4=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXXGM-00072l-R3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 02:02:12 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41721cDM075958;
 Wed, 7 Feb 2024 10:01:38 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TV3JC0nQwz2K4cHw;
 Wed,  7 Feb 2024 10:01:31 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 7 Feb 2024 10:01:36 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 7 Feb 2024 10:01:04 +0800
Message-ID: <1707271264-5551-5-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41721cDM075958
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXXGM-00072l-R3
Subject: [f2fs-dev] [PATCH v2 4/4] f2fs: stop checkpoint when get a
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

Also introduce a new stop cp reason:  STOP_CP_REASON_OUTOF_RAGNE.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/segment.c       | 12 ++++++++++--
 include/linux/f2fs_fs.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6772ad4..6fe2baf 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2666,7 +2666,11 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 		if (dir == ALLOC_RIGHT) {
 			secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
-			f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
+			if (secno >= MAIN_SECS(sbi)) {
+				f2fs_stop_checkpoint(sbi, false,
+						STOP_CP_REASON_OUTOF_RAGNE);
+				f2fs_bug_on(sbi, 1);
+			}
 		} else {
 			go_left = 1;
 			left_start = hint - 1;
@@ -2682,7 +2686,11 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 		}
 		left_start = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
-		f2fs_bug_on(sbi, left_start >= MAIN_SECS(sbi));
+		if (left_start >= MAIN_SECS(sbi)) {
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_OUTOF_RAGNE);
+			f2fs_bug_on(sbi, 1);
+		}
 		break;
 	}
 	secno = left_start;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 053137a0..72c6782 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -81,6 +81,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_CORRUPTED_SUMMARY,
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_OUTOF_RAGNE,
 	STOP_CP_REASON_MAX,
 };
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
