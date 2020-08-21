Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00C24DA26
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Aug 2020 18:18:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k99kj-0000pd-8p; Fri, 21 Aug 2020 16:18:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1k99kh-0000pV-NE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Aug 2020 16:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/UsyY/W7BPhqJaeBDlCRJ4/9wJExSYoogbilvcRHUuc=; b=YIkZu8Q+ETWnYdfykQlPhMBAu1
 G+2DRyd0SVh3o6dxmY+8MKDEVrQ7gmbjc62qGtkDssulThsilGSQwT1tVRRkBri00IS2QAEF8xVUO
 cmcNvqp8/ZKEordi2hN31Epd4SVYl3z4JULBG2VuP8FxDH/tqsYq1Y5gtX8jMN8MopkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/UsyY/W7BPhqJaeBDlCRJ4/9wJExSYoogbilvcRHUuc=; b=kjWthB2X8y/JDDUtw6Hztcec6i
 PPIEN+NEDTKtNO/pTM/27FAbhl+2BEVjxDG3JabUroPtpRv+fEU6j02f+1YadsZfOPM1oFzrJwMnm
 +bTKkoTTxJwH1SsuwzLVd0d3wUHAGBdcUgKM8EetmwctPLKuKHcSX/sVHzJLPpGr9vS8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k99kg-00Ee7L-G6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Aug 2020 16:18:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5763A22D3E;
 Fri, 21 Aug 2020 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026725;
 bh=wWypa74ApxnbJrtT25Hj2RfEkG8HY3F1rSeh2fTUozo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gzlVBmI17jbS8pTdYpdzoJltmUjsQ1JDGQpGUEJfZYQYPt5PgYrFRAE81qnlzK18S
 MII43YMI3kt8UhWaY0HgzOMTVwAFkIpmhHDU/JZVJ6DHOAboPiZ77saB3iKnUrKjuO
 ZBAoAofbRPI84VLVmODplVVJPR+PiDbNAbr6eRm4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 21 Aug 2020 12:17:58 -0400
Message-Id: <20200821161807.348600-29-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161807.348600-1-sashal@kernel.org>
References: <20200821161807.348600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k99kg-00Ee7L-G6
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 29/38] f2fs: fix use-after-free issue
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Li Guifu <bluce.liguifu@huawei.com>

[ Upstream commit 99c787cfd2bd04926f1f553b30bd7dcea2caaba1 ]

During umount, f2fs_put_super() unregisters procfs entries after
f2fs_destroy_segment_manager(), it may cause use-after-free
issue when umount races with procfs accessing, fix it by relocating
f2fs_unregister_sysfs().

[Chao Yu: change commit title/message a bit]

Signed-off-by: Li Guifu <bluce.liguifu@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9782250c98156..161ce0eb8891a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1004,6 +1004,9 @@ static void f2fs_put_super(struct super_block *sb)
 	int i;
 	bool dropped;
 
+	/* unregister procfs/sysfs entries in advance to avoid race case */
+	f2fs_unregister_sysfs(sbi);
+
 	f2fs_quota_off_umount(sb);
 
 	/* prevent remaining shrinker jobs */
@@ -1067,8 +1070,6 @@ static void f2fs_put_super(struct super_block *sb)
 
 	kfree(sbi->ckpt);
 
-	f2fs_unregister_sysfs(sbi);
-
 	sb->s_fs_info = NULL;
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
