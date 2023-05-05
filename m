Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 320696F807E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 12:02:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pusGv-0007lW-5b;
	Fri, 05 May 2023 10:02:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pusGt-0007lH-W8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hutm2pxCoF8V7ug5iQtrZEyTWM28MeQf9PAMUTJcEAA=; b=gNYVZRWMwgs6KPRR5undalqWD1
 TrrrMhnMN/2ILUSTdvv1nTlUBPXlWmzV3Yp6RixNAyLqMW+K7bVeD+dkAgPaCZTtR018wFiRtkaip
 N8GyvAU5UQtvn0v3Cw+kit0jx2cYFtkuiQhHjpsMD7RUfpnjPlzx+wck90BRBqMCedpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hutm2pxCoF8V7ug5iQtrZEyTWM28MeQf9PAMUTJcEAA=; b=QUVdEdyUN4Yl+Ty5UT5R/dm1dB
 xobZ46rY48bhPZQokJ+Vz88f/pSGdnBFxQr42tqA9iKXjdpToPiHOKx50QAiiysxWgc9OaHrPyQqn
 vDujvw3LGbhq0+e0VpkqCyf9cny+gGHf+si6+lPWsjvePwSUqH2yooarNKqu9G07q0iY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pusGo-00F8LD-SV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B56763D0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 10:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD84C4339E;
 Fri,  5 May 2023 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683280948;
 bh=cz3oRRmvG5okQd0cyNeoeQXKErnw2aTiRUPVOyqJuIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J+GxmjOlCc6OSEZB8O7fmCI27uONLSuFagrLBRMOeub3BeoTdKN8PumYZUdl34uvM
 ZUt/VBBfh1F3xPIKm0LGMeqH+QTUQe48W4kfbWfLu76CWwiHRDOndDxYXCpeBexUM7
 FcsvGQOCfgeqo9PpKWGRyEhlEZ2idtRGILZEdmH3HezXYkH//Df6PZYN2WCNBGHsbj
 lB85O1P3Ro6yStztEcCUB+mVx7BfbBJvQHtkEDlZsjuBVHKtym5ONkc4TjCf67uPDK
 VWqTHscz7ikKq/59SDvt7/F/1aEG4OmN+1y45uND5ljgUxIlv/ApVDBib97M2Urb65
 u6hmz3EECwMHA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  5 May 2023 18:02:03 +0800
Message-Id: <20230505100205.1921708-4-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505100205.1921708-1-chao@kernel.org>
References: <20230505100205.1921708-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce DISP_u8(),
 and use DISP_u16() and DISP_u8() to print
 below fields: - i_compress_algorithm - i_log_cluster_size - i_compress_flag
 Signed-off-by: Chao Yu <chao@kernel.org> --- fsck/mount.c | 6 +++---
 include/f2fs_fs.h
 | 11 +++++++++++ 2 files changed, 14 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pusGo-00F8LD-SV
Subject: [f2fs-dev] [PATCH 4/6] f2fs-tools: add DISP_u8() macro
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce DISP_u8(), and use DISP_u16() and DISP_u8() to print below fields:
- i_compress_algorithm
- i_log_cluster_size
- i_compress_flag

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c      |  6 +++---
 include/f2fs_fs.h | 11 +++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index b314756..5e475a3 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -302,9 +302,9 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 		}
 		if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
 			DISP_u64(inode, i_compr_blocks);
-			DISP_u32(inode, i_compress_algorithm);
-			DISP_u32(inode, i_log_cluster_size);
-			DISP_u32(inode, i_compress_flag);
+			DISP_u8(inode, i_compress_algorithm);
+			DISP_u8(inode, i_log_cluster_size);
+			DISP_u16(inode, i_compress_flag);
 		}
 	}
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index dca4cd8..e5d5d13 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -282,6 +282,17 @@ static inline uint64_t bswap_64(uint64_t val)
 		printf("%-30s" fmt, #member, ((ptr)->member));	\
 	} while (0)
 
+#define DISP_u8(ptr, member)						\
+	do {								\
+		assert(sizeof((ptr)->member) == 1);			\
+		if (c.layout)						\
+			printf("%-30s %u\n",				\
+			#member":", ((ptr)->member));			\
+		else							\
+			printf("%-30s" "\t\t[0x%8x : %u]\n",		\
+			#member, ((ptr)->member), ((ptr)->member));	\
+	} while (0)
+
 #define DISP_u16(ptr, member)						\
 	do {								\
 		assert(sizeof((ptr)->member) == 2);			\
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
