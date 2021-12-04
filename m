Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2E4687A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Dec 2021 22:31:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mtcd9-0003Cm-Dq; Sat, 04 Dec 2021 21:31:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mtccv-0003CU-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Dec 2021 21:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsxXnu9BY7rGi2VIa43tsqO+SMP+SPzolI5nV0VwgKA=; b=JoeMVFHaQ2noceG8KfhHCQV28y
 2iDF+f+ThWvIJ5U5lwylzWZMMBrSq7tX87VZXC/2CodngXuYw+RjPHrloYuLf3/9DmSmyK4TwjnN0
 gt+oRKonpoDJEFYj0MGqOdNGQOMWrMaZ2Rpe07AW+fI7BS2Zq5RjICKkwbrSpUnTz0yI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wsxXnu9BY7rGi2VIa43tsqO+SMP+SPzolI5nV0VwgKA=; b=G
 kBl4C5p8qgcEfBWL1qfwBvZBCFwhW2U5FEtJczmrhOIRPQy9TzboaaC/uMxrxp/Gb+bPTh08XvPNI
 +je+IrXM2Bc+qP+s9cW34wCXvSvUqtwKYv4LB7O2iH/g5BqPGtefdiIXy8ToHqOf+otOTUMnXOr1U
 Wd/WZZ4/qg0J1t6M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mtccv-0005rW-BA
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Dec 2021 21:31:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3BF660B46
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  4 Dec 2021 19:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4293DC341C2;
 Sat,  4 Dec 2021 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638644525;
 bh=AHl9BrLcAAyIfH+2de6f2wjbYlxFQtE4dIITddjEuYo=;
 h=From:To:Cc:Subject:Date:From;
 b=kGPgVsI5JfDrLMgna0R87aHb5WNG5JA5/CavfrCm/n4VjTImptPZO8Z+e8dYuUlQK
 yOJOYaPiLrsVn6ca9r9O9es1VcqGgLwUGeq6uF/FrV1Erc6KLMFu878i3S+yB3pfQH
 dKhIQ/YcF75BOnLEzosADha4jl0tmwczvwq2E0kwVppFjbVRYAB0r8miThq3Lg499w
 Z6IjBkCgKUygYjZIWqcJXh32ptlSW9e//ZqUARAVe3Cy2TeYePOTBtIf92oQLMQWL7
 N3olw/2SWW28+wv4CId8mVan2kMvs8ywx3jRyEMO2gETX980Yhm/IGplyarGV4iTwV
 /0u8bQIi8a0fw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Sat,  4 Dec 2021 11:01:58 -0800
Message-Id: <20211204190158.3158405-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's check the condition first before set|clear bit.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/f2fs.h | 4 ++++ 1 file changed,
 4 insertions(+) diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
 ac6dda6c4c5a..cbc73bd71dad
 100644 --- a/fs/f2fs/f2fs.h +++ b/fs/f2fs/f2fs.h @@ -3115,12 +3115,16 @@
 static inline int is_file(struct inode *inode, in [...] 
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
X-Headers-End: 1mtccv-0005rW-BA
Subject: [f2fs-dev] [PATCH] f2fs: avoid duplicate call of mark_inode_dirty
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's check the condition first before set|clear bit.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac6dda6c4c5a..cbc73bd71dad 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3115,12 +3115,16 @@ static inline int is_file(struct inode *inode, int type)
 
 static inline void set_file(struct inode *inode, int type)
 {
+	if (is_file(inode, type))
+		return;
 	F2FS_I(inode)->i_advise |= type;
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
 static inline void clear_file(struct inode *inode, int type)
 {
+	if (!is_file(inode, type))
+		return;
 	F2FS_I(inode)->i_advise &= ~type;
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
-- 
2.34.1.400.ga245620fadb-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
