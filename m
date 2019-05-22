Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052A26951
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 19:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTVIk-0003HE-1p; Wed, 22 May 2019 17:45:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hTVIi-0003H0-Mf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 17:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xB6Kn83xjohfkxVRB1RECUGTWlxzGcd932Hg4np7QjA=; b=AYWUuroGFUa32GA3A3wXAIHeeR
 QZjCkPScw0Kcln6EVAejtQi3sH190kfPfxQTap+Ly1tXVrIEDtjuVGEp+bg7GJ04NuJ1yRptT9F2f
 spyXMhcJxdbbcKGFiQBm7QxnpgHiyeZXy2weLE0sIkpf1vXe7GC59+mecqj3R2uBr1MI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xB6Kn83xjohfkxVRB1RECUGTWlxzGcd932Hg4np7QjA=; b=T3G9h/8+vhRmUkq3E3wEwewEsh
 DWsp20Ow926EXqSJVq1XkMkdo7M6YE68M0ja6dn/KxJEOAQZJt2FzdfIVgP8+usfNQdGayaHoBj0W
 8mKGLhQiW+g4wcZPTgiT1Mo8JOGIqBzkPXdkJehgAzBubHVP8HEUkBfwFsdjNP6Xlewo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTVIO-000S5E-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 17:45:16 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC5C121019;
 Wed, 22 May 2019 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558547090;
 bh=WGpxkLS3O1W5xJkPVT6OtlO6L0fjxSCDqpvjxfdM6e8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SzL7buq0bAzafVDhOU8P3wAUmBGyHpJpmx/A+Wg9G+RBjrePwONfrzYdaLTQ6n0ke
 xz8NKrRO3GWrfZTLu5+xIfiqvqPnf6DQ0cVkiooeJc32eSX+rfY8IFuTtOPMSTssKH
 1IWqBJr6jhO9FgvLdW5ERpUg+ZbExknEYZH5aPHs=
Date: Wed, 22 May 2019 10:44:48 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190522174448.GA81051@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190521180625.10562-1-jaegeuk@kernel.org>
 <8e9a4cac-c81b-11ce-0a5a-c6f5caf716c4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e9a4cac-c81b-11ce-0a5a-c6f5caf716c4@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hTVIO-000S5E-Fv
Subject: Re: [f2fs-dev] [PATCH 1/2] Revert "f2fs: don't clear
 CP_QUOTA_NEED_FSCK_FLAG"
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

On 05/22, Chao Yu wrote:
> On 2019-5-22 2:06, Jaegeuk Kim wrote:
> > This reverts commit fb40d618b03978b7cc5820697894461f4a2af98b.
> > 
> > The original patch introduced # of fsck triggers.
> 
> How about pointing out the old issue has been fixed with below patch:
> 
> f2fs-tools: fix to check total valid block count before block allocation
> 
> Otherwise, user should keep kernel commit "f2fs: don't clear
> CP_QUOTA_NEED_FSCK_FLAG".

Actually, that didn't fix my testing issue, but I found we were not using
error control for quota_sysfile. Now I've seen no issue with the below patch.

From e1b7de7050fd87b7c20e033b062b1cc6505679d3 Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 20 May 2019 16:17:56 -0700
Subject: [PATCH] f2fs: link f2fs quota ops for sysfile

This patch reverts:
commit fb40d618b039 ("f2fs: don't clear CP_QUOTA_NEED_FSCK_FLAG").

We were missing error handlers used in f2fs quota ops.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 6 ++----
 fs/f2fs/super.c      | 5 +----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index d0539ddad6e2..89825261d474 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1317,10 +1317,8 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
 		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
-	/*
-	 * TODO: we count on fsck.f2fs to clear this flag until we figure out
-	 * missing cases which clear it incorrectly.
-	 */
+	else
+		__clear_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
 
 	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
 		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 856f9081c599..34f2adf191ed 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3169,10 +3169,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 #ifdef CONFIG_QUOTA
 	sb->dq_op = &f2fs_quota_operations;
-	if (f2fs_sb_has_quota_ino(sbi))
-		sb->s_qcop = &dquot_quotactl_sysfile_ops;
-	else
-		sb->s_qcop = &f2fs_quotactl_ops;
+	sb->s_qcop = &f2fs_quotactl_ops;
 	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
 
 	if (f2fs_sb_has_quota_ino(sbi)) {
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
