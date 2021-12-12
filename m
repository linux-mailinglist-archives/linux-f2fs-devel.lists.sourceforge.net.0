Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCF471974
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 10:18:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwKzf-00069P-80; Sun, 12 Dec 2021 09:18:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mwKzd-00069F-9e
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 09:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aVXHJX7tKDP153TticpWuVYZeFDLHJfa6xvqf4l2e0E=; b=IilxzX9CKNpH6D4BGmXOzKzFRW
 KDDrz3gr11045TKCcLVmEXORb6udnyH6fWLlC8h18uUDz3qKpK539f3unIMrrMg0/uv1XFv+hPnoi
 Mu99EfyWMKvSK5CggbG+GUzWrkloRDUaojBMmIwxO3Tlnr01ZReNU3zunQdJDFUK39zc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aVXHJX7tKDP153TticpWuVYZeFDLHJfa6xvqf4l2e0E=; b=H
 OpOGTbRVrPFA7WBZDIwxfWyAaANfNtNJz7egOE+umlMlYxl1WbSCFRPpZI+ODY+JqLByNp56v5SJo
 UvGPdAXUpce2OZuMQNKFq11WP/mE3sgIpHs94IpUXV1CXhKkjhmrfqq+QTkMQgI6NgrS1wOLDVmMo
 VIrmJa+pBXkiqrzA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwKzc-00Cve2-Gv
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 09:18:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 56D5BCE0AB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 09:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A740AC341C5;
 Sun, 12 Dec 2021 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639300675;
 bh=4UhWf3Jd+rOdwe6f4ewKSADPW73hEhAJ7GGD4MoB2XE=;
 h=From:To:Cc:Subject:Date:From;
 b=mwrO35RVUT5ypEFRh5RiDrbPXWDtoAtHcZqTNbCCXrVnT/RDgWAt833oWxAYMf9IO
 ic9QKj5m1pjxjZXdWiYYUZl+lmRgP61QrMn/ygHiNY/t7GV1sMQw8FzuM5QVIROg3l
 fmwd02iMgejt9fWrA82pIk+zvb5qNLUDOQ3AeZexWmDoc9PGG1w+IyE+hTARkyB0Yy
 Lgbd4ijXfKfbvlVovB5sN7MCfEYOYzOJupNZzogqcqbXtR40aaSU49kCuLP+7jc3gY
 VmG54UBm8KibdVu3ziNWoAx/AsxNLCxNV0RPYKv4rZh1W8hzYCMfLnixEIn5v8RKZt
 KVWz9GPSE4oTg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 12 Dec 2021 17:17:51 +0800
Message-Id: <20211212091751.6499-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs: support fault injection for f2fs_trylock_op() This
 patch
 supports to inject fault into f2fs_trylock_op(). Usage: a) echo 65536 >
 /sys/fs/f2fs/<dev>/inject_type
 or b) mount -o fault_type=65536 <dev> <mountpoint> 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwKzc-00Cve2-Gv
Subject: [f2fs-dev] [PATCH] f2fs: support fault injection to
 f2fs_trylock_op()
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

f2fs: support fault injection for f2fs_trylock_op()

This patch supports to inject fault into f2fs_trylock_op().

Usage:
a) echo 65536 > /sys/fs/f2fs/<dev>/inject_type or
b) mount -o fault_type=65536 <dev> <mountpoint>

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 1 +
 fs/f2fs/f2fs.h                     | 5 +++++
 fs/f2fs/super.c                    | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index d7b84695f56a..4a2426f0485a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -198,6 +198,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_WRITE_IO		  0x000004000
 			 FAULT_SLAB_ALLOC	  0x000008000
 			 FAULT_DQUOT_INIT	  0x000010000
+			 FAULT_LOCK_OP		  0x000020000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d2d3b2332e79..f0bee78ce1f3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -56,6 +56,7 @@ enum {
 	FAULT_WRITE_IO,
 	FAULT_SLAB_ALLOC,
 	FAULT_DQUOT_INIT,
+	FAULT_LOCK_OP,
 	FAULT_MAX,
 };
 
@@ -2096,6 +2097,10 @@ static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
 
 static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
 {
+	if (time_to_inject(sbi, FAULT_LOCK_OP)) {
+		f2fs_show_injection_info(sbi, FAULT_LOCK_OP);
+		return 0;
+	}
 	return down_read_trylock(&sbi->cp_rwsem);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 666dc9aed262..053b508d1e4f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -59,6 +59,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_WRITE_IO]	= "write IO error",
 	[FAULT_SLAB_ALLOC]	= "slab alloc",
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
+	[FAULT_LOCK_OP]		= "lock_op",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
