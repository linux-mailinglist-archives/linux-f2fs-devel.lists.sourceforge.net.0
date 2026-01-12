Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAA4D10AEF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 07:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a616RG2NK1uqgTtmuojuxsS9rCiCxmvCpKphAaf/Ba4=; b=gx89jIicSaYTMtZj89GHTurlXJ
	VLms5uxbuzYLLPTaRRMFqWgP3SO241SZ/1MQbBAkBOSsb/xxu/bWlTmQua5F+XD2bR9LeCTYC4/3L
	SlwiirHQoZxF4rHGYHqxxIvPFLv/G9Wd2uCA2QOX43SvKp92KNM0r5soLaZozuqfMf3k=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfB9C-0006O9-NR;
	Mon, 12 Jan 2026 06:11:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vfB9A-0006O1-Sv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 06:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IqCCzb5FxRIwLaOrgVWteuxVFyKBAMUVk3j+VSYtXcU=; b=UnvH+Jr4xkg3YT69CKrzAr5Tqb
 vNrQfW4TBkxf7OoPonlyaxkdPMqxvY9+ndPBECxWe/qFVEvaq53q2qhBaExkAmXV+XPqp/Y+71xPs
 2E70Mem2G8ua9s+kGdkmmhn7ugupAYT2xEuzg0E/HBa/70nzlKaxwG+gbGta1Pl/xNnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IqCCzb5FxRIwLaOrgVWteuxVFyKBAMUVk3j+VSYtXcU=; b=F
 Y5BRcQWTZXZnHM/fA6yrb4fqkhNFtg/PBS9U3Ih8hlteGSi2uMMCVYOLmlv6rKEZaCxT22C8RPakd
 E7SBr7cPqpZCPM6H6FG68ECq5I69m+WmWK2XwL5nR4a0/UONqGakNdxcwtUfmYtfKS1ZCsII6kKdU
 +FssSI5gqS4l3TiQ=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vfB99-0008WF-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 06:11:24 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-34c718c5481so3291583a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Jan 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768198273; x=1768803073; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IqCCzb5FxRIwLaOrgVWteuxVFyKBAMUVk3j+VSYtXcU=;
 b=DDJd6F9H7hsdOWY2neQrqqCIastyr18Q3x06rmGnkupqYm4DD1s0jAx+gdZsZIkGy1
 Sfs27i25Sq+V6x12nA9m2zbOv7Ee8iVrsROumko6qqGLNSBsGNoSdUQEuj5aYuv8HI8D
 w6oST/gxkiZKXQFYGQ7NKwAW5GsAayhG9tJFRVsoRqJnUp1G8zVvDSjtBWdFvoFNg6sn
 w0HfeET2K5jYc3cWXv+X2iA8SOB2nyJxlZqcYEU4lUYKmLKoaqqthUHUoHYWbiCYYrNQ
 BaZ0ZM/axp2VFvSSqeEU9+GyjlMWFOwrs8032sTQlOWwodK5fQTr/O1kh7xr6bsLJLj4
 g3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768198273; x=1768803073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqCCzb5FxRIwLaOrgVWteuxVFyKBAMUVk3j+VSYtXcU=;
 b=mGBrt58XmpF+okvDWEHk02mr+/ny05I9CPZdrv71sUgSYii6lgerJBV4/l0OtlF9xX
 SdkNEXY4rQGds5Zd7B42QOKw7DqqP0jlQ+ULZOUPGbNnIK/haenAIGJ7S8A3Dvso2L8G
 /kZptQ5D/HFE7Tf/DNMah8+9OiQhX0JMwrRnUanqwfcoIaEvGcr5hdWLhsmkJNkFkbus
 lYAWKRc+wB7pYvv9b4scfVNaUqhmRIBzMlxs+749vtMVuq/LdI8a8p/rJSdsoavd8aCr
 Glxg961P2mbkaDifeyRvbk6guG3s8l2ETs67d27KSeFVamYNrlnF3kwD0OrElBsWbDnI
 vk7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiCiuIwaHZ5JH2/rYZE8blSWhZuCmRPcfG14V6TLG6EFZTfdwdPVNU4HHsqtSZef2ro+m/YlpuB8wgAmPsf2kO@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx5+Es2posWFxvdIvqHMfj0ro0pATLRXxNURYbDkSEaPszSiA9Q
 vrTTk1VVtm4sZVIJ6evb223vZSxk5nm3VnI0D0DXTYVpIrcgppPrHT5E
X-Gm-Gg: AY/fxX6/lMj6l4DyJgYvfTlkekUQ2BczFX9M/TU7jqqCK8swvOKMDBHku2cmC0YLXV0
 4jN9B+9zHLpR+vRwsipCQNB0ozhLaQsmmM1IOgrBCC4JOzTQn2fCEe27sPLxLuRact3/qtpoYIz
 phg3hudUkxvjdAvXCSXAT/OXSoRAqVoubpmCXtKjb6ci9CxYqET6xk9XaeOxBYf6cgemhBjKvRf
 S7Okj5WbOdbrR7r+LCo9dcZSceo+AVdlmBsdfbRHkL89qlkpyIlLPapsc60lxR84sakcvq9jCO9
 LTHWk0D7M3qetpTgKZLPyu75TjAKvGG29UXACEeefvceiRoR554N4sbY3UzuVc8Z0XA9MuyMx0P
 2w9WuH6xzf0kQ1m2I8m7NWoMrtkOwZvG9kqIRntw8C+r/fpW2I7JwXYIw2ms9eHxCRmR2k2xi7y
 uhPtT7+p4PXJU4ETG6
X-Google-Smtp-Source: AGHT+IFwpxUCmMYtBncT7ccoeRQB5Hfi4p+C+V7wNKLmVepjmQVgqNOJslq6ROfhpyT0RPzxBMd8nA==
X-Received: by 2002:a17:90b:3e8a:b0:33e:2d0f:4793 with SMTP id
 98e67ed59e1d1-34f68b65ffbmr14111531a91.11.1768198273047; 
 Sun, 11 Jan 2026 22:11:13 -0800 (PST)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5f8b0f67sm16368687a91.15.2026.01.11.22.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 22:11:12 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org,
	jinbaoliu365@gmail.com
Date: Mon, 12 Jan 2026 14:11:00 +0800
Message-Id: <20260112061100.702501-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 During SPO tests, when mounting F2FS, an
 -EINVAL error was returned. The issue originates from the
 f2fs_recover_inode_page
 function's check, where old_ni.blk_addr != NULL_ADDR under the conditions
 of [...] Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vfB99-0008WF-S5
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs-tools: Check and clear invalid dent
 flag flags during recovery
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
Add detection and repair for this scenario in fsck.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
---
v2:
- Clear the node_blk dent flag, proceed with recovery
of this and subsequent data.
---
v1:
- Clear the node_blk fsync flag, set next_blkaddr=NULL,
skip recovery of this and later data.
---
 fsck/mount.c | 21 ++++++++++++++++++++-
 fsck/node.h  | 13 +++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 6f640a0..8254644 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3878,6 +3878,7 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 
 	while (1) {
 		struct fsync_inode_entry *entry;
+		struct f2fs_nat_entry nat_entry;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
@@ -3902,8 +3903,26 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		}
 		entry->blkaddr = blkaddr;
 
-		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
+		if (IS_INODE(node_blk) && is_dent_dnode(node_blk)) {
+			get_nat_entry(sbi, ino_of_node(node_blk), &nat_entry);
+			if (is_valid_data_blkaddr(nat_entry.block_addr)) {
+				ASSERT_MSG("Invalid dent flag: blkaddr = %#x, "
+					"ino: %u, is_dent:%d, nat entry blkaddr is %#X\n",
+					blkaddr, ino_of_node(node_blk), is_dent_dnode(node_blk),
+					nat_entry.block_addr);
+				if (c.fix_on && f2fs_dev_is_writable()) {
+					int ret = 0;
+
+					FIX_MSG("Clear dent flag: blkaddr:%#x, ino: %u\n",
+						blkaddr, ino_of_node(node_blk));
+					set_dentry_mark(node_blk, 0);
+					ret = update_inode(sbi, node_blk, blkaddr);
+					ASSERT(ret >= 0);
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
