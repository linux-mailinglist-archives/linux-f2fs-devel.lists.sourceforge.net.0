Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE16603142
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 19:00:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okpxE-0006rN-0N;
	Tue, 18 Oct 2022 17:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1okpxC-0006rF-7s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 17:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wLtaH1AYltb6sVoVsKrg3UUMo7fbz4xDcrohkdzNMMQ=; b=Q5xNHRonIGTzBWyPGr26SI9bJ5
 VzgCVpySzmmPKnmFYJoxdoDkQEcf4JQl+RnrlXl03aiEFKa9W1v3+WTfeX2yFJmYb6pIPXvH3Prmc
 dZ7KVlfWb3LIJ/ayymKrzVaolqpdrNh1bG5x5W/TlToN3y12AVe0WuPioDwJPrSAOaSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wLtaH1AYltb6sVoVsKrg3UUMo7fbz4xDcrohkdzNMMQ=; b=g
 n+d78DMK8I68ftQpX46DwwQF5tKrTHG7Ft8tKdSWbg4kOdSrdavJHqx4FdpTx1boCuoukg+wS7Ztm
 PoU0e9cVd+emFrpgIMj8z9uHZenZZ/qLYRCuwrKH3iXNLt/dI0H9kqqsJDHv/9x2KJizQAYjHQwxP
 LoTdvZstiEoHlJtw=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okpxA-008bxc-Go for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 17:00:34 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso17972202pjf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Oct 2022 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wLtaH1AYltb6sVoVsKrg3UUMo7fbz4xDcrohkdzNMMQ=;
 b=FHM4oKzsRWWTak3Lk2SX+kT1E72HcBSfxmQct9wf42qL1p2yVlEej21iSp4w+99xiF
 tqVxXazzZaf9nsyYYolrLbDKrD6uyzgvzs0QeddtBEKGCsajo4R4q3fOLFx3Nu6U5aPH
 i4wiojsSAh+vSP+77e4eomEDkm26s+FrJU5yd7ejeEyQCuvVAW/dguOvej9d2gU/V/Ia
 YctjH9CpWwp/gN/4nnxacAzaSzNL151EZPqAAxK4pKvtKBbGYmekjzU90PikMjHEhIg9
 2NFvh96hs3wx9roaQOi1Qnn05KzvG5Zh5lCc6dx+73qwgqmeI0e/wAGvU268LrjV2E0G
 UbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLtaH1AYltb6sVoVsKrg3UUMo7fbz4xDcrohkdzNMMQ=;
 b=PooOuBtus1rUlU7mgS5iRQRtoFBmHKVrql04XZTf/PgARo5NxYvtOUvZZIhRnPUzKY
 H5M+Ramjfe+f+ROrbEqp5Wl82D4LM6gWr5CZJmeGjdJUGNGME0BzXSBwtJkFAkTUnXxz
 wtWXQnw9oFLf0A8Or4ArXBcs+Iv0b7aiJ47iQENDF42HtBox49Viv1CT41OaQZcTYrtD
 VUVh2kGGrzpiCXN6/S6+QIrMzxrjB1Q6gV4Jiy+igkrHBIAhzJ5Vk/QPp1Td5iYKYG8Z
 SGip4IhWXoGdcYgIhhJUK9O2suIohvAUhI0GOJe8vMrAES1SWT2QRWlTPHyV0Qn+aBks
 s+Hg==
X-Gm-Message-State: ACrzQf0cA89iAAksocKARYKS4r091VEBZQO4ZXuoHmI40wyvO815Zm0J
 0bWxOkvDMfjhBiNjIzsFSXIdt788XtI=
X-Google-Smtp-Source: AMsMyM5XXIfUiJh4qYd/pI/1JWeakOnLsBWIuvXEuZDK8yTUoXjXJhloYv28EKIhSPui5+vX6VLBBw==
X-Received: by 2002:a17:90b:4f4d:b0:20d:a08e:3876 with SMTP id
 pj13-20020a17090b4f4d00b0020da08e3876mr34584399pjb.0.1666112426711; 
 Tue, 18 Oct 2022 10:00:26 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:4968:cc70:9889:c198])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a170902d54a00b00172951ddb12sm8951375plf.42.2022.10.18.10.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 10:00:26 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 18 Oct 2022 10:00:16 -0700
Message-Id: <20221018170017.672824-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong We need to make sure i_size doesn't change
 until atomic write commit is successful and restore it when commit is failed.
 Signed-off-by: Daeho Jeong --- v5: prevent only i_size update for atomic
 files when dirtying inode v4: move i_size update after clearing atomic file
 flag in f2fs_abort_atomic_write() v3: make sure i [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okpxA-008bxc-Go
Subject: [f2fs-dev] [PATCH v5 1/2] f2fs: correct i_size change for atomic
 writes
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

We need to make sure i_size doesn't change until atomic write commit is
successful and restore it when commit is failed.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v5: prevent only i_size update for atomic files when dirtying inode
v4: move i_size update after clearing atomic file flag in
    f2fs_abort_atomic_write()
v3: make sure inode is clean while atomic writing
---
 fs/f2fs/f2fs.h    |  8 ++++++++
 fs/f2fs/file.c    | 18 +++++++++++-------
 fs/f2fs/inode.c   |  5 ++++-
 fs/f2fs/segment.c | 14 ++++++++++----
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e7e750e6b332..68d2a3383c38 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -764,6 +764,7 @@ enum {
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
+	FI_ATOMIC_COMMIT,	/* indicate atomic commit completed except disk sync */
 	FI_MAX,			/* max flag, never be used */
 };
 
@@ -822,6 +823,7 @@ struct f2fs_inode_info {
 	unsigned int i_cluster_size;		/* cluster size */
 
 	unsigned int atomic_write_cnt;
+	loff_t original_i_size;		/* original i_size before atomic write */
 };
 
 static inline void get_extent_info(struct extent_info *ext,
@@ -3072,6 +3074,8 @@ static inline void f2fs_i_blocks_write(struct inode *inode,
 		set_inode_flag(inode, FI_AUTO_RECOVER);
 }
 
+static inline bool f2fs_is_atomic_file(struct inode *inode);
+
 static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
 {
 	bool clean = !is_inode_flag_set(inode, FI_DIRTY_INODE);
@@ -3081,6 +3085,10 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
 		return;
 
 	i_size_write(inode, i_size);
+
+	if (f2fs_is_atomic_file(inode))
+		return;
+
 	f2fs_mark_inode_dirty_sync(inode, true);
 	if (clean || recover)
 		set_inode_flag(inode, FI_AUTO_RECOVER);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ec9ee0f6d502..7ce629c95f4a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1991,6 +1991,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct inode *pinode;
+	loff_t isize;
 	int ret;
 
 	if (!inode_owner_or_capable(mnt_userns, inode))
@@ -2049,7 +2050,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 		goto out;
 	}
-	f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
+
+	f2fs_write_inode(inode, NULL);
+
+	isize = i_size_read(inode);
+	fi->original_i_size = isize;
+	f2fs_i_size_write(fi->cow_inode, isize);
 
 	stat_inc_atomic_inode(inode);
 
@@ -2087,16 +2093,14 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 
 	if (f2fs_is_atomic_file(inode)) {
 		ret = f2fs_commit_atomic_write(inode);
-		if (ret)
-			goto unlock_out;
-
-		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 		if (!ret)
-			f2fs_abort_atomic_write(inode, false);
+			ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
+
+		f2fs_abort_atomic_write(inode, ret);
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
-unlock_out:
+
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 	return ret;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9f0d3864d9f1..044f132b87bc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -621,9 +621,12 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 	ri->i_uid = cpu_to_le32(i_uid_read(inode));
 	ri->i_gid = cpu_to_le32(i_gid_read(inode));
 	ri->i_links = cpu_to_le32(inode->i_nlink);
-	ri->i_size = cpu_to_le64(i_size_read(inode));
 	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
 
+	if (!f2fs_is_atomic_file(inode) ||
+			is_inode_flag_set(inode, FI_ATOMIC_COMMIT))
+		ri->i_size = cpu_to_le64(i_size_read(inode));
+
 	if (et) {
 		read_lock(&et->lock);
 		set_raw_extent(&et->largest, &ri->i_ext);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 289bcb7ca300..264b4e352319 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -192,14 +192,18 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	if (!f2fs_is_atomic_file(inode))
 		return;
 
-	if (clean)
-		truncate_inode_pages_final(inode->i_mapping);
 	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
 	iput(fi->cow_inode);
 	fi->cow_inode = NULL;
 	release_atomic_write_cnt(inode);
+	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
 	stat_dec_atomic_inode(inode);
+
+	if (clean) {
+		truncate_inode_pages_final(inode->i_mapping);
+		f2fs_i_size_write(inode, fi->original_i_size);
+	}
 }
 
 static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
@@ -335,10 +339,12 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 	}
 
 out:
-	if (ret)
+	if (ret) {
 		sbi->revoked_atomic_block += fi->atomic_write_cnt;
-	else
+	} else {
 		sbi->committed_atomic_block += fi->atomic_write_cnt;
+		set_inode_flag(inode, FI_ATOMIC_COMMIT);
+	}
 
 	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
 
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
