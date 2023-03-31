Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652326D1CC4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 11:42:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piBHG-00068z-79;
	Fri, 31 Mar 2023 09:42:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.ye@mediatek.com>) id 1piBHE-00068j-K3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 09:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=avL8CU6kY5CS4NKIn08+zcUBC0UI/MDg7QxLShqe7BY=; b=KdcwIEE6Bvha4nhoDFqMVQyvus
 NNNvMLXXr07D8pEpGTui0ybDA8So9cn6DhDlJVtBq+m6mV8DLDQT0O+wdYDWfjv1UkaSFAA6MPtfC
 +fQER3oWJ6h8UtrxJGEgBvy1T/VIueBkTG+oEIumA2E3gWXiBhmzBOnf0hQz3zPEzZOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=avL8CU6kY5CS4NKIn08+zcUBC0UI/MDg7QxLShqe7BY=; b=U
 80Xr6synEdm/X26z3BlbG0HIoEHtGt4I4g78ZVk9iWDD8XUOQZWGXW2nYOwSq8Z8zCeXgbENm4k7b
 +XHozIYELMgoX3T/vkWwq9QiE8HnCvsoKD1at3Wp1FuJCog8jW8TQJ6VZUka0EnkJkfDkL57UllTh
 D6UEgoaJzFe7+k1Q=;
Received: from [210.61.82.184] (helo=mailgw02.mediatek.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piBH7-00Aj7C-WC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 09:42:31 +0000
X-UUID: 3413c18ccfa611edb6b9f13eb10bd0fe-20230331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=avL8CU6kY5CS4NKIn08+zcUBC0UI/MDg7QxLShqe7BY=; 
 b=aRLXWOtfC9pfQlrLiiVitZq7A9juNIhcu8H9DoRQ1gzuQ4/xPZsN17/an3iMuvQiX8iPxnr8wFQPB2siAwY8XvldVFDsK2ATVo+J7pcK+OT/AtzN2zH6Dk7sjIrGp3GJFCaLpORy9TQitex6E746XLuB/B/UldCSm35StA0axNc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:2b5f194f-a467-4a30-b95b-bb9c29408ed7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:e5f6f6b4-beed-4dfc-bd9c-e1b22fa6ccc4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3413c18ccfa611edb6b9f13eb10bd0fe-20230331
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <bo.ye@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 255766054; Fri, 31 Mar 2023 17:27:06 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 17:27:05 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 17:27:04 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 31 Mar 2023 17:26:56 +0800
Message-ID: <20230331092658.72386-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Qilin Tan <qilin.tan@mediatek.com> Made iostat lock
 irq safe to avoid potentinal deadlock. Deadlock scenario: f2fs_attr_store
 -> f2fs_sbi_store -> _sbi_store -> spin_lock(sbi->iostat_lock) <interrupt
 request> -> scsi_end_request -> bio_endio -> f2fs_dio_read_end_io ->
 f2fs_update_iostat -> [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [210.61.82.184 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1piBH7-00Aj7C-WC
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix iostat lock protection
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
From: Bo Ye via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Bo Ye <bo.ye@mediatek.com>
Cc: Qilin Tan <qilin.tan@mediatek.com>, yongdong.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, light.hsieh@mediatek.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-mediatek@lists.infradead.org,
 browse.zhang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 peng.zhou@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qilin Tan <qilin.tan@mediatek.com>

Made iostat lock irq safe to avoid potentinal deadlock.

Deadlock scenario:
f2fs_attr_store
  -> f2fs_sbi_store
  -> _sbi_store
  -> spin_lock(sbi->iostat_lock)
    <interrupt request>
    -> scsi_end_request
    -> bio_endio
    -> f2fs_dio_read_end_io
    -> f2fs_update_iostat
    -> spin_lock_irqsave(sbi->iostat_lock)  ===> Dead lock here

Signed-off-by: Qilin Tan <qilin.tan@mediatek.com>
---
 fs/f2fs/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 0b19163c90d4..fd238a68017e 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -575,9 +575,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (!strcmp(a->attr.name, "iostat_period_ms")) {
 		if (t < MIN_IOSTAT_PERIOD_MS || t > MAX_IOSTAT_PERIOD_MS)
 			return -EINVAL;
-		spin_lock(&sbi->iostat_lock);
+		spin_lock_irq(&sbi->iostat_lock);
 		sbi->iostat_period_ms = (unsigned int)t;
-		spin_unlock(&sbi->iostat_lock);
+		spin_unlock_irq(&sbi->iostat_lock);
 		return count;
 	}
 #endif
-- 
2.17.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
