Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D18AF7E4CFC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Nov 2023 00:24:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0VR4-0007l0-2s;
	Tue, 07 Nov 2023 23:24:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1r0VR2-0007kt-De
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 23:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=owcGjqUgjtbNKz0CnK6eKxmzmk33O7WTLpt5SYw9jaI=; b=Pyzd+Uc+om1wYtwDnKyedJMUBZ
 qdmWZQpSlFkzB8UfrvltNC21w9+tcolCwtdHhEcfK643/+Bc3qUyuDIZ+7u+Clc9HN3bEuILjRaov
 Yd1SS1KrKeVeuyq9q+q6FC85MyDvlcoR40tVBM2cZZ1RxpuvyudN01q4DiF8iAfTH/fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=owcGjqUgjtbNKz0CnK6eKxmzmk33O7WTLpt5SYw9jaI=; b=TZctfYp9wFDft5C7rUzOFN4Pld
 r2O8UGxdz7zET3WrG0hWOPdjkc+tmihghzPag2cVOVxQKoFr39zFvueyBlvM1dA9MG4CiuqWpESl6
 J/6+2fI2LgU/Zsgp0OMJrwo+WH+FWzvcEw485F4z4g2htauLxbZ7JrI9C6f3u0nBUPNs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0VR1-00Cey3-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 23:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 689216124F;
 Tue,  7 Nov 2023 23:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460FBC433C8;
 Tue,  7 Nov 2023 23:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699399474;
 bh=0QeHBJN2Gbtm3RGYJj2Ttnw64A1bJVNTHtV4HZxRMnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J2Da6MXzUGGHUSYzAmPT44C9HFRSh8Yyfq9RmE2JZ6TbDAW2T5TcrLsW9hpStmApF
 oDKjsAtsUZmIUW2v9Crqol/GROkV/5+eqgpGUEg6M7EyXyu4mu4ceyiO2sdBXFq5e2
 A4Gc/pCpi0phwaDqbl/juCUDyx27kBapfr2eRKVD4fNiKcM9OU7Goh1q3ayAfmouhR
 AHrwgmRaSkkH7A8QP40+FbBh/7TyPy+MNFMord/jogpNHuhTD+xs3lmlIS7vR93CXw
 NUaifAuoDxCnafj7czdJjM6Q6VI5QZMLOnAIZs4MyQG0bhKvFIxl0r753cP/q/d1Ca
 iu+c20IcTFW1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue,  7 Nov 2023 18:24:09 -0500
Message-ID: <20231107232420.3776419-8-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232420.3776419-1-sashal@kernel.org>
References: <20231107232420.3776419-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Zhiguo Niu <zhiguo.niu@unisoc.com> [ Upstream commit
 9b4c8dd99fe48721410741651d426015e03a4b7a ] Use f2fs_handle_error to record
 inconsistent node block error and return -EFSCORRUPTED instead of -EINVAL.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0VR1-00Cey3-Qg
Subject: [f2fs-dev] [PATCH AUTOSEL 6.1 08/11] f2fs: fix error handling of
 __get_node_page
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhiguo Niu <zhiguo.niu@unisoc.com>

[ Upstream commit 9b4c8dd99fe48721410741651d426015e03a4b7a ]

Use f2fs_handle_error to record inconsistent node block error
and return -EFSCORRUPTED instead of -EINVAL.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a010b4bc36d2c..b73d44df9423b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1455,7 +1455,8 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(page));
 	set_sbi_flag(sbi, SBI_NEED_FSCK);
-	err = -EINVAL;
+	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+	err = -EFSCORRUPTED;
 out_err:
 	ClearPageUptodate(page);
 out_put_err:
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
