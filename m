Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3842D01B43
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 09:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ehb3CsHTG/zcvdIULgflu3KN/g0SEpQbgyHRjJJ35Uk=; b=Ra3PmKLXBLz40IYjAJ/axsqORt
	i7Qh/cRL4LuH/zth/Qz/P/TWvuFULdVK0c7kHVY6ipC8SDJA4ORQns2LoWcAqQBJhGlWcDyKTNEc2
	eSWe+Dw0snbCqCb6C1LMbwI/9OSdBpycoRCQ4VrX7Ussz6+7+ttmrDHJRw4TYAumhl7A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdlr8-0006jG-5e;
	Thu, 08 Jan 2026 08:58:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vdlr6-0006iz-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 08:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rQUThKYjZ/A0zqkw/tCG4m1wd4zbjIo+GdoK1FDq5XA=; b=MJriwBKgb/DaEsLH8miTu3bKUY
 /3Xx74dXGyZOkOfI1NzPbg+IU5HJV8cGpchzLhyUsNJd25WLywTBcZ1yk3C6jfT/KuUr3G/yskbss
 PhOYub0nKT36AVTwf23niSom0tepHfjcmmMV4M28qIB/Y1j++NWmtCQhCQtNqMX2rrMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rQUThKYjZ/A0zqkw/tCG4m1wd4zbjIo+GdoK1FDq5XA=; b=i
 g7c7jUrA76HSntZhGoRKLAIJCWy66Lg8oktdPxkT7xocjFNj6G4wykK7nZXW0Wj0vgU+jLAGo3vcG
 X1BOmvZAvea0F8PR8lMexH7U/a/HPsSsuYMkNwyhlXLzaJDfOIusXON7IeBbofrDppxgf7C2jmYrJ
 9NuqKHPkv/NLpeig=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdlr6-0007pM-8I for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 08:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE55D442C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Jan 2026 08:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E701EC116C6;
 Thu,  8 Jan 2026 08:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767862730;
 bh=zBIY6MkypGcZ2+WYXnu4o9UP+1E8HX2rx6jekl/lcmw=;
 h=From:To:Cc:Subject:Date:From;
 b=jsSzphMRpybupJVq+Ft2KGHhM0KfOUIP8HXgGQPRuO3QQcggbHTvCGC53eyROZ4rS
 5G+AHdK0M+p3C1LG+dYVzFjOGptfCsEHMCM70QVPt5hEsqsnUjTBgPLz4BQ/e35Q4l
 ++Hoe/gviC3GyTokY5Z0my2uxlLIDj1PtwN7xx7CAwrWiBFn+KGEE6Sl4K5A345fwh
 E0AkMAAaxkDd0I42aNcD3Gk6OV3Up5iJTu/r7opoPFRysYco2R9f/EsFUUrcaXYiRq
 aom4LIcL0oe89TVO1mGOjgVmJe+TihR/BtFy0+ibj8Wy4rMGo+P6tElx6UhcnfEYXp
 JhUOszqHXuEaA==
To: jaegeuk@kernel.org
Date: Thu,  8 Jan 2026 05:42:31 +0800
Message-Id: <20260107214231.24163-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In error path of f2fs_read_data_large_folio(),
 if bio is valid, 
 it may submit bio twice, fix it. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/data.c | 7 ++----- 1 file changed, 2 insertions(+), 5 deletions(-)
 Content analysis details:   (0.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdlr6-0007pM-8I
Subject: [f2fs-dev] [PATCH] f2fs: fix error path handling in
 f2fs_read_data_large_folio()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In error path of f2fs_read_data_large_folio(), if bio is valid, it
may submit bio twice, fix it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cabaeeb436bd..386d9adfd4bd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2568,17 +2568,14 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		folio_unlock(folio);
 		return ret;
 	}
-
+out:
+	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	if (ret) {
-		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
-
 		/* Wait bios and clear uptodate. */
 		folio_lock(folio);
 		folio_clear_uptodate(folio);
 		folio_unlock(folio);
 	}
-out:
-	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
