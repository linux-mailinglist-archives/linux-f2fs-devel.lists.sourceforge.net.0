Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E280BA62
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 12:36:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCI6l-0007Av-H6;
	Sun, 10 Dec 2023 11:36:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCI6h-0007AP-Mn
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 11:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glIgoNkSYkwhi0PRsV07rpou1zBi+ZyTwk4LSDuCG/Y=; b=cIWjC9Hx6rJh+1LhPkJRmOGJnI
 8S0yN+ca6g0G/B4Xym5WWoepAZn+di8ZIYfq5BN26rqoGDkkYktlayn00157EirQ+xD1ytrTW4noS
 6DPZPJG41cAomyUS6xsAEClZ3jiExR6iSXdH9UXLAluWTngF3vyDVXXT5icuBtFgqkIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glIgoNkSYkwhi0PRsV07rpou1zBi+ZyTwk4LSDuCG/Y=; b=gLw1nHZ+HDVm/6XfS77el6UjHU
 ApZiDvItTNf+o7l48wKuKpisfILdtIt+unIBrqVanJ5UICzmGTVqel4dQDa7KsqVnL+DyxUUi/5nl
 /l1k1Hn2JairgvxccVpRDP/hOdlkCwB31Rv9H+5bxiYdc0jMfFoZLAA32K3hbHvGye44=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCI6h-0000VE-I4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 11:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F1835CE09F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 11:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8620BC433C8;
 Sun, 10 Dec 2023 11:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702208171;
 bh=Iri4gOpboj6iTV2Mhz6ZedWpHWCjZ25WFJYUfWjqqLI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KbTG84Pgti9Rg9nuZefYagaar6MmND/pXxRIOKNqNqT7kT9DvjLj816128RaHnyWA
 1t856A8+B9XNMgz1U6jkxsyJZfSbbXH5LsaHkzIxLMHS94A6dr2KUzJHxhqUCpESI6
 2oifUZYES9vTPlrjTDMTkq8Xws9JxGq29abvtKfa+B84E/5BReFxri9KwO907sef/O
 YW7ozaSjlb5xmxfpYfqPd9dhbQJ2Nhwx6D+Gbcan9V3Pqy9AdGjLWVzv/dUHAtFEoq
 Auxeql1cK/woKVsSH7GMCnjm0ClHQnpn5xteCEPDbhx8FLCdeL+73O6coYb8KAqZsB
 awUKW8/7XI8QA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 19:35:47 +0800
Message-Id: <20231210113547.3412782-6-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231210113547.3412782-1-chao@kernel.org>
References: <20231210113547.3412782-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_filemap_fault(), it fixes to update iostat info only
 if VM_FAULT_LOCKED is tagged in return value of filemap_fault(). Fixes:
 8b83ac81f428
 ("f2fs: support read iostat") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/file.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCI6h-0000VE-I4
Subject: [f2fs-dev] [PATCH 6/6] f2fs: fix to update iostat correctly in
 f2fs_filemap_fault()
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

In f2fs_filemap_fault(), it fixes to update iostat info only if
VM_FAULT_LOCKED is tagged in return value of filemap_fault().

Fixes: 8b83ac81f428 ("f2fs: support read iostat")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8af4b29c3e1a..0626da43fa84 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -42,7 +42,7 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 
 	ret = filemap_fault(vmf);
-	if (!ret)
+	if (ret & VM_FAULT_LOCKED)
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
 					APP_MAPPED_READ_IO, F2FS_BLKSIZE);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
