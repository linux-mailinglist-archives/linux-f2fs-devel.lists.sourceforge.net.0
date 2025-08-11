Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B04B20432
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 11:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LJSX9KXJaJKzSBxj1z9JHdvC0mauboovXEZ6M+150QE=; b=dquXsg1AyPYMhD2fhYpHcTeHJ8
	eRCJwtHjbLwb5wyNlFw/ZzGzZQRrsrdb+9NqcZdtdHqLK4ziI3Dg0+pnSOFZ76zxUpSy1Brr1T3fe
	FPMeEqrV0dQ9RXvdDQzBaWRR2+a4UQ04GgFqhHOltFronMhntsnvl18E/UN87asNY+tg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulP7q-0002gk-M4;
	Mon, 11 Aug 2025 09:47:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ulP7n-0002gE-B7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 09:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PYIYrelWOaUsPKoiwzS+bd7tUiVLvXVeOwby+Ejqc20=; b=ObW8gCIrzav5eComVEYMyyYWU8
 IuZwGlQZR2YnsARPzVgjOTb1NUDrVCVh1PNWIXGuCxgQDagUIoscOSDDwOKj22w6k9N+rkw4jD4EU
 eRVtsdTz9nd03Ny27LywsEa3nQyaJZwb0DBrX/tMsgj71ugnXNOSFv+xBiQ++n5wq88o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PYIYrelWOaUsPKoiwzS+bd7tUiVLvXVeOwby+Ejqc20=; b=a
 ZkZJYb6GVsfBz5Xv19ZgKh6tPWqe/RD0Q2BXTMDJiv+EsInMnf7h2KC73RV1LLLkdaLCjuTnIuWjh
 /cY8Ndw924qHEfBxtsbKdzu7XeOUyUv+HU4PMsoNxSDLfc/9P9lwWp0SUXPH6GVgbj0WqzdY/fyIK
 gk9nyh3ChapxvwkA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulP7m-0002jZ-V3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 09:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EA57601EC;
 Mon, 11 Aug 2025 09:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE33C4CEED;
 Mon, 11 Aug 2025 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754905635;
 bh=b6jkhUYpdwUE16LmJoWqbBAvGtaIQ6wvKJgoSvIQojY=;
 h=From:To:Cc:Subject:Date:From;
 b=I9BFfmVHtgaWf2c+uiqE+sSLrbikYqzs2Y0NMI3NjnT36bUvnd89faGeHAwNn0uRp
 AoohCo9nsmOrfUDXQp9wk+24YQE2ulbN1GxMpjMyLZ1NyUuySauJAow/7nEuxCj8Xl
 EVcsICwFxTd2WoxxddOlCCS6m496oekpoODh8JfXwjhKSmUtHs4qGItji7TZlPn3Tl
 bwdZmWjhmmJdkG/m/v+SCnpY789flWi+CoeUreUzoUeTYQEU7T+WZw0HFyL8JN86JH
 y9O9O5jyQLD93TBiQ/5zkofddBM8nHgbr2Q2igG/LkYP2VUTWDkJFZ5s85CQEZ3vSe
 95XkMdbIZ/afQ==
To: jaegeuk@kernel.org
Date: Mon, 11 Aug 2025 17:47:05 +0800
Message-ID: <20250811094705.1054251-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Support to inject .i_xattr_nid on inode node. Cc: Sheng Yong
 <shengyong1@xiaomi.com> Signed-off-by: Chao Yu <chao@kernel.org> ---
 fsck/inject.c
 | 5 +++++ man/inject.f2fs.8 | 3 +++ 2 files changed, 8 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulP7m-0002jZ-V3
Subject: [f2fs-dev] [PATCH] inject.f2fs: support inject inode.i_xattr_nid
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Support to inject .i_xattr_nid on inode node.

Cc: Sheng Yong <shengyong1@xiaomi.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/inject.c     | 5 +++++
 man/inject.f2fs.8 | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index bd6ab84..b291d9d 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -192,6 +192,7 @@ static void inject_node_usage(void)
 	MSG(0, "  i_links: inject inode i_links\n");
 	MSG(0, "  i_size: inject inode i_size\n");
 	MSG(0, "  i_blocks: inject inode i_blocks\n");
+	MSG(0, "  i_xattr_nid: inject inode i_xattr_nid\n");
 	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
 	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
 	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
@@ -794,6 +795,10 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		MSG(0, "Info: inject inode i_blocks of nid %u: %"PRIu64" -> %"PRIu64"\n",
 		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
 		inode->i_blocks = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_xattr_nid")) {
+		MSG(0, "Info: inject inode i_xattr_nid of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_xattr_nid), (u32)opt->val);
+		inode->i_xattr_nid = cpu_to_le32((u32)opt->val);
 	} else if (!strcmp(opt->mb, "i_extra_isize")) {
 		/* do not care if F2FS_EXTRA_ATTR is enabled */
 		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 01d58ef..65ac658 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -170,6 +170,9 @@ inode i_size.
 .BI i_blocks
 inode i_blocks.
 .TP
+.BI i_xattr_nid
+inode i_xattr_nid.
+.TP
 .BI i_extra_isize
 inode i_extra_isize.
 .TP
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
