Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 962457BEB97
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Oct 2023 22:29:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qpwsh-0006pZ-6h;
	Mon, 09 Oct 2023 20:29:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qpwsf-0006pO-Os
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Oct 2023 20:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNWvqx+TZumLgslLCmyx3nUs5iegGwECzTZpwyFt1BY=; b=MoK+xI3Qu4KOYfGt6fx2AIhF8j
 OcCC2dhUdvolsN5iS8WuIL4Dl3OloVmryKg99gfEIgCCoI8eoJkd8mgzu1soCy4mIKo98uKvVPkBo
 z4D+BOBDDwCYMkBX0BVTJWk0xc1LXRwF7TxJTJiuDeSOJ6K/IWP/9AIESfAja8FEK2Nw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aNWvqx+TZumLgslLCmyx3nUs5iegGwECzTZpwyFt1BY=; b=P
 ph08ANS3HqiQjuBEpTaJJSsbsHKTPWOxch+CvYmdrVdrYE0NBoBlQ1qOPkwVIoblbeRYbHjzKZDQf
 BctndHHclUNzkGfHudsRz3UbaTKI4G8p81z/JYUWugIWAgXz78U9t4EsadAm3EFny17hq6lH7cSdY
 WrUsAN6vv0I9+Hp4=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qpwsb-0090hG-FA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Oct 2023 20:29:33 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1c723f1c80fso30236385ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Oct 2023 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696883364; x=1697488164; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNWvqx+TZumLgslLCmyx3nUs5iegGwECzTZpwyFt1BY=;
 b=Gkkni9zcJ7LuBnNipKETJn4GvJcK3Ni4a2bUpz5qeEHhYiYp211SR44o0EAPBvcQCq
 m+lTXMLki0IeOqWDwtwBHpEe6vEuxvmFYnyO23TduZ7m7p8VM2Hr+yMn1DA7icv0KrgI
 zCqxe5JitbI7xM4JbyILkUl0tlg+/xTH+tKpxhlljxOpcdETBaFDaUkMymAcS2beZ9d/
 LEU6Vee/x9o43Hk2asxf0XvavAUgWBBZBCP0+XTXu26C6Ueu+mks1Gl8H6+tOiD9P0rM
 je0l6KEOSaocP0rMHe5i1Ui9cRJkO99pciWTOsLQg0oxZFg9PUdiA+VJSnST3YEenqTd
 UmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696883364; x=1697488164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNWvqx+TZumLgslLCmyx3nUs5iegGwECzTZpwyFt1BY=;
 b=dU2qfZTjyVap6ZHYWDbzSjb2W8fyUp+gJX5nxCkLDNbb6LdQgQBN4hwFPoogy9QauD
 FmX/Pwrb4ozc/Tqhlk1md5fhjMoW+NQJcC070hNUW2Zvb2FW9KrJ6lQVS5vjPdFvgeTE
 UHgWVrsTD/rV+LONSJLPsGRO8AVmjQxTbZCACIQW4BL//WJtm/Kx0G2dbzcZqw+YY+Ps
 zn3cOaEZDi3ZGPTO+YrHwk1hKOEZ5aGlop3k452cLiqACViteTw4W+Cd+ArSsmzcd19w
 DTgpuB+UT0GUML/2iGF/aWjsUS+KbyoXV6u7tHn6XLO1a5tMUs7jfnGI0I2ICt8fgM0K
 MNkw==
X-Gm-Message-State: AOJu0Yz2/Hkn943h539YJVDqzDrvEM6Tvrvck2ilGxOh9C9bcQx6Yo69
 9ILRRBJBpnasVSgixeLovO8=
X-Google-Smtp-Source: AGHT+IEO1UcwAKvlYfVRJowOzIIjl3b6jfjN+CUhqSQDHyh9SkVUClpyT386+PwKF187dxein0DKCA==
X-Received: by 2002:a17:902:d50f:b0:1c3:bc2a:f6b4 with SMTP id
 b15-20020a170902d50f00b001c3bc2af6b4mr16637007plg.42.1696883363732; 
 Mon, 09 Oct 2023 13:29:23 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:7d85:c4b4:e59e:896])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090282c900b001c72c07c9d9sm9962633plz.308.2023.10.09.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:29:23 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Oct 2023 13:29:17 -0700
Message-ID: <20231009202917.1835899-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong For direct nodes,
 we have to use DEF_ADDRS_PER_BLOCK.
 Signed-off-by: Daeho Jeong --- v2: pass inode struct as a parameter and check
 COMPRESS_ADDR --- fsck/fsck.c | 22 +++++++++++ 1 file changed, 11 insertions(+),
 11 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qpwsb-0090hG-FA
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: use proper address entry count
 for direct nodes
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

For direct nodes, we have to use DEF_ADDRS_PER_BLOCK.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: pass inode struct as a parameter and check COMPRESS_ADDR
---
 fsck/fsck.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 78ffdb6..3ade728 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2875,7 +2875,7 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 }
 
 static void fsck_failed_reconnect_file_dnode(struct f2fs_sb_info *sbi,
-					     nid_t nid)
+					struct f2fs_inode *inode, nid_t nid)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
@@ -2894,12 +2894,12 @@ static void fsck_failed_reconnect_file_dnode(struct f2fs_sb_info *sbi,
 	fsck->chk.valid_blk_cnt--;
 	f2fs_clear_main_bitmap(sbi, ni.blk_addr);
 
-	for (i = 0; i < ADDRS_PER_BLOCK(&node->i); i++) {
+	for (i = 0; i < ADDRS_PER_BLOCK(inode); i++) {
 		addr = le32_to_cpu(node->dn.addr[i]);
 		if (!addr)
 			continue;
 		fsck->chk.valid_blk_cnt--;
-		if (addr == NEW_ADDR)
+		if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 			continue;
 		f2fs_clear_main_bitmap(sbi, addr);
 	}
@@ -2908,7 +2908,7 @@ static void fsck_failed_reconnect_file_dnode(struct f2fs_sb_info *sbi,
 }
 
 static void fsck_failed_reconnect_file_idnode(struct f2fs_sb_info *sbi,
-					      nid_t nid)
+					struct f2fs_inode *inode, nid_t nid)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
@@ -2931,14 +2931,14 @@ static void fsck_failed_reconnect_file_idnode(struct f2fs_sb_info *sbi,
 		tmp = le32_to_cpu(node->in.nid[i]);
 		if (!tmp)
 			continue;
-		fsck_failed_reconnect_file_dnode(sbi, tmp);
+		fsck_failed_reconnect_file_dnode(sbi, inode, tmp);
 	}
 
 	free(node);
 }
 
 static void fsck_failed_reconnect_file_didnode(struct f2fs_sb_info *sbi,
-					       nid_t nid)
+					struct f2fs_inode *inode, nid_t nid)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_node *node;
@@ -2961,7 +2961,7 @@ static void fsck_failed_reconnect_file_didnode(struct f2fs_sb_info *sbi,
 		tmp = le32_to_cpu(node->in.nid[i]);
 		if (!tmp)
 			continue;
-		fsck_failed_reconnect_file_idnode(sbi, tmp);
+		fsck_failed_reconnect_file_idnode(sbi, inode, tmp);
 	}
 
 	free(node);
@@ -3010,7 +3010,7 @@ static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
 			if (!addr)
 				continue;
 			fsck->chk.valid_blk_cnt--;
-			if (addr == NEW_ADDR)
+			if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
 				continue;
 			f2fs_clear_main_bitmap(sbi, addr);
 		}
@@ -3024,14 +3024,14 @@ static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
 		switch (i) {
 		case 0: /* direct node */
 		case 1:
-			fsck_failed_reconnect_file_dnode(sbi, nid);
+			fsck_failed_reconnect_file_dnode(sbi, &node->i, nid);
 			break;
 		case 2: /* indirect node */
 		case 3:
-			fsck_failed_reconnect_file_idnode(sbi, nid);
+			fsck_failed_reconnect_file_idnode(sbi, &node->i, nid);
 			break;
 		case 4: /* double indirect node */
-			fsck_failed_reconnect_file_didnode(sbi, nid);
+			fsck_failed_reconnect_file_didnode(sbi, &node->i, nid);
 			break;
 		}
 	}
-- 
2.42.0.609.gbb76f46606-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
