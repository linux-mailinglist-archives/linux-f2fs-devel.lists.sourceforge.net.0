Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB65661CCC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jan 2023 04:45:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pEj6C-0006Gx-L1;
	Mon, 09 Jan 2023 03:45:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pEj6B-0006Gi-FQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=euvkepgFT3TX951BGNdItfqdJ54GGwjTkv52+qkVxEQ=; b=igrlS7IXT9UZoplz0wmp0qFytc
 KCpK/oJglsNE6XJkCqP+0EaIU2kegC/z9WdH1+ZwodqBbE8VaJKPT//Y9YeOrqU8w+nks6LXr+XAW
 cR5Y+wiVJT5a4lbKNXqx3H+7Oq5Hk39x4u13Xx5HNh6BuACmJREQbkarqwin7klt0JLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=euvkepgFT3TX951BGNdItfqdJ54GGwjTkv52+qkVxEQ=; b=gSSHTfCXcDpDDQsg2ivTnuJDov
 LOuSUrwEE4mH2FkKYX3GOb8NvG55uQirK8arTzgEqA/JnRLtDXdF2gGx6M5fu7pvTAMPcHiywem33
 zuXFiqYzRS4KBRPKk1Qe0LlM3i2evQo4ayPpy5TdsaD5R8lmnTl6FrSSqO0LjH/DUoQA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pEj69-00AtiJ-Jt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jan 2023 03:45:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5ACFEB80C7B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jan 2023 03:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBC1C433F2;
 Mon,  9 Jan 2023 03:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673235914;
 bh=z+rEkFMv+wRfNSPG7VtFK07vpI0/Mb7wF/w9G4C5Uac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HtGz6EvXa+PBbLwGnayMZXLkItsmkkRMAzq4RG4PAi2baRQI+1yaWsh/aM3xDxP2v
 3Vjdh6bHI6i/e4n+cSTmMDxh1IPlD7HACU6HAUuQgLw6uXVeZk1UTEHfGHCg4xyF+V
 suZvvZrCquqM7Fe88ORTzPJQEgckViUKuctoe0+hrsgRFsS1ME4falCNouyTrbyXvj
 kXliOVbAeEV9pt7voeRaoA4ACYnq8fpfm05Ao6f/Vc9vmBTJlZI6AczeccBXXOIjrz
 H6bFMyumDZIkYiUL5B9lQFVw7LjzK2c+syKYUp8wN5e2CnZn8nnQFRR95pU2mWGLdc
 uPACqtsXlbEnA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon,  9 Jan 2023 11:44:50 +0800
Message-Id: <20230109034453.490176-2-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109034453.490176-1-chao@kernel.org>
References: <20230109034453.490176-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 last .atomic_write_task will be remained in structure
 f2fs_inode_info, resulting in aborting atomic_write accidentally in race
 case. Meanwhile, clear original_i_size as well. Fixes: 7a10f0177e11 ("f2fs:
 don't give partially written atomic data from process crash") Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/segment.c | 3 +++ 1 file changed, 3
 insertions(+) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pEj69-00AtiJ-Jt
Subject: [f2fs-dev] [PATCH 2/5] f2fs: clear atomic_write_task in
 f2fs_abort_atomic_write()
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

Otherwise, last .atomic_write_task will be remained in structure
f2fs_inode_info, resulting in aborting atomic_write accidentally
in race case. Meanwhile, clear original_i_size as well.

Fixes: 7a10f0177e11 ("f2fs: don't give partially written atomic data from process crash")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c6f6d0618164..5f7e42b355eb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -201,9 +201,12 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
 	stat_dec_atomic_inode(inode);
 
+	F2FS_I(inode)->atomic_write_task = NULL;
+
 	if (clean) {
 		truncate_inode_pages_final(inode->i_mapping);
 		f2fs_i_size_write(inode, fi->original_i_size);
+		fi->original_i_size = 0;
 	}
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
