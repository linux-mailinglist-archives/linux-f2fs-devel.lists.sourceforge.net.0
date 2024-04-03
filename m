Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4689673E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvPw-0005cU-1c;
	Wed, 03 Apr 2024 07:52:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvPu-0005cO-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IX3KpPM4W+j2ivkrNeAafVbPQd2u0lN8UtjO6Vi2ho0=; b=L0VH8GcS1pkaaXnunfHOer7yFa
 gGxnjLtajvgGAB654JO/FZetl4ciCqZp2mDGNTa7EH67ci5DjMZ2BMUEAG0kncOoNFI6kEX1KgEoI
 PVm4urwysNO73wdIvVBGGFFe4G2ELMTxcKuUUXNnZfKlZjxceIDLh7Iqo2bFEBHaGUyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IX3KpPM4W+j2ivkrNeAafVbPQd2u0lN8UtjO6Vi2ho0=; b=CV0rYQuhRy9xGjgQZAO/8bDr+T
 Ux47lF1QYMgkmP5Jfu2wWpgUkkl4ZniY/OwB51zIpkC9BAqpEyrA0LB87ZtUzgwEE19WgAebjADlD
 aSOfmWbs2k3gcGrozPKL8DcdGTaqUx39fahW4ZVoGxVUIx21QfkzgmXz4jrJMP7ZnKJA=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvPq-0001kT-07 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:18 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 41FCF807B2;
 Wed,  3 Apr 2024 03:33:10 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129590; bh=5jSs8nU917GCzbrVP0KXLbUutJOMwr3M87eATF8xiYE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I+GHyyn2AqhIMgJR35EkQswgG3miJcGyEJxwzXEC6xVoLDp2OlwyCosaNuuCkBCB9
 e3mF+1V+JntbUuBhT+zndD8j1+FQqYM+m18PAE0UkxIGavLc/UHnvJgLZlPhY3HvRU
 dAB1kd2oBY1IVAYOFyco0jcQzCh32wCqvmI1yUvKFEjAsgvRdtJEggWdai9Jldcnqz
 ZrXXRiSB4ad5DztioJsAP3FkLablHBamn3DBFU9p+4wWhQQJptJQTzZ4KPwbj+Bogf
 R+1oWcA8RUDRvVc2MjugMnBE1zMK/gXCQTxbPRZqZkrJjkesi+ktRnElXyFYmnL7+R
 VHl1Slf2emloA==
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
Date: Wed,  3 Apr 2024 03:22:44 -0400
Message-ID: <2befe2c13065bdf3ca74cb8b701727940310fd2a.1712126039.git.sweettea-kernel@dorminy.me>
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
 Content preview: This goes closely with the new physical length field in
 struct
 fiemap_extent, as when physical length is not equal to logical length the
 reason is frequently compression. Signed-off-by: Sweet Tea Dorminy
 <sweettea-kernel@dorminy.me>
 --- Documentation/filesystems/fiemap.rst | 4 ++++ fs/ioctl.c | 3 ++-
 include/uapi/linux/fiemap.h
 | 2 ++ 3 files changed, 8 insertions(+), [...] 
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
X-Headers-End: 1rrvPq-0001kT-07
Subject: [f2fs-dev] [PATCH v3 03/13] fs: fiemap: add new COMPRESSED extent
 state
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

This goes closely with the new physical length field in struct
fiemap_extent, as when physical length is not equal to logical length
the reason is frequently compression.

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 Documentation/filesystems/fiemap.rst | 4 ++++
 fs/ioctl.c                           | 3 ++-
 include/uapi/linux/fiemap.h          | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/fiemap.rst b/Documentation/filesystems/fiemap.rst
index c060bb83f5d8..16bd7faba5e0 100644
--- a/Documentation/filesystems/fiemap.rst
+++ b/Documentation/filesystems/fiemap.rst
@@ -162,6 +162,10 @@ FIEMAP_EXTENT_DATA_ENCRYPTED
   This will also set FIEMAP_EXTENT_ENCODED
   The data in this extent has been encrypted by the file system.
 
+FIEMAP_EXTENT_DATA_COMPRESSED
+  This will also set FIEMAP_EXTENT_ENCODED
+  The data in this extent is compressed by the file system.
+
 FIEMAP_EXTENT_NOT_ALIGNED
   Extent offsets and length are not guaranteed to be block aligned.
 
diff --git a/fs/ioctl.c b/fs/ioctl.c
index 1830baca532b..b47e2da7ec17 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -126,7 +126,8 @@ int fiemap_fill_next_extent(struct fiemap_extent_info *fieinfo, u64 logical,
 		return 1;
 
 #define SET_UNKNOWN_FLAGS	(FIEMAP_EXTENT_DELALLOC)
-#define SET_NO_UNMOUNTED_IO_FLAGS	(FIEMAP_EXTENT_DATA_ENCRYPTED)
+#define SET_NO_UNMOUNTED_IO_FLAGS	(FIEMAP_EXTENT_DATA_ENCRYPTED|\
+					 FIEMAP_EXTENT_DATA_COMPRESSED)
 #define SET_NOT_ALIGNED_FLAGS	(FIEMAP_EXTENT_DATA_TAIL|FIEMAP_EXTENT_DATA_INLINE)
 
 	if (flags & SET_UNKNOWN_FLAGS)
diff --git a/include/uapi/linux/fiemap.h b/include/uapi/linux/fiemap.h
index 3079159b8e94..ea97e33ddbb3 100644
--- a/include/uapi/linux/fiemap.h
+++ b/include/uapi/linux/fiemap.h
@@ -67,6 +67,8 @@ struct fiemap {
 						    * Sets EXTENT_UNKNOWN. */
 #define FIEMAP_EXTENT_ENCODED		0x00000008 /* Data can not be read
 						    * while fs is unmounted */
+#define FIEMAP_EXTENT_DATA_COMPRESSED	0x00000040 /* Data is compressed by fs.
+						    * Sets EXTENT_ENCODED. */
 #define FIEMAP_EXTENT_DATA_ENCRYPTED	0x00000080 /* Data is encrypted by fs.
 						    * Sets EXTENT_NO_BYPASS. */
 #define FIEMAP_EXTENT_NOT_ALIGNED	0x00000100 /* Extent offsets may not be
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
