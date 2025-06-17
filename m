Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01BADDAD2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 19:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qU0u6/SD4eFb171nLjxRPnd2Rs24umXToXjZlsbtzo8=; b=TNvkssIACuDW0dOhNqDsUhI1xm
	zirkFJmkjX1b8ictumu0DZxVnBDIlwWG6NRZWGLgW3kTMlxGPPU52s70TiBjeYVwd98bdk0Ng13u8
	7UwHpOHOXcbFskNvegYo/ViLsUAn8O78nfdxkYN/Q/SnRTrumHHcY2BTYGvAsZuuRtEs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRaJP-0005xr-GR;
	Tue, 17 Jun 2025 17:41:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sw.prabhu6@gmail.com>) id 1uRaJO-0005xj-2z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 17:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mgrGkqOxDNObLjLq6D7C6MTexdeVGeUMjxtSLbN+W2o=; b=mzcDVxoBqe1pK6S2uAGvO3lXjX
 Ij0hcZXIuujRDptRGtomJ5FhNvA1hqvut2QedYskNw7AGkooVXYRlTqzdChJEwsCAEaAn25mFMyd5
 KklWyqdL7k0aKV6grZ//XCNxX4qMEJ+DcQKwSFTL7KsUlLkW4lgPAgQ+3PWRwvUWI9X0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mgrGkqOxDNObLjLq6D7C6MTexdeVGeUMjxtSLbN+W2o=; b=e
 pugJl5ol0iRDAPzZmOJ5ekoxRHp8rGss5akUhcUccaniUJVbuaYr1+ZdTZjH6OjgjP3xBE0pEXCzQ
 326Yqwnt27kZTJNOwm+UqG3kZE4X7zw1fo5hV34KgEjWSHXbzsdznnGB9UYwZ0WJXRs8BE9yuyt3I
 yWml8ziipL3hdD0E=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uRaJL-0005mh-UG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 17:41:28 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-748c3afd0dbso1318285b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jun 2025 10:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750182077; x=1750786877; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mgrGkqOxDNObLjLq6D7C6MTexdeVGeUMjxtSLbN+W2o=;
 b=gPkHLXSLL+EvBw1gPdl+4uM6nBHDTuXFrL8KcohjFB4xUcHm5O/fvB7MZUjmQzkm38
 uhr3GcBGbhn6oDzbNUkqUMmgg8Eirvwxy4tme0pd1XrkUrn6quFd2PVTC/jW92099aQM
 KIv0nMIrsciW+Zz48xv42sK1Wh+WLoXzl3cJTvuKkdskSbnBoOPvU5bW2PG2cSXxqZHo
 GLeeT8hzNHPOu/JwYhll4oI6aI7MRsCIohniYgrA/s0w4BpYYnac2yFRp9J+8RKPfQAg
 2wEmAFuz0UVJBC5ZqCMJtWXWv1ALQfp1RWILmJp8H3vgzAT00DpY3r4CX/ayimT7cRPS
 WtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750182077; x=1750786877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mgrGkqOxDNObLjLq6D7C6MTexdeVGeUMjxtSLbN+W2o=;
 b=d/oQd1w0G4mTkwvOfnXy+c/sYzQMdpxiKlY80i5R/xw/J5ZKlxdjnh9WP/1gL2zfON
 I6KdcPZXHm8YSViWHB65HGqZcLoiq22NHdWAbGoXHGjlsJYoaAai5QBl+xkF2am+8TSK
 QhPP1rt0KPyIqmbIJ0mpstufqSl1ti6Utbw0nO+qWLFEfsqNRTHMEzJ2d0Dj449s2f5s
 m9srCseE/XnfMf0qrSDbT8HEYG30zEFA/Z6gjLUcOyE0EGTU/xCSfhkORRj5ppHdmF9s
 rIBy2h6Mt9HzN6f1n+TVReaxkEG6X6HSBajB+6edLM6gSgbrXZJeo5XltyI7TvLh3qAx
 FpdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQEfZaWFPAfyMD4E+lqCWyce4OrRSLoWH0uMkLZflbJFgHRqJlvpbiGGGgCHbP8oZ7KzvY6+n+tUtFlse4oxSl@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3Tiq86ewMSfOwzxtpIlhQtJp6QrCnr/JZ+WCymCDv3Q3kjc8r
 4Tl63DBIVvUp8k0DP/MwZg1zvICuDRy3LsEusbNXgk4RkrRxE9MqZzn3F3xOFw==
X-Gm-Gg: ASbGncuMtQ+8q/S35L15uycSQYyAhrqCMJ+Iwr30YfYFLcY1Wlgu6UP6wxOZqKmN35P
 EtwROIp+Pv58HBgS9+Cd8r5yTEkLfebh462H826eCuSSX7NmxQg15ngfF9dFD0sxSt1kSlj8hd4
 YevEu/++eD0OOVideljO1N76J55fCQk0pxR6CqHfRE0kvZe/fbNegQTX5Ht65lOTQPnCTDSjM+U
 sboAh6w23VCUD2OwKcl38DwXMrlKvVEz4zoKCuRviiRDyz/M4s0FXHn3WZovYYr4Da8AMlMuBeG
 7TYknWItQNMtZFjPQlezMFRzxwyO9L7nTcMgl6DW7ytOJrqr9+qkNSOxcqdKpB8NA0xdq7IMMwY
 wVUGQIA==
X-Google-Smtp-Source: AGHT+IG8uYkJ0nlmr7+LvuiKbnGE6RpbM0HNHS45nKFtm9jDCdWQmNQSRmkk3m6DxI7dLLyvTk/vmw==
X-Received: by 2002:a05:6a00:230d:b0:742:a7e3:7c84 with SMTP id
 d2e1a72fcca58-7489cf97bf8mr18115909b3a.13.1750182077189; 
 Tue, 17 Jun 2025 10:41:17 -0700 (PDT)
Received: from deb-101020-bm01.dtc.local ([149.97.161.244])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900d29a2sm9417592b3a.175.2025.06.17.10.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 10:41:16 -0700 (PDT)
From: Swarna Prabhu <sw.prabhu6@gmail.com>
X-Google-Original-From: Swarna Prabhu <s.prabhu@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Tue, 17 Jun 2025 17:40:47 +0000
Message-ID: <20250617174047.1511951-1-s.prabhu@samsung.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes minor typos in comments in f2fs.
 Signed-off-by:
 Swarna Prabhu --- fs/f2fs/f2fs.h | 6 +++--- fs/f2fs/node.h | 2 +-
 fs/f2fs/super.c
 | 2 +- 3 files changed, 5 insertions(+), 5 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [sw.prabhu6(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [sw.prabhu6(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRaJL-0005mh-UG
Subject: [f2fs-dev] [PATCH] f2fs: Fix the typos in comments
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
Cc: mcgrof@kernel.org, Swarna Prabhu <s.prabhu@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes minor typos in comments in f2fs.

Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
---
 fs/f2fs/f2fs.h  | 6 +++---
 fs/f2fs/node.h  | 2 +-
 fs/f2fs/super.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..fdf69330582b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -386,7 +386,7 @@ struct discard_cmd {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	struct discard_info di;		/* discard info */
 	struct list_head list;		/* command list */
-	struct completion wait;		/* compleation */
+	struct completion wait;		/* completion */
 	struct block_device *bdev;	/* bdev */
 	unsigned short ref;		/* reference count */
 	unsigned char state;		/* state */
@@ -1427,7 +1427,7 @@ enum {
 
 enum {
 	MEMORY_MODE_NORMAL,	/* memory mode for normal devices */
-	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
+	MEMORY_MODE_LOW,	/* memory mode for low memory devices */
 };
 
 enum errors_option {
@@ -1491,7 +1491,7 @@ enum compress_flag {
 #define COMPRESS_DATA_RESERVED_SIZE		4
 struct compress_data {
 	__le32 clen;			/* compressed data size */
-	__le32 chksum;			/* compressed data chksum */
+	__le32 chksum;			/* compressed data checksum */
 	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
 	u8 cdata[];			/* compressed data */
 };
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 1446c433b3ec..b5218d642545 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -31,7 +31,7 @@
 /* control total # of nats */
 #define DEF_NAT_CACHE_THRESHOLD			100000
 
-/* control total # of node writes used for roll-fowrad recovery */
+/* control total # of node writes used for roll-forward recovery */
 #define DEF_RF_NODE_BLOCKS			0
 
 /* vector size for gang look-up from nat cache that consists of radix tree */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bbf1dad6843f..b4f2b5a85d58 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2569,7 +2569,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			!test_opt(sbi, MERGE_CHECKPOINT)) {
 		f2fs_stop_ckpt_thread(sbi);
 	} else {
-		/* Flush if the prevous checkpoint, if exists. */
+		/* Flush if the previous checkpoint, if exists. */
 		f2fs_flush_ckpt_thread(sbi);
 
 		err = f2fs_start_ckpt_thread(sbi);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
