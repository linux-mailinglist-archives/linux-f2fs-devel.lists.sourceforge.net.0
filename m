Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4785F7E4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Feb 2024 13:19:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rd82i-0006r1-8n;
	Thu, 22 Feb 2024 12:19:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rd82h-0006qs-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RybAO6UjF9rQEJ8FIGv7KnXw6IFw6ds7eywLmrx2Vw0=; b=CXtPPFJJcM88pNelOJzrvI1cJz
 QOOoTv5Mh3xOF4KeNMaCd1s19EcxBlDschbJc48JsYxpcHatp3dF5gJBbvSgon6hJAooNR3mvKYmE
 nyYES9eM6fQaNcSkNLOjHl7Nzl/tSBZpZWabBC13/3LaA61c2mDgOn4lWWBl67jM/V0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RybAO6UjF9rQEJ8FIGv7KnXw6IFw6ds7eywLmrx2Vw0=; b=O
 YKD/Eqn9ft5qbec8kSYrzPawEJauUBKOk3bXObLGVEv24EjUPoOJCHL/w+z8PsSV63sbPYAHfzeSC
 2O8mFkpS+izjy1MDvkXN0d0pL4l/9Q0KxOkVlO1/w49CnFdVedeKTB5tEIAa9nkorYtJTU4rhGAF7
 biFX1U2NaEon8x7c=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rd82f-0003UY-1y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Feb 2024 12:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7F725CE2271
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Feb 2024 12:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF62C433F1;
 Thu, 22 Feb 2024 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708604337;
 bh=hBevzcQ0912uhBWtG4E7Up+PFldcF2IwczOHh20Evtc=;
 h=From:To:Cc:Subject:Date:From;
 b=bT18rqCLQzC7YSmZJAXDveVoZqPTAt+O/d3Ye19a9zklautaxeoKEXQO7eWGIEKVj
 eN84vFJ8FaO43JUq90P4gF+oabMZlJujN2Q4njfa9qQbqJmalW5EAEjNzIZJOG1RLd
 u3epzZPURBhSezX3nA2z7UGiaGNmRoS5sLXp8aMzf1JkDJ4RO/ZbYGm0FsZnQddXl6
 9/GiVQv1eAgOKAFqfX2nI1s++S8PGQMXSPEPAPbL3l17HnLYU99Lu/ZQYbtV1GrEPJ
 hgK9pUyPxvZJ8szMAoZPQAa6KdGSWXqOitm7anO/ztW5I9HeLvixbtlxTyJ4nJaU3N
 FkyaaBqAsMJ0g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 22 Feb 2024 20:18:48 +0800
Message-Id: <20240222121851.883141-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 093749e296e2 ("f2fs: support age threshold based
 garbage collection") added this declaration, but w/ definition,
 delete it. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 2 -- 1 file changed,
 2 deletions(-)
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rd82f-0003UY-1y
Subject: [f2fs-dev] [PATCH 1/4] f2fs: delete f2fs_get_new_segment()
 declaration
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

Commit 093749e296e2 ("f2fs: support age threshold based garbage
collection") added this declaration, but w/ definition, delete
it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8a6fd4352a0e..fbbe9a0a4221 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3701,8 +3701,6 @@ bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
 void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
 void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
 void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
-void f2fs_get_new_segment(struct f2fs_sb_info *sbi,
-			unsigned int *newseg, bool new_sec, int dir);
 void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
 int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
