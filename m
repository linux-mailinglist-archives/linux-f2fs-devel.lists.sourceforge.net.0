Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 681FC6688AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jan 2023 01:50:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pG8Gj-0000QV-3A;
	Fri, 13 Jan 2023 00:50:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pG8Gh-0000QN-GJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jan 2023 00:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0aOIcA4HY+kMmpBfAWn8xfATZOZpAZzf7hkPss2yBIk=; b=D+KzV4m5+AD/6CO54VSfYwPNaO
 PpqbvBAiB3LQs2SFsEr1qvQDG6Tz5soU0FM0avsfrYRlaoxOFFcp3RiCYFUhkUvbSakus9iPazSUs
 xZVvNLhQueNEAUctSBlg8zK93FQ/lk2YzRP/yHGXTIizY5CzjBG2ONwsUx09fB73j+UA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0aOIcA4HY+kMmpBfAWn8xfATZOZpAZzf7hkPss2yBIk=; b=U
 d1+QePTisQEDFfWyQU87Q6fR96F6PuKtJBWQSNA++QKaKNvWPplMYSSAhVHpodk8zH1kxPazelA+l
 tLHxWMzH9PJcK00UKoine43r4gR7LRV7WkmQ8C4a8oC97URa1pyXGcHD1EcIbASr2R3oaze/xBrGo
 D2ZxmpTQtGUIlqjk=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pG8Gc-0007J3-9z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jan 2023 00:50:02 +0000
Received: by mail-pf1-f175.google.com with SMTP id c26so10632082pfp.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jan 2023 16:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0aOIcA4HY+kMmpBfAWn8xfATZOZpAZzf7hkPss2yBIk=;
 b=cQZ3zGvcLBXrKfRU4C1sQ274E6wzURXM9trpqXGCKP9aC/5tAJT3OLT/w+ZMpC7xgK
 c6JWemKme9xsDnoavf/P9wmEh9ti9BucyQpYLgGJo1ERA0RLgc1FwjMDl9nOb8cY6pNG
 mEUUdqeU9sh95euoy0Nxfwf8Y6TXtdkMNe8SE/Y533fXfEf0sev7dntuHtPkupgsCj5D
 gVGoUe19IqU9WTtYqtBkTOgQ52vNOM+xkECEL5FAp5PCcu3Mf/uycnZG0PI6DYFMWYvM
 2eEB5sH/Y/juf6ZICJfWmFiqpSomof7VrOpjow4gmWsD6ChqNQCx/D8B8pLiBnSP6wBi
 thZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0aOIcA4HY+kMmpBfAWn8xfATZOZpAZzf7hkPss2yBIk=;
 b=tbmtcxRyI0pCyoZuPQYcKFlS6Rvi5BvKe8gVaLE+Qcp8a287mXJvt+QsN0tQlctKxE
 6phqp0UCKXzIX7y295Yqu/xYVLisQul75cs7lC7WEAvtWxGtwYkpDK7CEsjT/9bcYtgc
 zRiVXAw5SG+fSQEQD4Z7n8yy5d0VUlVaWpnUeCa8+R7sgo/yJeIDj1o7dpff2ak02ccq
 DusFBZZObKfCvlNkdGWBLW9KK8kIlS2Q/ebX33vGCKs1PQLx7HQx3H9fPL6fZfwlUB+0
 qJCxbVIxdS6BnutsXWr4PrqsUcNyextAu1yRkfQc2FtlJ3IjBNVeh0Te+wIGEEQyS2HL
 oeiA==
X-Gm-Message-State: AFqh2koII1WbWUuRfCjJ9t7iELi5qIGKa+S6/IB6mwuakJvZbd1mbs0f
 s4/Elkv38cUnAWvyjc0MWlDqNpBNlIs=
X-Google-Smtp-Source: AMrXdXvftwIOfFLuEPxagP/h1Q09IFACq7vTK8JKfxXE/i0Dwgmh3Ao+q+inJRXHJrFFcJbdngmpUA==
X-Received: by 2002:a05:6a00:130d:b0:580:fb8e:3044 with SMTP id
 j13-20020a056a00130d00b00580fb8e3044mr76639150pfu.22.1673570991526; 
 Thu, 12 Jan 2023 16:49:51 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:9cd1:e03e:3432:197d])
 by smtp.gmail.com with ESMTPSA id
 r21-20020aa79635000000b00580c0219f16sm12467614pfg.169.2023.01.12.16.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 16:49:50 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 12 Jan 2023 16:49:33 -0800
Message-Id: <20230113004933.2082072-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong To fix a race condition between atomic
 write
 aborts, I use the inode lock and make COW inode to be re-usable thoroughout
 the whole atomic file inode lifetime. Reported-by: 3db1de0e582c ("f2fs: change
 the current atomic write way") Signed-off-by: Daeho Jeong --- fs/f2fs/file.c
 | 43 ++++++++++++++++++++++++++++ fs/f2fs/inode.c | 11 ++++++++ [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1pG8Gc-0007J3-9z
Subject: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: Daeho Jeong <daehojeong@google.com>,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

To fix a race condition between atomic write aborts, I use the inode
lock and make COW inode to be re-usable thoroughout the whole
atomic file inode lifetime.

Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c    | 43 ++++++++++++++++++++++++++++---------------
 fs/f2fs/inode.c   | 11 +++++++++--
 fs/f2fs/segment.c |  3 ---
 fs/f2fs/super.c   |  2 --
 4 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ecbc8c135b49..ff072a9ed258 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1866,7 +1866,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
 			atomic_read(&inode->i_writecount) != 1)
 		return 0;
 
+	inode_lock(inode);
 	f2fs_abort_atomic_write(inode, true);
+	inode_unlock(inode);
+
 	return 0;
 }
 
@@ -1880,8 +1883,11 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	 * until all the writers close its file. Since this should be done
 	 * before dropping file lock, it needs to do in ->flush.
 	 */
-	if (F2FS_I(inode)->atomic_write_task == current)
+	if (F2FS_I(inode)->atomic_write_task == current) {
+		inode_lock(inode);
 		f2fs_abort_atomic_write(inode, true);
+		inode_unlock(inode);
+	}
 	return 0;
 }
 
@@ -2087,19 +2093,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		goto out;
 	}
 
-	/* Create a COW inode for atomic write */
-	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
-	if (IS_ERR(pinode)) {
-		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-		ret = PTR_ERR(pinode);
-		goto out;
-	}
+	/* Check if the inode already has a COW inode */
+	if (fi->cow_inode == NULL) {
+		/* Create a COW inode for atomic write */
+		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
+		if (IS_ERR(pinode)) {
+			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			ret = PTR_ERR(pinode);
+			goto out;
+		}
 
-	ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
-	iput(pinode);
-	if (ret) {
-		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-		goto out;
+		ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
+		iput(pinode);
+		if (ret) {
+			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			goto out;
+		}
+
+		set_inode_flag(fi->cow_inode, FI_COW_FILE);
+		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
+	} else {
+		/* Reuse the already created COW inode */
+		f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
 	}
 
 	f2fs_write_inode(inode, NULL);
@@ -2107,8 +2122,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	stat_inc_atomic_inode(inode);
 
 	set_inode_flag(inode, FI_ATOMIC_FILE);
-	set_inode_flag(fi->cow_inode, FI_COW_FILE);
-	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 
 	isize = i_size_read(inode);
 	fi->original_i_size = isize;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ff6cf66ed46b..4921f7209e28 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -766,11 +766,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 void f2fs_evict_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	nid_t xnid = fi->i_xattr_nid;
 	int err = 0;
 
 	f2fs_abort_atomic_write(inode, true);
 
+	if (fi->cow_inode) {
+		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
+		iput(fi->cow_inode);
+		fi->cow_inode = NULL;
+	}
+
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
 
@@ -857,7 +864,7 @@ void f2fs_evict_inode(struct inode *inode)
 	stat_dec_inline_inode(inode);
 	stat_dec_compr_inode(inode);
 	stat_sub_compr_blocks(inode,
-			atomic_read(&F2FS_I(inode)->i_compr_blocks));
+			atomic_read(&fi->i_compr_blocks));
 
 	if (likely(!f2fs_cp_error(sbi) &&
 				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ae3c4e5474ef..536d7c674b04 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -192,9 +192,6 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	if (!f2fs_is_atomic_file(inode))
 		return;
 
-	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
-	iput(fi->cow_inode);
-	fi->cow_inode = NULL;
 	release_atomic_write_cnt(inode);
 	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
 	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f812b9ce985..10463f084d30 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1430,8 +1430,6 @@ static int f2fs_drop_inode(struct inode *inode)
 			atomic_inc(&inode->i_count);
 			spin_unlock(&inode->i_lock);
 
-			f2fs_abort_atomic_write(inode, true);
-
 			/* should remain fi->extent_tree for writepage */
 			f2fs_destroy_extent_node(inode);
 
-- 
2.39.0.246.g2a6d74b583-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
