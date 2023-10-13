Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2267C7DDE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Oct 2023 08:47:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qrBxW-00036D-4e;
	Fri, 13 Oct 2023 06:47:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangkailong@jari.cn>) id 1qrBxT-000367-VO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Oct 2023 06:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ghCUXmJ147jnXAdhzqUrZNBUQkoZLr0BXHD9nbBvin4=; b=lKJySECKBQ2ARE47ASVxV2TD60
 nriIH1R6Up7x10pJ7YEFji0/6sFFbBYw+yDvYh7m7vTMlhGPolsBsx66AbOMaDfFzKQfxWsiK7k22
 8tQY1UEKfbn4Dfyd/m8YyeI6RfiQhfDra12lALbooqq5ImACagXSzAa6zIlyh2zKLVtM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Cc
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ghCUXmJ147jnXAdhzqUrZNBUQkoZLr0BXHD9nbBvin4=; b=W
 V597prKqqzbgO31f2WwE8hATzO75eSW5ItDa0obtBpbT0EiqW3Pz000j7x1UkkzfuIFEVozmL1AhH
 sC4Yf1s0IVk/HUgjyrw/hWNig0RkfsAtTDUUIqhJEqGocxEJuU0dFUfTwGdklx61TGAXMwyRDtwGZ
 bh83CBITz6UCNBik=;
Received: from [218.92.28.115] (helo=jari.cn)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qrBxP-0003EK-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Oct 2023 06:47:38 +0000
Received: from wangkailong$jari.cn ( [182.148.14.172] ) by
 ajax-webmail-localhost.localdomain (Coremail) ; Fri, 13 Oct 2023 14:45:42
 +0800 (GMT+08:00)
X-Originating-IP: [182.148.14.172]
Date: Fri, 13 Oct 2023 14:45:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "KaiLong Wang" <wangkailong@jari.cn>
To: jaegeuk@kernel.org, chao@kernel.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.1-cmXT6 build
 20230419(ff23bf83) Copyright (c) 2002-2023 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
MIME-Version: 1.0
Message-ID: <1712b338.95b.18b27c8a5b6.Coremail.wangkailong@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwDHZD+W5yhlQN7BAA--.687W
X-CM-SenderInfo: 5zdqwypdlo00nj6mt2flof0/1tbiAQABB2UlHDMAlgAJs3
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix the following errors reported by checkpatch: ERROR:
 spaces
 required around that ':' (ctx:VxW) Signed-off-by: KaiLong Wang
 <wangkailong@jari.cn>
 --- fs/f2fs/segment.h | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
 Content analysis details:   (5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 3.6 RCVD_IN_PBL            RBL: Received via a relay in Spamhaus PBL
 [218.92.28.115 listed in zen.spamhaus.org]
 0.0 T_SPF_PERMERROR        SPF: test of record failed (permerror)
 0.0 T_SPF_HELO_PERMERROR   SPF: test of HELO record failed (permerror)
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 1.1 XPRIO                  Has X-Priority header
X-Headers-End: 1qrBxP-0003EK-W5
Subject: [f2fs-dev] [PATCH] f2fs: Clean up errors in segment.h
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix the following errors reported by checkpatch:

ERROR: spaces required around that ':' (ctx:VxW)

Signed-off-by: KaiLong Wang <wangkailong@jari.cn>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2ca8fb5d0dc4..8129be788bd5 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -108,11 +108,11 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	((sbi)->segs_per_sec - ((sbi)->unusable_blocks_per_sec >>\
 	(sbi)->log_blocks_per_seg))
 #define GET_SEC_FROM_SEG(sbi, segno)				\
-	(((segno) == -1) ? -1: (segno) / (sbi)->segs_per_sec)
+	(((segno) == -1) ? -1 : (segno) / (sbi)->segs_per_sec)
 #define GET_SEG_FROM_SEC(sbi, secno)				\
 	((secno) * (sbi)->segs_per_sec)
 #define GET_ZONE_FROM_SEC(sbi, secno)				\
-	(((secno) == -1) ? -1: (secno) / (sbi)->secs_per_zone)
+	(((secno) == -1) ? -1 : (secno) / (sbi)->secs_per_zone)
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
-- 
2.17.1

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
