Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E188B6D65EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji40-0000gD-GB;
	Tue, 04 Apr 2023 14:55:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji3x-0000g5-7H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=do7mgrJpiSwWS1mlFAfBuj//WIsG4B8mI0gR4ORK1OQ=; b=K7L+dr604EZqT+w1A67WD14Y+L
 iNFVZdif+VvHlM9/bTPn0TgSppo6tP8IUHn7CRuEhgd8+eFQ51X+1g7XeY+Rz8KqFZ2yQEYMTwX97
 gJQ4QNrNyfJi0OBC7RLGEjAST8+H9LdGzbdHHTCnknn8TBB6QsNUI4TWDDB3yBh4Dcsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=do7mgrJpiSwWS1mlFAfBuj//WIsG4B8mI0gR4ORK1OQ=; b=KGl9yw1YEewuNC3bKIEqNTugki
 znFCynO+YsVPfRQAO7eBSnWqYcYtyKCyyAgF+GWID/bQ1cdL1s/kjQm38JQwxx3ZCTcyIVYhfqybB
 i+ohQute4HvAWYm9gqWyMwIyHiKjNGi49jIeqIm95lxKHRQEbGxmAa5AUWTpBETP35M0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji3s-00Ez6U-8y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=do7mgrJpiSwWS1mlFAfBuj//WIsG4B8mI0gR4ORK1OQ=;
 b=Emo20yaEr+Qj3PTY2SFsln1wMmV0wPkFX9pImEWXTB6t1SNt0c2LOt0aGYFLojWUnqq9va
 8GXZJ+rbdHFVJqKwBEM+zyxy7kbjSasoZj/ASkNrVMh4kcJkXGQmGxuHFx9D9KFpVjj1bX
 6MuvYxWLvUKuAdexfjDHLaUA4Ssn91o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-PixBAtmcPIiJ883hxoPGxQ-1; Tue, 04 Apr 2023 10:54:57 -0400
X-MC-Unique: PixBAtmcPIiJ883hxoPGxQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 s23-20020a05622a1a9700b003e6578904c3so3759029qtc.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=do7mgrJpiSwWS1mlFAfBuj//WIsG4B8mI0gR4ORK1OQ=;
 b=SaHYOIsYYBfMSPac+Oda1FA5PBg3quyknkfxblQRm8o0VqMEuBKe1xzQLIbYnyKWd2
 XGLVrM/sierjP+qA2Eu2mVrTh7KbUh7OWSlGV18NUfxghMiEZozfGTyAtH3jM8rUY+sk
 Z3X1logv0FTc9oeHRSraTwSLa3JfLFMtGTtqzoUl4crM3D2IVIMOwx3Yp4Om6vI89wGY
 RPB8XEDhN8i+B+lPpBs9a5I09Ytu4TBCDmQyJlvCyrk3oWyrEzww8ijBOQVpy4ADHGTm
 XXr+vWBV1nApApSRztg3amfgqtf4ASkqYdY4NVlSa1vEMbXqIEoTKv9Wpy3WKE/O2NVm
 l+8A==
X-Gm-Message-State: AAQBX9eCSU4SSJm62RDObWaQtKHjo+feMRGxCULjJTRCdhr/KfOKQWYw
 p7/pllW7dbR3VWg8KGAoFCySjY4cvA9XgYbZqVBHT9dVr7D2FTBIkTm0Wmcd58N76PSwqDqVwtZ
 3kWcc7srQjNtwBWik7QE67phq09AT3BLkLaPC
X-Received: by 2002:ac8:5dca:0:b0:3e6:4843:ce39 with SMTP id
 e10-20020ac85dca000000b003e64843ce39mr3446049qtx.21.1680620095710; 
 Tue, 04 Apr 2023 07:54:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrWqDzCGkW5Me9zkv+YJzY1mx+oPLzV295riL8PYBIw4GPxqdHHd+/6CyZuOvEvtkOcPBiVQ==
X-Received: by 2002:ac8:5dca:0:b0:3e6:4843:ce39 with SMTP id
 e10-20020ac85dca000000b003e64843ce39mr3445998qtx.21.1680620095304; 
 Tue, 04 Apr 2023 07:54:55 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:54:55 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:00 +0200
Message-Id: <20230404145319.2057051-5-aalbersh@redhat.com>
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
 Content preview: From: Allison Henderson <allison.henderson@oracle.com>
 Attribute
 names of parent pointers are not strings. So we need to modify attr_namecheck
 to verify parent pointer records when the XFS_ATTR_PARENT flag is set. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
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
X-Headers-End: 1pji3s-00Ez6U-8y
Subject: [f2fs-dev] [PATCH v2 04/23] xfs: Add xfs_verify_pptr
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
 cluster-devel@redhat.com, Allison Henderson <allison.henderson@oracle.com>,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Allison Henderson <allison.henderson@oracle.com>

Attribute names of parent pointers are not strings.  So we need to modify
attr_namecheck to verify parent pointer records when the XFS_ATTR_PARENT flag is
set.

Signed-off-by: Allison Henderson <allison.henderson@oracle.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_attr.c      | 47 ++++++++++++++++++++++++++++++++---
 fs/xfs/libxfs/xfs_attr.h      |  3 ++-
 fs/xfs/libxfs/xfs_da_format.h |  8 ++++++
 fs/xfs/scrub/attr.c           |  2 +-
 fs/xfs/xfs_attr_item.c        | 11 +++++---
 fs/xfs/xfs_attr_list.c        | 17 +++++++++----
 6 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
index 101823772bf9..711022742e34 100644
--- a/fs/xfs/libxfs/xfs_attr.c
+++ b/fs/xfs/libxfs/xfs_attr.c
@@ -1577,9 +1577,33 @@ xfs_attr_node_get(
 	return error;
 }
 
-/* Returns true if the attribute entry name is valid. */
-bool
-xfs_attr_namecheck(
+/*
+ * Verify parent pointer attribute is valid.
+ * Return true on success or false on failure
+ */
+STATIC bool
+xfs_verify_pptr(
+	struct xfs_mount			*mp,
+	const struct xfs_parent_name_rec	*rec)
+{
+	xfs_ino_t				p_ino;
+	xfs_dir2_dataptr_t			p_diroffset;
+
+	p_ino = be64_to_cpu(rec->p_ino);
+	p_diroffset = be32_to_cpu(rec->p_diroffset);
+
+	if (!xfs_verify_ino(mp, p_ino))
+		return false;
+
+	if (p_diroffset > XFS_DIR2_MAX_DATAPTR)
+		return false;
+
+	return true;
+}
+
+/* Returns true if the string attribute entry name is valid. */
+static bool
+xfs_str_attr_namecheck(
 	const void	*name,
 	size_t		length)
 {
@@ -1594,6 +1618,23 @@ xfs_attr_namecheck(
 	return !memchr(name, 0, length);
 }
 
+/* Returns true if the attribute entry name is valid. */
+bool
+xfs_attr_namecheck(
+	struct xfs_mount	*mp,
+	const void		*name,
+	size_t			length,
+	int			flags)
+{
+	if (flags & XFS_ATTR_PARENT) {
+		if (length != sizeof(struct xfs_parent_name_rec))
+			return false;
+		return xfs_verify_pptr(mp, (struct xfs_parent_name_rec *)name);
+	}
+
+	return xfs_str_attr_namecheck(name, length);
+}
+
 int __init
 xfs_attr_intent_init_cache(void)
 {
diff --git a/fs/xfs/libxfs/xfs_attr.h b/fs/xfs/libxfs/xfs_attr.h
index 3e81f3f48560..b79dae788cfb 100644
--- a/fs/xfs/libxfs/xfs_attr.h
+++ b/fs/xfs/libxfs/xfs_attr.h
@@ -547,7 +547,8 @@ int xfs_attr_get(struct xfs_da_args *args);
 int xfs_attr_set(struct xfs_da_args *args);
 int xfs_attr_set_iter(struct xfs_attr_intent *attr);
 int xfs_attr_remove_iter(struct xfs_attr_intent *attr);
-bool xfs_attr_namecheck(const void *name, size_t length);
+bool xfs_attr_namecheck(struct xfs_mount *mp, const void *name, size_t length,
+			int flags);
 int xfs_attr_calc_size(struct xfs_da_args *args, int *local);
 void xfs_init_attr_trans(struct xfs_da_args *args, struct xfs_trans_res *tres,
 			 unsigned int *total);
diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index b02b67f1999e..75b13807145d 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -731,6 +731,14 @@ xfs_attr3_leaf_name(xfs_attr_leafblock_t *leafp, int idx)
 	return &((char *)leafp)[be16_to_cpu(entries[idx].nameidx)];
 }
 
+static inline int
+xfs_attr3_leaf_flags(xfs_attr_leafblock_t *leafp, int idx)
+{
+	struct xfs_attr_leaf_entry *entries = xfs_attr3_leaf_entryp(leafp);
+
+	return entries[idx].flags;
+}
+
 static inline xfs_attr_leaf_name_remote_t *
 xfs_attr3_leaf_name_remote(xfs_attr_leafblock_t *leafp, int idx)
 {
diff --git a/fs/xfs/scrub/attr.c b/fs/xfs/scrub/attr.c
index 9d2e33743ecd..2a79a13cb600 100644
--- a/fs/xfs/scrub/attr.c
+++ b/fs/xfs/scrub/attr.c
@@ -129,7 +129,7 @@ xchk_xattr_listent(
 	}
 
 	/* Does this name make sense? */
-	if (!xfs_attr_namecheck(name, namelen)) {
+	if (!xfs_attr_namecheck(sx->sc->mp, name, namelen, flags)) {
 		xchk_fblock_set_corrupt(sx->sc, XFS_ATTR_FORK, args.blkno);
 		return;
 	}
diff --git a/fs/xfs/xfs_attr_item.c b/fs/xfs/xfs_attr_item.c
index 95e9ecbb4a67..da807f286a09 100644
--- a/fs/xfs/xfs_attr_item.c
+++ b/fs/xfs/xfs_attr_item.c
@@ -593,7 +593,8 @@ xfs_attri_item_recover(
 	 */
 	attrp = &attrip->attri_format;
 	if (!xfs_attri_validate(mp, attrp) ||
-	    !xfs_attr_namecheck(nv->name.i_addr, nv->name.i_len))
+	    !xfs_attr_namecheck(mp, nv->name.i_addr, nv->name.i_len,
+				attrp->alfi_attr_filter))
 		return -EFSCORRUPTED;
 
 	error = xlog_recover_iget(mp,  attrp->alfi_ino, &ip);
@@ -804,7 +805,8 @@ xlog_recover_attri_commit_pass2(
 	}
 
 	attr_name = item->ri_buf[i].i_addr;
-	if (!xfs_attr_namecheck(attr_name, attri_formatp->alfi_name_len)) {
+	if (!xfs_attr_namecheck(mp, attr_name, attri_formatp->alfi_name_len,
+				attri_formatp->alfi_attr_filter)) {
 		XFS_CORRUPTION_ERROR(__func__, XFS_ERRLEVEL_LOW, mp,
 				item->ri_buf[i].i_addr, item->ri_buf[i].i_len);
 		return -EFSCORRUPTED;
@@ -822,8 +824,9 @@ xlog_recover_attri_commit_pass2(
 		}
 
 		attr_nname = item->ri_buf[i].i_addr;
-		if (!xfs_attr_namecheck(attr_nname,
-				attri_formatp->alfi_nname_len)) {
+		if (!xfs_attr_namecheck(mp, attr_nname,
+				attri_formatp->alfi_nname_len,
+				attri_formatp->alfi_attr_filter)) {
 			XFS_CORRUPTION_ERROR(__func__, XFS_ERRLEVEL_LOW, mp,
 					item->ri_buf[i].i_addr,
 					item->ri_buf[i].i_len);
diff --git a/fs/xfs/xfs_attr_list.c b/fs/xfs/xfs_attr_list.c
index 99bbbe1a0e44..a51f7f13a352 100644
--- a/fs/xfs/xfs_attr_list.c
+++ b/fs/xfs/xfs_attr_list.c
@@ -58,9 +58,13 @@ xfs_attr_shortform_list(
 	struct xfs_attr_sf_sort		*sbuf, *sbp;
 	struct xfs_attr_shortform	*sf;
 	struct xfs_attr_sf_entry	*sfe;
+	struct xfs_mount		*mp;
 	int				sbsize, nsbuf, count, i;
 	int				error = 0;
 
+	ASSERT(context != NULL);
+	ASSERT(dp != NULL);
+	mp = dp->i_mount;
 	sf = (struct xfs_attr_shortform *)dp->i_af.if_u1.if_data;
 	ASSERT(sf != NULL);
 	if (!sf->hdr.count)
@@ -82,8 +86,9 @@ xfs_attr_shortform_list(
 	     (dp->i_af.if_bytes + sf->hdr.count * 16) < context->bufsize)) {
 		for (i = 0, sfe = &sf->list[0]; i < sf->hdr.count; i++) {
 			if (XFS_IS_CORRUPT(context->dp->i_mount,
-					   !xfs_attr_namecheck(sfe->nameval,
-							       sfe->namelen)))
+					   !xfs_attr_namecheck(mp, sfe->nameval,
+							       sfe->namelen,
+							       sfe->flags)))
 				return -EFSCORRUPTED;
 			context->put_listent(context,
 					     sfe->flags,
@@ -174,8 +179,9 @@ xfs_attr_shortform_list(
 			cursor->offset = 0;
 		}
 		if (XFS_IS_CORRUPT(context->dp->i_mount,
-				   !xfs_attr_namecheck(sbp->name,
-						       sbp->namelen))) {
+				   !xfs_attr_namecheck(mp, sbp->name,
+						       sbp->namelen,
+						       sbp->flags))) {
 			error = -EFSCORRUPTED;
 			goto out;
 		}
@@ -465,7 +471,8 @@ xfs_attr3_leaf_list_int(
 		}
 
 		if (XFS_IS_CORRUPT(context->dp->i_mount,
-				   !xfs_attr_namecheck(name, namelen)))
+				   !xfs_attr_namecheck(mp, name, namelen,
+						       entry->flags)))
 			return -EFSCORRUPTED;
 		context->put_listent(context, entry->flags,
 					      name, namelen, valuelen);
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
