Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 842159E4F11
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tJ6o9-0002yB-CC;
	Thu, 05 Dec 2024 08:01:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <panglu2022@gmail.com>) id 1tJ6o8-0002xe-Ie
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 08:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3eMlSAULgoo0XpQdaR1ooZz9GNiNy/RVWekpYrnkZv8=; b=FFrn6FpGxIda1rdQqtOplfEEdb
 iSGLnoL642jXn4kYwvwAeYIP5W6UZMUsDgyVJMvCddEOjJkqF2UYvHrwfKD93pyECxtIBxe77U8NF
 pxQV0yhsKbR7UzcsEUpEdegLU1/YFgDdXVYL5ExZ3211ebZ+s+Ura/TM5lcSAjfHH7fM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3eMlSAULgoo0XpQdaR1ooZz9GNiNy/RVWekpYrnkZv8=; b=C
 rHKKLHsepunX+Hl3KbmfO/8xKFsLV1IQugtEHuVqWbutUqMMFMcYZaI5t0Jys6WkkjSsReRMuMOJ1
 EPiZQjKww57szCSvvbw3jqnsUnBH/027gTQl6jO9SIcYPkbSS36n9ER1mj7x+u5VAQDb4sv24pUJi
 KB79XgFkOBnBsvZ4=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tJ6o8-0006fr-LO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 08:01:57 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7253bc4d25eso530593b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Dec 2024 00:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733385711; x=1733990511; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3eMlSAULgoo0XpQdaR1ooZz9GNiNy/RVWekpYrnkZv8=;
 b=lc+C2LvOy0MqnH7Sqp6smNlzgK7jSvE3JpFXastoziQTyfb88+I7B+ZwDZrYJlAv6T
 2VZsdXHa1ZDZ3fEHTpTQx9H3WpsJF3MTpwhC+EU//cCK3c6w+lDdQXSHfh+ufHp1O0eT
 njFIkcvJQYdLCqQ1B9rU6WoPKP7XE7XvoGkdw5Ompb39lQWDGZ8OLQwpdvCx/xEW4PRB
 24cauh7xBJafH0emKHruFXhNlRAhOvZ96Cee+wPloEG4oUJXRKdQxL3sB70RywLZLSZB
 4yC84lvVxc/Rzs4IwhCGm8TZRirJdAuK1kghehkoeGw4PMVBYoAfiw/Ix3q4vRNxzovz
 LSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733385711; x=1733990511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3eMlSAULgoo0XpQdaR1ooZz9GNiNy/RVWekpYrnkZv8=;
 b=XLsz2iC5OxB1UiDd/E1L/b4R1ETaV0ZYmWbhxNX4pTcIrY72QVm89JfkTxXB8JgmYw
 rjCbhVW0eGSibL7acP6C3mVgRC4Oabi5YwuD9IAbcJ4/4cJ2abrpO22A7RtnTA7RYpZt
 UMTPPndkgxfv10TlG5vroI5gyIOJMsmCabxsvvZ/Ac7yagvwI6JJ5rPmzmqS4QCbwuMd
 r8P1qCB5ChRINmbU9e2oFlLt6FMtxEJfujdhj0SSIjw723Xf3BKisGxecr8AZZBqwzOR
 tDex3ocaKZFDStkev6XC8eutVyBMjbM8Zdi03VkiWb0VVeTaaIW9rhGSMwWRqGrdrl6t
 HcXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU++s6l3AR4+jNAZf5zTwoRgv0rQc+/a+rV78/s8uOwMexrk3HfYqr/zpNrzMU3/r4y/Uflq9G4Zki7drQkCX4Q@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw9TZoSf/+TlsVRY5t3t9E+gHZGZR0LE81UyyeqE9rg1ri2sOyJ
 EzKrlS3QN589Y5ZCED7Ie0cLDux1rGvLU9me28dwz2/kappwyCyV9KLWALnH
X-Gm-Gg: ASbGncv/7gnho+QkVD2BVOwy4TdAt0lmVikgzionzxUemxgkP4vLENXqp51hLRUkHnZ
 LmOOAmopA+NXjk7OeemPJE62iAgBuqqOFOfIblPf4K9DBCXKAgsZ5iypoGRwc83Ytu/qDMvnSZz
 t28PfRXEmWOZzXdVtTTOPz4ecisKlXULoezCZ2bKNUzW9uLdbXf54CihLeyzjaaH1WVZJwM7yFp
 fKptNGbsGoXxf0jcRdj7GjfK1rYfNkny6JpyzC1+HxqqJIgG1nDieGm7g4E11w7En6kPPVSrIWr
 Dc4cw4RGTpJZ5MzIJEQUgaMo/u8=
X-Google-Smtp-Source: AGHT+IHh8bvZGQKYeDY1Ysj24MvCSDYgu0i6OSK1z8Z7lj7NwI5NsQCHyiOBZ5KenIFigQOx1PyEng==
X-Received: by 2002:a17:902:ec88:b0:215:a034:3bae with SMTP id
 d9443c01a7336-215f3ca19fdmr34292605ad.18.1733385710773; 
 Thu, 05 Dec 2024 00:01:50 -0800 (PST)
Received: from lu-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn
 ([43.224.245.228]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8e61ef7sm7177905ad.95.2024.12.05.00.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 00:01:50 -0800 (PST)
From: Lu Pang <panglu2022@gmail.com>
To: chao@kernel.org
Date: Thu,  5 Dec 2024 16:01:08 +0800
Message-ID: <20241205080109.43552-1-panglu2022@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Most of read() and write() are performed with lseek(),
 combining
 two operations into one can slightly improve the performance. Signed-off-by:
 Lu Pang --- lib/libf2fs_io.c | 22 +++++ 1 file changed, 5 insertions(+),
 17 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [panglu2022[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.169 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.169 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [panglu2022[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tJ6o8-0006fr-LO
Subject: [f2fs-dev] [PATCH] libf2fs_io: change lseek & read/write to
 pread/pwrite
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
Cc: Lu Pang <panglu2022@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Most of read() and write() are performed with lseek(),
combining two operations into one can slightly improve the performance.

Signed-off-by: Lu Pang <panglu2022@gmail.com>
---
 lib/libf2fs_io.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 520ae03..6388ace 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -279,11 +279,7 @@ static int dcache_io_read(long entry, __u64 offset, off_t blk)
 	if (fd < 0)
 		return fd;
 
-	if (lseek(fd, offset, SEEK_SET) < 0) {
-		MSG(0, "\n lseek fail.\n");
-		return -1;
-	}
-	if (read(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE) < 0) {
+	if (pread(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE, (off_t)offset) < 0) {
 		MSG(0, "\n read() fail.\n");
 		return -1;
 	}
@@ -393,9 +389,7 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
 {
 	if (c.sparse_mode)
 		return 0;
-	if (lseek(c.kd, (off_t)offset, SEEK_SET) < 0)
-		return -1;
-	if (read(c.kd, buf, len) < 0)
+	if (pread(c.kd, buf, len, (off_t)offset) < 0)
 		return -1;
 	return 0;
 }
@@ -535,9 +529,7 @@ int dev_read(void *buf, __u64 offset, size_t len)
 	fd = __get_device_fd(&offset);
 	if (fd < 0)
 		return fd;
-	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
-		return -1;
-	if (read(fd, buf, len) < 0)
+	if (pread(fd, buf, len, (off_t)offset) < 0)
 		return -1;
 	return 0;
 }
@@ -615,8 +607,6 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
 	if (fd < 0)
 		return fd;
 
-	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
-		return -1;
 
 #if ! defined(__MINGW32__)
 	if (c.need_whint && (c.whint != whint)) {
@@ -629,7 +619,7 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
 	}
 #endif
 
-	if (write(fd, buf, len) < 0)
+	if (pwrite(fd, buf, len, (off_t)offset) < 0)
 		return -1;
 
 	c.need_fsync = true;
@@ -663,9 +653,7 @@ int dev_write_block(void *buf, __u64 blk_addr, enum rw_hint whint)
 
 int dev_write_dump(void *buf, __u64 offset, size_t len)
 {
-	if (lseek(c.dump_fd, (off_t)offset, SEEK_SET) < 0)
-		return -1;
-	if (write(c.dump_fd, buf, len) < 0)
+	if (pwrite(c.dump_fd, buf, len, (off_t)offset) < 0)
 		return -1;
 	return 0;
 }
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
