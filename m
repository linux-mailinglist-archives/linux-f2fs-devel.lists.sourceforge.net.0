Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E812BC18779
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 07:31:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nHzf1as+d8WU8huzMZbGazTwQWWibTTeXMs7Bc6PkVk=; b=I6xZLjzMAvEPEquJPx6/SVY5Jw
	LwOjuMg3Ak/cfyGY3dRGoiEFMp8Qk6kQcqn+oae6cJugRiQA/AgoOLdhlEgU/nR2Sy/YGtz3cWqoR
	SE4IqGaeOM9Vwv2RQPj5Qe0Zquj7eZiEYH4XwgJCCviU3g5fgMPMnP+Ol7whkfFCSPFw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDziL-00063q-JZ;
	Wed, 29 Oct 2025 06:31:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDziK-00063c-2F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 06:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eQZqRLpJjk3GmTWAF/pdlHs7oG7Cz+iTnyTX9voBHYE=; b=fLKPLSOpAAsLiQsmzWnKLtMxC2
 swpSToW54TS6Fk7nF37fFaeeNRXi56BPnH7/yQ0w3pLWZdohRHoAJS1KPn9x+6K/0YqMnMLl11/Wj
 4XWhrWh4efk58l+o4gY6HdCHGVYlw6XU1e/sL8VRfy5BW/lf+cDdA+PTbcE/wkMknJtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eQZqRLpJjk3GmTWAF/pdlHs7oG7Cz+iTnyTX9voBHYE=; b=m
 88lhj5nVXVOiNMrEYtjNpRbhTEw1ZqihSQgswbwLb8nTZXqL3MVtiIAh57kEM0zHs34kF9VbgDScs
 FL5cQI3msRs+PAKlgG02U48WobcuIyjO3RAyEFkcdQ2SO3Z4xAblo+WHeA7Tz6LeVGqNdmEctahpD
 2pdp4EQMqGhGFcTQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDziK-0005iM-FQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 06:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 23B08406FC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 06:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C621C4CEF7;
 Wed, 29 Oct 2025 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761719475;
 bh=M8TOhzUcxJ8U/jWJFpN3QlqV3yVKYE0f7t0KLLwk1zg=;
 h=From:To:Cc:Subject:Date:From;
 b=Bti381xv/4CdZbWJhBCghbmdX8DNtsZ2wJ/tic0mR616x3LVPW0gd1uIRjruXeLjw
 YoKGhuJW0MfvH+ffUUvUTebNhwKuArFNreFi3fNFSKLZw+cu07bpPc8A+lxsX8tzIa
 dBenIc2el8p7czAzc0YFdj/toVNMSAmjNsdcyck++eqEDLKPFd0DBgaBqZrj/aM2Dd
 EKkyWG5D8SXAw23/zBR/LfLmCBUwTUdIgoyicqHg+4Nsuepgjcf31uQLdlWdVX4iS9
 8s4VPMMUZqAzd8/djEW1FsYrUFS7kbddGV+J/x54Ay2yFSD1vclqKr9F3lAhpMD15z
 j4p5atzaDXtdA==
To: jaegeuk@kernel.org
Date: Wed, 29 Oct 2025 14:31:04 +0800
Message-ID: <20251029063105.989253-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It recommends to use i_size_{read,
 write}() to access and update
 i_size, otherwise, we may get wrong tearing value due to high 32-bits value
 and low 32-bits value of i_size field are not updated atomic [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDziK-0005iM-FQ
Subject: [f2fs-dev] [PATCH] f2fs: fix to access i_size w/ i_size_read()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It recommends to use i_size_{read,write}() to access and update i_size,
otherwise, we may get wrong tearing value due to high 32-bits value
and low 32-bits value of i_size field are not updated atomically in
32-bits archicture machine.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 include/trace/events/f2fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index edbbd869078f..e1fae78d64a5 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -204,7 +204,7 @@ DECLARE_EVENT_CLASS(f2fs__inode,
 		__entry->pino	= F2FS_I(inode)->i_pino;
 		__entry->mode	= inode->i_mode;
 		__entry->nlink	= inode->i_nlink;
-		__entry->size	= inode->i_size;
+		__entry->size	= i_size_read(inode);
 		__entry->blocks	= inode->i_blocks;
 		__entry->advise	= F2FS_I(inode)->i_advise;
 	),
@@ -353,7 +353,7 @@ TRACE_EVENT(f2fs_unlink_enter,
 	TP_fast_assign(
 		__entry->dev	= dir->i_sb->s_dev;
 		__entry->ino	= dir->i_ino;
-		__entry->size	= dir->i_size;
+		__entry->size	= i_size_read(dir);
 		__entry->blocks	= dir->i_blocks;
 		__assign_str(name);
 	),
@@ -433,7 +433,7 @@ DECLARE_EVENT_CLASS(f2fs__truncate_op,
 	TP_fast_assign(
 		__entry->dev	= inode->i_sb->s_dev;
 		__entry->ino	= inode->i_ino;
-		__entry->size	= inode->i_size;
+		__entry->size	= i_size_read(inode);
 		__entry->blocks	= inode->i_blocks;
 		__entry->from	= from;
 	),
@@ -1006,7 +1006,7 @@ TRACE_EVENT(f2fs_fallocate,
 		__entry->mode	= mode;
 		__entry->offset	= offset;
 		__entry->len	= len;
-		__entry->size	= inode->i_size;
+		__entry->size	= i_size_read(inode);
 		__entry->blocks = inode->i_blocks;
 		__entry->ret	= ret;
 	),
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
