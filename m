Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D076088086F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Mar 2024 01:15:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmjbb-0000hs-38;
	Wed, 20 Mar 2024 00:14:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rmjba-0000hi-K4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 00:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jJXe+rJ5hKNx9Gli3p1gXY0cl2hDdqP/dgBEF4E7t5k=; b=eL83cfycjUDrT57VeR3ayK8wOj
 HqjF6ap+K1jDFQlVZN4P3p0hNsEXg8wOKQ70wQFGX0zHyyaAtTLhvwJOKcvgNTPFfL3wH/Wc/p3aE
 D1EG537zyUpnv1zL3UKFDi7n3p1uJbHE3ZOPDEo4IoQkKJtycelwHc6VVeL+FQUr5KaY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jJXe+rJ5hKNx9Gli3p1gXY0cl2hDdqP/dgBEF4E7t5k=; b=F
 Rv0JVk7WEssM+ZE5DcQCd7fOQkkZVjcy1I/TIRLZ0R1g5KEduuFH/hac3JwHiJI9qPcI8+EeJR9IK
 MWohytQL0laVC/k0IxPWqEkgmrw8qguEAZn+tJWSo6bfvVc3cRZ88s09iJZa7WzhADbw0lVKSQGI3
 +ooLdAXqcVS6z0VA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmjbT-0000dD-16 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 00:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8AEC7CE0B6A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Mar 2024 00:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2A0C433C7;
 Wed, 20 Mar 2024 00:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710893686;
 bh=RgQ+4D5jOVCbEgkz3y6+dLvAKuKFyxUUXvKEfz/0awU=;
 h=From:To:Cc:Subject:Date:From;
 b=bsU3hV32fVAcAl6rtVKfChcygYOsmBVQkod/kzYF9frS2qxQKvIFVfFxAzg5sZtM6
 /p7D1RUOT27w+IutQ6WYIMKCYNjK9UTdLM8ZkGBCjQVgqThw1hCe3bfXDzbGfo/Nuy
 Hi2IMUO8O+wcyTbOrcKxxiXHjVkQ15br4c4CHX64nMdWAJ4q13X9pw9o53gpxyYjX0
 DCaoG7XuHSboL+6E7/EwGmxLMLhGJaTw7qgUUDjcb8vWGk1sZqaWqLrOkHiE/eWeDy
 TuCfGV/aUo8rVeA4fwwhuIwZLIZUpehTONVaUMqauDmAbT3DiBeNnQrBPFAIZnCJmv
 Dtioqj9D6J3Xg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 19 Mar 2024 17:14:42 -0700
Message-ID: <20240320001442.497813-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
MIME-Version: 1.0
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_ioc_shutdown(F2FS_GOING_DOWN_NOSYNC)
 issue_discard_thread
 - mnt_want_write_file() - sb_start_write(SB_FREEZE_WRITE) -
 sb_start_intwrite(SB_FREEZE_FS); 
 - f2fs_stop_checkpoint(sbi, false, : waiting [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rmjbT-0000dD-16
Subject: [f2fs-dev] [PATCH] f2fs: avoid the deadlock case when stopping
 discard thread
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

f2fs_ioc_shutdown(F2FS_GOING_DOWN_NOSYNC)  issue_discard_thread
 - mnt_want_write_file()
   - sb_start_write(SB_FREEZE_WRITE)
                                             - sb_start_intwrite(SB_FREEZE_FS);
 - f2fs_stop_checkpoint(sbi, false,            : waiting
    STOP_CP_REASON_SHUTDOWN);
 - f2fs_stop_discard_thread(sbi);
   - kthread_stop()
     : waiting

 - mnt_drop_write_file(filp);

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4fd76e867e0a..088b8c48cffa 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1923,7 +1923,9 @@ static int issue_discard_thread(void *data)
 			continue;
 		}
 
-		sb_start_intwrite(sbi->sb);
+		/* Avoid the deadlock from F2FS_GOING_DOWN_NOSYNC. */
+		if (!sb_start_intwrite_trylock(sbi->sb))
+			continue;
 
 		issued = __issue_discard_cmd(sbi, &dpolicy);
 		if (issued > 0) {
-- 
2.44.0.291.gc1ea87d7ee-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
