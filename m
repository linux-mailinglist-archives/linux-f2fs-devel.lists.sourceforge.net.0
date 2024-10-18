Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E09A39DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 11:22:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1jBi-0006A8-PX;
	Fri, 18 Oct 2024 09:22:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t1jBh-0006A0-38
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 09:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uy55QWYorcGwjts4xVzPmfEPNs+z+JdI75vgnSLJyH4=; b=XiAfc7ywgMibxCVPnsuPhcfwWD
 gmAL8+6n512t6686QmBqxoOjIV1H+NLjZAGzvoluvllzhnNx8Bg0kviDK9vzh1PVJPNP6R1pr+fZ2
 QLJDJg40AgK+XUO2KhN7/084MQBYFWheK54KvF1knXie//jrXcyvhmUWIoOmrWnfX6D0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Uy55QWYorcGwjts4xVzPmfEPNs+z+JdI75vgnSLJyH4=; b=c
 zrIeCxXYXrcUfoDbhqVPbHvBMhSDNd8g/FVaYTYhoiM3RXPqOo5KQRSznlVTA5EP/IFO3iYQiaFjl
 EFyLD0Ej7ofBNBVjbRp42Vttj3ZAgVap6Q0dw3VUm9ZYJx5Json5wHHua/bYzo1qzNSbTEiSOOp0X
 sJqFtBQuUcLHuJgA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1jBh-0002ye-3I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 09:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 469B05C6058
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Oct 2024 09:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3821EC4CEC3;
 Fri, 18 Oct 2024 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729243334;
 bh=iQtFXyu+eKmRsJRQ50JW/Pwh0OvPOcYrT9Jj7gapYzY=;
 h=From:To:Cc:Subject:Date:From;
 b=JfTpNufxh2i/J1ts9O+yGtlQldp4//A/HIMiJbixnq1P9QpwqfibMf2FG7ktkFbgY
 lcoEAgBiBlGRRcOkZ1J0VyKQSoGysHk0EzqefyJOE8n0l1CCBVwTxaBgLAtzMaoFRV
 cB63ArDaCAKfnZZEwegEy2r1fY+UhxQv/mJJXCJRdE5Oj+n6TLPcsGimxW7TKO/xbt
 ND7x2uHZBxPG9YtPMcuLvFoJ3EY3uPwXaS32ZUg34BSTiDJU38O5qCCDLm5FW1Byc8
 b9WkxAruAQdP8DVYqTJv7C/MetVJyUzg9PnXE5LVKfMEtJX/8lNsBAQzBpTNz9gdg8
 NPOqc8jANQkZA==
To: jaegeuk@kernel.org
Date: Fri, 18 Oct 2024 17:22:00 +0800
Message-Id: <20241018092200.2792472-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces a new helper log_type_to_seg_type()
 to convert log type to segment data type, and uses it to clean up opened codes
 in build_curseg(), and also it fixes to convert log type before [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1jBh-0002ye-3I
Subject: [f2fs-dev] [PATCH] f2fs: fix to convert log type to segment data
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
 fs/f2fs/segment.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a1806976f4ad..e172b3d0aec3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3836,10 +3836,35 @@ void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
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
@@ -4845,12 +4870,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
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
