Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF42E6A52
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Dec 2020 20:13:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ktxxi-0000yB-4O; Mon, 28 Dec 2020 19:13:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ktxxg-0000xk-FS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 19:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cpwtpozgh+UeeKkoImvR2LGhYQIF4ATaivf8EUw5Ilo=; b=CYIP+7dK860bb6Wg04Fy/gQ4rZ
 9FPewg9FqMy7n295N2K0VD2qy4R7fsa4yMhcXd9E3Era05x0MYE2fPR/J6lywR/X5K6DavsOy1N4X
 2TrAZNTEYUvD/Lf2Reukmj9evD1qd1ysh+Rd85U/CBtaAiwg42O9NXSxtxH8tRKnRXZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cpwtpozgh+UeeKkoImvR2LGhYQIF4ATaivf8EUw5Ilo=; b=dreqbCEGSXtMehx7NAbWZQeFhB
 hQ5fQ1JLSl3cp46AAAGznhAvMWLR772plCCo/fvGlSVWH45KFNMGmtvpecOYgOVnYnFXxjKz/cVuZ
 te3zOxGGt4sVJQxvG/ev08fKGlqsH16FDwqLObt9Rd6ayYzPcVukr7RmtqLjem9z7cPs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ktxxR-003H5w-KP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 19:13:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC1C322B2A;
 Mon, 28 Dec 2020 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609182797;
 bh=wcDIzfW0TdVWW8ZUcFxkhA+O3mFdLmRyWJlQxT4S1QI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bAQNUpGKbUC6XgijBxKuQ6fLblzIjwttUoUazHLtwrmvyRAc/Hp21PThkFceo2oND
 +20rouDAMTnb8+gPYw32tirqHwpl3Trft2e5ZG0gVJkOImuAdAkPKdMuxaKEVvzoQm
 8od/01VOrXkJqs3NmQuHziqvc8o5IVveuM//bYZRclslEfElrjsTe7NX/6K9O2R9ud
 RPjixOFxq4uHlp3ZDFYPaEDRV2f5+gzHb5j82nO0p0ezNlQYr40a86s5ZeVk9oIWxi
 Pbj7E9prte/MgEp1mkzEDRYpcjCnfd6/Wc287+/VJezxQ6sKGj3VcSH8uHMtx3G5LU
 WYCR6iIAZSi3A==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Mon, 28 Dec 2020 11:12:09 -0800
Message-Id: <20201228191211.138300-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228191211.138300-1-ebiggers@kernel.org>
References: <20201228191211.138300-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ktxxR-003H5w-KP
Subject: [f2fs-dev] [PATCH 4.19 2/4] ext4: prevent creating duplicate
 encrypted filenames
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit 75d18cd1868c2aee43553723872c35d7908f240f upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ext4 by rejecting no-key dentries in ext4_add_entry().

Note that the duplicate check in ext4_find_dest_de() sometimes prevented
this bug.  However in many cases it didn't, since ext4_find_dest_de()
doesn't examine every dentry.

Fixes: 4461471107b7 ("ext4 crypto: enable filename encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 4191552880bd7..3c238006870d3 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2106,6 +2106,9 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 	if (!dentry->d_name.len)
 		return -EINVAL;
 
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
 	retval = ext4_fname_setup_filename(dir, &dentry->d_name, 0, &fname);
 	if (retval)
 		return retval;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
