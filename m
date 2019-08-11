Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5989482
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Aug 2019 23:37:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwvWl-0001uJ-8C; Sun, 11 Aug 2019 21:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hwvWk-0001tv-32
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9mj2IZ2dVjVk2zqAI6wLpFUnc4FjCsoXTMCOSXsBGs=; b=S4NfgJQdNIK6lC0DgPlMQdlS+/
 wRfc2C5IsEU48rMpbd3rKs6Z9sry1P9o5VM+iEu+DyIqXN9ERcj816E43jwtONw6fGewtWnShoseG
 by6nGs/x8F9fa7wHG5dXue4A0DPAILo3h6tLVxC6xIBRHvc1TBzPx85e+d6osgdJuk0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k9mj2IZ2dVjVk2zqAI6wLpFUnc4FjCsoXTMCOSXsBGs=; b=PBfC2jnCXApFbpRR0X4NUu5s6I
 jh2HTFzUZPOULGQmI+AO2nkkH3KALt8qhKaD+WdsTZTsgkyd80HMb3MqFLhLCtcDSqR+kzda4tqZA
 Jde+Wnf1J5HoV8C+oRTbNmgJwCDsRh6usLYiW4hg7bC7cMIUkmQZZhNG7O61pRL4VFSI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hwvWg-0022Ov-IO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:21 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7DE4208C2;
 Sun, 11 Aug 2019 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565559433;
 bh=hfKkuGUJ1kiygfXldZQujeyj/c9gD3q/1k7tA5kqnRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0wlTph1uBlx9zoYfzKeX5qpWlntqWfJ1qt93hZQkqaXlU1RSgvNwwOiWoLvesgSRg
 JRW37GlYSQRTVezCPpP7o3yCpnxL1AE/qDE/D72IdEVwTS9KxbQ614EKWGLMhNffJq
 GOHlkkzHZWPwjEFriIHid8Y66YQ1Te1cFzkU/dhk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 11 Aug 2019 14:35:54 -0700
Message-Id: <20190811213557.1970-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811213557.1970-1-ebiggers@kernel.org>
References: <20190811213557.1970-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hwvWg-0022Ov-IO
Subject: [f2fs-dev] [PATCH 3/6] f2fs: skip truncate when verity in progress
 in ->write_begin()
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When an error (e.g. ENOSPC) occurs during f2fs_write_begin() when called
from f2fs_write_merkle_tree_block(), skip truncating the file.  i_size
is not meaningful in this case, and the truncation is handled by
f2fs_end_enable_verity() instead.

Fixes: 60d7bf0f790f ("f2fs: add fs-verity support")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3f525f8a3a5fa..00b03fb87bd9b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2476,7 +2476,7 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
 	struct inode *inode = mapping->host;
 	loff_t i_size = i_size_read(inode);
 
-	if (to > i_size) {
+	if (to > i_size && !f2fs_verity_in_progress(inode)) {
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		down_write(&F2FS_I(inode)->i_mmap_sem);
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
