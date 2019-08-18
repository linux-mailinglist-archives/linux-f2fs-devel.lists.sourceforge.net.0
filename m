Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39E91806
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 18:59:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzOWx-0001tS-T4; Sun, 18 Aug 2019 16:59:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1hzOWx-0001tF-22; Sun, 18 Aug 2019 16:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBoGugkhUC7RzEVn8NEyVinAwt3h5A3UJUwpo03Y32I=; b=PCOsUSVMcwxFRS1SV6/cCcakaP
 87W91CntU0VJlLCaDodDtsMp6vrbX3ZkXPKriUciZVxXdJcAxfmXcBBg8TE5AqrCYBRJn9mhnwD+X
 3JdQSysDE0oGsTlOXEvgOpM0ic20T1+XmkH8aa2pRMG+jYEvX33j7hezxRzlpvvl+e8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XBoGugkhUC7RzEVn8NEyVinAwt3h5A3UJUwpo03Y32I=; b=XhVEmldfODLpdc8UF7GpyADENd
 miYisJYzP/QPIFANCiQuAKhE6wHz4rYJlQSKm3f4U922/V1z7ke4KtS27/Uzn977P90xo9qktnbMb
 dSVl8MAxnmTxwFq2ybrQPMPqxf9OmIaw0fiA2Utnq0GdPKyniK1hx9EJMsEnufTcZA7Y=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hzOWt-00Apx3-KT; Sun, 18 Aug 2019 16:59:46 +0000
Received: by mail-pf1-f196.google.com with SMTP id g2so5748035pfq.0;
 Sun, 18 Aug 2019 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XBoGugkhUC7RzEVn8NEyVinAwt3h5A3UJUwpo03Y32I=;
 b=mlw3BTHmR65CECBGBfXGXHjTZ5nyHwdI6R8Rp5DQ3oO8pXG6+/TVmoY/X1eUUe7m4M
 NywGeGa506MTS3HvJq+RKK7t3qeBzAy0zkmEjQJUw3iRS7ZGFvkA54/44d4skmg4mKPp
 9BM+1IdlEpQwrbDb0bEN9VuGlPsG04Lgn7VDjI80Je7xwzN/p4ERNoksd0iHF6EWwxJ9
 yscfg30lVzUcx3ZCiC0DGkrfUzoJicdlyogkoyW98sWY9bVjzwIJaV4mduy5FAvxqsxn
 +J4B9McSFexn31/NZCFP74SXSJo58mjK/ALWOZExwDIlSqEGlWhsWa+t49PyLth6Z1T9
 fn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XBoGugkhUC7RzEVn8NEyVinAwt3h5A3UJUwpo03Y32I=;
 b=UCedUfeu2rv2/JZunstypEBSa9MiyDBUALIRiZKqGctl3rR85A+mCrls4dmF1msCs0
 gP+3b0euwJdI8C1iak0qMToH1w/4MC2x+WFsXaSKkMAqaqF1++GfalMD/31qBSvQFFPD
 ne5DyGs8EBKDKK61TdQ3wPxWvtF+vcQ/m7Yuhf0DlqTP7WI0H+3eVOKdzK0juiwYM/aX
 6qcKdCwFvBzAJBi8NJ2i5VHQf19oec5rnjgAEuozAcQXm7WLw7y2ddXLfz/6oWx+C77c
 MWj/TJPXovYD0pBYKvTYGS8Hcra7lZIkBJesfhohnUKjo8XujjoMhwKKyKViNQXZRWA8
 +8Yg==
X-Gm-Message-State: APjAAAUORtIB/NZgygxuvL7wLtft0ijL9QCPf39kBQHTFHur9uW9VVJ0
 g8AcEPVwhNk2OzIioVt6D8w=
X-Google-Smtp-Source: APXvYqyMocWQPnOEOvETytOVzxJTuHH9RsqGxnRaQNh5G1nPmvEKz71Glx/Lb38BKq0xU4X4UktRWA==
X-Received: by 2002:a63:e20a:: with SMTP id q10mr16098732pgh.24.1566147577789; 
 Sun, 18 Aug 2019 09:59:37 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id b136sm15732831pfb.73.2019.08.18.09.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 09:59:37 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Date: Sun, 18 Aug 2019 09:58:00 -0700
Message-Id: <20190818165817.32634-4-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190818165817.32634-1-deepa.kernel@gmail.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: evilplan.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hzOWt-00Apx3-KT
Subject: [f2fs-dev] [PATCH v8 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
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
Cc: arnd@arndb.de, dedekind1@gmail.com, y2038@lists.linaro.org,
 gregkh@linuxfoundation.org, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, tj@kernel.org,
 linux-mtd@lists.infradead.org, jlbec@evilplan.org, richard@nod.at,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, hch@lst.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update the inode timestamp updates to use timestamp_truncate()
instead of timespec64_trunc().

The change was mostly generated by the following coccinelle
script.

virtual context
virtual patch

@r1 depends on patch forall@
struct inode *inode;
identifier i_xtime =~ "^i_[acm]time$";
expression e;
@@

inode->i_xtime =
- timespec64_trunc(
+ timestamp_truncate(
...,
- e);
+ inode);

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: adrian.hunter@intel.com
Cc: dedekind1@gmail.com
Cc: gregkh@linuxfoundation.org
Cc: hch@lst.de
Cc: jaegeuk@kernel.org
Cc: jlbec@evilplan.org
Cc: richard@nod.at
Cc: tj@kernel.org
Cc: yuchao0@huawei.com
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: linux-mtd@lists.infradead.org
---
 fs/attr.c           | 21 ++++++++++++---------
 fs/configfs/inode.c | 12 ++++++------
 fs/f2fs/file.c      | 21 ++++++++++++---------
 fs/kernfs/inode.c   |  7 +++----
 fs/ntfs/inode.c     | 21 ++++++++++++---------
 fs/ubifs/file.c     | 21 ++++++++++++---------
 6 files changed, 57 insertions(+), 46 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 1fcfdcc5b367..97b60ad7f419 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -183,15 +183,18 @@ void setattr_copy(struct inode *inode, const struct iattr *attr)
 		inode->i_uid = attr->ia_uid;
 	if (ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
-	if (ia_valid & ATTR_ATIME)
-		inode->i_atime = timespec64_trunc(attr->ia_atime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_MTIME)
-		inode->i_mtime = timespec64_trunc(attr->ia_mtime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_CTIME)
-		inode->i_ctime = timespec64_trunc(attr->ia_ctime,
-						  inode->i_sb->s_time_gran);
+	if (ia_valid & ATTR_ATIME) {
+		inode->i_atime = timestamp_truncate(attr->ia_atime,
+						  inode);
+	}
+	if (ia_valid & ATTR_MTIME) {
+		inode->i_mtime = timestamp_truncate(attr->ia_mtime,
+						  inode);
+	}
+	if (ia_valid & ATTR_CTIME) {
+		inode->i_ctime = timestamp_truncate(attr->ia_ctime,
+						  inode);
+	}
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
 
diff --git a/fs/configfs/inode.c b/fs/configfs/inode.c
index ab0284321912..884dcf06cfbe 100644
--- a/fs/configfs/inode.c
+++ b/fs/configfs/inode.c
@@ -76,14 +76,14 @@ int configfs_setattr(struct dentry * dentry, struct iattr * iattr)
 	if (ia_valid & ATTR_GID)
 		sd_iattr->ia_gid = iattr->ia_gid;
 	if (ia_valid & ATTR_ATIME)
-		sd_iattr->ia_atime = timespec64_trunc(iattr->ia_atime,
-						      inode->i_sb->s_time_gran);
+		sd_iattr->ia_atime = timestamp_truncate(iattr->ia_atime,
+						      inode);
 	if (ia_valid & ATTR_MTIME)
-		sd_iattr->ia_mtime = timespec64_trunc(iattr->ia_mtime,
-						      inode->i_sb->s_time_gran);
+		sd_iattr->ia_mtime = timestamp_truncate(iattr->ia_mtime,
+						      inode);
 	if (ia_valid & ATTR_CTIME)
-		sd_iattr->ia_ctime = timespec64_trunc(iattr->ia_ctime,
-						      inode->i_sb->s_time_gran);
+		sd_iattr->ia_ctime = timestamp_truncate(iattr->ia_ctime,
+						      inode);
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = iattr->ia_mode;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 89a9ee22296d..af8cdd345f3d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -749,15 +749,18 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
 		inode->i_uid = attr->ia_uid;
 	if (ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
-	if (ia_valid & ATTR_ATIME)
-		inode->i_atime = timespec64_trunc(attr->ia_atime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_MTIME)
-		inode->i_mtime = timespec64_trunc(attr->ia_mtime,
-						  inode->i_sb->s_time_gran);
-	if (ia_valid & ATTR_CTIME)
-		inode->i_ctime = timespec64_trunc(attr->ia_ctime,
-						  inode->i_sb->s_time_gran);
+	if (ia_valid & ATTR_ATIME) {
+		inode->i_atime = timestamp_truncate(attr->ia_atime,
+						  inode);
+	}
+	if (ia_valid & ATTR_MTIME) {
+		inode->i_mtime = timestamp_truncate(attr->ia_mtime,
+						  inode);
+	}
+	if (ia_valid & ATTR_CTIME) {
+		inode->i_ctime = timestamp_truncate(attr->ia_ctime,
+						  inode);
+	}
 	if (ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
 
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index f3f3984cce80..f3eaa8869f42 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -158,12 +158,11 @@ static inline void set_default_inode_attr(struct inode *inode, umode_t mode)
 static inline void set_inode_attr(struct inode *inode,
 				  struct kernfs_iattrs *attrs)
 {
-	struct super_block *sb = inode->i_sb;
 	inode->i_uid = attrs->ia_uid;
 	inode->i_gid = attrs->ia_gid;
-	inode->i_atime = timespec64_trunc(attrs->ia_atime, sb->s_time_gran);
-	inode->i_mtime = timespec64_trunc(attrs->ia_mtime, sb->s_time_gran);
-	inode->i_ctime = timespec64_trunc(attrs->ia_ctime, sb->s_time_gran);
+	inode->i_atime = timestamp_truncate(attrs->ia_atime, inode);
+	inode->i_mtime = timestamp_truncate(attrs->ia_mtime, inode);
+	inode->i_ctime = timestamp_truncate(attrs->ia_ctime, inode);
 }
 
 static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 8baa34baf548..6c7388430ad3 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2899,15 +2899,18 @@ int ntfs_setattr(struct dentry *dentry, struct iattr *attr)
 			ia_valid |= ATTR_MTIME | ATTR_CTIME;
 		}
 	}
-	if (ia_valid & ATTR_ATIME)
-		vi->i_atime = timespec64_trunc(attr->ia_atime,
-					       vi->i_sb->s_time_gran);
-	if (ia_valid & ATTR_MTIME)
-		vi->i_mtime = timespec64_trunc(attr->ia_mtime,
-					       vi->i_sb->s_time_gran);
-	if (ia_valid & ATTR_CTIME)
-		vi->i_ctime = timespec64_trunc(attr->ia_ctime,
-					       vi->i_sb->s_time_gran);
+	if (ia_valid & ATTR_ATIME) {
+		vi->i_atime = timestamp_truncate(attr->ia_atime,
+					       vi);
+	}
+	if (ia_valid & ATTR_MTIME) {
+		vi->i_mtime = timestamp_truncate(attr->ia_mtime,
+					       vi);
+	}
+	if (ia_valid & ATTR_CTIME) {
+		vi->i_ctime = timestamp_truncate(attr->ia_ctime,
+					       vi);
+	}
 	mark_inode_dirty(vi);
 out:
 	return err;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 400970d740bb..cd52585c8f4f 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1078,15 +1078,18 @@ static void do_attr_changes(struct inode *inode, const struct iattr *attr)
 		inode->i_uid = attr->ia_uid;
 	if (attr->ia_valid & ATTR_GID)
 		inode->i_gid = attr->ia_gid;
-	if (attr->ia_valid & ATTR_ATIME)
-		inode->i_atime = timespec64_trunc(attr->ia_atime,
-						  inode->i_sb->s_time_gran);
-	if (attr->ia_valid & ATTR_MTIME)
-		inode->i_mtime = timespec64_trunc(attr->ia_mtime,
-						  inode->i_sb->s_time_gran);
-	if (attr->ia_valid & ATTR_CTIME)
-		inode->i_ctime = timespec64_trunc(attr->ia_ctime,
-						  inode->i_sb->s_time_gran);
+	if (attr->ia_valid & ATTR_ATIME) {
+		inode->i_atime = timestamp_truncate(attr->ia_atime,
+						  inode);
+	}
+	if (attr->ia_valid & ATTR_MTIME) {
+		inode->i_mtime = timestamp_truncate(attr->ia_mtime,
+						  inode);
+	}
+	if (attr->ia_valid & ATTR_CTIME) {
+		inode->i_ctime = timestamp_truncate(attr->ia_ctime,
+						  inode);
+	}
 	if (attr->ia_valid & ATTR_MODE) {
 		umode_t mode = attr->ia_mode;
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
