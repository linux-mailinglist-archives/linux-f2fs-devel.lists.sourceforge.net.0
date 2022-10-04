Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F875F481A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Oct 2022 19:14:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oflUS-0002My-PL;
	Tue, 04 Oct 2022 17:14:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oflUR-0002Mr-3Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 17:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TR19ErKJDLX3klMzWsPtAp4FJxjfq89DPkRaUC4/w+k=; b=PVS/11kfpFSHjEXCTY1awRuJAH
 vElJTN7K2DXKm0HKbU+RedWcbFACQEHpJNET5FglT6rCEVwqap0veYl3EOp5k+JE7P7f8jB5p7xXf
 PuLxM9Ik8es+cRMMIpBU8/wZ3DobUQJeFFS6bFd50IaeZwuJgrTOtUv9G3LhqWjw6mK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TR19ErKJDLX3klMzWsPtAp4FJxjfq89DPkRaUC4/w+k=; b=P4bDUoM1iNzHesRB1ed0BcElmR
 oqWQJ+ZxloGypkX25LcvGLR/N7wjez87SoroUW0KijBmyR1Xg27KZrQekPyuBCWCHrV8vvjpqf307
 LmJr69BfPW4ZM/Wivch6pW90C+sUUQD5uQz0jytejoA40KtNTFFwzchl2TpAK/gQaKGg=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oflUd-0007Z1-2v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Oct 2022 17:14:07 +0000
Received: by mail-pl1-f174.google.com with SMTP id d24so13213921pls.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Oct 2022 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TR19ErKJDLX3klMzWsPtAp4FJxjfq89DPkRaUC4/w+k=;
 b=DEHpmf1sd2XqvwkfLMcqkDucCoP0pV4XqvkpBJzOj0ETtG7DmeRoTYh1u1Sthrxbd9
 57xk0Yu2LWut/tZV2c1dPxVgpiVu0fBOocIvx+dlAeTiNJAEcuFN41R3EsnWmpl5jPpT
 NQagkZGx4UT8rvuAlmvvgFclT72bZYXPAEzKEKfW2VFUwvwaQAg4Sl7Ht20NcY0ST76/
 731S17/FHSB6vZE05CB+715uxe2uQv350gEZ6Gw/qS2nWCdoueCbF4A3mz2WakSFxgmq
 J/wCmPnMVftkOaWlTS5YJ0hudCVFpxiI56rTC6Uo0hTX7M/l11MjETdr7BNVTHrccNf0
 tg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TR19ErKJDLX3klMzWsPtAp4FJxjfq89DPkRaUC4/w+k=;
 b=d7teUTQunEdSNc61JWqrLmgCcJSiZFG3VcZH5dR0lmukCZ1z0nQPJNXV/za/bCd9dH
 HzIqkPOcJreQpbVNo0TXyCc+fmiKpG/nHLSjpqYetcxMhbuBy2F63TQMEmcKBPAgRsVx
 Ac8avwcU8bAZxCLBjie1n98CQYEiMaKHtNU2PQZcKDoQ6K//9mdY3+11QCEZmXc/2vPa
 WCnKM6Nr+VtA72Iol8ON30n6d+gRMF/upT/5t6d2qf3xQeYM8SCNrnfBGruLXkNe1r63
 BRvJvSi8hws3RagkEs5dpI/Bt5NkuFbOn+40Gz1xJ3yTIrkSJYemUQleHODCOSs8A9M8
 oIzA==
X-Gm-Message-State: ACrzQf3S9Mkww889d4DHaj0nXvu08dIfvRMpW8m7b45HYbIW2aemmZXb
 kQ2Q2nn49g6qzdVYOYV2UwA=
X-Google-Smtp-Source: AMsMyM7pw0FqHYagTdz3fKUg+dKEMrgwILT7QtzExHkZ6BzcksH/GU8My/iMnR954Pqm8C2B/++UCQ==
X-Received: by 2002:a17:902:ebc7:b0:17e:7378:1da8 with SMTP id
 p7-20020a170902ebc700b0017e73781da8mr14408668plg.152.1664903641497; 
 Tue, 04 Oct 2022 10:14:01 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:9291:ff24:9df5:5be7])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a622942000000b00561c55c56a7sm1683693pfp.94.2022.10.04.10.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 10:14:00 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  4 Oct 2022 10:13:51 -0700
Message-Id: <20221004171351.3678194-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221004171351.3678194-1-daeho43@gmail.com>
References: <20221004171351.3678194-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong introduce a new ioctl to replace the whole
 content of a file atomically, which means it induces truncate and content
 update at the same time. We can start it with F2FS_IOC_START_ATOMIC_REPLACE
 and com [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oflUd-0007Z1-2v
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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

introduce a new ioctl to replace the whole content of a file atomically,
which means it induces truncate and content update at the same time.
We can start it with F2FS_IOC_START_ATOMIC_REPLACE and complete it with
F2FS_IOC_COMMIT_ATOMIC_WRITE. Or abort it with
F2FS_IOC_ABORT_ATOMIC_WRITE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v3: move i_size change after setting atomic write flag
v2: add undefined ioctl number reported by <lkp@intel.com>
---
 fs/f2fs/data.c            |  3 +++
 fs/f2fs/f2fs.h            |  1 +
 fs/f2fs/file.c            | 20 ++++++++++++++------
 fs/f2fs/segment.c         | 14 +++++++++++++-
 include/uapi/linux/f2fs.h |  1 +
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6cd29a575105..d3d32db3a25d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3438,6 +3438,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	else if (*blk_addr != NULL_ADDR)
 		return 0;
 
+	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
+		goto reserve_block;
+
 	/* Look for the block in the original inode */
 	err = __find_data_block(inode, index, &ori_blk_addr);
 	if (err)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 539da7f12cfc..2c49da12d6d8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -764,6 +764,7 @@ enum {
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
+	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce2336d2f688..66d62ea42c73 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1982,7 +1982,7 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
 	return put_user(inode->i_generation, (int __user *)arg);
 }
 
-static int f2fs_ioc_start_atomic_write(struct file *filp)
+static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 {
 	struct inode *inode = file_inode(filp);
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
@@ -2051,10 +2051,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	f2fs_write_inode(inode, NULL);
 
-	isize = i_size_read(inode);
-	fi->original_i_size = isize;
-	f2fs_i_size_write(fi->cow_inode, isize);
-
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
 	sbi->atomic_files++;
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
@@ -2064,6 +2060,16 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
+	isize = i_size_read(inode);
+	fi->original_i_size = isize;
+	if (truncate) {
+		set_inode_flag(inode, FI_ATOMIC_REPLACE);
+		truncate_inode_pages_final(inode->i_mapping);
+		f2fs_i_size_write(inode, 0);
+		isize = 0;
+	}
+	f2fs_i_size_write(fi->cow_inode, isize);
+
 	f2fs_update_time(sbi, REQ_TIME);
 	fi->atomic_write_task = current;
 	stat_update_max_atomic_write(inode);
@@ -4082,7 +4088,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FS_IOC_GETVERSION:
 		return f2fs_ioc_getversion(filp, arg);
 	case F2FS_IOC_START_ATOMIC_WRITE:
-		return f2fs_ioc_start_atomic_write(filp);
+		return f2fs_ioc_start_atomic_write(filp, false);
+	case F2FS_IOC_START_ATOMIC_REPLACE:
+		return f2fs_ioc_start_atomic_write(filp, true);
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
 		return f2fs_ioc_commit_atomic_write(filp);
 	case F2FS_IOC_ABORT_ATOMIC_WRITE:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index abb55cd418c1..e4f7efbdc027 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -264,14 +264,26 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 					bool revoke)
 {
 	struct revoke_entry *cur, *tmp;
+	pgoff_t start_index = 0;
+	bool truncate = is_inode_flag_set(inode, FI_ATOMIC_REPLACE);
 
 	list_for_each_entry_safe(cur, tmp, head, list) {
-		if (revoke)
+		if (revoke) {
 			__replace_atomic_write_block(inode, cur->index,
 						cur->old_addr, NULL, true);
+		} else if (truncate) {
+			f2fs_truncate_hole(inode, start_index, cur->index);
+			start_index = cur->index + 1;
+		}
+
 		list_del(&cur->list);
 		kmem_cache_free(revoke_entry_slab, cur);
 	}
+
+	if (!revoke && truncate) {
+		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
+		clear_inode_flag(inode, FI_ATOMIC_REPLACE);
+	}
 }
 
 static int __f2fs_commit_atomic_write(struct inode *inode)
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 3121d127d5aa..955d440be104 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -42,6 +42,7 @@
 						struct f2fs_comp_option)
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
+#define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.38.0.rc1.362.ged0d419d3c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
