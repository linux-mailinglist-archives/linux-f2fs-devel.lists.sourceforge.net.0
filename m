Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BCCCEBD18
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Dec 2025 11:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdZUxeyW+txHU1a0VPoyPHOuMxrTSTWnUn0MWMt2nEY=; b=M/5WhIo6ENxfnqj5xWP/bJGUG/
	G7bCdLApu56FY77/uqQ9CdlUOpXiBj1GTx9xT4YJ18V/dh2vudAVHBHtDMAU4h3YiciEWJu2k4ho0
	8AWn/GaP/1100FMXaCY4tM1q2hzBCLVxjsLDOtbFOjC66rp0BIJwnYEUrW9NXWrg/45c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vatp4-0004l5-2v;
	Wed, 31 Dec 2025 10:52:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vatp2-0004kv-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 10:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3LDiD0bSmYac0nXn1GeP9HLelZq3+m2Xb88jr2NmykU=; b=g4WojnoK7mdCQH8WTOF5leZnkz
 G6o/KEx4alPABVd2sCtYVO4QI2F7hdQGwSPpNlH4+xD+zpTr3OO9Zvax7yJz5oo2mBSsSgaZ/hoFc
 YDjvJBCCZ4opoYE2K6qY6vQ0CUOVlpKAfLx0B5rXDcY9dPY2CrJkcva6/4LO+6nSzIRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3LDiD0bSmYac0nXn1GeP9HLelZq3+m2Xb88jr2NmykU=; b=V
 fm6p24AED0OxVO4IhX4xHHoXmUbp2DF0BQR1TU6bDJU8eJ2s1WCZ6dO/hEqBH6+VqnBr2XSMCWOrf
 dm0d9OonIzAgXZJU1rPXOr7gl3XWja/1yvxIlVi/1+ZOLlZBD0jQqHHPTsERUlTcIYbXfazyYFZK9
 it9IAJpHh7BmuKOg=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vatp1-0003tC-Oq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 10:52:56 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a0d0788adaso96620025ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Dec 2025 02:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767178370; x=1767783170; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3LDiD0bSmYac0nXn1GeP9HLelZq3+m2Xb88jr2NmykU=;
 b=iFu9UyGAFVlNRCtP6uX1RZSOaX1YdXza9l1pABzxIvwd5V/l7f87c+hsLXk3k0Q+9J
 0K/JoUe9GzieznygB/BXI7yQw9O624vPm+TVeYoHGpbkS7K/nzsZ+3fwGHq2Z7WA/EEa
 StSXTW3mpuup4tqSQ91MMovI4idLulZY2wloBrAqj8hnB9wbLPwIvyE9skHK2/z9cCIx
 fq7To0hBUjbYIJ/ufNE7rwSeo42C+qONgdh1aWyvtHhf2/I6xoWmNMDLXTdPONW8Ftcs
 bDod1n8i0VXj8jZaLho5UJS1sqkAlvp6WUbdpnSYtXe8d8eDAQVBr0+NslQG7Td3fyHl
 4gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767178370; x=1767783170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LDiD0bSmYac0nXn1GeP9HLelZq3+m2Xb88jr2NmykU=;
 b=dQNx4bOFKZ4T85t1/HT+3OIecLToOhhWhp9Yz98O9oU3raKiDqUfBY3Q/ukrv5dLD3
 vK6H9+kz1XXC19SO5qrTWhmXN9c9WRJtIeJrTkLkGwuQnED3BkScFfmW7THrMO2Brgbr
 LfAQxDJchgE93gyYBnuCzXfi4Zov+enJKNmDX4NOZiB7r+rQRIKkb6YAyWjfwdMiwMap
 d1m6G1SghL5OLQ07U8ge64SJnOFvEfcowVrzasO8wY7oUU5umC0BRk/CKWnH1dZk7k9d
 AEObYHJKOrRgBa+zIk3TpvqH5drJAvlrYqA4DwjPzHQtzqH96JWNp006J9QvvmbciVym
 UVmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/7FR8Dk2xiTPGMePce12S1ZMSblkinYOUdS9Eko1iP2FiqxB426/M/b4Zzwh0P7jn6nAm5U7c5gLcSdWM4GI1@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzriVyxSCfzZQiLZLqJ7rJJFzGqegVDnbWSifVH3zOVS8AGXftP
 Dv55wZESHKfx/zCitAwkG4FlPzJq62MeKYTJr1rtUaVJvmqv317LzjU4
X-Gm-Gg: AY/fxX50+AX43MFSAgULK0IjACTUmoZzbtKDrxOCB6EXZLFgdgpVhyYPPnHKBmm83bu
 7on6HMwxe6p9fNgstSV4wIWK+dGjd+ViutzEBgXRMsd7ti+yYPwuaZc94qb7rPJgKFu+DrP0qqT
 2AteYXsbcdAydv3dx+7+KUGBZX3toKAqQOt0dskpgtQJn+/CzpUEU/lwvggz01AhmhFlTddzweF
 mQ9u3/yZuH4qzakFeGYB1PSUVjqlqR0r9G2+qZ9+H/2886Lg3Mme/4F4DUnj/Kihi1I8jUoPuWC
 XmjsmaFEGlafvn9eW8ZQCRt3zmPULvMqQgCcnRgRfW+mBnQZ6wbk0sP7GeMgtZ4/kmNUNV5OEcp
 w+9utv17F/QaF2+Hb4zLCYVfnR0/Xr9cbZxruKV7kjN59gpMystMIMfSR4g+f6we97/b0zqBT2u
 VT/RaJhF5rDesEE3n3
X-Google-Smtp-Source: AGHT+IHkNLZuJipMhEphl5A4nMBWyTxy9lxHL9gDcrR2t3CPFq5M97mRhMWTjuUrixgstIhqZQjlCA==
X-Received: by 2002:a17:902:f552:b0:29f:251b:c9d7 with SMTP id
 d9443c01a7336-2a2f220d35emr319241525ad.12.1767178369985; 
 Wed, 31 Dec 2025 02:52:49 -0800 (PST)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d776ebsm329353425ad.99.2025.12.31.02.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 02:52:49 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jinbaoliu365@gmail.com,
	jaegeuk@kernel.org
Date: Wed, 31 Dec 2025 18:52:19 +0800
Message-Id: <20251231105219.2679546-1-jinbaoliu365@gmail.com>
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.170 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vatp1-0003tC-Oq
Subject: [f2fs-dev] [PATCH] f2fs-tools: detect and fix NAT entry
 inconsistencies with dent_flag set
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
 fsck/mount.c | 24 ++++++++++++++++++++++++
 fsck/node.h  | 14 ++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index f03fa2d..07b8e6e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3881,6 +3881,7 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 
 	while (1) {
 		struct fsync_inode_entry *entry;
+		struct f2fs_nat_entry nat_entry;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
@@ -3897,6 +3898,29 @@ int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 
 		entry = get_fsync_inode(head, ino_of_node(node_blk));
 		if (!entry) {
+			if (IS_INODE(node_blk) && is_dent_dnode(node_blk)) {
+				get_nat_entry(sbi, ino_of_node(node_blk), &nat_entry);
+				if (nat_entry.block_addr != NULL_ADDR) {
+					if (!c.fix_on)
+						ASSERT_MSG("ino: %u is_dent:%d nat entry blkaddr is %#X\n",
+							ino_of_node(node_blk), is_dent_dnode(node_blk),
+							nat_entry.block_addr);
+					else if (f2fs_dev_is_writable()) {
+						int ret = 0;
+
+						ASSERT_MSG("Set node_blk %#x fsync flag [%u] -> [0]"
+							" next_blkaddr [%#x] -> [NULL_ADDR]\n",
+							blkaddr, is_fsync_dnode(node_blk),
+							F2FS_NODE_FOOTER(node_blk)->next_blkaddr);
+						F2FS_NODE_FOOTER(node_blk)->next_blkaddr = NULL_ADDR;
+						set_fsync_mark(node_blk, 0);
+						ret = dev_write_block(node_blk, blkaddr,
+							f2fs_io_type_to_rw_hint(CURSEG_WARM_NODE));
+						ASSERT(ret >= 0);
+						goto next;
+					}
+				}
+			}
 			entry = add_fsync_inode(head, ino_of_node(node_blk));
 			if (!entry) {
 				err = -1;
diff --git a/fsck/node.h b/fsck/node.h
index 19f1e57..7c16cc8 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -173,6 +173,20 @@ static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
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
+#define set_fsync_mark(page, mark)	set_mark(page, mark, FSYNC_BIT_SHIFT)
+
 #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
