Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3D3F4EE9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Aug 2021 19:02:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIDKp-0006Z4-5r; Mon, 23 Aug 2021 17:02:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mIDKm-0006Ys-Mt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 17:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I6Ku1qAyVZznzkzu1brZdU4u4OELodtznmaw3eIvKnY=; b=QBnvIhQlwMwVkOr2JVU89koOF/
 BT190S56QkKgHGTxoSy7jazJ5yBwCwPqjLVp6sOheZLW2tPTMvrixw+rbwZ99TSfesZ8YvOivepFw
 VuSRHtlgAL9oB32Mb3QY2+e4arANFWP/UBkTm8grLbspRFADDroqYu5oTDKbSeI2wqRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I6Ku1qAyVZznzkzu1brZdU4u4OELodtznmaw3eIvKnY=; b=W
 HSS9/0CV4h9vVjzFXI9vbgU9zhOpmoJ0XQ8/z+Hj4JxSTOwu4tDNFQRE4BwNG2Xt95Uo4Kl+YANU1
 eaycdNfuWOikmpyRL3QUCBcRfRJ67NT3HqVhq5/jylFW1z987Xw3q9oSq1bppU1aOvJ7lrfMYn1by
 QFZWDHYLwwtZIkoQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIDKl-0007dH-KR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 17:02:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43C9861371;
 Mon, 23 Aug 2021 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629738113;
 bh=l1QzhnmDx6j5Mo9ionHtqp1z0YofUbL+bbew5Dj9YYo=;
 h=From:To:Cc:Subject:Date:From;
 b=jwyEKZa2USyHYPNvzjfM3aZudsMZ7aBP8c5ive48y1YkK/4Pc8R/0BHplqrNiOrVM
 BVhnYPAmRZkxaOep6YKhh67gkszdDpwIe8LrRZCTUvJAY8SidJlBEWNO4U3EaSWqjS
 tbPwsvI2Hrm8N66gj48BaZth7Mn9OnGXqzROfQu1jYFJ3g503bd804avPg2+YGMiyI
 ouVVl3BIyViT/kNkFiAOlmGya5G+Ke5KHFMkIL5BXGyyhgYGcTlHeLQpYCVu3aAoHb
 CeHXRLojCWJA3DvmW0/WFjV+66LOQSCtLNtIAiztUWvxaTbq2UpiiUJlygeflYH6fM
 vEjaH5BrcrXJQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 23 Aug 2021 10:01:51 -0700
Message-Id: <20210823170151.1434772-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mIDKl-0007dH-KR
Subject: [f2fs-dev] [PATCH] f2fs: don't ignore writing pages on fsync during
 checkpoint=disable
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

We must flush dirty pages when calling fsync() during checkpoint=disable.
Returning zero makes inode being clear, which fails to flush them when
enabling checkpoint back even by sync_inodes_sb().

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d4fc5e0d2ffe..45c54332358b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -262,8 +262,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	};
 	unsigned int seq_id = 0;
 
-	if (unlikely(f2fs_readonly(inode->i_sb) ||
-				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+	if (unlikely(f2fs_readonly(inode->i_sb)))
 		return 0;
 
 	trace_f2fs_sync_file_enter(inode);
@@ -277,7 +276,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	ret = file_write_and_wait_range(file, start, end);
 	clear_inode_flag(inode, FI_NEED_IPU);
 
-	if (ret) {
+	if (ret || is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
 		trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
 		return ret;
 	}
-- 
2.33.0.rc2.250.ged5fa647cd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
