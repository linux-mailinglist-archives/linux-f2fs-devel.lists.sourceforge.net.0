Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449D96AF23
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 05:21:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slgaE-0007Hp-6t;
	Wed, 04 Sep 2024 03:21:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1slgaD-0007Hh-8g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Om8LmRIswFTNo55U1tYywRY4ddbqLHkKpFBkr6Nsa8A=; b=nSFWLn/mOMExWJCevvyCOubpSl
 IiDjfDNvQVbMnhsA2UhvKCByVQI4+JVzann6BLoyzRcVPfQHEC8+eA8cateW3tf9IZj5V9O1R2n8D
 +/ZkdEu9rQORfPgh2tN6DixU6g9GiljHlgw49WYX/lMYMrkn+4ywPX7+NJ8eAa0o1l2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Om8LmRIswFTNo55U1tYywRY4ddbqLHkKpFBkr6Nsa8A=; b=E
 TLc6P+FMITXxI4TekmpDDlyCBA/Tagy5v+lZC3uwbzGct5I5myhvljbaILU/17dfIGMgoXnEwyFft
 aso6R+apARijVnRC+qi4l+i44jZA/BPJ6xKDMQrV/DIKslGioZ0THHCNmZNuyRKp0FCsfi63BoFcj
 Kicc1CKd7yIE+IDs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slgaC-0005Yd-K9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 03:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BAC75A40117
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Sep 2024 03:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590B1C4CEC4;
 Wed,  4 Sep 2024 03:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725420073;
 bh=7W7hSFh6fbzMu1DJBOBbHsI5RIQMTJ2hInRBKWxu5IA=;
 h=From:To:Cc:Subject:Date:From;
 b=QSUNarubdzImUCws3SMfJfYvb7vpJ3+zEAqxD8MTeRnEt484c/BSAx6jJzzsHqsLj
 o+ClAQ/NVA7gIpQGNqmzcC15bSCQ8EpzyTlJKyRXzuAQ99RSZqU/7nopUuX6k4cC2V
 8yXAbSg4cnXX5Hn+S14ywgiOp5nwLssmfBik9qtFxasjy+yLA06/NFsw7to/IIAox7
 GU1mAhc2wKJGJIWPJSDfpLxywKo2hCoJqfgfJpKESNj8JqR8MBFfbbSBcd1TrHsZpp
 3U8ZDAy1a25HNeNgRjxl5ylCO46x62MStPbvAw7s0HDBGaZ/FLvUNPrveBLlEyEu1S
 ZGeS2qyi3e/jg==
To: jaegeuk@kernel.org
Date: Wed,  4 Sep 2024 11:20:47 +0800
Message-Id: <20240904032047.1264706-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some f2fs ioctl interfaces like f2fs_ioc_set_pin_file(),
 f2fs_move_file_range(), 
 and f2fs_defragment_range() missed to check atomic_write status, which may
 cause potential race issue, fix it. Cc: stable@vger.kernel.org Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/file.c | 13 ++++++++++++- 1 file changed,
 12 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slgaC-0005Yd-K9
Subject: [f2fs-dev] [PATCH] f2fs: fix to check atomic_file in f2fs ioctl
 interfaces
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some f2fs ioctl interfaces like f2fs_ioc_set_pin_file(),
f2fs_move_file_range(), and f2fs_defragment_range() missed to
check atomic_write status, which may cause potential race issue,
fix it.

Cc: stable@vger.kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a8d153eb0a95..99903eafa7fe 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2710,7 +2710,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 				(range->start + range->len) >> PAGE_SHIFT,
 				DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
 
-	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) ||
+		f2fs_is_atomic_file(inode)) {
 		err = -EINVAL;
 		goto unlock_out;
 	}
@@ -2943,6 +2944,11 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		goto out_unlock;
 	}
 
+	if (f2fs_is_atomic_file(src) || f2fs_is_atomic_file(dst)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	ret = -EINVAL;
 	if (pos_in + len > src->i_size || pos_in + len < pos_in)
 		goto out_unlock;
@@ -3326,6 +3332,11 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
+	if (f2fs_is_atomic_file(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (!pin) {
 		clear_inode_flag(inode, FI_PIN_FILE);
 		f2fs_i_gc_failures_write(inode, 0);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
