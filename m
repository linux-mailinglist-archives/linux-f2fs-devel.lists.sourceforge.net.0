Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D7759764
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jul 2023 15:51:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qM7aA-00052R-H2;
	Wed, 19 Jul 2023 13:51:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qM7a9-00052L-32
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jul 2023 13:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZFez3G9iZwTDX9MwhqfV3uWTzMROT16heX9xDgJmM5w=; b=a9QWZf+HAzkOfptqV0wNQQF7+G
 NEefp0GbPG9gKI9MKu2abV9D6/HRWZBuclvj6pLe+OchN+vfB89iWhb+ydyBeYUCTTo+jPtKIEjVB
 EaBufmAX9XCPWQbP2KFI748780VQbdaZ2noWKxKlME7yAU/YnD5MVavHMarKTsW8SYug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZFez3G9iZwTDX9MwhqfV3uWTzMROT16heX9xDgJmM5w=; b=jbHdd75ux22yh+S2G8h35tYbtG
 C9/XPaivF7F9mm0yKfAVdqXBSArjFDf5x27CQn0WTHvTpdWJO38w/QL+Vnbm1IKS5sJGYmPS4Gqus
 NHFAwendY9/v09Ncfpgj+7OcLC8NF6IokZmLa0Cn3tigjEzduAemrjDIJV9UIvp0B5IU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qM7a4-00CzSD-F7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jul 2023 13:51:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D290E6167A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Jul 2023 13:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E81C433C7;
 Wed, 19 Jul 2023 13:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689774654;
 bh=jxSEIgFFgOG/2+9mEHtdiwLWFjzU1BfBqEW1cWXN2HU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZYhfHhirwP+IqwIhtU2G4WJc0ZWbF9nXm9soVIzoHF02McjRI5GfC4rG3jm1QGQqK
 l6ClKF/zYBPX8v4gRfU+iVV5QIgUu8rOxTXTpgGJkCjzBhlm3o0e/2gbPwemooAV/w
 P/dG6uMokDNnTvmy8FoFRWUZkuT3DeIPRrSsiG+ymqYVzw40smpQpCZq8xA8AQUbJS
 1VL5x+GKGDxSnyeeTWU0dg5FhGlyMNw9E5U6FCR3SzNmJ8Uc9MEC2zabXxqcAOUkdN
 GHYyLWi+3p/v6kcmtDlvg17QZGXqt9VCrKZ6NIrCrulw1pXNOqyjKjFAVsGEgrm3sO
 zaJI1dpPRHsOA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 19 Jul 2023 21:50:46 +0800
Message-Id: <20230719135047.2947030-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719135047.2947030-1-chao@kernel.org>
References: <20230719135047.2947030-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It has checked return value of write_all_xattrs(), remove
 unneeded following check condition. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/xattr.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qM7a4-00CzSD-F7
Subject: [f2fs-dev] [PATCH 2/2] f2fs: remove unneeded check condition in
 __f2fs_setxattr()
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

It has checked return value of write_all_xattrs(), remove unneeded
following check condition.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 71bfa2391ab4..9cc1ca75b2da 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -757,7 +757,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	if (index == F2FS_XATTR_INDEX_ENCRYPTION &&
 			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
 		f2fs_set_encrypted_inode(inode);
-	if (!error && S_ISDIR(inode->i_mode))
+	if (S_ISDIR(inode->i_mode))
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
 
 same:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
