Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 835726D65F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4F-0007xu-Cg;
	Tue, 04 Apr 2023 14:55:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4E-0007xn-4z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k8y9WhZdDNtrUXoW/FedDtUjjZj566BJYHrOtFmmOqc=; b=JPJTUjcegO9EwPr1oF35jhy1zi
 SBZXvqlP438jJhvGtDkpmAWLp7SaeJHc2ogqumSNQj0b7srQzYZUK56ioISKpqGP3jNWthwI0Uofw
 dH26HUBJ8zrqKTIVI+r9aiHSYTLbx5DRB6om75Ad7ypMcoy4HkP0QzDqKQSlrcdsPI8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k8y9WhZdDNtrUXoW/FedDtUjjZj566BJYHrOtFmmOqc=; b=ZTcEDLJY+TdG4rDetVLXkG7yWY
 EBzt/GYIaFieHP8EQ0KG2HGRsoyChCEx5kLhjD2T2rlCab5dG/k6nPQgGcNVuc8I2u9hC94g7p6tp
 OL9GP4Yci9WZd56Qn+P8WH1Ulxy/0NBZX0m941eIKza6o/BM1u4fBA3uq5BhtIb2H2f4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4E-00Ez8D-9u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k8y9WhZdDNtrUXoW/FedDtUjjZj566BJYHrOtFmmOqc=;
 b=XQ5M64wYoCjwbMos+m1h3AtH64pL456UE2GAz25p4v0DZdLzW6NqMqmKLS6AENI2s2uAtF
 Ys2OoPsKsZwxJzezRQbfVamrLpDV7LXBtmk42hHuKWKS4tT26wpbTMoqo4BBZjtDdufj44
 TeJRpqLcWc3YZhQL/VP0HJWrPfOBB+I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-ydqWOF6cOXC3VpHY31kBEw-1; Tue, 04 Apr 2023 10:55:19 -0400
X-MC-Unique: ydqWOF6cOXC3VpHY31kBEw-1
Received: by mail-qv1-f69.google.com with SMTP id
 l18-20020ad44bd2000000b005a9cf5f609eso14731337qvw.15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8y9WhZdDNtrUXoW/FedDtUjjZj566BJYHrOtFmmOqc=;
 b=WqpuJU4PPtdExTX/vOEiUXZlpz60xiNJfjyPeeRXPz0e+zaLYBcyxrGp7bPJytNddQ
 ZaknbFNM3GOK+iLrBHjL321UqKxo/sh6CcILRhZCjib4cSwL5Nwkme24d2imOzXrvWHK
 lfwXt6xfrKiRq9JXh952/ycOMZwNLc+aMjawLI5r5oz5lZOQn1DxbHisJRdkShZzqFSp
 hQIBpqSqVPwv4zmntoGnrNbjj1hX/6WAnuUbQhhhe51WQspLY6KzjSlaExbrv2A3uTUG
 J84Tz9JYxCM8+pfd70V1utm9mVc/NmCQSyVTZ3ANt+NVuqFZZjYaM629PP6YyCfTRvNm
 D7lQ==
X-Gm-Message-State: AAQBX9fqu0lUatzEXMP2pUEwQBAUIeXUkBQu/ZHiHqIu1W71t/PN7dmN
 rY3zZ2Aq30Cgu/tXFrOFxGlTb9SPR4mlYmIrMRD+o1x1Inuk4+9dsxxLApAvzDnEak88c6WRUXT
 be1CM9fDdWLsrWaeti2718a6q65cZLYsFd9by
X-Received: by 2002:ac8:5b06:0:b0:3d4:3d6c:a62b with SMTP id
 m6-20020ac85b06000000b003d43d6ca62bmr3793794qtw.27.1680620118593; 
 Tue, 04 Apr 2023 07:55:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zq76N3HAqDggjHqbDMyBg5khfORiFnim8gNTT1pLECc9GdD6VxBnlyiVZupUjB3vAUZcGqDA==
X-Received: by 2002:ac8:5b06:0:b0:3d4:3d6c:a62b with SMTP id
 m6-20020ac85b06000000b003d43d6ca62bmr3793740qtw.27.1680620118202; 
 Tue, 04 Apr 2023 07:55:18 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:17 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:07 +0200
Message-Id: <20230404145319.2057051-12-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: One of essential ideas of fs-verity is that pages which are
 already verified won't need to be re-verified if they still in page cache.
 The XFS stores Merkle tree blocks in extended attributes. Each attribute
 has one Merkle tree block. We can not directly mark underlying xfs_buf's pages
 as checked. The are not aligned with xattr value [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji4E-00Ez8D-9u
Subject: [f2fs-dev] [PATCH v2 11/23] xfs: add XFS_DA_OP_BUFFER to make
 xfs_attr_get() return buffer
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
Cc: linux-ext4@vger.kernel.org, agruenba@redhat.com,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, rpeterso@redhat.com, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

One of essential ideas of fs-verity is that pages which are already
verified won't need to be re-verified if they still in page cache.

The XFS stores Merkle tree blocks in extended attributes. Each
attribute has one Merkle tree block. We can not directly mark
underlying xfs_buf's pages as checked. The are not aligned with
xattr value and we don't have a reference to that buffer which is
immediately release when value is copied out.

One way to track that this block was verified is to mark xattr's
buffer as verified. If buffer is evicted the incore
XBF_VERITY_CHECKED flag is lost. When the xattr is read again
xfs_attr_get() returns new buffer without the flag. The flag is then
used to tell fs-verity if it's new page or cached one.

This patch adds XFS_DA_OP_BUFFER to tell xfs_attr_get() to
xfs_buf_hold() underlying buffer and return it as xfs_da_args->bp.
The caller must then xfs_buf_rele() the buffer.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_attr.c        |  5 ++++-
 fs/xfs/libxfs/xfs_attr_leaf.c   |  7 +++++++
 fs/xfs/libxfs/xfs_attr_remote.c | 13 +++++++++++--
 fs/xfs/libxfs/xfs_da_btree.h    |  5 ++++-
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
index 711022742e34..298b74245267 100644
--- a/fs/xfs/libxfs/xfs_attr.c
+++ b/fs/xfs/libxfs/xfs_attr.c
@@ -251,6 +251,8 @@ xfs_attr_get_ilocked(
  * If the attribute is found, but exceeds the size limit set by the caller in
  * args->valuelen, return -ERANGE with the size of the attribute that was found
  * in args->valuelen.
+ *
+ * Using XFS_DA_OP_BUFFER the caller have to release the buffer args->bp.
  */
 int
 xfs_attr_get(
@@ -269,7 +271,8 @@ xfs_attr_get(
 	args->hashval = xfs_da_hashname(args->name, args->namelen);
 
 	/* Entirely possible to look up a name which doesn't exist */
-	args->op_flags = XFS_DA_OP_OKNOENT;
+	args->op_flags = XFS_DA_OP_OKNOENT |
+					(args->op_flags & XFS_DA_OP_BUFFER);
 
 	lock_mode = xfs_ilock_attr_map_shared(args->dp);
 	error = xfs_attr_get_ilocked(args);
diff --git a/fs/xfs/libxfs/xfs_attr_leaf.c b/fs/xfs/libxfs/xfs_attr_leaf.c
index beee51ad75ce..112bb2604c89 100644
--- a/fs/xfs/libxfs/xfs_attr_leaf.c
+++ b/fs/xfs/libxfs/xfs_attr_leaf.c
@@ -2533,6 +2533,13 @@ xfs_attr3_leaf_getvalue(
 		name_loc = xfs_attr3_leaf_name_local(leaf, args->index);
 		ASSERT(name_loc->namelen == args->namelen);
 		ASSERT(memcmp(args->name, name_loc->nameval, args->namelen) == 0);
+
+		/* must be released by the caller */
+		if (args->op_flags & XFS_DA_OP_BUFFER) {
+			xfs_buf_hold(bp);
+			args->bp = bp;
+		}
+
 		return xfs_attr_copy_value(args,
 					&name_loc->nameval[args->namelen],
 					be16_to_cpu(name_loc->valuelen));
diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index d440393b40eb..72908e0e1c86 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -424,9 +424,18 @@ xfs_attr_rmtval_get(
 			error = xfs_attr_rmtval_copyout(mp, bp, args->dp->i_ino,
 							&offset, &valuelen,
 							&dst);
-			xfs_buf_relse(bp);
-			if (error)
+			xfs_buf_unlock(bp);
+			/* must be released by the caller */
+			if (args->op_flags & XFS_DA_OP_BUFFER)
+				args->bp = bp;
+			else
+				xfs_buf_rele(bp);
+
+			if (error) {
+				if (args->op_flags & XFS_DA_OP_BUFFER)
+					xfs_buf_rele(args->bp);
 				return error;
+			}
 
 			/* roll attribute extent map forwards */
 			lblkno += map[i].br_blockcount;
diff --git a/fs/xfs/libxfs/xfs_da_btree.h b/fs/xfs/libxfs/xfs_da_btree.h
index a4b29827603f..269d26730bca 100644
--- a/fs/xfs/libxfs/xfs_da_btree.h
+++ b/fs/xfs/libxfs/xfs_da_btree.h
@@ -61,6 +61,7 @@ typedef struct xfs_da_args {
 	uint8_t		filetype;	/* filetype of inode for directories */
 	void		*value;		/* set of bytes (maybe contain NULLs) */
 	int		valuelen;	/* length of value */
+	struct xfs_buf	*bp;		/* OUT: xfs_buf which contains the attr */
 	unsigned int	attr_filter;	/* XFS_ATTR_{ROOT,SECURE,INCOMPLETE} */
 	unsigned int	attr_flags;	/* XATTR_{CREATE,REPLACE} */
 	xfs_dahash_t	hashval;	/* hash value of name */
@@ -95,6 +96,7 @@ typedef struct xfs_da_args {
 #define XFS_DA_OP_REMOVE	(1u << 6) /* this is a remove operation */
 #define XFS_DA_OP_RECOVERY	(1u << 7) /* Log recovery operation */
 #define XFS_DA_OP_LOGGED	(1u << 8) /* Use intent items to track op */
+#define XFS_DA_OP_BUFFER	(1u << 9) /* Return underlying buffer */
 
 #define XFS_DA_OP_FLAGS \
 	{ XFS_DA_OP_JUSTCHECK,	"JUSTCHECK" }, \
@@ -105,7 +107,8 @@ typedef struct xfs_da_args {
 	{ XFS_DA_OP_NOTIME,	"NOTIME" }, \
 	{ XFS_DA_OP_REMOVE,	"REMOVE" }, \
 	{ XFS_DA_OP_RECOVERY,	"RECOVERY" }, \
-	{ XFS_DA_OP_LOGGED,	"LOGGED" }
+	{ XFS_DA_OP_LOGGED,	"LOGGED" }, \
+	{ XFS_DA_OP_BUFFER,	"BUFFER" }
 
 /*
  * Storage for holding state during Btree searches and split/join ops.
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
