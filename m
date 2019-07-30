Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25979E2F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2019 03:50:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsHHW-0000lP-G0; Tue, 30 Jul 2019 01:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1hsHHV-0000lF-LY; Tue, 30 Jul 2019 01:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L/HD57pd50ajIUsHODxhnXGWHejzLDOdwJEP3n72SQw=; b=m43H1mBl29mjjsubW7SyrvFNro
 ShbY9/cZ5czZlvW7W3C1NkJStIFPv9JPZ4RRL4a9HRUBd8Yyh/FG3eS8+KWM7KSLVpZ0yqrZMRNy9
 J2AH8bSB5P50tr3qS6kXvrGzyZQa/kpyVIO8qc7SIec7rbXcN0dD5pRiQ3J8QfiysQg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L/HD57pd50ajIUsHODxhnXGWHejzLDOdwJEP3n72SQw=; b=mpzpfDXJXl/ymlbVAxHebuYIkP
 GRwktJ/R2IHEVQ/z+H+IDWHZNEJHgOPkZVl/oaX3G824XSqbtVq4Qto3+3ORYuLnTyA6i9+oO/Xs/
 cEqgI0GTul+ZswiAoROHTzinrzSiTzPu9FWUrg3+yVkofkKogqkf0ySOPRTjU+GXwfyA=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsHHQ-004IC1-H3; Tue, 30 Jul 2019 01:50:25 +0000
Received: by mail-pg1-f194.google.com with SMTP id i70so18423914pgd.4;
 Mon, 29 Jul 2019 18:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L/HD57pd50ajIUsHODxhnXGWHejzLDOdwJEP3n72SQw=;
 b=QHhbTm1TZgOm6WvfrheJvUVNeDXD58E3pX5WUEvt1BP91bmPiq5Zxlwe0W7TOYXoCN
 MkNfx9qLLj8fyaP3b7IF4i6G6Mkgb23PHdlgaNIJRlu3NM6Es13SefEmhkB3J1UfIWGK
 soB7NWNFa20U8NYgNzlRF3WMC88RtL7qe0bTbQ1cvIhorC2b8kqE/RY85zKTkCEyBsQh
 BdKev0yI9rY4xF4cPnJ6NS8ZwaRWLLgKzkuAdtPNzcv+sltC90b1jYaaBMcLW3gtpjT0
 lcILku6POE4fQfSb3rTDmKTDv0Qjk9tMvj5rB3uc2hsoyfEIeJojb/BRzbD01DDJWzF+
 eymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L/HD57pd50ajIUsHODxhnXGWHejzLDOdwJEP3n72SQw=;
 b=TNhTbWM8GvFx+7zV5O8cgvIvmstktPIxSroDnmeECLrx9vyxW+7KEGCHzpZM4xh71G
 lEOVGnmxn6aCaXrOi7hStb2zoAxG/8GuJYBYkrC7V2mJao8SZfMC+juOtfMktqSbBwlL
 Xr+n9736UUTVKWFv4C68iP97npzZ6ex9I3qia9Ls7G/05t6egybL8WrnwaHR40HN5UPX
 AZJHRDW0dIzEZp9EJ+ZAoHQoCKF+wC0wZrXV0lrkZjVtyvQMfrCxwdiJ2geZl86itUHx
 f4+6c0pIIN0FcJmzC2XU/B+twWzRHdFsJRgNOJlPQ3plQAySlWDw1qlze3CRCpmneMdE
 d+jQ==
X-Gm-Message-State: APjAAAUqJD+RAGhiQwmidcu8HUltRMfNqX1T/TMIsNxBCjxb2HCOhsXR
 Y+yL3Vp6vnoQ70f3YTPeZvQ=
X-Google-Smtp-Source: APXvYqymlfxXZkLKDbtTqqG4gNF0mEEFbRBNU2budVpRI6cIsHbCtGHUYAgZi7Jxv18tF300c570QQ==
X-Received: by 2002:a17:90a:bd0b:: with SMTP id
 y11mr109382806pjr.141.1564451414701; 
 Mon, 29 Jul 2019 18:50:14 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id r6sm138807156pjb.22.2019.07.29.18.50.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 18:50:14 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Date: Mon, 29 Jul 2019 18:49:07 -0700
Message-Id: <20190730014924.2193-4-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730014924.2193-1-deepa.kernel@gmail.com>
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxera.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hsHHQ-004IC1-H3
Subject: [f2fs-dev] [PATCH 03/20] timestamp_truncate: Replace users of
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
 linux-mtd@lists.infradead.org, hirofumi@mail.parknet.co.jp, richard@nod.at,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, hch@lst.de, anton@tuxera.com,
 jlbec@evilplan.org
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
Cc: anton@tuxera.com
Cc: dedekind1@gmail.com
Cc: gregkh@linuxfoundation.org
Cc: hch@lst.de
Cc: hirofumi@mail.parknet.co.jp
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
 fs/fat/misc.c       |  5 +++--
 fs/kernfs/inode.c   |  6 +++---
 fs/ntfs/inode.c     | 21 ++++++++++++---------
 fs/ubifs/file.c     | 21 ++++++++++++---------
 7 files changed, 60 insertions(+), 47 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index d22e8187477f..df28035aa23e 100644
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
index 45b45f37d347..faf1e160961b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -744,15 +744,18 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
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
 
diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index 1e08bd54c5fb..53bb7c6bf993 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
 		inode->i_atime = (struct timespec64){ seconds, 0 };
 	}
 	if (flags & S_CTIME) {
-		if (sbi->options.isvfat)
-			inode->i_ctime = timespec64_trunc(*now, 10000000);
+		if (sbi->options.isvfat) {
+			inode->i_ctime = timestamp_truncate(*now, inode);
+		}
 		else
 			inode->i_ctime = fat_timespec64_trunc_2secs(*now);
 	}
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index f3f3984cce80..892a58cfe7a1 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -161,9 +161,9 @@ static inline void set_inode_attr(struct inode *inode,
 	struct super_block *sb = inode->i_sb;
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
