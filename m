Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161EF6295
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Nov 2019 03:44:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTdD4-0005Uc-4g; Sun, 10 Nov 2019 02:44:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iTdD3-0005UT-72
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Nov 2019 02:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O5snlL8N4Tlir9iah86ZVdIrCxF2jFCYAkg+KjgbpM4=; b=MPzWeCXIHL8E9x7mUU2lWf7BaJ
 kZcW3sEWT48hw/dPrkrU5HCwuhL5R9PzQWneKn3Gd2rE0UkcTJ4YDGK1Z+KpKfI3Jj6aahy7UTibL
 +5+CQdRzMu22ob2oxkkTgW8csAPKAgoux/DJwVC25OlcWmVaKeIDGIBVWrtToAZ6LJv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O5snlL8N4Tlir9iah86ZVdIrCxF2jFCYAkg+KjgbpM4=; b=Ogrtx1caGfEg9qSzx75QPBaT+v
 jhS7OQ8us/GSn/s017x0avALEVDwAjWHqiGH85cpf3jKteLdXI7nSAiBaoaxtHnc+CqXjtUJXV1dT
 uxNSc1TJl6ruXBAmOFLobnjjNoLkxGMLM1QlLYimODKgwahCDKBbMm2iyXn+yWBYx9K8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTdCz-00CSm9-Sk
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Nov 2019 02:44:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 851D921924;
 Sun, 10 Nov 2019 02:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353839;
 bh=Clahr9tyx0YwPFKHVEbZpyqfQUlA1RpfBoLTc9F30ng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HbDpAkUpmKX84ZKLdP8GPAvdUWpc2x0As5G6GMZA37ZG1O33lyG24wpgJhoAhAm5/
 67gqFjdJvwFupfz5Do9A3/I7J++LyT1Ar73cDZvAjEJJtR79x5Dz9TFqQB+zbifYxA
 M9BvZ/uLwlg370PpSN19Vv18y6uePHZCWlBJ4cGw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  9 Nov 2019 21:39:10 -0500
Message-Id: <20191110024013.29782-128-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTdCz-00CSm9-Sk
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 128/191] f2fs: fix remount problem
 of option io_bits
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
Cc: Chengguang Xu <cgxu519@gmx.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chengguang Xu <cgxu519@gmx.com>

[ Upstream commit c6b1867b1da3b1203b4c49988afeebdcbdf65499 ]

Currently we show mount option "io_bits=%u" as "io_size=%uKB",
it will cause option parsing problem(unrecognized mount option)
in remount.

Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d9106bbe7df63..c3f07171a5ab9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1336,7 +1336,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 				from_kgid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resgid));
 	if (F2FS_IO_SIZE_BITS(sbi))
-		seq_printf(seq, ",io_size=%uKB", F2FS_IO_SIZE_KB(sbi));
+		seq_printf(seq, ",io_bits=%u",
+				F2FS_OPTION(sbi).write_io_size_bits);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (test_opt(sbi, FAULT_INJECTION)) {
 		seq_printf(seq, ",fault_injection=%u",
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
