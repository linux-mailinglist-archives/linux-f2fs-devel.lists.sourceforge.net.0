Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E02EA26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 03:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ty4QhLmcyT1thqFmF2qo832BxQUDrK9UGXqSyuoOBy8=; b=BwnvQlaQ9ksqJx/cjy7jSjLay
	AUe29MX44KaSL7TtgCsoVDyPtNfyAczMYsXXHNdbPW4ycYT3k7B7PrpmGMQVBmRBeGcLeHOwg8JB/
	unGBma/50MEkTZzmaB34z8o56NVBvpoinDWEEcXqk+5A7Upa7XQkT4BHgBvg10tMVF+UE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hW9iT-0004U9-Gt; Thu, 30 May 2019 01:18:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3gynvXAYKAIAhvswirksskpi.gsq@flex--drosen.bounces.google.com>)
 id 1hW9iR-0004U1-Uh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:18:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d6X4/k5B5WeQgyIvpn8Af86NqovFLF22qTA1Y2V4Fe8=; b=SLzB2BeTlItrXYY3LQ4Cf6F6B
 FSmIuGW2tNpUDafMFfEnAQ1zzKiHswApZ3+pDJSg32dFZ/y7QREnJOjgGky+f1ZqbDcaVo14yyL12
 BhRFXAmPPaWTic5W7HmszOwHAin0kMP4n72uI1wKVWc4q/WCJacXmjd2xOkxmKNHi8Dxw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d6X4/k5B5WeQgyIvpn8Af86NqovFLF22qTA1Y2V4Fe8=; b=VIVILl3AlehccOhMmbtncpKMCe
 4jNjtjO3TA27YnEgDQVuH+qpVE+RIYOlf7sMZOFZeHt00HI6q4r23pmCsqacg4xUaKy+mOQvyYlH7
 aZnOLz/EaTEG2ChX1IduXx9Fy6ejCTsgUhJUTulcuK3fUN7pDaTQSYdGGEItUQAwq+eo=;
Received: from mail-yw1-f74.google.com ([209.85.161.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hW9iQ-00CK0W-MH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:18:47 +0000
Received: by mail-yw1-f74.google.com with SMTP id w3so286556ywa.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2019 18:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=d6X4/k5B5WeQgyIvpn8Af86NqovFLF22qTA1Y2V4Fe8=;
 b=Ax2EXMsdAnoEHIrqzhP0Cv23VlEaDoSoO1OWqhvxtcuBXmnYYLbiiBAZQlVXUUtGgA
 i6w+G4d54N8mfV0D6KY3vURUd55d8xA1pwqYEpTzjK68EmxEOCRJVDhq648b4GXT1jGV
 3YrMacqCMm6wtkWM9ach4dG7xfETTseNfVw9UM/pxIHth0Ji7tonp1P9tLbqoqqtynbi
 DiENSJNzIdEipIykCMGLgC1Nz8YKxon3Gno9T6HkP2TBj6bY9GFxNm0etPi64anLqTnl
 aFpqLIUEQL5Pswsuq9dgOrW+1PKzioUiwtMYbgzR/a96OB4IOOCPkunrKKKeoQnMXWxu
 4Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=d6X4/k5B5WeQgyIvpn8Af86NqovFLF22qTA1Y2V4Fe8=;
 b=sUU8AFoOuOcE1AXuKcxFCgRCzyuovF6IE2SVhVet3DXFFP6+6RlmMnv3D5fnBhE+yI
 hfk0uPMIuMrfvM6Xn7g+Bd+Df9OfaIIr16OAWwosQBQUUmP6IWhzT1Utq1SY3TEbfSGm
 NxI15y+OxMBPktbMWxQiKK0fRhtliRjbNCLatdDgBVnPw3rE+9u76t/YRMr0foZ2Vc+S
 T5k07FtB8febzWlE0Do+fE9+baDmwjWvT8Cdubgnl0SkSxzsFvrGrGoFmtHr6e0dBOnD
 AaPuemq1ZFiPzCptzKQMFY7fFKYENRD6/v8f1ZmUVf8Q6QqRHtiVFsZX4+4bbKyr/Gkq
 h/XQ==
X-Gm-Message-State: APjAAAUiyVMWO5YTvVHX6WvsAg2ONlUNi6GnFoKiVrEvAWf8zTe3GVnk
 mbnIQaG300jbTuglkV3Hu0II/CjHJ44=
X-Google-Smtp-Source: APXvYqzY+oI/v3047+rLfAdqlDZ9Z79kMZvQRPmWfGPVRdyfWVyQ3mLlfGRyfTAwrOQom+6CDZKVd7elYDo=
X-Received: by 2002:a81:300c:: with SMTP id w12mr555304yww.57.1559177603199;
 Wed, 29 May 2019 17:53:23 -0700 (PDT)
Date: Wed, 29 May 2019 17:49:04 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-3-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.161.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
X-Headers-End: 1hW9iQ-00CK0W-MH
Subject: [f2fs-dev] [PATCH v3 2/4] f2fs: Fix root reserved on remount
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On a remount, you can currently set root reserved if it was not
previously set. This can cause an underflow if reserved has been set to
a very high value, since then root reserved + current reserved could be
greater than user_block_count. inc_valid_block_count later subtracts out
these values from user_block_count, causing an underflow.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 912e2619d581b..359fd68509d16 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -213,7 +213,8 @@ void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...)
 
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
-	block_t limit = (sbi->user_block_count << 1) / 1000;
+	block_t limit = min((sbi->user_block_count << 1) / 1000,
+			sbi->user_block_count - sbi->reserved_blocks);
 
 	/* limit is 0.2% */
 	if (test_opt(sbi, RESERVE_ROOT) &&
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
