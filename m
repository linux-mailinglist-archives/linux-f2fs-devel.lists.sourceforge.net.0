Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AC282D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:20:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSZ-0000bh-7G; Thu, 23 May 2019 16:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSY-0000bO-76
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z441TaZeN8HgKmJYrurKQCbJfHepx0cnUl2KIAAFrPc=; b=WjeTJbLYcXy0HsypMbmsAXHrpL
 j+4VMXwQ/X9SqDT8s8PTrmXy2gr+Vwswus6Px/f7UCseFnVQzS03ERx4CwxmBd79fdJ7IpVri0Ey/
 TLt65+sT2E3oXN71ER9vz5+ZyvrwJj9ItIMpHB8O+OmAp02JjCiZWk0J9Wzvkam0Vi+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z441TaZeN8HgKmJYrurKQCbJfHepx0cnUl2KIAAFrPc=; b=Ns1vTJ9N6pg9YzWvWL5BdQt1Pz
 GNwTOB/SSgpgyA+hGu9A2MREORWz721pLmKT2njWW0RAqmcOybrnlZj0CAVjp95BIQ66G/rVeiXNA
 075hyu5aG+li+qGp82Pd46SOF0EdXRm0zm5DjjzBHe1Kcjeqj8sPKQq015YjAPvJ/Yhw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSX-009b3z-3n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:50 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 634A621873;
 Thu, 23 May 2019 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628437;
 bh=OXgI1Anom05ui26ncqYa0NBQDzcnpGqcy+YcyYqHoZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtWslty6zwFR4VyaGGbEH60JbdIURHw6kESwgz0h2HJBdwZQnCAox+mwi+Mhh2nQy
 o1zsAeZZqiy3LWOOx+4A09Fr0xSAzIGZYUr+qW+eqARJ2TGLPKieP76UDxJBKyn2dY
 FBiRN3y++ME4jazvWoLpe/TrrZfHTJ+dktLZSOLc=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:03 -0700
Message-Id: <20190523161811.6259-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523161811.6259-1-ebiggers@kernel.org>
References: <20190523161811.6259-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hTqSX-009b3z-3n
Subject: [f2fs-dev] [PATCH v3 07/15] fs-verity: add the hook for file
 ->setattr()
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a function fsverity_prepare_setattr() which filesystems that support
fs-verity must call to deny truncates of verity files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/open.c         | 21 +++++++++++++++++++++
 include/linux/fsverity.h |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/fs/verity/open.c b/fs/verity/open.c
index e6d73d73b000d..f779a150b4ede 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -292,6 +292,27 @@ int fsverity_file_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL_GPL(fsverity_file_open);
 
+/**
+ * fsverity_prepare_setattr - prepare to change a verity inode's attributes
+ * @dentry: dentry through which the inode is being changed
+ * @attr: attributes to change
+ *
+ * Verity files are immutable, so deny truncates.  This isn't covered by the
+ * open-time check because sys_truncate() takes a path, not a file descriptor.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
+{
+	if (IS_VERITY(d_inode(dentry)) && (attr->ia_valid & ATTR_SIZE)) {
+		pr_debug("Denying truncate of verity file (ino %lu)\n",
+			 d_inode(dentry)->i_ino);
+		return -EPERM;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsverity_prepare_setattr);
+
 /**
  * fsverity_cleanup_inode - free the inode's verity info, if present
  *
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 3b60195e3c51a..29bb4d007ad16 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -40,6 +40,7 @@ struct fsverity_operations {
 /* open.c */
 
 extern int fsverity_file_open(struct inode *inode, struct file *filp);
+extern int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 extern void fsverity_cleanup_inode(struct inode *inode);
 
 #else /* !CONFIG_FS_VERITY */
@@ -51,6 +52,12 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 	return IS_VERITY(inode) ? -EOPNOTSUPP : 0;
 }
 
+static inline int fsverity_prepare_setattr(struct dentry *dentry,
+					   struct iattr *attr)
+{
+	return IS_VERITY(d_inode(dentry)) ? -EOPNOTSUPP : 0;
+}
+
 static inline void fsverity_cleanup_inode(struct inode *inode)
 {
 }
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
