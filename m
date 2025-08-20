Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2F1B2DCDB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLHcTTzFNXbxiBTrnUPeFa3IDfTTRNRCBJSMb3vL9Ww=; b=T0putnyVGIedkAyGBRn4RdpIlk
	PiDT8PqP/Ho5ReSPTVUdv+xcDdhv0VJF+Zuq9kHu5puf4IfakLx5kjq5uVopZGRZwIo2vXCxRAlEq
	c0Tqvf8zU7QlybCrGn3UWmAGnccNqs6OvrZwXXEpNe/Dm8kOa53asrh2YKSix0ZB6jKM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoiAA-0008TV-GJ;
	Wed, 20 Aug 2025 12:43:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoiA9-0008TJ-AK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9HUTq41rxQWJnkYQKHDbWKkZuRZUi8dqsrTRXnuVnU=; b=FB6ynYER5x2TEDKOaLsyoWq+ML
 NzjirTCsx90QMgeQ/oIEHo6NX2gbie8CfVxzsFQITvcEsmqbVelv3j3oNQqMjp6jZ6FndUloBA60h
 0Y31YCsmI0nawkW86IKufTTveWjWaONDg63rPiMkuBSvcCv82fRDK3zENP+H2xiev7zc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k9HUTq41rxQWJnkYQKHDbWKkZuRZUi8dqsrTRXnuVnU=; b=KOks9hijjvTMW0KmOUEyleA9Xy
 B7yuKqGeMPiETEMjeCVOxjVDhh3mzHfzYOBRX/OcV6zTfU9v+cjwShBdY3X/Tl+tIZqyIK+f5y08E
 /XXXlYMbRBB7byY2TdDjFUJwGiKaFF7nuZH5dwzxS520nnWZmRzQ4RfZh/cXpFWAVjUw=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoiA8-0003nm-LE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:33 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2445824dc27so60386815ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693807; x=1756298607; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9HUTq41rxQWJnkYQKHDbWKkZuRZUi8dqsrTRXnuVnU=;
 b=Vat2uHyomkfK/GYvUpeVpcqSxKBnyZFCeoqALh8opbkZbHC8Yb6KLsKeKUwmv61fbZ
 UjtmVrzcsNS3O70A0jZN3jLVY8jx7XdMp8kzdwpwjLl3tlllY1lJJXTVnI+yQFTg+6Cu
 EhJvkUaDHTeGUlFk7dqSkFykdSUyHe5BF8Gv3fcPQOXGODaGgzD2+XTBzWjUxdCM3i9Y
 kydRf4bFPzcTRlnnHfQb8VaEkBMRwQEpVnE39A+nVsXrl5kr22wHxBwOtIQ3WT9A9+gU
 kaPtIk9+tfKmqpLPTU7F+JGl8XmC/xN2bHerAUXpnkaeoLNqnDtRJS9GxFrbfdbpoXds
 1bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693807; x=1756298607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9HUTq41rxQWJnkYQKHDbWKkZuRZUi8dqsrTRXnuVnU=;
 b=M0pLZ1WBGBpotkb3yGuGP9zimLtOuDHtM9CsKdwEIAaKhPP7HJyR4JumTweNLZZ9iS
 RvSUWb1blyQxGBviTQUkHJYI3YualirBJ2ZbTWRNI60vNImvQ5SzUR4MOWPK6Hhn46xv
 +X8jpJTccCJBZ+ice8GxPecJ9r/Q+QmY4kuceYOIAZQExQl5CEjJPobrj3I+gRYUJwQ/
 XaU7RFeLL42qIDAqvglGGww0RlAap4lGO2QimIbgK8aMjm0NXsT6PtRcHLNvebx5Y5op
 G+6u3hLzcGPe6p55JWo3dX2MoFtBO/qUP9XoSHsIXeOr+HX+banXcAb3VInKBkL1DiTp
 G74A==
X-Gm-Message-State: AOJu0YySeml7W8Uv/hF/Xz1IIJwA4Pn8/YFKCUsh0TCMq8g+Ti0ro8GH
 OckKXtIDM/qcvLVfPEvGVtclpDc7l5yEwwpsX3tGeNtyxQqM/1jIM0JX
X-Gm-Gg: ASbGncujDcskzF2Fs77/LLvA4mXzdwCQTogf5LmdWdqQNn/T0SoFJ6tJ+OcrxZrm9uW
 ck3jtlAwBPN/WSZ2TWPtHFI+OIe+jCWuww2NTZnFRsiDVAuU9G6RTgsiuRSt0QGOP4eoXzrkkSL
 RkMvwQtGa5i9a1uwnGwQLy6+1YB5Tg2d1uTtOGgrzK2OMAfUxdKUHTlDDD3bEb+WOgLkYsQotP/
 0Uy9dCjS+qt1/BlLwrA16BH3+lr98SppBTMyP3n7irmPmO/nBNvp2EVckZQ5BZnE87xLdGUOSHm
 URu9OmyC9aYQoNWtbL7MNY0i4ClhONJJ8N65aoJ1fdY/UOjF71LbQOGToAX9bD0IhthXhWAWorY
 FQ+J3e/SPGe4lYFHDG5r+yRZaX40j
X-Google-Smtp-Source: AGHT+IHDb1TFfWA9WGC4tR13VfC/2LPuGKNLeCkuKHv5J/s9AL0tdoF0X2f/E+OIyN1LoufianJZwA==
X-Received: by 2002:a17:902:d48a:b0:240:a53:dd37 with SMTP id
 d9443c01a7336-245ef11b904mr31504445ad.21.1755693806832; 
 Wed, 20 Aug 2025 05:43:26 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:26 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:38 +0800
Message-ID: <20250820124238.3785621-14-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong This patch adds a new member `filename' in
 inject_dentry to inject dentry filename. The dentry is specified by nid
 option.
 Note that '.' and '..' dentries are special, because they are not in the
 parent directory of nid. So this patch also adds a new option `--dots' to
 inject these two dentries. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uoiA8-0003nm-LE
Subject: [f2fs-dev] [PATCH v3 13/13] inject.f2fs: add member `filename' in
 inject_dentry
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

This patch adds a new member `filename' in inject_dentry to inject
dentry filename. The dentry is specified by nid option.

Note that '.' and '..' dentries are special, because they are not in the
parent directory of nid. So this patch also adds a new option `--dots'
to inject these two dentries.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c     | 94 ++++++++++++++++++++++++++++++++++++++++-------
 fsck/inject.h     |  1 +
 man/inject.f2fs.8 | 12 +++++-
 3 files changed, 92 insertions(+), 15 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index 3c3f37790616..0e46b1b8f067 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -117,7 +117,7 @@ void inject_usage(void)
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
-	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
+	MSG(0, "  --dent --mb <name> --nid <ino> [--dots <1|2>] --val/str <value/string> inject ino's dentry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -225,12 +225,16 @@ static void inject_node_usage(void)
 
 static void inject_dent_usage(void)
 {
-	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
+	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--dots <1|2>] --val/str <value/string> inject dentry\n");
+	MSG(0, "[dots]:\n");
+	MSG(0, "  1: inject \".\" in directory which is specified by nid\n");
+	MSG(0, "  2: inject \"..\" in directory which is specified by nid\n");
 	MSG(0, "[mb]:\n");
 	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
 	MSG(0, "  d_hash: inject dentry hash\n");
 	MSG(0, "  d_ino: inject dentry ino\n");
 	MSG(0, "  d_ftype: inject dentry ftype\n");
+	MSG(0, "  filename: inject dentry filename, its hash and len are updated implicitly\n");
 }
 
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
@@ -254,6 +258,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"ssa", no_argument, 0, 12},
 		{"node", no_argument, 0, 13},
 		{"dent", no_argument, 0, 14},
+		{"dots", required_argument, 0, 15},
 		{0, 0, 0, 0}
 	};
 
@@ -352,6 +357,14 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->dent = true;
 			MSG(0, "Info: inject dentry\n");
 			break;
+		case 15:
+			opt->dots = atoi(optarg);
+			if (opt->dots != TYPE_DOT &&
+			    opt->dots != TYPE_DOTDOT)
+				return -ERANGE;
+			MSG(0, "Info: inject %s dentry\n",
+			    opt->dots == TYPE_DOT ? "dot" : "dotdot");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -384,6 +397,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->dent) {
 				inject_dent_usage();
 				exit(0);
+			} else {
+				MSG(0, "\tError: Wrong option -%c (%d) %s\n",
+				    o, o, optarg);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -1202,12 +1218,12 @@ static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
 		}
 
 		de = &d->dentry[slot];
-		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
-			return slot;
 		if (de->name_len == 0) {
 			slot++;
 			continue;
 		}
+		if (le32_to_cpu(de->ino) == ino)
+			return slot;
 		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
 	}
 
@@ -1220,14 +1236,15 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct f2fs_node *node_blk = NULL;
 	struct f2fs_inode *inode;
 	struct f2fs_dentry_ptr d;
-	void *inline_dentry;
+	void *buf = NULL, *inline_dentry;
 	struct f2fs_dentry_block *dent_blk = NULL;
 	block_t addr = 0;
-	void *buf = NULL;
 	struct f2fs_dir_entry *dent = NULL;
 	struct dnode_of_data dn;
 	nid_t pino;
-	int slot = -ENOENT, ret;
+	int slot = -ENOENT, namelen, namecap, ret;
+	unsigned int dentry_hash;
+	char *name;
 
 	node_blk = malloc(F2FS_BLKSIZE);
 	ASSERT(node_blk != NULL);
@@ -1236,12 +1253,25 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	get_node_info(sbi, opt->nid, &ni);
 	ret = dev_read_block(node_blk, ni.blk_addr);
 	ASSERT(ret >= 0);
-	pino = le32_to_cpu(node_blk->i.i_pino);
 
-	/* get parent inode */
-	get_node_info(sbi, pino, &ni);
-	ret = dev_read_block(node_blk, ni.blk_addr);
-	ASSERT(ret >= 0);
+	if (opt->dots) {
+		if (!LINUX_S_ISDIR(le16_to_cpu(node_blk->i.i_mode))) {
+			ERR_MSG("ino %u is not a directory, cannot inject "
+				"its %s\n", opt->nid,
+				opt->dots == TYPE_DOT ? "." : "..");
+			ret = -EINVAL;
+			goto out;
+		}
+		/* pino is itself */
+		pino = opt->nid;
+	} else {
+		pino = le32_to_cpu(node_blk->i.i_pino);
+
+		/* get parent inode */
+		get_node_info(sbi, pino, &ni);
+		ret = dev_read_block(node_blk, ni.blk_addr);
+		ASSERT(ret >= 0);
+	}
 	inode = &node_blk->i;
 
 	/* find child dentry */
@@ -1251,7 +1281,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		addr = ni.blk_addr;
 		buf = node_blk;
 
-		slot = find_dir_entry(&d, opt->nid);
+		if (opt->dots == TYPE_DOTDOT)
+			slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
+		else
+			slot = find_dir_entry(&d, opt->nid);
 		if (slot >= 0)
 			dent = &d.dentry[slot];
 	} else {
@@ -1287,7 +1320,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 			ASSERT(ret >= 0);
 
 			make_dentry_ptr(&d, node_blk, dent_blk, 1);
-			slot = find_dir_entry(&d, opt->nid);
+			if (opt->dots == TYPE_DOTDOT)
+				slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
+			else
+				slot = find_dir_entry(&d, opt->nid);
 			if (slot >= 0) {
 				dent = &d.dentry[slot];
 				buf = dent_blk;
@@ -1321,6 +1357,36 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		    "%d -> %d\n", opt->nid, dent->file_type,
 		    (u8)opt->val);
 		dent->file_type = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "filename")) {
+		if (!opt->str) {
+			ERR_MSG("option str is needed\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		namecap = ALIGN_UP(le16_to_cpu(dent->name_len), F2FS_SLOT_LEN);
+		namelen = strlen(opt->str);
+		if (namelen > namecap || namelen > F2FS_NAME_LEN) {
+			ERR_MSG("option str too long\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		name = (char *)d.filename[slot];
+		MSG(0, "Info: inject dentry filename of nid %u: "
+		    "%.*s -> %s\n", opt->nid, le16_to_cpu(dent->name_len),
+		    name, opt->str);
+		memcpy(name, opt->str, namelen);
+		MSG(0, "Info: inject dentry namelen of nid %u: "
+		    "%d -> %d\n", opt->nid, le16_to_cpu(dent->name_len),
+		    namelen);
+		dent->name_len = cpu_to_le16(namelen);
+		dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
+						IS_CASEFOLDED(inode),
+						(unsigned char *)name,
+						namelen);
+		MSG(0, "Info: inject dentry d_hash of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
+		    dentry_hash);
+		dent->hash_code = cpu_to_le32(dentry_hash);
 	} else {
 		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
 		ret = -EINVAL;
diff --git a/fsck/inject.h b/fsck/inject.h
index 43c21b56a7eb..706a211bc645 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -30,6 +30,7 @@ struct inject_option {
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
+	int dots;		/* . or .. dentry */
 	bool ssa;
 	bool node;
 	bool dent;
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 15f77d076e3c..1fb7328c8c69 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -217,7 +217,14 @@ inode i_nid array specified by \fIidx\fP.
 .RE
 .TP
 .BI \-\-dent
-Inject dentry block or dir entry specified \fInid\fP.
+Inject dentry block or dir entry specified by \fInid\fP.
+.RS 1.2i
+.TP
+.BI \-\-dots " 1 or 2"
+The option means the "." or ".." directory entry of \fInid\fP is going to be injected.
+.RE
+.TP
+.BI ""
 The available \fImb\fP of \fIdent\fP are:
 .RS 1.2i
 .TP
@@ -232,6 +239,9 @@ dentry ino.
 .TP
 .BI d_ftype
 dentry ftype.
+.TP
+.BI filename
+dentry filename, and corresponding d_hash and namelen are updated implicitly.
 .RE
 .TP
 .BI \-\-dry\-run
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
