Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA7CEC01C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Dec 2025 14:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxUIgFe+HIZtzuJ+1WARA2HUXdI1gOVgFzPznHNJcRw=; b=etDONEZ5rl1jWV8PdgGtKwmlPn
	5+3uNwVWMurCMnL7QmnYQQ+Lbzr5QCqjIxuUq4yYay7ARXt82Thhmhi/mj74Bj1VTDMRVIomx2u4r
	Nv/taQQFXp8y7zdiy1Ccges1oLyWUbqRJvHUD6TWsREi2l2PYCzNjeHFWzR/G7m7Na5s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vavwZ-0004Ki-8W;
	Wed, 31 Dec 2025 13:08:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vavwX-0004Ka-8T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 13:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=; b=PxveQoSF+JrD2DTBgrsKJvWbNa
 pY4fQtrik3fmsgfmHtYkN152buix6VrYYoNrGYjEf0S5Sdz3XpxKz57zcv5c9ovaVq3XzZ/34jRLz
 usFFUr1AjElL1gln31vj0LC2qyrCNqqkV5EMmzteVVvTK0YLlmVobJsX0Vdq3ctJTwPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=; b=d
 ab+a7AVNJMf4q81yyyg2KWdBJ8cMtWgVuCSYFUU1qPimdSQNQSfHZVQ4vwLAPtKF5WFNBBCSrGRcR
 JUpe1JUOSeYcKd4GhWdAGeuNNnXktpWb9LTS/Y9DeDm5/LEw49SWPkxrBiq8INAcjbedW23rPzWGn
 TddoGfw9lWh9Pltc=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vavwW-0001Ex-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 13:08:49 +0000
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-29f0f875bc5so156713125ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Dec 2025 05:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767186523; x=1767791323; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=;
 b=G9Tw39CMRz7bHJ90mFRYVwul0XxhmRwsVuNGTVPQYs5N+s0AggclARhom+VhJGrcna
 VvumYPrzuKI2hbiTpT5liNCvwClKTXv3xfvdZoqhqi3AGg+gD4GZRB/5STkqWh8ecPZH
 i0aBV/zdVH5eIuAwuPUpI20aSb2VbYJPusTUFVbXI+YZCW14njE8TLcm0RSWpLKWGiYQ
 WT768xdRpptwn12lSSU5qacEKBwiu5FZyvya2tPbRhKWKHN0DhusyF5ov4ExLMon04P0
 Bv25mJ2PSzrVs0koIOow36y9/FBOGOOFJsyPMcxq6+xSEJJfHks/cJPSiAAYy/6RDyw5
 7CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767186523; x=1767791323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNJ9lfPTDhQFXfjulcebq5+HO4sGMvlVwodr+zhCb8U=;
 b=UaOwSkVmUfh4ksy4V1AM/qmrAA/SyTnPdql9N/n4jWgABAlW39OMI0+c+/Y6xDrvLz
 XkB1tJ1m52rUpLI6ZorrAiQfbxh9QxEXsLffiw87736HY+K5v4ckkYB00f/9cnuiVU4B
 +k9R/PxExroR7hRd3XJD5j+Yho8RmtJOV2He0eAczpW/MOhWnhGOZ2lSPTqJMcALAEFJ
 XBB1lAlpLP4CCN11PTc2HvCPISO0u5KljqlwvA3TRNqfuM4Pi+KuIapE7pVdwy8dRVqb
 nMpbR7kAh3Dqdx8RyvXzGrJqkm/Y/DxdYy4AHAfNazHwOsxrhxFcRIBhX61oa1v993el
 a8yw==
X-Gm-Message-State: AOJu0YyhPaRGsf/XUKuDy5cG80c/CgLpqMsU7ae90SYi8Bw7HeUiLPTv
 /hY7X5dLFqpkPa+NM5z5MQLPrTviosBMdVPDfRVf03FybivqYM4VBwiF
X-Gm-Gg: AY/fxX5NpCJC8u+5/xd2P88430qAfzLvWBoK+HiExe0tyDnH3VecoctdwsDtAcDaj8v
 6TNnc81ai7C61l/KKEfhzLSqSUHuYEmyWbt2ypq3NXSqfCUHQmOlBzKK3zzTJnHZRpP5QWmt/Cc
 O8jCFolIOe9KbbhDkprlS/5BVvpmev6XFw7ZCAiF4w8bB00vBkw2jhbZvXsCezcxXv2JhhKIvsV
 lqT2ORDVus/mwKJxTITwt3tklA/VBWCMlBMnyP8f4uk9NxqFLIs9rg0eXR6kisg935N8efuHonz
 nKdCkdecKFbdF4J94MW35VF9CG1qNWhEqJxrqmqwdaytdZU2ZM2NpKuTNSRdbiVkDMXVeSZUE/e
 u9fSzzesFFTI8cVKjDVhLV4IOM4sTpk64ZsQtjTRZSDhSYhkj63A01NSggv0jpTd2rMfIvRv//f
 sWMEbVLn8m+yOxEaqkb9Q3EBeXzqF15fmac3kMyFXxGJg2mnvhw7lqMJeISA==
X-Google-Smtp-Source: AGHT+IFQ0tsjLbtkRvRltT0hL17h+dUO51n+DeKHgFwrkx2D/zH3uRSXoIO3WJ8gRV+3ug8YzpaVhg==
X-Received: by 2002:a17:903:1a85:b0:2a0:acca:f3f2 with SMTP id
 d9443c01a7336-2a2f29370d3mr335486655ad.48.1767186522830; 
 Wed, 31 Dec 2025 05:08:42 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d5d6e4sm328202145ad.75.2025.12.31.05.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 05:08:42 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 31 Dec 2025 21:05:14 +0800
Message-ID: <20251231130514.1061051-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vavwW-0001Ex-Nm
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix out-of-bounds access in sysfs
 attribute read/write
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
