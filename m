Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977E89673C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvPx-0005mA-7P;
	Wed, 03 Apr 2024 07:52:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvPv-0005ls-At
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YIc4KfiR6liu8Si7AocJ/Ewyg82WwMQuQBXKzCZ5x/I=; b=BH6DvGAKL/SYjNtCZrghEP7iEz
 JYh5PCG+wYeY/KitYKZ6H+n6wGS7Zbc6/rHrLt9Hb60BG1C8Lchz0UqB5hVSINp9xcRrRDhIiwA8o
 jzGoSRPnnoSVaWhlJdxjvZrFVl+hjHWhKqC43P2aAeMQ25KU3hRFfTGOBbcAQhGXigBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YIc4KfiR6liu8Si7AocJ/Ewyg82WwMQuQBXKzCZ5x/I=; b=KWpuJSUd0BcnNVohwOVtunPebb
 k84xhLqmq5yvdmfwmUTdgnodVKi23Y+mG852HQj1IW68N39kBZxL1hWpkY1kCHJ4/8C3jTjhnSz4m
 z50nQiUSJKMXDxpr1W3UbFeGRo3/UbBm0XIwx/o+yZjjLgWFrJV4rx7D1FpKmxmh/jf8=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvPv-0001kl-2V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:20 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 47146807A5;
 Wed,  3 Apr 2024 03:33:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129585; bh=8hdRucriYr7TDeIc1Z7lCtD9oMQ64x6lsX9+VmwRajs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=duAbvHkdgGafhhkA8hd0r625830aALZZQ8oxeANR/Kl8V2xZug5kmcP4vI1YapxFN
 A9LIDRTvjeSQOhcIpRDoLRTbG3NMyvM/72K1ifkS/Z9WVfqJVjWSBQ7y9OWOKItEFi
 P+IExaIGlJDtZ5Rx/+twB5qnULd5b1xw9JJmHoTUZK1CNmor9ry/3WJ5MlliuOXzge
 eoaW6DepcInBi/zwZ/15PRH144T5KOWel/2PH8M2LXhMM/YZG6q5hG/wxWX1eFQHXr
 y0rEkGXPrjhNC8NJHfsw4ypdhHDVDROcDUUlNXmuBJ6WY9PkwLnPjt68hBA1lQ7Eyb
 PKcWh0anOhPtA==
To: Jonathan Corbet <corbet@lwn.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Date: Wed,  3 Apr 2024 03:22:42 -0400
Message-ID: <1ba5bfccccbf4ff792f178268badde056797d0c4.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Some filesystems support compressed extents which have a
 larger
 logical size than physical, and for those filesystems, it can be useful for
 userspace to know how much space those extents actually use. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rrvPv-0001kl-2V
Subject: [f2fs-dev] [PATCH v3 01/13] fs: fiemap: add physical_length field
 to extents
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some filesystems support compressed extents which have a larger logical
size than physical, and for those filesystems, it can be useful for
userspace to know how much space those extents actually use. For
instance, the compsize [1] tool for btrfs currently uses btrfs-internal,
root-only ioctl to find the actual disk space used by a file; it would
be better and more useful for this information to require fewer
privileges and to be usable on more filesystems. Therefore, use one of
the padding u64s in the fiemap extent structure to return the actual
physical length; and, for now, return this as equal to the logical
length.

[1] https://github.com/kilobyte/compsize

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 Documentation/filesystems/fiemap.rst | 28 +++++++++++++++++-------
 fs/ioctl.c                           |  3 ++-
 include/uapi/linux/fiemap.h          | 32 ++++++++++++++++++++++------
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/Documentation/filesystems/fiemap.rst b/Documentation/filesystems/fiemap.rst
index 93fc96f760aa..c2bfa107c8d7 100644
--- a/Documentation/filesystems/fiemap.rst
+++ b/Documentation/filesystems/fiemap.rst
@@ -80,14 +80,24 @@ Each extent is described by a single fiemap_extent structure as
 returned in fm_extents::
 
     struct fiemap_extent {
-	    __u64	fe_logical;  /* logical offset in bytes for the start of
-				* the extent */
-	    __u64	fe_physical; /* physical offset in bytes for the start
-				* of the extent */
-	    __u64	fe_length;   /* length in bytes for the extent */
-	    __u64	fe_reserved64[2];
-	    __u32	fe_flags;    /* FIEMAP_EXTENT_* flags for this extent */
-	    __u32	fe_reserved[3];
+            /*
+             * logical offset in bytes for the start of
+             * the extent from the beginning of the file
+             */
+            __u64 fe_logical;
+            /*
+             * physical offset in bytes for the start
+             * of the extent from the beginning of the disk
+             */
+            __u64 fe_physical;
+            /* logical length in bytes for this extent */
+            __u64 fe_logical_length;
+            /* physical length in bytes for this extent */
+            __u64 fe_physical_length;
+            __u64 fe_reserved64[1];
+            /* FIEMAP_EXTENT_* flags for this extent */
+            __u32 fe_flags;
+            __u32 fe_reserved[3];
     };
 
 All offsets and lengths are in bytes and mirror those on disk.  It is valid
@@ -175,6 +185,8 @@ FIEMAP_EXTENT_MERGED
   userspace would be highly inefficient, the kernel will try to merge most
   adjacent blocks into 'extents'.
 
+FIEMAP_EXTENT_HAS_PHYS_LEN
+  This will be set if the file system populated the physical length field.
 
 VFS -> File System Implementation
 ---------------------------------
diff --git a/fs/ioctl.c b/fs/ioctl.c
index 661b46125669..8afd32e1a27a 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -138,7 +138,8 @@ int fiemap_fill_next_extent(struct fiemap_extent_info *fieinfo, u64 logical,
 	memset(&extent, 0, sizeof(extent));
 	extent.fe_logical = logical;
 	extent.fe_physical = phys;
-	extent.fe_length = len;
+	extent.fe_logical_length = len;
+	extent.fe_physical_length = len;
 	extent.fe_flags = flags;
 
 	dest += fieinfo->fi_extents_mapped;
diff --git a/include/uapi/linux/fiemap.h b/include/uapi/linux/fiemap.h
index 24ca0c00cae3..3079159b8e94 100644
--- a/include/uapi/linux/fiemap.h
+++ b/include/uapi/linux/fiemap.h
@@ -14,14 +14,30 @@
 
 #include <linux/types.h>
 
+/*
+ * For backward compatibility, where the member of the struct was called
+ * fe_length instead of fe_logical_length.
+ */
+#define fe_length fe_logical_length
+
 struct fiemap_extent {
-	__u64 fe_logical;  /* logical offset in bytes for the start of
-			    * the extent from the beginning of the file */
-	__u64 fe_physical; /* physical offset in bytes for the start
-			    * of the extent from the beginning of the disk */
-	__u64 fe_length;   /* length in bytes for this extent */
-	__u64 fe_reserved64[2];
-	__u32 fe_flags;    /* FIEMAP_EXTENT_* flags for this extent */
+	/*
+	 * logical offset in bytes for the start of
+	 * the extent from the beginning of the file
+	 */
+	__u64 fe_logical;
+	/*
+	 * physical offset in bytes for the start
+	 * of the extent from the beginning of the disk
+	 */
+	__u64 fe_physical;
+	/* logical length in bytes for this extent */
+	__u64 fe_logical_length;
+	/* physical length in bytes for this extent */
+	__u64 fe_physical_length;
+	__u64 fe_reserved64[1];
+	/* FIEMAP_EXTENT_* flags for this extent */
+	__u32 fe_flags;
 	__u32 fe_reserved[3];
 };
 
@@ -66,5 +82,7 @@ struct fiemap {
 						    * merged for efficiency. */
 #define FIEMAP_EXTENT_SHARED		0x00002000 /* Space shared with other
 						    * files. */
+#define FIEMAP_EXTENT_HAS_PHYS_LEN	0x00004000 /* Physical length is valid
+						    * and set by FS. */
 
 #endif /* _UAPI_LINUX_FIEMAP_H */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
