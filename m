Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFFBC832F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 11:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qyEFvOtCXnV/kfeQRIyeyJFm9nb8MaJnI/Lad649w8M=; b=RdKDLAFiSWLuh1GSks6l/SyGxJ
	hxlS+fyCjM6mOqDr0isdAXPKOeqetfoUbWyOI9Iylj74y7TZsz0R2VGUODq/JwH7qXX2tf5GswfwJ
	uh37ifG1jeSYMxi5amZzEDdtYblZgLFtN/05xGmU0Q0TWmUorwp5GkYngJnteOX/iDxQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6me6-0003ni-RT;
	Thu, 09 Oct 2025 09:09:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6mdy-0003n1-Eu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gb7Kzr40sx/Cylp3yrPIkC0xPvzP/9xzHw4+qY9IqOs=; b=Ls35boJHYWREvue9fUcsp6D1D5
 Crt28bE6eEe9PLWgVvic3LUjVywDMFlmS0lsx3uMQvOf4vrXcxszcZy769bL33JEh8mInG5L+PSuE
 WJwFqrKkRyj/+kWuRYqHaecKIszzStgMatAMDAcez1K78pgP2PMJHTnl+rtYRdykBBG4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gb7Kzr40sx/Cylp3yrPIkC0xPvzP/9xzHw4+qY9IqOs=; b=R
 wsfuE+W09x3lMgMEbeGzXoRVYpDWqwviFE2BygAuaTGmuJZpL/C9QKEETjfKdUmGtxFSd4iGxGUvR
 dVE1w+1enNpI8Dn9Mo8LNVLCDTjlGqYobCTpAoadEmzB8XgHFfG/GThgmNfHt4Y6XD4jq8nYvrAvX
 bgrSKZ8vdMSLJ4T4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6mdy-0006Fx-3m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 09:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7D4043590
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 09:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A5EC4CEFE;
 Thu,  9 Oct 2025 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760000931;
 bh=cSF5nnWAkuG+2VjrxbmPPHyWmyDje6wogp0OrhnscnA=;
 h=From:To:Cc:Subject:Date:From;
 b=rsOd2I7QI7V1OweWULDrGrHF1WCddyzoKz8XXXxhoiESV7M3flR330qa7JgqT5jlV
 zCQMb1bpy0tiszdFs3roJjEbh1Oe14MXJeK464dmmYX4gR8NDkVNx4VfdJCawFgxYu
 rhqzDWn2+TiC2jQJ5VP8ZkrSyKUghb0YUCmmRlUq2SvhiG6SARs1YOUO+WjSUITW5c
 r2bgm+VHBK3jfh7ZTRgmuFZJVDrbbv0r+KPxajmLQ5Mme4xyqoIw69EJxRZVzcsf81
 OgK4QJPUXOM0vbcH+/jPocSL1gst1AxxnuR1YfYNMbD7och2VxtH1nFgxuyFaiYvgg
 Wf06o3xaxJ4Tg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu,  9 Oct 2025 16:50:41 +0800
Message-Id: <20251009085043.16910-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Let's source common/f2fs in _source_specific_fs() instead
 of in each testcase. Cc: Jaegeuk Kim <jaegeuk@kernel.org> Signed-off-by: Chao
 Yu <chao@kernel.org> --- common/config | 1 + tests/f2fs/002 | 1 - 2 files
 changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6mdy-0006Fx-3m
Subject: [f2fs-dev] [PATCH 1/3] common/config: source common/f2fs in
 _source_specific_fs()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's source common/f2fs in _source_specific_fs() instead of in each
testcase.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/config  | 1 +
 tests/f2fs/002 | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/config b/common/config
index 22b52432..1420e35d 100644
--- a/common/config
+++ b/common/config
@@ -509,6 +509,7 @@ _source_specific_fs()
 		;;
 	f2fs)
 		[ "$MKFS_F2FS_PROG" = "" ] && _fatal "mkfs.f2fs not found"
+		. ./common/f2fs
 		;;
 	nfs)
 		. ./common/nfs
diff --git a/tests/f2fs/002 b/tests/f2fs/002
index 74146217..d2f6e413 100755
--- a/tests/f2fs/002
+++ b/tests/f2fs/002
@@ -43,7 +43,6 @@
 _begin_fstest auto quick rw encrypt compress fiemap
 
 . ./common/filter
-. ./common/f2fs
 . ./common/encrypt
 
 # Prerequisites to create a file that is both encrypted and LZ4-compressed
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
