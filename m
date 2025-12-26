Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D5CDE419
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 03:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qN0ai3zS7GvmPDdNVq4SgsRFfRsIfHWXJlLyHtHwxJ4=; b=BlrapaAfMzRCpISJc1MrZFdMnz
	YO4vkkKeXn+BZ3acrHaHFEl7n82CpEa5SAP5wrD2pPC3hleSaeFGONwvLPRDvLda312kPl3rP393Y
	qyn4PmmYyak/pqGLrKeZa9XupCVmodOfBpRNnE0EJT7Eggrl7A95kJO4K9T/wVvw41lU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYy11-0005A3-RT;
	Fri, 26 Dec 2025 02:57:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vYy0z-00059v-Nn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 02:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chKbGPAyZ9XyJLDeC4r4pQetc9bDx5pvgVysyU1wI+Q=; b=j6otnnsVUSTZ+AimuvH6lW4C90
 mEoSQ+14RSsmW2IXe+nDBhptwDD2PcUx4qOVeXOHz3KYdbSh9Z4of4TmvGshK73LZAQ4oQJ6aw3ey
 L4Gbad75X2QduZcg8mXAUHrMpCngGapNIomytWwBOO4z2KJ38eYbvoqDyUKgW60ckslI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=chKbGPAyZ9XyJLDeC4r4pQetc9bDx5pvgVysyU1wI+Q=; b=T
 QS0XzgOcuLZh2RQC3ROeAnvmYIM8lHwI3kDaK3/yP5FA9hR9OyQ0H4qltQjxdqH5fwBv1pv5xg9Ly
 TKSuesukKmmtBpRIPZ7bUoMs8fcM85XANbdKar3gBP/Vy7og0uIzDIAE3lAfs5nsVhBOSAZ98s6nQ
 6c+Lkpdsw8JNL2Xs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYy0y-0000bN-Qu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 02:57:18 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 5BQ2uPDh094311;
 Fri, 26 Dec 2025 10:56:25 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dcqrS0PyPz2L8STY;
 Fri, 26 Dec 2025 10:51:36 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 26 Dec 2025 10:56:23 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 26 Dec 2025 10:56:04 +0800
Message-ID: <1766717764-19956-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 5BQ2uPDh094311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1766717804;
 bh=chKbGPAyZ9XyJLDeC4r4pQetc9bDx5pvgVysyU1wI+Q=;
 h=From:To:CC:Subject:Date;
 b=omxHw/BHAj1gPQEX5+EKWP8jTiopJ5RYlhIgZWzxFW5+j+zneHqZGmKZOtqc2OWBl
 njq1NPWPjFhEHInrQyZVhok1nK0rfhxzecBhyysHDhrmidqYSAgK8QU7t9KC/+cJP9
 F3JCEHijCyINp49YvAQiOBWlCAr5FRE64kNNKCG1sOn/Q1WucGtnd7W0c4k/WuzCgb
 v0vdCMY1RzyKSNIdR0CZylowBVjORSWf27Jwu7VzPLFUArwlAfdq9o/DfpxVChW0tb
 ihujBQWA4uLe0B2yYk2OOsci72mfXSkDtOALLBcGB5rLsgJ5Pla6ln2rbb02RbhL+M
 YQdGOAj030sVw==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It missed the stat count in f2fs_gc_range. Cc:
 stable@kernel.org
 Fixes: 9bf1dcbdfdc8 ("f2fs: fix to account gc stats correctly") Signed-off-by:
 Zhiguo Niu <zhiguo.niu@unisoc.com> --- V3: correct Fixes tags --- fs/f2fs/gc.c
 | 1 + 1 file changed [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vYy0y-0000bN-Qu
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to add gc count stat in
 f2fs_gc_range
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It missed the stat count in f2fs_gc_range.

Cc: stable@kernel.org
Fixes: 9bf1dcbdfdc8 ("f2fs: fix to account gc stats correctly")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
V3: correct Fixes tags
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6afd57f..58b291d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2096,6 +2096,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
+	stat_inc_gc_call_count(sbi, FOREGROUND);
 	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
 		struct gc_inode_list gc_list = {
 			.ilist = LIST_HEAD_INIT(gc_list.ilist),
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
