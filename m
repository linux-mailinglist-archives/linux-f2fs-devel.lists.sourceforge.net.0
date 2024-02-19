Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9B859BD9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 07:07:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbwnt-0004Gm-A0;
	Mon, 19 Feb 2024 06:07:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rbwnr-0004GY-CJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 06:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjKnYAUrVx3Ki5CL6XKIjEzACQo+j6qELWT75/S1DDk=; b=SbXOhLT1xscsJR8fEvve1d0bH4
 oN1fNtZ/9K/AsyiTqT2sjRhF9XcOSPKbslc8m2BsL8dBLisOV9T3Qdoz1lHl8UZVEIbbLHsXzzO+n
 XFP7lJDWvqTrZMonDXb5gP34HkZMqYKNGwXqtuXql/O6JUqg8ThHcgR+aFP37VIpQOIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VjKnYAUrVx3Ki5CL6XKIjEzACQo+j6qELWT75/S1DDk=; b=c
 cdNB5wozgbnwOAvNZlCEikUxL1uVwn6yrMSe23iQhYXCB1MztTXYZ5/dLva0Ran9ACmIPN2T9ISI2
 Sk6iZ7ClnEV5kVstUZuw67XW/UjnzMgebUYFUEmhYwZV026VbnCnuYm8+5fwLGprp+AMxPDicL1y+
 BPyzss4NKpiX5hMk=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbwno-0004bm-FO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 06:06:59 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 41J66QAm087442;
 Mon, 19 Feb 2024 14:06:26 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TdX8g1Q9Gz2KG46m;
 Mon, 19 Feb 2024 14:05:55 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 19 Feb 2024 14:06:24 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 19 Feb 2024 14:05:41 +0800
Message-ID: <1708322741-14849-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 41J66QAm087442
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
X-Headers-End: 1rbwno-0004bm-FO
Subject: [f2fs-dev] [PATCH v3 4/4] f2fs: stop checkpoint when get a
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

Also introduce a new stop cp reason:  STOP_CP_REASON_OUT_OF_RANGE.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
changes of v3: correct MACRO spelling and update based on the lastes code
---
---
 fs/f2fs/segment.c       | 7 ++++++-
 include/linux/f2fs_fs.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c25aaec..8f7ac49 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2665,7 +2665,12 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
 	if (secno >= MAIN_SECS(sbi)) {
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
-		f2fs_bug_on(sbi, secno >= MAIN_SECS(sbi));
+		if (secno >= MAIN_SECS(sbi)) {
+			f2fs_stop_checkpoint(sbi, false,
+				STOP_CP_REASON_OUT_OF_RANGE);
+			f2fs_bug_on(sbi, 1);
+		}
+
 	}
 	segno = GET_SEG_FROM_SEC(sbi, secno);
 	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 9b69c50..56e260c 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -75,6 +75,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_CORRUPTED_SUMMARY,
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_OUT_OF_RANGE,
 	STOP_CP_REASON_MAX,
 };
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
