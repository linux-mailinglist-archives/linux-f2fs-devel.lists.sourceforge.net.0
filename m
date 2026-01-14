Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87993D1D26C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 09:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fMxgVRs0bS1RVz13ubuop8zSUg+bFTKWoHoedd51Mhs=; b=VQJ+ZgPQ+9UuhCGECTuflSx3r9
	qjD52ntZEOmHyNKJfOn+UWB+50cpRcloZU/XX9LUHMtDR3aMNIJDuz9a3yenjK7WPfirzvq+8oKwN
	f8uIHzecTKAOKC+NQ+gkRNAl2rthvC2OJofeKZIscoff1GRJv9eES/mAZ5045L77Iw4A=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfwNg-00014O-4G;
	Wed, 14 Jan 2026 08:37:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vfwNe-00014I-BX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 08:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RgJKJTalhI27XFMh04xcvA/3WhZ+4Gof2sUhbf4GnXE=; b=OXKGiFkY8AS1YeEyPK/wBrTD3A
 IQFMtMPvPJoFKGm6poqiv3NMX6krVTDiZ9awoaG9vTJApGHXzDZrTygmHBiLbta8fXbLCjA7BOefd
 nrYkRWzFL1ifsEW7C5cbu9gDoyoUexbawr1M16L+PJ6U1KvJZjSMH0v+cdFaKqXQN28Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RgJKJTalhI27XFMh04xcvA/3WhZ+4Gof2sUhbf4GnXE=; b=D
 9RWm7FL63odqQ/EoM/pzQllDChVnF1cG+nK3s1C2kUB44b21z4ACBs4mu0n11eXDMXN/tZOmSx5Jk
 wY67pIjyNccBVUGA5Pw6SZf05LzEmK5/iOp3AfeZyDS84meznrnnTay0drH5+eFJhCGoBIIaagrYj
 Bpsx70MSaMpjPsUU=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfwNc-0006q7-QB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 08:37:30 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a07fac8aa1so63501275ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Jan 2026 00:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768379838; x=1768984638; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RgJKJTalhI27XFMh04xcvA/3WhZ+4Gof2sUhbf4GnXE=;
 b=dniVsejWXZ2ypzdqP7yEFxoEkWp1JwyBph2TJOvIx/1bqpC7X0s1Db3wr5Y3euBl8U
 SAzcwyb+c1FZVW+djnpiCRkdx3eKvzBAkDbAqLYldpBjiyOSo8zNq5yPvwi8PskJ0zmP
 rhYmj2pEwugK+RnngJ1s7mUK2VCOXvC+mrnQvC41ZGIqAYGkTjlShioZsGqzeMsGOptq
 oD1Z0y/MuENuvElQPAXhfdOHMJYaDZI9R49ZyQFlB5+xiHooYQmhCqcBn87mfKkTTZIV
 TEn3f10o10UWfbpyr/jJ7TZ/QwY1gWmYBLMRlD0m/MvMrzdtU9wjewLNkctYCIx19DQ7
 IOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768379838; x=1768984638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgJKJTalhI27XFMh04xcvA/3WhZ+4Gof2sUhbf4GnXE=;
 b=elMC7MJpQXu7nHcu85XCDshLWirpb/3Hh3ngO0KXZsFeL6+ClF4g/Cv/gsDHqigcp8
 SO3D21IXFD3SvDV2kvzImhndyvAciIrx0y9GKerWEoe7vK2mL/slomtptCltUhnVrOvU
 HXPjwHrpjofnVgGQF7qF43dc8HmngBfBifPqxJvc0dFpXNEZ8QVGCr3uG8b6+z3lciKW
 1L0J11cEgZJ+S8NXHtoXOeTR1rXDoNxKy5yvYkRbGmCWZg+aSxt5+42XnlY0FRdOyOVe
 iLGaApAxMUVCexnUPTJFAPERgES41Ryn6D0kG8p30vDPCeTf+YWBJkTL//c2Y6ueK1yd
 e+cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCkHn4jh+xW0OvUEDmht7ZMCH8jE8/qPwXTGbcI6zNqiJfXhlXZ+HHFnHZ5maYjd9MYf09ehEd8qew3KiqSV7b@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxPN0MdzGRuLtrTQ41aMQZeEfG91pFkYHXD5FvqeP9k1ECynaHU
 kNmUHUMbARklRsYXHuvi1TBP6bsiSAg7t3DCitpnHusSBh7i8cMVCYLE
X-Gm-Gg: AY/fxX7vbFgqkllw72xbhcdgQ+wXSEGGvCwmJCC3UtxhUsT7EJSy7k+mRx12IEt/qg4
 9g3AyfeDvXZP5dMyaV1BIFEfovYJlYBvGwkCiNgcovucy66A/3SBl8uIkNJ47WnN6rrLQZL1Hae
 85GVIfOgc+QkfAFCccB8L5n3hFneUo4xGhDYxpaK1UrVFmXabO6KtfBdkInrvW0r6TwnTvrD/xG
 nJPo4/cf493JleotYiulxcYnswoquu+jFF39vhrneZYfcO3uDyS5+NkXfaiLVBEhKx2zX+LoDvl
 uxz6OoF1aBuojOltpb0bmgavP9eI8njw/CF7ppPy3cDSk9pZpwZxH6TYheJrM2qu2C6HHuPbS40
 sKEF15GDo/h7Z1/roU9xRJFSWfHPRBtb9JXg9YwrZrXNJRq/RDTRG56wZauOtYUVLE6LY8V/q8A
 0FtwoRBhGMWBykoN5n
X-Received: by 2002:a17:903:2c9:b0:29d:a26c:34b6 with SMTP id
 d9443c01a7336-2a599ea1046mr18670555ad.50.1768379837981; 
 Wed, 14 Jan 2026 00:37:17 -0800 (PST)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2dd4sm217850705ad.47.2026.01.14.00.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:37:17 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org,
	jinbaoliu365@gmail.com
Date: Wed, 14 Jan 2026 16:37:05 +0800
Message-Id: <20260114083705.944024-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 During SPO tests, when mounting F2FS, an
 -EINVAL error was returned. The issue originates from the
 f2fs_recover_inode_page
 function's check, where old_ni.blk_addr != NULL_ADDR under the conditions
 of [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vfwNc-0006q7-QB
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: Check and clear invalid dent flag
 during recovery
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, Sheng Yong <shengyong1@xiaomi.com>,
 liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liujinbao1 <liujinbao1@xiaomi.com>

During SPO tests, when mounting F2FS, an -EINVAL error was returned.
The issue originates from the f2fs_recover_inode_page function's
check, where old_ni.blk_addr != NULL_ADDR under the conditions of
IS_INODE(folio) && is_dent_dnode(folio).
Clear dent flag of the node block to fix this issue.
Test Step:
1.Modify files and induce SPO to generate fsync inode list.
 blkaddr: 0x15828, ino: 1378, is_inode: 1, is_fsync: 2, is_dent: 0

2.Use inject.f2fs to set dent flag for a fsync inode.
 inject.f2fs --cp 0 --mb flag --idx 2 --val 7 /dev/vda
 Info: inject blkaddr[2] flag of cp 2: 0x3 -> 0x7

3.Boot verification, System fails to mount during recovery:
 f2fs_recover_inode_page:ino: 1378, ni.blkaddr: 0x1581a,
 old_ni.blk_addr != NULL_ADDR
 F2FS-fs (vda): Cannot recover all fsync data errno=-22
4.Run fsck
 fsck.f2fs -f /dev/vda
 [ASSERT] (f2fs_find_fsync_inode:3924) --> Invalid dent flag:
 blkaddr: 0x15828, ino: 1378, is_dent: 4, nat entry blkaddr: 0x1581a
 [FIX] (f2fs_find_fsync_inode:3931) --> Clear dent flag: blkaddr: 0x15828, ino: 1378
After this fix, the system boots normally.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
---
v3:
- Add test steps to verify the effect.
---
v2:
- Clear the node_blk dent flag, proceed with recovery
of this and subsequent data.
---
v1:
- Clear the node_blk fsync flag, set next_blkaddr=NULL,
skip recovery of this and later data.
---
 fsck/mount.c | 19 ++++++++++++++++++-
 fsck/node.h  | 13 +++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 6f640a0..3385489 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3878,6 +3878,7 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 
 	while (1) {
 		struct fsync_inode_entry *entry;
+		struct f2fs_nat_entry nat_entry;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
@@ -3902,8 +3903,24 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		}
 		entry->blkaddr = blkaddr;
 
-		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
+		if (IS_INODE(node_blk) && is_dent_dnode(node_blk)) {
+			get_nat_entry(sbi, ino_of_node(node_blk), &nat_entry);
+			if (is_valid_data_blkaddr(nat_entry.block_addr)) {
+				ASSERT_MSG("Invalid dent flag: blkaddr: 0x%x, "
+					"ino: %u, is_dent: %d, nat entry blkaddr: 0x%x\n",
+					blkaddr, ino_of_node(node_blk), is_dent_dnode(node_blk),
+					nat_entry.block_addr);
+				if (c.fix_on && f2fs_dev_is_writable()) {
+					FIX_MSG("Clear dent flag: blkaddr: 0x%x, ino: %u\n",
+						blkaddr, ino_of_node(node_blk));
+					set_dentry_mark(node_blk, 0);
+					err = update_inode(sbi, node_blk, &blkaddr);
+					ASSERT(err >= 0);
+					goto next;
+				}
+			}
 			entry->last_dentry = blkaddr;
+		}
 next:
 		blkaddr = next_blkaddr_of_node(node_blk);
 
diff --git a/fsck/node.h b/fsck/node.h
index 19f1e57..f3e2c46 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -173,6 +173,19 @@ static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
 	F2FS_NODE_FOOTER(rn)->flag = cpu_to_le32(flag);
 }
 
+static inline void set_mark(struct f2fs_node *rn, int mark, int type)
+{
+	unsigned int flag = le32_to_cpu(F2FS_NODE_FOOTER(rn)->flag);
+
+	if (mark)
+		flag |= (1 << type);
+	else
+		flag &= ~(1 << type);
+	F2FS_NODE_FOOTER(rn)->flag = cpu_to_le32(flag);
+}
+
+#define set_dentry_mark(page, mark)	set_mark(page, mark, DENT_BIT_SHIFT)
+
 #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
