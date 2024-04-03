Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F417D896739
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvPv-0002lU-QT;
	Wed, 03 Apr 2024 07:52:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvPu-0002lK-9S
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hgNG3Zr2MtLq0GIKKJTRzv4xGMhx/WuzOjui/PQ1JOQ=; b=To7nI8D23qHwjCRYIJXFfeqSec
 mfrTbVsDyaZ5YEtlz2jqkx7IPKDaKHXd9Z/DxND13PKbjXCyj3m08rQzrPk5qBVCxwaTgAj+KGmu5
 HfQtcmj7ZaTqml9aWerS5VA9SahXSS+m9xrFXHE6bbEwoScT07d8FTDyn7XHpSAdSFwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hgNG3Zr2MtLq0GIKKJTRzv4xGMhx/WuzOjui/PQ1JOQ=; b=IfXoL/DF248NSzcTKH/Oezg6gQ
 Vk8XDmf/1CEXzVbPKO4aXY5lxhDxR6gJn8QWEznkUSV144Mzpu3jhfqdu8Sg+PEiafQWgKtOtN8Ra
 dBz1yqhYyq0f/ddROJ+noLq0+Hz2bENrIO+SvDmTJfHR1k3OC6cUd8AABp6o/fjXlSmc=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvPq-0001kU-0j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:18 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id BDBF98089D;
 Wed,  3 Apr 2024 03:33:24 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129605; bh=LnQUExMEi4K5Eq4tutxz2pOoBuBB93Ng5m6J9LLHIv8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ShLq06yRFTESpZJwiWHcJo16tBtJUgnqA9agoyQSzZAWKNutSxyYios9BpbTInyZk
 ScSiv6shQNZnemhUNUlVK2nqEIApjUSOluBjpuf2tmZJn8tx2zsV7xYlxyDuSUDP+5
 JR4dJlnpOG6rCx+Bgqk/kHpkK61yY3GXzTQ1RAljAGTG8f8bA+dNbrf7psorjEw+SH
 HHsns8Qgyx50zcnfxXrLvu27AaOv9tnb4ZHCDSYtifvkkKPYCogkQa6FrqvBR59QAP
 T/O7VI6Y41ZUJaargTyw3VjXUaZoNxhNjUUOri0m9QA0XtsCxey/Q/c+brGFL7QGe7
 BhSc4Llv+6ngQ==
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
Date: Wed,  3 Apr 2024 03:22:50 -0400
Message-ID: <3bcdf126c1db6b4119d4bbdd4dc621c3ca3e2ae1.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
 --- fs/f2fs/data.c | 25 ++++++++++++++++--------- fs/f2fs/inline.c | 2 +-
 2 files changed, 17 insertions(+), 10 deletions(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index 34af1673461b..2a3625c10125 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -1829, 7 +1829,
 9 @@ static int f2fs_xattr_fiemap(struct inode *inode, 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rrvPq-0001kU-0j
Subject: [f2fs-dev] [PATCH v3 09/13] f2fs: fiemap: return correct extent
 physical length
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

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 fs/f2fs/data.c   | 25 ++++++++++++++++---------
 fs/f2fs/inline.c |  2 +-
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 34af1673461b..2a3625c10125 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1829,7 +1829,9 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 
 		f2fs_put_page(page, 1);
 
-		flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED;
+		flags = FIEMAP_EXTENT_DATA_INLINE |
+			FIEMAP_EXTENT_NOT_ALIGNED |
+			FIEMAP_EXTENT_HAS_PHYS_LEN;
 
 		if (!xnid)
 			flags |= FIEMAP_EXTENT_LAST;
@@ -1857,7 +1859,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 
 		f2fs_put_page(page, 1);
 
-		flags = FIEMAP_EXTENT_LAST;
+		flags = FIEMAP_EXTENT_LAST | FIEMAP_EXTENT_HAS_PHYS_LEN;
 	}
 
 	if (phys) {
@@ -1894,8 +1896,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	struct f2fs_map_blocks map;
 	sector_t start_blk, last_blk;
 	pgoff_t next_pgofs;
-	u64 logical = 0, phys = 0, size = 0;
-	u32 flags = 0;
+	u64 logical = 0, phys = 0, size = 0, phys_size = 0;
+	u32 flags = FIEMAP_EXTENT_HAS_PHYS_LEN;
 	int ret = 0;
 	bool compr_cluster = false, compr_appended;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
@@ -1981,11 +1983,12 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
 
 		ret = fiemap_fill_next_extent(fieinfo, logical,
-				phys, size, 0, flags);
-		trace_f2fs_fiemap(inode, logical, phys, size, 0, flags, ret);
+				phys, size, phys_size, flags);
+		trace_f2fs_fiemap(inode, logical, phys, size, phys_size, flags, ret);
 		if (ret)
 			goto out;
 		size = 0;
+		phys_size = 0;
 	}
 
 	if (start_blk > last_blk)
@@ -2006,17 +2009,21 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		phys = __is_valid_data_blkaddr(map.m_pblk) ?
 			blks_to_bytes(inode, map.m_pblk) : 0;
 		size = blks_to_bytes(inode, map.m_len);
-		flags = 0;
+		phys_size = blks_to_bytes(inode, map.m_len);
+		flags = FIEMAP_EXTENT_HAS_PHYS_LEN;
 
 		if (compr_cluster) {
-			flags = FIEMAP_EXTENT_ENCODED;
+			flags = FIEMAP_EXTENT_ENCODED |
+				FIEMAP_EXTENT_HAS_PHYS_LEN;
 			count_in_cluster += map.m_len;
 			if (count_in_cluster == cluster_size) {
 				compr_cluster = false;
 				size += blks_to_bytes(inode, 1);
+				phys_size += blks_to_bytes(inode, 1);
 			}
 		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
-			flags = FIEMAP_EXTENT_UNWRITTEN;
+			flags = FIEMAP_EXTENT_UNWRITTEN |
+				FIEMAP_EXTENT_HAS_PHYS_LEN;
 		}
 
 		start_blk += bytes_to_blks(inode, size);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 235b0d72f6fc..c1c804a754de 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -772,7 +772,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 {
 	__u64 byteaddr, ilen;
 	__u32 flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED |
-		FIEMAP_EXTENT_LAST;
+		FIEMAP_EXTENT_HAS_PHYS_LEN | FIEMAP_EXTENT_LAST;
 	struct node_info ni;
 	struct page *ipage;
 	int err = 0;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
