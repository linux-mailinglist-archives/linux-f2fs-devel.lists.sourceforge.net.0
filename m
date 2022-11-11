Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83754625FFB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 18:04:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otXS1-00056e-Gz;
	Fri, 11 Nov 2022 17:04:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1otXS0-00056Y-NJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X+70jSVesYOoVF/IXWRbdTauFYwEc+auPprGXRcR1ME=; b=YsZ/LwtZqSMAL7CoHfj9two/5x
 lBAskdYd5hIMzUZPLoyxI8dWAzaqCHUZcJKOYeXzMXTnoPZWtfOyXJ8UKJuNqcGzJvfnkwaIIcIs7
 k/5A2KQHcMU3kwyYs1h4OH5OufjfzzmunqaNQKO58bU/PV1Ln+U9mPHHHuAiJq/ZuMW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=X+70jSVesYOoVF/IXWRbdTauFYwEc+auPprGXRcR1ME=; b=W
 BlEfC1dWrUxwJ2bau/qi0WK+GsoaanWihZH1ai14U1W/8XMoT9CyNdAvFY0iPhbaFLsnhCFNEDhZV
 kn+Pbs5swkEgNEdvT51A/97tARt9sxyc24lqjOqWViWGDCyJjyY+SrcbdbEObL/zraGJptSReTinW
 pvmD4hzKYYCwORbs=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otXRx-004WE7-Cd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 17:04:20 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so8262710pji.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Nov 2022 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+70jSVesYOoVF/IXWRbdTauFYwEc+auPprGXRcR1ME=;
 b=KAC3sPvtwUWLqV/CfVyc/KAmjrnipAGbnAOsBQS9X3IONUNP7v8MHWFCegsozrwyQd
 s8xzCAVr8tkW+R6kIWfjdEfNiCy8XbLUUy6xtad3aLG4QUKwFYx9TrN36n/BfrSKIQYr
 Sn4oRStBtDbL8bBsmPaDZt0trwWwqAtHd+elpwnUMnfD9aSpOOWh1sQVGkbQF/2VP8cK
 nkyQJBw3mIS9iC9wn5uLTAmoOpnu9CAqw+fiNN2D2iUgWMwPqbciY1CId0SZkHEd+iRM
 TiLGTGy3Xhqz7en9VWJtO0i3LwO27oo0KZdUHMVoYtF6I0BSTbEkWXQcVxBJ8tPnvS1E
 DJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+70jSVesYOoVF/IXWRbdTauFYwEc+auPprGXRcR1ME=;
 b=LcUjvZXBhudD+7sB9HvDyU3zqeKaqHcBh0gkCV8SOGCm5++DT66QHPAkaKnu6kzmnN
 j7x4LLVbSt4juLBsfNa5nNjUFO5uCbUoQ6DmrV1Kt2LF+ZscuXPCi9LVF26mRl4HcQn3
 rdffuHRVM51etWLFw5Ix6unMyVtD+hwdlegUE/8EOCZey63HEt+ueFbmnPD7xX9VHx/3
 pTJI7rb+UDxP2gxBDzN3fG6jSJRANaQkEspWSoHknp7kGvO0JQYYYRh0krB/5PITcFu7
 C9z3N7zH7dPrwA+NkE+4OC6HddBxpp8yUqEBJUmCh1SrwtT+EAPfbmI3wta+iv34ibOB
 N4BQ==
X-Gm-Message-State: ANoB5pnci+w8Tdd2O+oGREr56Z2KEHN3UMZE0wLa1WqyUOFthJDmezS/
 YVd96hXc6S0jDW4zqpuImIz5Kd9TuAw=
X-Google-Smtp-Source: AA0mqf4ZVUz5/qfpJXg1Ij+0V8wGCXqgIcWvPlOnlsFM7eFkJoaRLrLKFTErs3MmM+597hGv1c/lgQ==
X-Received: by 2002:a17:90a:4282:b0:212:f810:a846 with SMTP id
 p2-20020a17090a428200b00212f810a846mr2960405pjg.71.1668186250818; 
 Fri, 11 Nov 2022 09:04:10 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:b2f7:934a:d681:59d2])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a1709026f0900b001837463f654sm1926449plk.251.2022.11.11.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 09:04:10 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 11 Nov 2022 09:04:06 -0800
Message-Id: <20221111170406.1086745-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1otXRx-004WE7-Cd
Subject: [f2fs-dev] [PATCH v7] f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE
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
v7: changed where to clear FI_ATOMIC_REPLACE
    fixed tentative race condition in f2fs_ioc_start_atomic_write()
v3: move i_size change after setting atomic write flag
v2: add undefined ioctl number reported by <lkp@intel.com>
---
 fs/f2fs/data.c            |  3 +++
 fs/f2fs/f2fs.h            |  1 +
 fs/f2fs/file.c            | 21 +++++++++++++++------
 fs/f2fs/segment.c         | 13 ++++++++++++-
 include/uapi/linux/f2fs.h |  1 +
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5f895ddcd64a..bce4dcc3ad78 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3457,6 +3457,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	else if (*blk_addr != NULL_ADDR)
 		return 0;
 
+	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
+		goto reserve_block;
+
 	/* Look for the block in the original inode */
 	err = __find_data_block(inode, index, &ori_blk_addr);
 	if (err)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e29f9adf60ca..d513ecd17550 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -765,6 +765,7 @@ enum {
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
 	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
+	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7ce629c95f4a..f9a04f6d76cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1984,7 +1984,7 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
 	return put_user(inode->i_generation, (int __user *)arg);
 }
 
-static int f2fs_ioc_start_atomic_write(struct file *filp)
+static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 {
 	struct inode *inode = file_inode(filp);
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
@@ -2053,15 +2053,22 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	f2fs_write_inode(inode, NULL);
 
-	isize = i_size_read(inode);
-	fi->original_i_size = isize;
-	f2fs_i_size_write(fi->cow_inode, isize);
-
 	stat_inc_atomic_inode(inode);
 
 	set_inode_flag(inode, FI_ATOMIC_FILE);
 	set_inode_flag(fi->cow_inode, FI_COW_FILE);
 	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
+
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
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	f2fs_update_time(sbi, REQ_TIME);
@@ -4089,7 +4096,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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
index 9cbf88092c78..f2930fffbc7d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -197,6 +197,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	fi->cow_inode = NULL;
 	release_atomic_write_cnt(inode);
 	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
+	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
 	stat_dec_atomic_inode(inode);
 
@@ -261,14 +262,24 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
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
+	if (!revoke && truncate)
+		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
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
2.38.1.431.g37b22c650d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
