Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DDF6D65FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4R-00026q-28;
	Tue, 04 Apr 2023 14:55:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4P-00026C-78
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qBYfR9y7mc4emCV9kD7O8/LELcLcH0cCLkcuznWVRNE=; b=IsZnP3wtzI7Xow4CQa6fYBHbbY
 NNRqkOqBUbQJNCeuGAlsfNlH8tg2BWkgqEaHw0Y4c62oLDOv9AOzr6ZPY9ZjJbJCtbF73tlzN4aCb
 MQkFqqtwKrNuEOrIeTPqveLInOvcSggciY8yB1NAQBpGKjEuhxF9aqlprpkj9L6HpVYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qBYfR9y7mc4emCV9kD7O8/LELcLcH0cCLkcuznWVRNE=; b=Riz9zzTVIoUx/9yh4ekc658wru
 AmT3DjwOjQpz1ZxJ9WFMoiaNwe25CrxOUrdPPlbUY6QlcaM4CxlXVIslt1LG5YhAu2MD4medYrmwy
 VMZ0R0TQ42tFQ6ynYfLVONWqMGaZ5QJdHY5ujorG/8ZuoVZeTGLjh69dolS3FSfiIfCM=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4N-00Ez8m-2i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBYfR9y7mc4emCV9kD7O8/LELcLcH0cCLkcuznWVRNE=;
 b=HTiw/liJMegjz+Tl1wLGQATZrf5NKGnHMOpZKOlWwbyPBoFoXcJ2Lb/HDI0FG+krbWnRou
 tFVAdKEEpSvo4iaLSmOP9Vh80DxW8kmBvvwJQnqvYJzLbGIMEuJgEa0GA8/b7dtKrZYV7T
 2SH3L1AUSQnDc1ieScd26nAwkpwVMkc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-gg4wJ_vBOxus2BPC7vSy3A-1; Tue, 04 Apr 2023 10:55:28 -0400
X-MC-Unique: gg4wJ_vBOxus2BPC7vSy3A-1
Received: by mail-qt1-f199.google.com with SMTP id
 s23-20020a05622a1a9700b003e6578904c3so3760255qtc.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBYfR9y7mc4emCV9kD7O8/LELcLcH0cCLkcuznWVRNE=;
 b=dwR2dhc1bRrTX3i7/hvZhrhVw5GnGiZzu0mUmNQY1Y0mGNUCrmjMOyXJi/r1Z87XhM
 4GLD3WLROBTYjskz8TOe5Ac40E3KzWear+uD4fmPn0QwgmQPsXSecFBgMiXStLdTz04g
 qEaOblhQchV8fQ0jSI6eo5+ZvycqAZVvZFQUXeADGXIvjdzYsIRK0Et0FqpHYV7qbMCu
 JzTUeqEN1EYvQMrNKBBGM9ojtFIKGEXdlFOWpONUfAJpI5dUOEwIEOKKKhp2mgpSuyCd
 dncbc9hMBbkxENvrbbVtp14t8XkP5fZuop61tT4pk0m11BMb2ic7Yup8moSzGuQQa+I/
 cepw==
X-Gm-Message-State: AAQBX9c/cIrYddkzmmJB/R9pEIXaWPWfbW7V0SHztE3inpnV94N/aQSc
 NjqU/umey7elaNpEKLqxcbjwCqa2i7D1YYU+PsI+6Jrt8cqs5EA0xLpvB5C248KhYAdkSvIE07C
 WkTkrxXldBsCN40CmkET1jXIaa1fTK0j5bKU6
X-Received: by 2002:a05:622a:199c:b0:3e4:3f79:9d7b with SMTP id
 u28-20020a05622a199c00b003e43f799d7bmr3716048qtc.55.1680620127337; 
 Tue, 04 Apr 2023 07:55:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPhI2S3MEB+MRHM6CVfbFypXk0qGatbwEPU5syhmYxnWr2Q3wqyiCRz9ctEKISxtGe9l4JDA==
X-Received: by 2002:a05:622a:199c:b0:3e4:3f79:9d7b with SMTP id
 u28-20020a05622a199c00b003e43f799d7bmr3716007qtc.55.1680620126943; 
 Tue, 04 Apr 2023 07:55:26 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:26 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:10 +0200
Message-Id: <20230404145319.2057051-15-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The Merkle tree blocks and descriptor are stored in the
 extended
 attributes of the inode. Add new attribute type for fs-verity metadata. Add
 XFS_ATTR_INTERNAL_MASK to skip parent pointer and fs-verity [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji4N-00Ez8m-2i
Subject: [f2fs-dev] [PATCH v2 14/23] xfs: add attribute type for fs-verity
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

The Merkle tree blocks and descriptor are stored in the extended
attributes of the inode. Add new attribute type for fs-verity
metadata. Add XFS_ATTR_INTERNAL_MASK to skip parent pointer and
fs-verity attributes as those are only for internal use. While we're
at it add a few comments in relevant places that internally visible
attributes are not suppose to be handled via interface defined in
xfs_xattr.c.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_da_format.h  | 10 +++++++++-
 fs/xfs/libxfs/xfs_log_format.h |  1 +
 fs/xfs/xfs_ioctl.c             |  5 +++++
 fs/xfs/xfs_trace.h             |  1 +
 fs/xfs/xfs_xattr.c             |  9 +++++++++
 5 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index 75b13807145d..2b5967befc2e 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -689,14 +689,22 @@ struct xfs_attr3_leafblock {
 #define	XFS_ATTR_ROOT_BIT	1	/* limit access to trusted attrs */
 #define	XFS_ATTR_SECURE_BIT	2	/* limit access to secure attrs */
 #define	XFS_ATTR_PARENT_BIT	3	/* parent pointer attrs */
+#define	XFS_ATTR_VERITY_BIT	4	/* verity merkle tree and descriptor */
 #define	XFS_ATTR_INCOMPLETE_BIT	7	/* attr in middle of create/delete */
 #define XFS_ATTR_LOCAL		(1u << XFS_ATTR_LOCAL_BIT)
 #define XFS_ATTR_ROOT		(1u << XFS_ATTR_ROOT_BIT)
 #define XFS_ATTR_SECURE		(1u << XFS_ATTR_SECURE_BIT)
 #define XFS_ATTR_PARENT		(1u << XFS_ATTR_PARENT_BIT)
+#define XFS_ATTR_VERITY		(1u << XFS_ATTR_VERITY_BIT)
 #define XFS_ATTR_INCOMPLETE	(1u << XFS_ATTR_INCOMPLETE_BIT)
 #define XFS_ATTR_NSP_ONDISK_MASK \
-			(XFS_ATTR_ROOT | XFS_ATTR_SECURE | XFS_ATTR_PARENT)
+			(XFS_ATTR_ROOT | XFS_ATTR_SECURE | XFS_ATTR_PARENT | \
+			 XFS_ATTR_VERITY)
+
+/*
+ * Internal attributes not exposed to the user
+ */
+#define XFS_ATTR_INTERNAL_MASK (XFS_ATTR_PARENT | XFS_ATTR_VERITY)
 
 /*
  * Alignment for namelist and valuelist entries (since they are mixed
diff --git a/fs/xfs/libxfs/xfs_log_format.h b/fs/xfs/libxfs/xfs_log_format.h
index 727b5a858028..678eacb7925c 100644
--- a/fs/xfs/libxfs/xfs_log_format.h
+++ b/fs/xfs/libxfs/xfs_log_format.h
@@ -968,6 +968,7 @@ struct xfs_icreate_log {
 #define XFS_ATTRI_FILTER_MASK		(XFS_ATTR_ROOT | \
 					 XFS_ATTR_SECURE | \
 					 XFS_ATTR_PARENT | \
+					 XFS_ATTR_VERITY | \
 					 XFS_ATTR_INCOMPLETE)
 
 /*
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index 55bb01173cde..3d6d680b6cf3 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -351,6 +351,11 @@ static unsigned int
 xfs_attr_filter(
 	u32			ioc_flags)
 {
+	/*
+	 * Only externally visible attributes should be specified here.
+	 * Internally used attributes (such as parent pointers or fs-verity)
+	 * should not be exposed to userspace.
+	 */
 	if (ioc_flags & XFS_IOC_ATTR_ROOT)
 		return XFS_ATTR_ROOT;
 	if (ioc_flags & XFS_IOC_ATTR_SECURE)
diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index 9c0006c55fec..e842b9d145cb 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -79,6 +79,7 @@ struct xfs_perag;
 #define XFS_ATTR_FILTER_FLAGS \
 	{ XFS_ATTR_ROOT,	"ROOT" }, \
 	{ XFS_ATTR_SECURE,	"SECURE" }, \
+	{ XFS_ATTR_VERITY,	"VERITY" }, \
 	{ XFS_ATTR_INCOMPLETE,	"INCOMPLETE" }
 
 DECLARE_EVENT_CLASS(xfs_attr_list_class,
diff --git a/fs/xfs/xfs_xattr.c b/fs/xfs/xfs_xattr.c
index 7b9a0ed1b11f..5a71797fbd44 100644
--- a/fs/xfs/xfs_xattr.c
+++ b/fs/xfs/xfs_xattr.c
@@ -20,6 +20,12 @@
 
 #include <linux/posix_acl_xattr.h>
 
+/*
+ * This file defines interface to work with externally visible extended
+ * attributes, such as those in system or security namespaces. This interface
+ * should not be used for internally used attributes (consider xfs_attr.c).
+ */
+
 /*
  * Get permission to use log-assisted atomic exchange of file extents.
  *
@@ -234,6 +240,9 @@ xfs_xattr_put_listent(
 
 	ASSERT(context->count >= 0);
 
+	if (flags & XFS_ATTR_INTERNAL_MASK)
+		return;
+
 	if (flags & XFS_ATTR_ROOT) {
 #ifdef CONFIG_XFS_POSIX_ACL
 		if (namelen == SGI_ACL_FILE_SIZE &&
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
