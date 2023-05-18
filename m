Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13160707CDE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 11:29:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzZxJ-0004ou-BS;
	Thu, 18 May 2023 09:29:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pzZxI-0004oo-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 09:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58L3WaLMi3VUvVs4ZbvW8nIO6OpE/Q5KdgQd/ohiyy0=; b=JYddsixODlYZ7kz8br89tw4V4Y
 w4ZVLeFghTJEoQNVG8gf7LWtRT4oQQuDSrpe9e6nFfTqYWjqCAfNvqgzDxE4QWd1EnBPgRc4FLGhp
 5zgqS1T0O6I1StQSDhll+dtbrowAGTq0VZFG0Kf+bSe+NXv1e3wCrtSa3loQKg8zAT0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=58L3WaLMi3VUvVs4ZbvW8nIO6OpE/Q5KdgQd/ohiyy0=; b=O
 h9yK65a3x5RDVEPFZod6Q/7kFTHJOEPtDCvABkEwe9/gnUleeHj5/DkYas5w9VDhr9gSa78kHHWGH
 XpRE7R9SXFdgBJW4vo9cvptODGx3whOvcA7x/yzQAgcL+cdQi9ptXC9FDAFiiRuAqal7vTxS78KJ5
 LlGJoBRjA+xiXrd8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzZxI-0005YB-8G for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 09:29:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6B1064DC3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 09:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0437C4339C;
 Thu, 18 May 2023 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684402183;
 bh=ovRBMbfJ+0e2fp3fL3pzSwAhC4xZCypG0p8+sBPPWG4=;
 h=From:To:Cc:Subject:Date:From;
 b=dK4qFyZA0dN8yAUQzL0S7ZuaDDKgCMkUCp6ChHtGI8CYUiXzM5K7iCKLWZ8xYLxLT
 bld7GfUibB0TpXwUu15G9AN6FShQKFDpCuyRFSH9EaEQRBuc4h/qGDwuI63K7rOaPH
 oK7hByarOUsIsUtr5fo45qAzwAbEJKIJIDSAjyn9yu4/eECkOxOcq6OAqGZAKrBp3F
 Ub4UDY9jICBvxWPGvuNAJ37SvuoGrGmWWH+Eg1c7q7bPSs7qqrpdmZj3WEGbIgQ1Uz
 FDP9QLUjlRwYqFCv5pVv5HImXJOxi8E7QczE6vehmh67uQyaxgbfiPJv+Yu/ItG74E
 Tg9ESaJozjm0w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 18 May 2023 17:29:31 +0800
Message-Id: <20230518092931.2280835-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __le32 type variable should be converted w/ le32_to_cpu()
 before access. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h
 | 6 +++++- 1 file changed, 5 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/f2fs.h
 b/fs/f2fs/f2fs.h index 7f6c51a6b930..a4bff3b5b887 100644 --- a/fs/f2fs/f2fs.h
 +++ b/fs/f2fs/f2fs.h @@ -2840, 7 +2840,
 11 @@ static inline void f2fs_radix_tree_insert(struct r [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzZxI-0005YB-8G
Subject: [f2fs-dev] [PATCH] f2fs: fix to use le32_to_cpu() in RAW_IS_INODE()
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

__le32 type variable should be converted w/ le32_to_cpu() before access.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7f6c51a6b930..a4bff3b5b887 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2840,7 +2840,11 @@ static inline void f2fs_radix_tree_insert(struct radix_tree_root *root,
 		cond_resched();
 }
 
-#define RAW_IS_INODE(p)	((p)->footer.nid == (p)->footer.ino)
+static inline bool RAW_IS_INODE(struct f2fs_node *node)
+{
+	return le32_to_cpu(node->footer.ino) ==
+			le32_to_cpu(node->footer.nid);
+}
 
 static inline bool IS_INODE(struct page *page)
 {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
