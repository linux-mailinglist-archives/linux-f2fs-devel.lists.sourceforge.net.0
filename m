Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8D0CEC0B2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Dec 2025 14:55:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxUIgFe+HIZtzuJ+1WARA2HUXdI1gOVgFzPznHNJcRw=; b=g1iCVMxO8YaxfKTP9Ed+mGDa4j
	KUouRKK5dyS9l8xT1XdVqNWMV/O6pbTAbV20IOXgiUQoHL2r6lOW3PFiSYt9dNP5D0Piwm8BLYCih
	kGL/xhYJBQQL1MoraOI/zR1j8JFyJpJz/25hFkNVuX83a5elOGdaTIwUWWT3mMzvobLc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vawfM-00063A-0o;
	Wed, 31 Dec 2025 13:55:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty.pavel.devel@gmail.com>) id 1vawfL-000632-2q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 13:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=; b=jnSjsURRPuN+3Lsh2xwDUPvGlv
 DUFgSRnWt7sP973I7R+hjMWWkvmkGLu42CO6Yj/ohVv+l9pfeEgwNnw33BdjK6SC+XgeY/W/NQfR9
 D6qaoJdb426yifaP5vTpPUdenKriemsTtGOL9rkV6L7Gx7UBZM0liLzTJa1Es7UbYSoY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=; b=R
 MnyWuU1wEKWBMkYutgM9j1esQ+3SE8Wm5LCy8LF0dXz4uBmoZOkRk1837HJwrGMJmA5j+QaGICfky
 +AZwnJeQuRz6L5MTtdiOv7GLuCe3+/cdrVXr6RAnCsBVBs+vpLsfOWObjI+9ErvDAi2hkCP7CiYbD
 EeoKWywGbeRyVg+0=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vawfK-0002sB-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 13:55:07 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso11114761b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Dec 2025 05:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767189301; x=1767794101; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=;
 b=M7Bo3ggkqHHdIVfoFF3WEtXDYvY811Z6y8OH3BaLUw8dow5LYeFqfoa3DTZXtqA6hQ
 n6uL/eV/1hh/mxzvluznngxNkhWJtYTljfWia/A9ZDZGbuhlSuAtRW06xt6IQkFbJVkM
 ZIeGlsX7fGwLX403YPCmxzrsCuFI1E9h9VRQjnJ7JifVDVXA1u/X6Us/79S82cCh0Mxk
 uZFvJHXOCKlrZrzIJKSkkNzz02ZavNp44PF7uyRNVVOeispKMFjprsoZMZJdmBbynE3z
 EDPlEB5BvZOaiWAl7uVFuDQfsUdTIh6lnrvMeLElOJ7uS8XVCm+QVTCloKbzZPHi6PIl
 Ih7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767189301; x=1767794101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=;
 b=eDABPlbG35s0ewHsrfXieXIvDJJLrOx2myDU+4CRv+yFGsrc+yrjEZUIOnbfgd3bg0
 Pjamlc5+exj2YUDx7M3/51/xkobJT4VcNbquhE03DuL5dCgaQXijmHiXwVj7BJGa7R+b
 nQCQJh0Wh6trPWtGVJYBjK1vg7WwotW2RmQqCyVgLucGBoPs/zOVwbEtBeZ4kK7d+nvl
 bemanuI9BiWu8pTjEqyX+cmhdcZnlh1zG4KRZVniDP9AXPpuDD7J2MoUhOt36i7+jRqE
 m8FvT861pjQIvxOdFK4Q+cfKvnRnXHl3QDXJT0pGqwvEHEm3puK99LeaqB22eFpkPJCv
 r2rQ==
X-Gm-Message-State: AOJu0YyDdxI2x9FajJlFB0Vd7hGx29sxp9QfWuw92ZQkeFr110jiwhhN
 FeAC5c+bO7CkCfppM/ONxxRgkkm16vqMoDyaCN1Om4QEf3qghvDligIG
X-Gm-Gg: AY/fxX4vysC5LeJYgmyDPux1o0ZQ12uJMpgbWEDNXF4LudrkrpmG8N14Jy/WQsBhMEC
 ZmlGFHxIxFl8iHzvW45VOp5PjciY3bv+pqD5Mtbz4D+c2m3Z6/UTOcJYOmrDtJZ20+OimaLpa79
 mDZYn2QYEjO/sf/P3/Nqlt2dVf7CIrtrHQswC9zzDng/YZjorctqJtP2Fplc/ZOk7GM91W6YQi4
 Lm9nPl7Yv4gT6UImtZ+t0wWBUOPsU28+mCRKRqg2iO1SodDqz8Qn4jLkylmMLoblvfyBXD1FtaI
 IglvXFk3pu/fFi37sHyFS2wGLqST+0TFMtDbTODoaxkxKW8l2qE+PWi0i6hcIlwZjcc9bcCXWLo
 iCzCS9aNIBXeV6/MbT3gbu8+DHe73YANXR1175f729Y3nnBH+8ERW7+TrH41vzv/oVdoRFj1Fwp
 TRlSOF834roWiQ2hQjU4LfTBLPYjLqb4JPyDcrhEpUKfyM2S5LaHzF8m2sOyP8CdTD
X-Google-Smtp-Source: AGHT+IFw1K/LGRk2Ur3zafI88rjyiChdjECw35Gc3+cO2B8QCAgQylk74kdiLc5TRoKY8okNEzKXtA==
X-Received: by 2002:a05:6a00:4396:b0:781:16de:cc1a with SMTP id
 d2e1a72fcca58-7ff6607b421mr28364081b3a.32.1767189300852; 
 Wed, 31 Dec 2025 05:55:00 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e48e1d6sm32666424b3a.53.2025.12.31.05.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 05:54:59 -0800 (PST)
From: Yongpeng Yang <monty.pavel.devel@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 31 Dec 2025 21:54:33 +0800
Message-ID: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang Some f2fs sysfs attributes suffer from
 out-of-bounds memory access and incorrect handling of integer values whose
 size is not 4 bytes. For example: vm:~# echo 65537 >
 /sys/fs/f2fs/vde/gc_pin_file_thresh
 vm:~# cat /sys/fs/f2fs/vde/gc_pin_file_thresh 65537 vm:~# echo 4294967297
 > /sys/fs/f2fs/vde/atgc_age_threshold vm:~# cat /sys/fs/f2 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty.pavel.devel(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vawfK-0002sB-Jb
Subject: [f2fs-dev] [PATCH RESEND 1/2] f2fs: fix out-of-bounds access in
 sysfs attribute read/write
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Some f2fs sysfs attributes suffer from out-of-bounds memory access and
incorrect handling of integer values whose size is not 4 bytes.

For example:
vm:~# echo 65537 > /sys/fs/f2fs/vde/gc_pin_file_thresh
vm:~# cat /sys/fs/f2fs/vde/gc_pin_file_thresh
65537
vm:~# echo 4294967297 > /sys/fs/f2fs/vde/atgc_age_threshold
vm:~# cat /sys/fs/f2fs/vde/atgc_age_threshold
1

gc_pin_file_thresh maps to {struct f2fs_sb_info}->gc_pin_file_threshold,
which is a 16-bit integer. However, the sysfs interface allows setting
it to a value larger than SHRT_MAX, resulting in an out-of-range update.

atgc_age_threshold maps to {struct atgc_management}->age_threshold,
which is a 64-bit integer, but its sysfs interface cannot correctly set
values larger than UINT_MAX.

The root causes are:
1. __sbi_store() treats all default values as unsigned int, which
prevents updating integers larger than 4 bytes and causes out-of-bounds
writes for integers smaller than 4 bytes.

2. f2fs_sbi_show() also assumes all default values are unsigned int,
leading to out-of-bounds reads and incorrect access to integers larger
than 4 bytes.

This patch introduces {struct f2fs_attr}->size to record the actual size
of the integer associated with each sysfs attribute. With this
information, sysfs read and write operations can correctly access and
update values according to their real data size, avoiding memory
corruption and truncation.

Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/sysfs.c | 60 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c42f4f979d13..e6a98ddd73b3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -58,6 +58,7 @@ struct f2fs_attr {
 			 const char *buf, size_t len);
 	int struct_type;
 	int offset;
+	int size;
 	int id;
 };
 
@@ -344,11 +345,30 @@ static ssize_t main_blkaddr_show(struct f2fs_attr *a,
 			(unsigned long long)MAIN_BLKADDR(sbi));
 }
 
+static ssize_t __sbi_show_value(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf,
+		unsigned char *value)
+{
+	switch (a->size) {
+	case 1:
+		return sysfs_emit(buf, "%u\n", *(u8 *)value);
+	case 2:
+		return sysfs_emit(buf, "%u\n", *(u16 *)value);
+	case 4:
+		return sysfs_emit(buf, "%u\n", *(u32 *)value);
+	case 8:
+		return sysfs_emit(buf, "%llu\n", *(u64 *)value);
+	default:
+		f2fs_bug_on(sbi, 1);
+		return sysfs_emit(buf,
+				"show sysfs node value with wrong type\n");
+	}
+}
+
 static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 			struct f2fs_sb_info *sbi, char *buf)
 {
 	unsigned char *ptr = NULL;
-	unsigned int *ui;
 
 	ptr = __struct_ptr(sbi, a->struct_type);
 	if (!ptr)
@@ -428,9 +448,30 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 				atomic_read(&sbi->cp_call_count[BACKGROUND]));
 #endif
 
-	ui = (unsigned int *)(ptr + a->offset);
+	return __sbi_show_value(a, sbi, buf, ptr + a->offset);
+}
 
-	return sysfs_emit(buf, "%u\n", *ui);
+static void __sbi_store_value(struct f2fs_attr *a,
+			struct f2fs_sb_info *sbi,
+			unsigned char *ui, unsigned long value)
+{
+	switch (a->size) {
+	case 1:
+		*(u8 *)ui = value;
+		break;
+	case 2:
+		*(u16 *)ui = value;
+		break;
+	case 4:
+		*(u32 *)ui = value;
+		break;
+	case 8:
+		*(u64 *)ui = value;
+		break;
+	default:
+		f2fs_bug_on(sbi, 1);
+		f2fs_err(sbi, "store sysfs node value with wrong type");
+	}
 }
 
 static ssize_t __sbi_store(struct f2fs_attr *a,
@@ -906,7 +947,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-	*ui = (unsigned int)t;
+	__sbi_store_value(a, sbi, ptr + a->offset, t);
 
 	return count;
 }
@@ -1053,24 +1094,27 @@ static struct f2fs_attr f2fs_attr_sb_##_name = {		\
 	.id	= F2FS_FEATURE_##_feat,				\
 }
 
-#define F2FS_ATTR_OFFSET(_struct_type, _name, _mode, _show, _store, _offset) \
+#define F2FS_ATTR_OFFSET(_struct_type, _name, _mode, _show, _store, _offset, _size) \
 static struct f2fs_attr f2fs_attr_##_name = {			\
 	.attr = {.name = __stringify(_name), .mode = _mode },	\
 	.show	= _show,					\
 	.store	= _store,					\
 	.struct_type = _struct_type,				\
-	.offset = _offset					\
+	.offset = _offset,					\
+	.size = _size						\
 }
 
 #define F2FS_RO_ATTR(struct_type, struct_name, name, elname)	\
 	F2FS_ATTR_OFFSET(struct_type, name, 0444,		\
 		f2fs_sbi_show, NULL,				\
-		offsetof(struct struct_name, elname))
+		offsetof(struct struct_name, elname),		\
+		sizeof_field(struct struct_name, elname))
 
 #define F2FS_RW_ATTR(struct_type, struct_name, name, elname)	\
 	F2FS_ATTR_OFFSET(struct_type, name, 0644,		\
 		f2fs_sbi_show, f2fs_sbi_store,			\
-		offsetof(struct struct_name, elname))
+		offsetof(struct struct_name, elname),		\
+		sizeof_field(struct struct_name, elname))
 
 #define F2FS_GENERAL_RO_ATTR(name) \
 static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
