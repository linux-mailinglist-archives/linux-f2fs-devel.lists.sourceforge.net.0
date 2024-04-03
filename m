Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089D89673D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvPv-0003Ta-I9;
	Wed, 03 Apr 2024 07:52:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvPt-0003TM-Hf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bo0+oQB3CBX/9sKybgJXdj3mBIs86cKfuUsi2GKhl/Y=; b=fvyDhAh22MFW4ANjDuL9fH+uNU
 FOQJQ5gAwUf28lO/21BH6sib8lTMA3i/oBsHMVrEKj9N6++LvPM8kTNNAV2A+vzcvkZNUR0DGdb9G
 OANJhAAVR2cvjR0gM9pZIQ1elEZwoUKvXlHD5MaQorlYxDrIJ0SBjUJAFVDwdKTdYiis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bo0+oQB3CBX/9sKybgJXdj3mBIs86cKfuUsi2GKhl/Y=; b=ftecSWj7SSSu60nuuSylAloRJn
 FGWovay6woMpDysW6Gihwf9D7f6doTTZ8UZBWZGB3tHwxRneijPGprWf1R1KvAbD9UUeVqDid+vHZ
 fP8439LL7GY30bMPeHyLSRJ0VWS8S9liBoAghQ1r8LFgiqdeVlMyej3s2X8fLoLXWCK0=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvPq-0001kV-1I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:17 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id A63518083E;
 Wed,  3 Apr 2024 03:33:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129603; bh=OPpE9eN8CD5ANdNxUZDWvEkQM4rXnf4BVN57cpWu324=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=U9x8ao/YtXeIP6vqNHdNGYgKj+yXOk1vCiXgPT1yActpXGHe++Cr6YI8vvggHRBq6
 yQEPr3sMnm2kFzTH1ieN/TMe77oodEDsf67NWszgd9UtORzWsZJSpA8/rHVAR+Vp/k
 kSy507v6yuJWP9ELUOt8WkY/1ccbX2arnapapc48dOzST9mkwFMNkApXmXBsrlTJpU
 r8clqmo9BKvDy4PEY//3I3P1NQc9gF8QtGRC3alOIUoJOicylNVMZ/7KIPNo5srPrx
 6ht8RdqQE+ef8OZayxffgmoiCnjb1fa4WZpT69KzEyzHxEgLWebS5z8bReBLyq1zg9
 1YgF3ZuwkD2Eg==
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
Date: Wed,  3 Apr 2024 03:22:49 -0400
Message-ID: <c24fc95fa184fdd799d9d3d32b3227f790ba772f.1712126039.git.sweettea-kernel@dorminy.me>
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
 Content preview: Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
 --- fs/f2fs/data.c | 6 +++--- fs/f2fs/inline.c | 2 +-
 include/trace/events/f2fs.h
 | 10 +++++++--- 3 files changed, 11 insertions(+), 7 del [...] 
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
X-Headers-End: 1rrvPq-0001kV-1I
Subject: [f2fs-dev] [PATCH v3 08/13] f2fs: fiemap: add physical length to
 trace_f2fs_fiemap
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
 fs/f2fs/data.c              |  6 +++---
 fs/f2fs/inline.c            |  2 +-
 include/trace/events/f2fs.h | 10 +++++++---
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 87f8d828e038..34af1673461b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1836,7 +1836,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 
 		err = fiemap_fill_next_extent(
 				fieinfo, 0, phys, len, 0, flags);
-		trace_f2fs_fiemap(inode, 0, phys, len, flags, err);
+		trace_f2fs_fiemap(inode, 0, phys, len, 0, flags, err);
 		if (err)
 			return err;
 	}
@@ -1863,7 +1863,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 	if (phys) {
 		err = fiemap_fill_next_extent(
 				fieinfo, 0, phys, len, 0, flags);
-		trace_f2fs_fiemap(inode, 0, phys, len, flags, err);
+		trace_f2fs_fiemap(inode, 0, phys, len, 0, flags, err);
 	}
 
 	return (err < 0 ? err : 0);
@@ -1982,7 +1982,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 		ret = fiemap_fill_next_extent(fieinfo, logical,
 				phys, size, 0, flags);
-		trace_f2fs_fiemap(inode, logical, phys, size, flags, ret);
+		trace_f2fs_fiemap(inode, logical, phys, size, 0, flags, ret);
 		if (ret)
 			goto out;
 		size = 0;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 49d2f87fe048..235b0d72f6fc 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -808,7 +808,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 					(char *)F2FS_INODE(ipage);
 	err = fiemap_fill_next_extent(
 			fieinfo, start, byteaddr, ilen, 0, flags);
-	trace_f2fs_fiemap(inode, start, byteaddr, ilen, flags, err);
+	trace_f2fs_fiemap(inode, start, byteaddr, ilen, 0, flags, err);
 out:
 	f2fs_put_page(ipage, 1);
 	return err;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 7ed0fc430dc6..63706eb3a5db 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2276,9 +2276,10 @@ TRACE_EVENT(f2fs_bmap,
 TRACE_EVENT(f2fs_fiemap,
 
 	TP_PROTO(struct inode *inode, sector_t lblock, sector_t pblock,
-		unsigned long long len, unsigned int flags, int ret),
+		unsigned long long len, unsigned long long phys_len,
+		unsigned int flags, int ret),
 
-	TP_ARGS(inode, lblock, pblock, len, flags, ret),
+	TP_ARGS(inode, lblock, pblock, len, phys_len, flags, ret),
 
 	TP_STRUCT__entry(
 		__field(dev_t, dev)
@@ -2286,6 +2287,7 @@ TRACE_EVENT(f2fs_fiemap,
 		__field(sector_t, lblock)
 		__field(sector_t, pblock)
 		__field(unsigned long long, len)
+		__field(unsigned long long, phys_len)
 		__field(unsigned int, flags)
 		__field(int, ret)
 	),
@@ -2296,16 +2298,18 @@ TRACE_EVENT(f2fs_fiemap,
 		__entry->lblock		= lblock;
 		__entry->pblock		= pblock;
 		__entry->len		= len;
+		__entry->phys_len	= phys_len;
 		__entry->flags		= flags;
 		__entry->ret		= ret;
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, lblock:%lld, pblock:%lld, "
-		"len:%llu, flags:%u, ret:%d",
+		"len:%llu, plen:%llu, flags:%u, ret:%d",
 		show_dev_ino(__entry),
 		(unsigned long long)__entry->lblock,
 		(unsigned long long)__entry->pblock,
 		__entry->len,
+		__entry->phys_len,
 		__entry->flags,
 		__entry->ret)
 );
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
