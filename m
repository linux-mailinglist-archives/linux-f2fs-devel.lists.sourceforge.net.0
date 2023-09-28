Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F537B199C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 13:05:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qlopP-0004JZ-5A;
	Thu, 28 Sep 2023 11:05:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qlopM-0004JM-VF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 11:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chUwOc4YOWgG9eXasFEYtE+V6RNq7iEDm87KK2GGUVY=; b=UDCxzBqbO3EABT/J1E4fVoQCUj
 vqJHJOjCelvi3dzf3t8uu3QRjU4LgR8b5+JN8m3J7mwNEeq6xpGBNjqySNiYG3GaIqhnnb3nSvske
 08Ac2FqSqK3yKCExugtWUEvuxLkllYobzY/HT65otZW5rmhx1gkGx7ucT12SKBerKtyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=chUwOc4YOWgG9eXasFEYtE+V6RNq7iEDm87KK2GGUVY=; b=b08qCJCKK7GTGwgp1p1xSIczaT
 6C3GkHvufNJeEkDclMKTWGIUnvz7sx2B40bCG8J2kA4mdZOOBh8Y+3u30VoTZJg3siyDxuJUlvyrc
 848LcU5na2Q4IzJmdozy+0e9sHYIEuZ9KNvSIKBBEnLo+qS1SV2tWFpqN93fNBDsBqWY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qlopK-009nSW-VW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 11:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 14B97B81BC2;
 Thu, 28 Sep 2023 11:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E970C4166B;
 Thu, 28 Sep 2023 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695899094;
 bh=xy5xKvOS+FaMJlr9U9ud4gSCBfgCY/a9XrDzZtVtdX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SGMGyOVCBdKCgBZ4A3f6v/hZUR1RojNXfYsTtjVGcpOSxLbcfeuvJRoOM2iBrgd9T
 n0s5MyqAsWjA1i8GVguXBsUZg2fZpdqxMPjmX4ujyLh3IIE+kylto/P3YriIP+FGAH
 IQdw2sx+3FBRl7LrTIa/4SP1p7imrerFqZuKj8/bD+H2+kiNsdyQOCmnEa5rSaUvi5
 mPglltjeaXXO6XdXgtjHJ/xG8/SVeGM2cC+GGIsi6TnN1Nym8153znemWCTPjfFZab
 dPo+3KlD2doTWqAdDpIQuuVmN7UiPeYPqH8tBhBYLQsW86PJquWGhzX8f8Wwj9axgo
 Y9D7tXVa3aD+w==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 28 Sep 2023 07:02:44 -0400
Message-ID: <20230928110413.33032-34-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928110413.33032-1-jlayton@kernel.org>
References: <20230928110300.32891-1-jlayton@kernel.org>
 <20230928110413.33032-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/f2fs/dir.c
 | 6 +++--- fs/f2fs/f2fs.h | 10 ++++++---- fs/f2fs/file.c | 14 +++++++-------
 fs/f2fs/inline.c | 2 +- fs/f2fs/inode.c | 20 ++++++++++-- [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qlopK-009nSW-VW
Subject: [f2fs-dev] [PATCH 35/87] fs/f2fs: convert to new inode {a,
 m}time accessors
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/f2fs/dir.c      |  6 +++---
 fs/f2fs/f2fs.h     | 10 ++++++----
 fs/f2fs/file.c     | 14 +++++++-------
 fs/f2fs/inline.c   |  2 +-
 fs/f2fs/inode.c    | 20 ++++++++++----------
 fs/f2fs/namei.c    |  4 ++--
 fs/f2fs/recovery.c |  8 ++++----
 fs/f2fs/super.c    |  2 +-
 8 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 8aa29fe2e87b..042593aed1ec 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -455,7 +455,7 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 	de->file_type = fs_umode_to_ftype(inode->i_mode);
 	set_page_dirty(page);
 
-	dir->i_mtime = inode_set_ctime_current(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	f2fs_mark_inode_dirty_sync(dir, false);
 	f2fs_put_page(page, 1);
 }
@@ -609,7 +609,7 @@ void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
 			f2fs_i_links_write(dir, true);
 		clear_inode_flag(inode, FI_NEW_INODE);
 	}
-	dir->i_mtime = inode_set_ctime_current(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	f2fs_mark_inode_dirty_sync(dir, false);
 
 	if (F2FS_I(dir)->i_current_depth != current_depth)
@@ -919,7 +919,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 	}
 	f2fs_put_page(page, 1);
 
-	dir->i_mtime = inode_set_ctime_current(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	f2fs_mark_inode_dirty_sync(dir, false);
 
 	if (inode)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6d688e42d89c..cb9927a6d0c8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3317,13 +3317,15 @@ static inline void clear_file(struct inode *inode, int type)
 
 static inline bool f2fs_is_time_consistent(struct inode *inode)
 {
-	struct timespec64 ctime = inode_get_ctime(inode);
+	struct timespec64 ts = inode_get_atime(inode);
 
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time, &inode->i_atime))
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time, &ts))
 		return false;
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 1, &ctime))
+	ts = inode_get_ctime(inode);
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 1, &ts))
 		return false;
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 2, &inode->i_mtime))
+	ts = inode_get_mtime(inode);
+	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 2, &ts))
 		return false;
 	return true;
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ca5904129b16..dd99abbb7186 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -798,7 +798,7 @@ int f2fs_truncate(struct inode *inode)
 	if (err)
 		return err;
 
-	inode->i_mtime = inode_set_ctime_current(inode);
+	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 	f2fs_mark_inode_dirty_sync(inode, false);
 	return 0;
 }
@@ -905,9 +905,9 @@ static void __setattr_copy(struct mnt_idmap *idmap,
 	i_uid_update(idmap, attr, inode);
 	i_gid_update(idmap, attr, inode);
 	if (ia_valid & ATTR_ATIME)
-		inode->i_atime = attr->ia_atime;
+		inode_set_atime_to_ts(inode, attr->ia_atime);
 	if (ia_valid & ATTR_MTIME)
-		inode->i_mtime = attr->ia_mtime;
+		inode_set_mtime_to_ts(inode, attr->ia_mtime);
 	if (ia_valid & ATTR_CTIME)
 		inode_set_ctime_to_ts(inode, attr->ia_ctime);
 	if (ia_valid & ATTR_MODE) {
@@ -1012,7 +1012,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			return err;
 
 		spin_lock(&F2FS_I(inode)->i_size_lock);
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 		F2FS_I(inode)->last_disk_size = i_size_read(inode);
 		spin_unlock(&F2FS_I(inode)->i_size_lock);
 	}
@@ -1840,7 +1840,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 	}
 
 	if (!ret) {
-		inode->i_mtime = inode_set_ctime_current(inode);
+		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 		f2fs_mark_inode_dirty_sync(inode, false);
 		f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 	}
@@ -2888,10 +2888,10 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	if (ret)
 		goto out_unlock;
 
-	src->i_mtime = inode_set_ctime_current(src);
+	inode_set_mtime_to_ts(src, inode_set_ctime_current(src));
 	f2fs_mark_inode_dirty_sync(src, false);
 	if (src != dst) {
-		dst->i_mtime = inode_set_ctime_current(dst);
+		inode_set_mtime_to_ts(dst, inode_set_ctime_current(dst));
 		f2fs_mark_inode_dirty_sync(dst, false);
 	}
 	f2fs_update_time(sbi, REQ_TIME);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 2fe25619ccb5..ac00423f117b 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -699,7 +699,7 @@ void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry, struct page *page,
 	set_page_dirty(page);
 	f2fs_put_page(page, 1);
 
-	dir->i_mtime = inode_set_ctime_current(dir);
+	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
 	f2fs_mark_inode_dirty_sync(dir, false);
 
 	if (inode)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index cde243840abd..96e578b008b6 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -386,9 +386,9 @@ static void init_idisk_time(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
-	fi->i_disk_time[0] = inode->i_atime;
+	fi->i_disk_time[0] = inode_get_atime(inode);
 	fi->i_disk_time[1] = inode_get_ctime(inode);
-	fi->i_disk_time[2] = inode->i_mtime;
+	fi->i_disk_time[2] = inode_get_mtime(inode);
 }
 
 static int do_read_inode(struct inode *inode)
@@ -417,12 +417,12 @@ static int do_read_inode(struct inode *inode)
 	inode->i_size = le64_to_cpu(ri->i_size);
 	inode->i_blocks = SECTOR_FROM_BLOCK(le64_to_cpu(ri->i_blocks) - 1);
 
-	inode->i_atime.tv_sec = le64_to_cpu(ri->i_atime);
+	inode_set_atime(inode, le64_to_cpu(ri->i_atime),
+			le32_to_cpu(ri->i_atime_nsec));
 	inode_set_ctime(inode, le64_to_cpu(ri->i_ctime),
 			le32_to_cpu(ri->i_ctime_nsec));
-	inode->i_mtime.tv_sec = le64_to_cpu(ri->i_mtime);
-	inode->i_atime.tv_nsec = le32_to_cpu(ri->i_atime_nsec);
-	inode->i_mtime.tv_nsec = le32_to_cpu(ri->i_mtime_nsec);
+	inode_set_mtime(inode, le64_to_cpu(ri->i_mtime),
+			le32_to_cpu(ri->i_mtime_nsec));
 	inode->i_generation = le32_to_cpu(ri->i_generation);
 	if (S_ISDIR(inode->i_mode))
 		fi->i_current_depth = le32_to_cpu(ri->i_current_depth);
@@ -698,12 +698,12 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 	}
 	set_raw_inline(inode, ri);
 
-	ri->i_atime = cpu_to_le64(inode->i_atime.tv_sec);
+	ri->i_atime = cpu_to_le64(inode_get_atime(inode).tv_sec);
 	ri->i_ctime = cpu_to_le64(inode_get_ctime(inode).tv_sec);
-	ri->i_mtime = cpu_to_le64(inode->i_mtime.tv_sec);
-	ri->i_atime_nsec = cpu_to_le32(inode->i_atime.tv_nsec);
+	ri->i_mtime = cpu_to_le64(inode_get_mtime(inode).tv_sec);
+	ri->i_atime_nsec = cpu_to_le32(inode_get_atime(inode).tv_nsec);
 	ri->i_ctime_nsec = cpu_to_le32(inode_get_ctime(inode).tv_nsec);
-	ri->i_mtime_nsec = cpu_to_le32(inode->i_mtime.tv_nsec);
+	ri->i_mtime_nsec = cpu_to_le32(inode_get_mtime(inode).tv_nsec);
 	if (S_ISDIR(inode->i_mode))
 		ri->i_current_depth =
 			cpu_to_le32(F2FS_I(inode)->i_current_depth);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 193b22a2d6bf..d0053b0284d8 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -243,8 +243,8 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 
 	inode->i_ino = ino;
 	inode->i_blocks = 0;
-	inode->i_mtime = inode->i_atime = inode_set_ctime_current(inode);
-	F2FS_I(inode)->i_crtime = inode->i_mtime;
+	simple_inode_init_ts(inode);
+	F2FS_I(inode)->i_crtime = inode_get_mtime(inode);
 	inode->i_generation = get_random_u32();
 
 	if (S_ISDIR(inode->i_mode))
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 7be60df277a5..b56d0f1078a7 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -320,12 +320,12 @@ static int recover_inode(struct inode *inode, struct page *page)
 	}
 
 	f2fs_i_size_write(inode, le64_to_cpu(raw->i_size));
-	inode->i_atime.tv_sec = le64_to_cpu(raw->i_atime);
+	inode_set_atime(inode, le64_to_cpu(raw->i_atime),
+			le32_to_cpu(raw->i_atime_nsec));
 	inode_set_ctime(inode, le64_to_cpu(raw->i_ctime),
 			le32_to_cpu(raw->i_ctime_nsec));
-	inode->i_mtime.tv_sec = le64_to_cpu(raw->i_mtime);
-	inode->i_atime.tv_nsec = le32_to_cpu(raw->i_atime_nsec);
-	inode->i_mtime.tv_nsec = le32_to_cpu(raw->i_mtime_nsec);
+	inode_set_mtime(inode, le64_to_cpu(raw->i_mtime),
+			le32_to_cpu(raw->i_mtime_nsec));
 
 	F2FS_I(inode)->i_advise = raw->i_advise;
 	F2FS_I(inode)->i_flags = le32_to_cpu(raw->i_flags);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb..ca965136c09f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2710,7 +2710,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 
 	if (len == towrite)
 		return err;
-	inode->i_mtime = inode_set_ctime_current(inode);
+	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 	f2fs_mark_inode_dirty_sync(inode, false);
 	return len - towrite;
 }
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
