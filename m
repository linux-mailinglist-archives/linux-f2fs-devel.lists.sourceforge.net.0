Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B111E2A1B2A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 00:13:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZ03i-0003Jc-5l; Sat, 31 Oct 2020 23:13:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZ03h-0003JD-6L
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DLG+T2t2bsrw5HivqhspV9heIsN5AZgAKYc2lEbwQRI=; b=dtj/3/Ic/jk9tK1qJzklTh3BAm
 eZdI2j/IBnEw5QG8RaI6CTxPxBiV2884qknzhIPERUdTCBna1eMsZXoR5+IXHb70+nACcQdK2sdew
 Aof/Z/5z9DWmb0kXQBjEsbmPPD2DoLbX08gvBWPU5BJqIHR35gzezi+NcfBDXjBq8/1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DLG+T2t2bsrw5HivqhspV9heIsN5AZgAKYc2lEbwQRI=; b=Lu0R4mfUNRpEKV7C36oEoGNd/q
 B3QTnSutFyZgYTTlAbP8HGP3IEx5hdPajhqzUDQ0+/Fnhhh5wDinTWynDbp1Q1peGVwnTEaphR1rl
 GM8hGOYpsQZndsfMvrjckCFe0ZpbtHgoGRbu1CbDCjWgEE9RHPDjcNgwPfuUDpUBQZwE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZ03f-00EfGY-3b
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:13:17 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC14E208B6;
 Sat, 31 Oct 2020 23:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604185983;
 bh=5YTncnfxoiRc+Gm3gLawwFHq1F8Nr63JtIwvhMbDln0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZYVLm8TGbc/oHq4jfcNvT6eqaZiEPw5eUZauowUvu6cuHnDuVPBi4FeFkNXQD1lSg
 TToeokDPVFnlpy5cfblQBbhQlhOWRHuMpIXZJAQga5CuDxXBLmtF1829KBsVD5oQiB
 cbbWzEuf+J82q5dY4f4BNAiWYr07arhzXdv7zhB8=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Sat, 31 Oct 2020 16:11:24 -0700
Message-Id: <20201031231124.1199710-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201031231124.1199710-1-ebiggers@kernel.org>
References: <20201031231124.1199710-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZ03f-00EfGY-3b
Subject: [f2fs-dev] [PATCH 4.9 2/2] fscrypt: use EEXIST when file already
 uses different policy
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 8488cd96ff88966ccb076e4f3654f59d84ba686d upstream.

As part of an effort to clean up fscrypt-related error codes, make
FS_IOC_SET_ENCRYPTION_POLICY fail with EEXIST when the file already uses
a different encryption policy.  This is more descriptive than EINVAL,
which was ambiguous with some of the other error cases.

I am not aware of any users who might be relying on the previous error
code of EINVAL, which was never documented anywhere.

This failure case will be exercised by an xfstest.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/crypto/policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index a89e50331deb6..2bf6e0a2a57ca 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -131,7 +131,7 @@ int fscrypt_ioctl_set_policy(struct file *filp, const void __user *arg)
 		printk(KERN_WARNING
 		       "%s: Policy inconsistent with encryption context\n",
 		       __func__);
-		ret = -EINVAL;
+		ret = -EEXIST;
 	}
 
 	inode_unlock(inode);
-- 
2.29.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
