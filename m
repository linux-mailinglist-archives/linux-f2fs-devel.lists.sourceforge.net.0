Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A29B5D7B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2024 09:17:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t63tI-0002NK-AR;
	Wed, 30 Oct 2024 08:17:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t63tD-0002Le-Ab
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 08:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WrNrGGvyzm46hgJTJ9wsXN4M7WMbPBNwZLd5HF6pXTY=; b=WCz8xN8s1Pe5i95GZfZ9qCY6O5
 m0rfzJIZRVBei+WoeSTGMgsdSMbZsaXQv0WhQMsHgcSHynru4z1uJIXk0v2lmzIss5fwhm3ne7dxR
 AjfHvruVd9w87o9fr1nz/DGjSuWWAKF6bCBzsl46OajUn2HVHJt9Gu6vhKxmz6TaFyr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WrNrGGvyzm46hgJTJ9wsXN4M7WMbPBNwZLd5HF6pXTY=; b=T
 fAFYw8e0LEopyEfAm3mCmMWhZ1lnuWfCmzZnB5oCM/vhTMDmISVDLk+wDjNTcp8WPxyruU3lxpGyx
 6tcGCxGnaXFFbfKqkZvU+B2514m0x5xIBNcyRuRNnIk4eYvS1/c2o8Etopbdu1720qomvESjds8L4
 tqC0/4WwyGZsLUFM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t63tD-0008Ow-Af for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Oct 2024 08:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B20D4A43890
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Oct 2024 08:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFF5C4CEE4;
 Wed, 30 Oct 2024 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730276229;
 bh=G0Jc5GwhCoQ+HTn/PbQQjj+Skqf8rx5u84YAdDP62Sc=;
 h=From:To:Cc:Subject:Date:From;
 b=dOx+MpUyPE4FK0GEJyZlgAS4dCoAOUAd/yPHA/RxZ2KEqFrsmKs4meZWnlYVnW+ro
 Cvc45xXgBRoiIaLphFODANzSc4KWr8yeXMTYAX/72+mqMBRsF8MIXQb3NY2dDC1mWO
 yrcgcsSSy2G+ZUeYv7o+YPVL/g8pfXJC1/qSuPrFjAGp5c4KxrUkPST+udrJps32Bq
 SOtgsosPs7dw3VHwIzi8ndDiQoa5NOdFrine7xsCklrSjZOsEevtKD9wIPSCtdtmLO
 U4vibdYffmVUAFYkpC2Nx4Ns7Ax6SkaIZmhVvGyCpuA/p+7bfyAxFZY2HMTWoKo6b1
 NOn7x/srXUQYw==
To: jaegeuk@kernel.org
Date: Wed, 30 Oct 2024 16:17:01 +0800
Message-Id: <20241030081701.1853020-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces a new helper log_type_to_seg_type()
 to convert log type to segment data type, and uses it to clean up opened codes
 in build_curseg(), and also it fixes to convert log type before [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t63tD-0008Ow-Af
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to convert log type to segment data
 type correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new helper log_type_to_seg_type() to convert
log type to segment data type, and uses it to clean up opened codes
in build_curseg(), and also it fixes to convert log type before use
in do_write_page().

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- no logic change, just rebase to last dev-test branch
 fs/f2fs/segment.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0347a59be6c..279ce3bd6ddd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3833,10 +3833,35 @@ void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
 	}
 }
 
+static int log_type_to_seg_type(enum log_type type)
+{
+	int seg_type = CURSEG_COLD_DATA;
+
+	switch (type) {
+	case CURSEG_HOT_DATA:
+	case CURSEG_WARM_DATA:
+	case CURSEG_COLD_DATA:
+	case CURSEG_HOT_NODE:
+	case CURSEG_WARM_NODE:
+	case CURSEG_COLD_NODE:
+		seg_type = (int)type;
+		break;
+	case CURSEG_COLD_DATA_PINNED:
+	case CURSEG_ALL_DATA_ATGC:
+		seg_type = CURSEG_COLD_DATA;
+		break;
+	default:
+		break;
+	}
+	return seg_type;
+}
+
 static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 {
-	int type = __get_segment_type(fio);
-	bool keep_order = (f2fs_lfs_mode(fio->sbi) && type == CURSEG_COLD_DATA);
+	enum log_type type = __get_segment_type(fio);
+	int seg_type = log_type_to_seg_type(type);
+	bool keep_order = (f2fs_lfs_mode(fio->sbi) &&
+				seg_type == CURSEG_COLD_DATA);
 
 	if (keep_order)
 		f2fs_down_read(&fio->sbi->io_order_lock);
@@ -4818,12 +4843,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 				sizeof(struct f2fs_journal), GFP_KERNEL);
 		if (!array[i].journal)
 			return -ENOMEM;
-		if (i < NR_PERSISTENT_LOG)
-			array[i].seg_type = CURSEG_HOT_DATA + i;
-		else if (i == CURSEG_COLD_DATA_PINNED)
-			array[i].seg_type = CURSEG_COLD_DATA;
-		else if (i == CURSEG_ALL_DATA_ATGC)
-			array[i].seg_type = CURSEG_COLD_DATA;
+		array[i].seg_type = log_type_to_seg_type(i);
 		reset_curseg_fields(&array[i]);
 	}
 	return restore_curseg_summaries(sbi);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
