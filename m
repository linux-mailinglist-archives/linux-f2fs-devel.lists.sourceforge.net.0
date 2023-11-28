Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DC7FB5D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 10:32:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7uRs-0005pk-HP;
	Tue, 28 Nov 2023 09:32:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7uRn-0005pe-D8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:32:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KfcTND6BssLdpzmPYPlDYig9sIrB6I9wGFcgPo8r/xE=; b=keYZzDblLwHEIZIjEBE6QUUxkh
 cM9sG+ZS7JLNgQvUdJmJX6u3H5alNxuCPic/DvUIW3R2Zsj5io2iex1oB9CTknvCr43XBWRTtVfAP
 4dxSmNdB3J+yLB/rEFSku20w2Kj+iASvVuoWb3ggqVQ+qvizENWboHYXzYMZ7KJ19VmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KfcTND6BssLdpzmPYPlDYig9sIrB6I9wGFcgPo8r/xE=; b=h
 Nu14OUnyzuv/j+Vk60V65hVex5afR7lnk4wZ9y/U73I2fDrG4Y7Dt5Dw8BhzhkgE51wsJbzCJC4Dj
 117jCsaqKAiypkdMSGaQbqb26JHeaNKi3jTGAIB+ApfR6Y0cP1maUC25Emwd431frnH9d/hYGLj+O
 I4/BXkdJe/pA2kz4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7uRk-0001Q4-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 09:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0294EB8397B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Nov 2023 09:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D9CC433C9;
 Tue, 28 Nov 2023 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701163896;
 bh=2Dql++FKHJ8HVSjhd3VZ6CSZcME1Follek+sE8aZeJw=;
 h=From:To:Cc:Subject:Date:From;
 b=uM+SHt9GX2KUqUvXgBd787svm6ARgraDkrqYaF6Egelrh2xG59GlsMUcB7PuMpCpw
 6N6MzY5q9OOYsB05ub5yHlVUthLCGmAjeYYBhQLo8bWgSgomf5/qUpyYjJCRD30das
 N3FEk2RSidtpASei6n2AU0i/C3+jf5QHGIii/tT3QBJiDoB+i3aeu13+MWd0VGgp7S
 S2tM2q5R2MNnicIEWoZfhFeh5QihqXBK/A8QNrHzd64rPxH8tifvfOy35jpC/AIqCw
 gwucsOqVaa7KilE2a0EZDW4PrF8FDCwSJAv1yFCTNiYH7md9gHQI0U3s7Dui9Ldj53
 CRgxi4y927gLg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 28 Nov 2023 17:31:29 +0800
Message-Id: <20231128093130.2885216-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds tracepoints for f2fs_rename(). Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/namei.c | 16 ++++++---
 include/trace/events/f2fs.h
 | 69 +++++++++++++++++++++++++++++++++++++ 2 files changed, 80 insertions(+), 
 5 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7uRk-0001Q4-Ei
Subject: [f2fs-dev] [PATCH 1/2] f2fs: introduce tracepoint for f2fs_rename()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds tracepoints for f2fs_rename().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/namei.c             | 16 ++++++---
 include/trace/events/f2fs.h | 69 +++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a765db9e26c2..ede6afb81762 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1315,21 +1315,27 @@ static int f2fs_rename2(struct mnt_idmap *idmap,
 	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE | RENAME_WHITEOUT))
 		return -EINVAL;
 
+	trace_f2fs_rename_start(old_dir, old_dentry, new_dir, new_dentry,
+								flags);
+
 	err = fscrypt_prepare_rename(old_dir, old_dentry, new_dir, new_dentry,
 				     flags);
 	if (err)
 		return err;
 
-	if (flags & RENAME_EXCHANGE) {
-		return f2fs_cross_rename(old_dir, old_dentry,
-					 new_dir, new_dentry);
-	}
+	if (flags & RENAME_EXCHANGE)
+		err = f2fs_cross_rename(old_dir, old_dentry,
+					new_dir, new_dentry);
+	else
 	/*
 	 * VFS has already handled the new dentry existence case,
 	 * here, we just deal with "RENAME_NOREPLACE" as regular rename.
 	 */
-	return f2fs_rename(idmap, old_dir, old_dentry,
+		err = f2fs_rename(idmap, old_dir, old_dentry,
 					new_dir, new_dentry, flags);
+
+	trace_f2fs_rename_end(old_dentry, new_dentry, flags, err);
+	return err;
 }
 
 static const char *f2fs_encrypted_get_link(struct dentry *dentry,
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 793f82cc1515..36d9e29ca3c5 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -866,6 +866,75 @@ TRACE_EVENT(f2fs_lookup_end,
 		__entry->err)
 );
 
+TRACE_EVENT(f2fs_rename_start,
+
+	TP_PROTO(struct inode *old_dir, struct dentry *old_dentry,
+			struct inode *new_dir, struct dentry *new_dentry,
+			unsigned int flags),
+
+	TP_ARGS(old_dir, old_dentry, new_dir, new_dentry, flags),
+
+	TP_STRUCT__entry(
+		__field(dev_t,		dev)
+		__field(ino_t,		ino)
+		__string(old_name,	old_dentry->d_name.name)
+		__field(ino_t,		new_pino)
+		__string(new_name,	new_dentry->d_name.name)
+		__field(unsigned int,	flags)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= old_dir->i_sb->s_dev;
+		__entry->ino		= old_dir->i_ino;
+		__assign_str(old_name, old_dentry->d_name.name);
+		__entry->new_pino	= new_dir->i_ino;
+		__assign_str(new_name, new_dentry->d_name.name);
+		__entry->flags		= flags;
+	),
+
+	TP_printk("dev = (%d,%d), old_dir = %lu, old_name: %s, "
+		"new_dir = %lu, new_name: %s, flags = %u",
+		show_dev_ino(__entry),
+		__get_str(old_name),
+		__entry->new_pino,
+		__get_str(new_name),
+		__entry->flags)
+);
+
+TRACE_EVENT(f2fs_rename_end,
+
+	TP_PROTO(struct dentry *old_dentry, struct dentry *new_dentry,
+			unsigned int flags, int ret),
+
+	TP_ARGS(old_dentry, new_dentry, flags, ret),
+
+	TP_STRUCT__entry(
+		__field(dev_t,		dev)
+		__field(ino_t,		ino)
+		__string(old_name,	old_dentry->d_name.name)
+		__string(new_name,	new_dentry->d_name.name)
+		__field(unsigned int,	flags)
+		__field(int,		ret)
+	),
+
+	TP_fast_assign(
+		__entry->dev		= old_dentry->d_sb->s_dev;
+		__entry->ino		= old_dentry->d_inode->i_ino;
+		__assign_str(old_name, old_dentry->d_name.name);
+		__assign_str(new_name, new_dentry->d_name.name);
+		__entry->flags		= flags;
+		__entry->ret		= ret;
+	),
+
+	TP_printk("dev = (%d,%d), ino = %lu, old_name: %s, "
+		"new_name: %s, flags = %u, ret = %d",
+		show_dev_ino(__entry),
+		__get_str(old_name),
+		__get_str(new_name),
+		__entry->flags,
+		__entry->ret)
+);
+
 TRACE_EVENT(f2fs_readdir,
 
 	TP_PROTO(struct inode *dir, loff_t start_pos, loff_t end_pos, int err),
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
