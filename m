Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA007A999B3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Apr 2025 22:50:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7h2x-00012u-8I;
	Wed, 23 Apr 2025 20:50:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1u7h2k-00012L-O5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 20:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fFkkPBXFFdFSrV74lL2RXijCFkxgTbW7EfheadDhMlM=; b=By4ZOxKk15ag9uT9On8uaZkKMa
 CF7R6j5sy0wyGG16T1uGQGjnd8JYCTU0jb35KAE2wFAeeYDS7BLf1MojJX5gZ1E/DSvdDJGv7t983
 y3sRPhfG46d13ropvkCjP2zvpyr/O6litrrbnpjE2zDxJ4VSm5xE+iv/jEhImwnXqboQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fFkkPBXFFdFSrV74lL2RXijCFkxgTbW7EfheadDhMlM=; b=M
 5lz7vcGwdlKxUsBQWPE2w0iWcrAsmwjK4emfP11CTN4xRqDnL6BAHqypq5bDq9MQCtH9oFvab7vm4
 sCCQKLtOsTHbDk38cq9QgAccJt+hNX9UkEh/NJQyZbv4I4qU+Zgb+pKXSUZpoqZcquisTEQkGmqbU
 rk5WIx0ThLiBcwEU=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u7h2V-0002zH-E7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Apr 2025 20:50:07 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so174023b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Apr 2025 13:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745441381; x=1746046181; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fFkkPBXFFdFSrV74lL2RXijCFkxgTbW7EfheadDhMlM=;
 b=LE1MtFav7W8O7PlAvFCSOgXssIWOV8gzcsBmf9bhr72F/GS7mcnXKaRz8aPAdlrSbC
 h8p5UgM+Pz0XvIyG0cr4iwaSBMvzX4eLzUjgMvzCGQylPmRY/AcSU0oa5E+VgIds4Xd6
 +Mu1Qho+Zjn5wnIDGI7k1cDgWinl70J3yhAp3kXNZReU5/VpuP48YjW7ot/Y3kpHYEiS
 vdP2crAKaRDMKRe4crp+6J5y6ax4RIMplsPZkxOwGjrvbFUYBKfVWPS6i4MxtTg3uGlG
 w8DapgPuCsWZz8tKey4hG87m5PU6PhgizcyqAUh/hIL/amYvet9lYlNpKnpuAoOBlSkz
 PEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745441381; x=1746046181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fFkkPBXFFdFSrV74lL2RXijCFkxgTbW7EfheadDhMlM=;
 b=RAsYwsoo+8mP7ctZEs5RMAWuRPTc6uQxOSGZ3te9EfzXqbn4h1cg5uC3B/ljilz2TG
 gplUJ4R0QcFx4oBv7Y2dLMPXrr9h9XxcxEh1z7PCAmPupnMFl6zLs4BHqqLTvXtMCeT/
 H0VOx7r731PyPoXXPUDAalJy4zaby8BjbGZNddqUzNpXGyCwKc1b1a0RjZNyImKDxfZY
 6T2qjV0wP7UcJtzN98D1R8D4qxRMqL1TeHz0jWsvQDOBkZeWOYbGm6JaKFJdvwiiFJF5
 yosOSYC2/QxAHDzY7tJ0Vb4iIHierrTQLcnl4RpUNEcYpZhdjvRvzsNuta449lTyzmCI
 z9aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvfvRcNWPkGBMERnIJmYWlQVMI1Yob4P2Bnjx6p7kzELA1MAukqN+3vh4Pc/ccIdBM3rJgPsCj12T67KhkIt7G@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzaPkZZwi+KEcOfQk5fE2qfH2f0wMzwM9agqTqlqiMZvAiHf1X9
 BlFOzG2/LAGbJtxebhK1n1lfBQESPxnnG/zqDEA1gGmVpYe+R1qI
X-Gm-Gg: ASbGnctmOshMcERS8lTj/Qy9frFSYjG430F8R+IbI/ovNF3zoFJoX156XAAacWz9NEf
 cOIkHsZiCiM2JNBrBJ5+ZkH3AirnSe77ThWjk6iqpxIonnJJLdlB2MYtfNiwBWwVmgvwfSsJBtP
 Cv/bUNI1CWuTyB3CNj6FlBj7WFJoNUpSl4LamtXsHHIY+9DZfa7nai3FpHs1Onp2WMX6GfcpeNw
 BaHfCTPIwKFrAHPq3oG+fWJaynH/TFq30tssdk4KECtNNrjbRKLQZu25JbNhThEmRaY0dWyp/Oz
 J55uv7yu9j/CYrcpoxqniTwZ3NGny2OKHiIim6UlwRs2k60bewaErwtFQiiSWYZryR4F56SKSIU
 18MxeCFdlJYnQYZWFO5Z0KWAkvxTnm5ag
X-Google-Smtp-Source: AGHT+IFwjUzOpbdI9GzZmAWxW0GeyrpeovFKMtz9ez3tSWXCTpH3YxHA3i6KQYceOr19FwuIGctLFw==
X-Received: by 2002:a05:6a00:3406:b0:732:5276:4ac9 with SMTP id
 d2e1a72fcca58-73e24606fedmr251754b3a.9.1745441380729; 
 Wed, 23 Apr 2025 13:49:40 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:7dbc:3d73:1245:bd40])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acaba0sm825b3a.169.2025.04.23.13.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 13:49:40 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 23 Apr 2025 13:49:34 -0700
Message-ID: <20250423204935.2335000-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In cases of removing memory donation, we
 need to handle some error cases like ENOENT and EACCES (indicating the range
 already has been donated). Signed-off-by: Daeho Jeong --- v2: use proper
 error code rename FI_DONATE_FINISHED and use it to fix race conditions ---
 fs/f2fs/f2fs.h | 1 + fs/f2fs/file.c | 23 ++++++++++++++++------- fs/f2fs/shri
 [...] Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.175 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.175 listed in bl.score.senderscore.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u7h2V-0002zH-E7
Subject: [f2fs-dev] [PATCH v2] f2fs: handle error cases of memory donation
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

In cases of removing memory donation, we need to handle some error cases
like ENOENT and EACCES (indicating the range already has been donated).

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: use proper error code
    rename FI_DONATE_FINISHED and use it to fix race conditions
---
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/file.c     | 23 ++++++++++++++++-------
 fs/f2fs/shrinker.c | 13 ++++++++++---
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..01ee8bbb5c84 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -821,6 +821,7 @@ enum {
 	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
+	FI_DONATE_FINISHED,	/* indicate page donation of file has been finished */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..61b88431fd43 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2464,19 +2464,20 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static void f2fs_keep_noreuse_range(struct inode *inode,
+static int f2fs_keep_noreuse_range(struct inode *inode,
 				loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 	u64 start, end;
+	int ret = 0;
 
 	if (!S_ISREG(inode->i_mode))
-		return;
+		return 0;
 
 	if (offset >= max_bytes || len > max_bytes ||
 	    (offset + len) > max_bytes)
-		return;
+		return 0;
 
 	start = offset >> PAGE_SHIFT;
 	end = DIV_ROUND_UP(offset + len, PAGE_SIZE);
@@ -2484,7 +2485,7 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 	inode_lock(inode);
 	if (f2fs_is_atomic_file(inode)) {
 		inode_unlock(inode);
-		return;
+		return 0;
 	}
 
 	spin_lock(&sbi->inode_lock[DONATE_INODE]);
@@ -2493,7 +2494,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_del_init(&F2FS_I(inode)->gdonate_list);
 			sbi->donate_files--;
-		}
+			if (is_inode_flag_set(inode, FI_DONATE_FINISHED))
+				ret = -EALREADY;
+			else
+				set_inode_flag(inode, FI_DONATE_FINISHED);
+		} else
+			ret = -ENOENT;
 	} else {
 		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_add_tail(&F2FS_I(inode)->gdonate_list,
@@ -2505,9 +2511,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		}
 		F2FS_I(inode)->donate_start = start;
 		F2FS_I(inode)->donate_end = end - 1;
+		clear_inode_flag(inode, FI_DONATE_FINISHED);
 	}
 	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
 	inode_unlock(inode);
+
+	return ret;
 }
 
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
@@ -5236,8 +5245,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 	     f2fs_compressed_file(inode)))
 		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
 	else if (advice == POSIX_FADV_NOREUSE)
-		f2fs_keep_noreuse_range(inode, offset, len);
-	return 0;
+		err = f2fs_keep_noreuse_range(inode, offset, len);
+	return err;
 }
 
 #ifdef CONFIG_COMPAT
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 9c8d3aee89af..b88babcf6ab4 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -184,10 +184,17 @@ static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
 		if (!inode)
 			continue;
 
-		len = fi->donate_end - fi->donate_start + 1;
-		npages = npages < len ? 0 : npages - len;
-		invalidate_inode_pages2_range(inode->i_mapping,
+		inode_lock(inode);
+		if (!is_inode_flag_set(inode, FI_DONATE_FINISHED)) {
+			len = fi->donate_end - fi->donate_start + 1;
+			npages = npages < len ? 0 : npages - len;
+
+			invalidate_inode_pages2_range(inode->i_mapping,
 					fi->donate_start, fi->donate_end);
+			set_inode_flag(inode, FI_DONATE_FINISHED);
+		}
+		inode_unlock(inode);
+
 		iput(inode);
 		cond_resched();
 	}
-- 
2.49.0.805.g082f7c87e0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
