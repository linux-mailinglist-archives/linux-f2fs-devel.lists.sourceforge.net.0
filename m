Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DED82A7B9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 07:42:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNom8-0005fE-6D;
	Thu, 11 Jan 2024 06:42:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNom5-0005f8-QI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gbqBjB9dGO5DNoWz4hJSaL4wOc8782Hf6wNDj7ZMkLo=; b=l66sqoY9572xPnU4hEw7P2Y1B/
 DxVtK72UPi/I6PJnjpj67nIMFYwurDcHPefLS4m4MsM+OSzODrAddUNlv9whvVPzzuZ24t+Xd09rS
 eNNx5FmZfLs1ADszTGe2aqM/Mnm0nrhVCD9p9cY2+7xc5OmRoZeKOgm8vcjhmfIukQEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gbqBjB9dGO5DNoWz4hJSaL4wOc8782Hf6wNDj7ZMkLo=; b=IUp/Sfg+MjnEae2sfY9IypTa6K
 qBsXK81aycetGnD+wCIPxlTIP3r7CrlCKN8YKosRvC9wI0JDDaJ+bEuq+UIM2nbLaLQpdIGJ1wCZI
 UypQZcnngRybQXeRFiUgLVGPao4l84YMIR8E/qnnyJlUscZZVX7teL0ADfbnq7qC4XS8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNolz-000798-3M for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F1CFCE1E75
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 06:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C0EC43399;
 Thu, 11 Jan 2024 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704955342;
 bh=gbX4YWfRwjVnF49sDXj1O3cCSmmOzMm5S1M/X7oiEXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GB1XxKtKwAbjoCUkLjjJoGupyaPxCfXinyIZtxjj9h2gCF7xtiv/z0/J3XLuA3w2M
 B2LfimX/2MM/HUA3rnD7W3oZBvb2aw67It4G85AaSbvCt9yQKfVNYUBcZcZhmqZcnc
 cs+kHcWdfDgP8ZNs0MNVS4He1flN5E+DXouJPZfCxAtfF3pOnyXHHQ004IhPeMlBu5
 V1gUtCtI4XF1IjTXutmIDXqs4VAEwbPoV+eHeCub7gz2HmD13o4DK7m8RSAmZP8lF8
 oae/LmsEx/b1c9a0FvZ7IWl6ik8/Sjhi9TxMrYQBrLWWFUFNz0idA9eUankiINLg+C
 KIlJksLKi0+tg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Jan 2024 14:42:07 +0800
Message-Id: <20240111064208.2969599-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240111064208.2969599-1-chao@kernel.org>
References: <20240111064208.2969599-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: verify_blkaddr() will trigger panic once we inject fault into
 f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on(). Fixes:
 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 4 +--- 1 file
 changed, 1 insertion(+), 3 deletions(-) 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNolz-000798-3M
Subject: [f2fs-dev] [PATCH v4 5/6] f2fs: fix to remove unnecessary
 f2fs_bug_on() to avoid panic
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

verify_blkaddr() will trigger panic once we inject fault into
f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on().

Fixes: 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 69e71460a950..ab710bb6d8b3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3470,11 +3470,9 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type)) {
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type))
 		f2fs_err(sbi, "invalid blkaddr: %u, type: %d, run fsck to fix.",
 			 blkaddr, type);
-		f2fs_bug_on(sbi, 1);
-	}
 }
 
 static inline bool __is_valid_data_blkaddr(block_t blkaddr)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
