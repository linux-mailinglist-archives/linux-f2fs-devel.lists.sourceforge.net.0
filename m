Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B8A79AD7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 06:33:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0CGD-00007Y-Ak;
	Thu, 03 Apr 2025 04:33:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <thond2009@gmail.com>) id 1u0CGB-00007Q-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 04:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GtsgyMd5k5S+RCVW953wEU0S2j9d9y2UJk6iVF/zlrc=; b=Uu9HwUVc8AJ8PBDvUXo2EzJeKU
 oW4Fq2Fjj9fLLNBX3FeBBGRF79fvKV3NHBA0OMlt9sYvEcF3s8nutwgn3jeQzJb3bZ23zS7rws89I
 keKsaN5UOURV4mIgjlJkMxxByMrM7f7i+SAKL2UNhutVYfSzx0PeLxrPwpalunupUxGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GtsgyMd5k5S+RCVW953wEU0S2j9d9y2UJk6iVF/zlrc=; b=h
 zltYrnwY2LxzCsOp83S1+NQp69H7kmLB1CPsohCWUlsttelDFvi4ii16mUL5dgRox6LSBLztMLwpD
 8WX1iLeABvkZ6f87+/mV01+s3dQ9gsNOKUeTHTE1Kke4Ho1T0nmRDQxYTAlyYV9S50J2Zt5an5pwr
 UdJhSPauMSmh3oyM=;
Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u0CFu-0006vL-Gt for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 04:32:58 +0000
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.51 with ESMTP; 3 Apr 2025 13:02:30 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local)
 (10.185.60.101)
 by 156.147.1.126 with ESMTP; 3 Apr 2025 13:02:30 +0900
X-Original-SENDERIP: 10.185.60.101
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  3 Apr 2025 13:02:20 +0900
Message-Id: <20250403040220.305573-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 3.8 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nguyen Dat Tho gcc-15 switched to -std=c23 by default:
 https://gcc.gnu.org/git/?p=gcc.git; a=commitdiff;
 h=55e3bd376b2214e200fa76d12b67ff259b06c212
 Content analysis details:   (3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [156.147.23.51 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [156.147.23.51 listed in bl.score.senderscore.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [thond2009[at]gmail.com]
 1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received'
 headers
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [thond2009[at]gmail.com]
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing
 list 0.0 SPOOFED_FREEMAIL       No description available.
 0.4 SPOOF_GMAIL_MID        From Gmail but it doesn't seem to be...
X-Headers-End: 1u0CFu-0006vL-Gt
Subject: [f2fs-dev] [PATCH] include/f2fs_fs.h: fix -std=c23 build failure
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
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

gcc-15 switched to -std=c23 by default:

    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212

As a result `f2fs-tools` fails as below, so only typedef u8 bool
for __STDC_VERSION__ <= 201710L (C17)

In file included from ../../git/lib/libf2fs_zoned.c:11:
../../git/include/f2fs_fs.h:107:25: error: two or more data types in declaration specifiers
  107 | typedef u8              bool;
      |                         ^~~~
../../git/include/f2fs_fs.h:107:1: warning: useless type name in empty declaration
  107 | typedef u8              bool;

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 include/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index f890634..1be77f1 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -103,7 +103,7 @@ typedef uint16_t	u16;
 typedef uint8_t		u8;
 typedef u32		block_t;
 typedef u32		nid_t;
-#ifndef bool
+#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
 typedef u8		bool;
 #endif
 typedef unsigned long	pgoff_t;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
