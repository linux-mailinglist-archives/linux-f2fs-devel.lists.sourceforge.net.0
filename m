Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB038BCC2E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 May 2024 12:42:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s3vno-0005jf-Df;
	Mon, 06 May 2024 10:42:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s3vnb-0005jS-HL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pXM3+d7J8l7/SuJ1Cme1YN2EKq4LyU96RK6rS2IrXx4=; b=IPIob6zMGsNl0NQnfBhAKzyXiC
 GCvLRHSO1eGPfIB2lBui6Vbb+lnVcVihplgq4ugnsfWN0WQeyePXgf1DfBF12PRfMk6BcLWTKjIe4
 3zX0VsUUTqnMDZoHspOOl9dPlugFnGv5FxT3C+/seCckIHB3zWmzu+CzeGtYK8pwVrs4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pXM3+d7J8l7/SuJ1Cme1YN2EKq4LyU96RK6rS2IrXx4=; b=PPbubA9GnS8fml6Zyhp1m8ejOa
 0qtBDWuBfWmSspz9DsPTH8RwOlR1giVKLf2z7qAdTx8MtmqpNtef4fUFwAYkc434p/oQJv8z0v2f+
 /3A26CUZ1ShUkR3khp1P1cIcpeNudRfZQVonE+UV4BCJJSQTH7nO0LD9rgjory53u3ZM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s3vnb-0004ny-1T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 May 2024 10:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B25BD6119D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 May 2024 10:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481F5C4DDE0;
 Mon,  6 May 2024 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714992132;
 bh=KvHgv8pWJ70VR77g2JX68gkuf540MRIUf0YWe6xekTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DpaEIk0f4Ct2HOBbOktLw9cLgScg74r6sF1aeBGSzldjHZsNtOCpAb7aB09DC+L4b
 nH/B/fkiKSgkh5C6qy4uO2Kdfy9F8UY2dvpVSFFyoFWZSMM4T/T5O3j2TnREhwhU7j
 ItwrN3876knBt86fB5TEPiIVlC5FEpyo+oL1tFlXoxyBZlLKw2k+gQm3e+JpalOszz
 a/qMDofsnHqvSBlCu9fngq2K0PxZUs9hUmhu4O3Rq4p0f1J3urtAB4sdoaMv+AhvLI
 MbbiGVOOgBWfkPsddFIQG/VI++F2GOSEwo3sHQC0kKQ0it7nAW3FjgUnSrLgu7wttl
 PmlDVZsZj/rMA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  6 May 2024 18:41:38 +0800
Message-Id: <20240506104140.776986-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506104140.776986-1-chao@kernel.org>
References: <20240506104140.776986-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: s/released/reserved. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/file.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff
 --git a/fs/f2fs/file.c b/fs/f2fs/file.c index 6c84485687d3..e77e958a9f92
 100644 --- a/fs/f2fs/file.c +++ b/fs/f2fs/file.c @@ -3785, 7 +3785, 7 @@ static
 int f2fs_reserve_compress_blocks(struct file [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s3vnb-0004ny-1T
Subject: [f2fs-dev] [PATCH 3/5] f2fs: compress: fix typo in
 f2fs_reserve_compress_blocks()
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

s/released/reserved.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6c84485687d3..e77e958a9f92 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3785,7 +3785,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	} else if (reserved_blocks &&
 			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		f2fs_warn(sbi, "%s: partial blocks were released i_ino=%lx "
+		f2fs_warn(sbi, "%s: partial blocks were reserved i_ino=%lx "
 			"iblocks=%llu, reserved=%u, compr_blocks=%u, "
 			"run fsck to fix.",
 			__func__, inode->i_ino, inode->i_blocks,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
