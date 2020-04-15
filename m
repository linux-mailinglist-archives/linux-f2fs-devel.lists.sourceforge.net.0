Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFE1A9D4B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:45:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgTo-0005NE-VY; Wed, 15 Apr 2020 11:45:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgTn-0005Mf-FG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cAa3jvd6YB3LQBsFFIH2ITg+Rzc+7wI7mh7ECopLIRE=; b=V8lXVOG6U6orbGHdn1e9/+n81h
 6BM2+rUmXpm5o0hro32vW6sT/waiB8zIgpWpSzRxbunUCs8XB+9XrU7e1tLzpC3FS9+h9rKdVy5Aq
 gfvBpo7uMsg+U8UV+4f0Nbyvfxe5m/vQ5lH4/CLKNBeREWIsPMksTxTxta5Io1j+dJz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cAa3jvd6YB3LQBsFFIH2ITg+Rzc+7wI7mh7ECopLIRE=; b=ljGNYCce81zY5xaxCz4tr/QMOz
 BEflsVcqa9kKEpOgbRPO/MYRSTHUOHGkPtkTnan4Bla1H9GsbpWkMOliBKkdddzUadOfjiTOnKjr8
 8YdxHJlMH84ZPve+sz4rskGfyYF3AuBELMNxtDuEREt+1TQsCzpxmN1GIEtp6OWqSKsc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgTk-00GU4N-84
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:45:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC0D6206A2;
 Wed, 15 Apr 2020 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951110;
 bh=PXaOv0pa7SYg7uqpUX7Vx5OsF7uktHKosvPTWaBldIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MUDwrySGzWtPQ8N1dIbgDzeE04EaS3WwQoUGsHYRB3DiCFiEShJJ0rTW1nMVeMImi
 Nr6efAydZ566Iallin7rmR55kdCNUSFAZtb1jO9seS6Gv3VzCo5qDVIxyYjQDoMAGo
 WHq+++Rif8kAioNATPn2CRuRu66GUgJpXVeAstgg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:43:42 -0400
Message-Id: <20200415114442.14166-25-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114442.14166-1-sashal@kernel.org>
References: <20200415114442.14166-1-sashal@kernel.org>
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
X-Headers-End: 1jOgTk-00GU4N-84
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 25/84] f2fs: Fix mount failure due to
 SPO after a successful online resize FS
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

From: Sahitya Tummala <stummala@codeaurora.org>

[ Upstream commit 682756827501dc52593bf490f2d437c65ec9efcb ]

Even though online resize is successfully done, a SPO immediately
after resize, still causes below error in the next mount.

[   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
[   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint

This is because after FS metadata is updated in update_fs_metadata()
if the SBI_IS_DIRTY is not dirty, then CP will not be done to reflect
the new user_block_count.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/gc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5877bd7296896..e611d768efde3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1532,11 +1532,17 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 		goto out;
 	}
 
+	mutex_lock(&sbi->cp_mutex);
 	update_fs_metadata(sbi, -secs);
 	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
+	set_sbi_flag(sbi, SBI_IS_DIRTY);
+	mutex_unlock(&sbi->cp_mutex);
+
 	err = f2fs_sync_fs(sbi->sb, 1);
 	if (err) {
+		mutex_lock(&sbi->cp_mutex);
 		update_fs_metadata(sbi, secs);
+		mutex_unlock(&sbi->cp_mutex);
 		update_sb_metadata(sbi, secs);
 		f2fs_commit_super(sbi, false);
 	}
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
