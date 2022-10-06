Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FE5F6A4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 17:09:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogSVR-0006GV-7y;
	Thu, 06 Oct 2022 15:09:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogSVP-0006GL-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BMn/8U3P0yRacWrCOoo4PGi+s4fJbwpb1MybzING9cw=; b=XWAodPLMFfcz0cwX+VgcoevnbS
 fy5qeucqQ+7mixgk36pUjrQvyG2N4K2AkWe4RABlxwNGZeNfVHA8nnFGzcjiOhwQd02oinREAFvp1
 CesE6daSQaZLBFDkr2IvfGPuRpNGLkgydmzTLrpvfD6gJcnUv4AJbxvaMx6ffBCeYTr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BMn/8U3P0yRacWrCOoo4PGi+s4fJbwpb1MybzING9cw=; b=h
 6Ww+yNX3wPNzPMhtt+xFaasYTxcQ4aETGQbkNLOsrVpkEwRHJsX7OmgR7ItPQ2E/mYXgy8xG1fBMg
 jqoxJL7Ihx/E7i8r4KUmECZoao9cRl0aCz3pDrhixN8PXnFuqv26VnraP2RuQCOYfLHpE0pMe4BOj
 ruqvpOcbVn1DsYu0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogSVP-0006XE-0r for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 15:09:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF4C0B820C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Oct 2022 15:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF558C433C1;
 Thu,  6 Oct 2022 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665068979;
 bh=wXqoiRqvOOsXHSVgafb2mnLDBiY/qtfZwDyNj7iYQcY=;
 h=From:To:Cc:Subject:Date:From;
 b=Ky+/zJFHFPIJO5ycxxNUg/8qpGmI1yL0vxQHqYUnzfN/CCj0tohff9XmWgwpvge/p
 qttC97fafocV1WDCCoUhwDsrEkCZ+uIRTln5s0gtz7UwqAKlvltVixIPdonPzqg319
 durwBHcpH/K2LWupSuTrmLVrbSzlNnEY1qBygKQSZH4eARfsRgHXc0p3IFuTB3+Apg
 GA5r3NFg3qQXL303ikBYrZslXvd1ihjJwDvuvv8wXQ2VoxQW+HKtnq7mhJSvNMDAjm
 fN2+1AiMl+yt8gv4JNlzP9SbJWwCy25OXb0DnzejOWeqcYj91siLrEePuU/l0woL0c
 scQn6QFLHVoAA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Oct 2022 23:09:28 +0800
Message-Id: <20221006150928.56627-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports to inject fault into
 f2fs_is_valid_blkaddr()
 to simulate accessing inconsistent data/meta block addressses from caller.
 Usage: a) echo 262144 > /sys/fs/f2fs/<dev>/inject_type or b) mount -o
 fault_type=262144 <dev> <mountpoint> 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogSVP-0006XE-0r
Subject: [f2fs-dev] [PATCH] f2fs: support fault injection for
 f2fs_is_valid_blkaddr()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch supports to inject fault into f2fs_is_valid_blkaddr() to
simulate accessing inconsistent data/meta block addressses from caller.

Usage:
a) echo 262144 > /sys/fs/f2fs/<dev>/inject_type or
b) mount -o fault_type=262144 <dev> <mountpoint>

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 1 +
 fs/f2fs/checkpoint.c               | 5 +++++
 fs/f2fs/f2fs.h                     | 1 +
 fs/f2fs/super.c                    | 1 +
 4 files changed, 8 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 6f19e7f9e908..3bca70fff5ea 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -199,6 +199,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_SLAB_ALLOC	  0x000008000
 			 FAULT_DQUOT_INIT	  0x000010000
 			 FAULT_LOCK_OP		  0x000020000
+			 FAULT_BLKADDR		  0x000040000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 109e96c15b84..2a5d9256a6f4 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -168,6 +168,11 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
+	if (time_to_inject(sbi, FAULT_BLKADDR)) {
+		f2fs_show_injection_info(sbi, FAULT_BLKADDR);
+		return false;
+	}
+
 	switch (type) {
 	case META_NAT:
 		break;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3a63125ffdfd..fa9ac681f71c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -60,6 +60,7 @@ enum {
 	FAULT_SLAB_ALLOC,
 	FAULT_DQUOT_INIT,
 	FAULT_LOCK_OP,
+	FAULT_BLKADDR,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 787010893a12..fad333881ea2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -61,6 +61,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_SLAB_ALLOC]	= "slab alloc",
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
 	[FAULT_LOCK_OP]		= "lock_op",
+	[FAULT_BLKADDR]		= "invalid blkaddr",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
