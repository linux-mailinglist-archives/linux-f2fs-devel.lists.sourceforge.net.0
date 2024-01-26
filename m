Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C9483DD4B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 16:20:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTNzy-0003F7-K1;
	Fri, 26 Jan 2024 15:20:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rTNzw-0003Es-Ed
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 15:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SSGu4NLDD5D2HenSgEFat3Ig4z9NZ5ue9NpxxKrKMg4=; b=RRCe1zccW9NvMesIlm4uI7Smau
 kW57KKDMPMFK3hMm+D8OoKA1YGBFusdP93lvq7QYcmU57aHlShdWX0/V1xc15FzEqUKKyBg4FYjS2
 xOpUv9X5Zi5IMTnM1wwQFUo8k+s2j/d7lml9xm/CtQlc049Do0ooBoTu6K2A7RAnxRUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SSGu4NLDD5D2HenSgEFat3Ig4z9NZ5ue9NpxxKrKMg4=; b=iwzEybdy2vzbeF2CJkOSHA9z5Y
 A7PZvot+Y8/e1kSwvZST1/plEx1SXIFsEAME28ju7zaQxWzUCogeozDKk55P0YKFUqqrfiKK8bN5k
 nSCzVE0AV04y63TxnY2kAd3lZRS3X36kCKJzD9dd4ozuT9D/3IcY8vIQZHbcsW8GjsZs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTNzv-0000pT-Me for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 15:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E641E62287
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jan 2024 15:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B34C43399;
 Fri, 26 Jan 2024 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706282393;
 bh=ZtyUk0RkyPEdvpNQ+7kxFdt/jzM49VUpcfVYCbc7d8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o/lKFtS3SEBsyc03ZV7lLYkFi7Cr7qlb5YWRz43hAwGBNPt3Kjc5KNU4hXm9cu24D
 yMTnqZ2kDFrriyvoFvFzuuzbBs0TleEH5Be+MCoSXV5vwHBBa08hYHCH2zfsUAHyYj
 MY1DiabtwZ+a5vBOTjaTr00oomXPvw299JQQ+sB0kdaK8DArWPhf8gPgPsqaVKU4rq
 bbvuGIHaRWFXy5Q6WHapuuu4sQm4THUn37/NWxyC3qRijDH2nZ/zWQzadplq8C1EQp
 27hwuh4uyKULz44GQHDp2S/f8emx5w0se1Ne2KyNZnrsFWTbm4Q6CbNmO8GEcpVlOA
 Ff9xNb3BzlMRA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 26 Jan 2024 23:19:17 +0800
Message-Id: <20240126151917.837565-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126151917.837565-1-chao@kernel.org>
References: <20240126151917.837565-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use f2fs_err_ratelimited() to instead f2fs_err() in
 f2fs_record_stop_reason()
 and f2fs_record_errors() to avoid redundant logs. Signed-off-by: Chao Yu
 <chao@kernel.org> --- fs/f2fs/super.c | 9 ++++++--- 1 file changed,
 6 insertions(+), 3 deletions(-) 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTNzv-0000pT-Me
Subject: [f2fs-dev] [PATCH 2/2] f2fs: use f2fs_err_ratelimited() to avoid
 redundant logs
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

Use f2fs_err_ratelimited() to instead f2fs_err() in
f2fs_record_stop_reason() and f2fs_record_errors() to
avoid redundant logs.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4ca390363131..f0fa76d227e4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4096,7 +4096,9 @@ static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
 
 	f2fs_up_write(&sbi->sb_lock);
 	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record err:%d", err);
+		f2fs_err_ratelimited(sbi,
+			"f2fs_commit_super fails to record stop_reason, err:%d",
+			err);
 }
 
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
@@ -4139,8 +4141,9 @@ static void f2fs_record_errors(struct f2fs_sb_info *sbi, unsigned char error)
 
 	err = f2fs_commit_super(sbi, false);
 	if (err)
-		f2fs_err(sbi, "f2fs_commit_super fails to record errors:%u, err:%d",
-								error, err);
+		f2fs_err_ratelimited(sbi,
+			"f2fs_commit_super fails to record errors:%u, err:%d",
+			error, err);
 out_unlock:
 	f2fs_up_write(&sbi->sb_lock);
 }
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
