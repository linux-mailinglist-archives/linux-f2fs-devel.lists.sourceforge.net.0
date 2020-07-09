Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D92652195C6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 03:58:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtLp3-00024u-TN; Thu, 09 Jul 2020 01:58:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jtLp1-00024i-VO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 01:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EOJ8u6cUBdJpk7YFY5mzmvMLrW3UokFC1yt6TbWqsM=; b=TpwSabe+M/ZZ5oCGEt4UDTJU2l
 RkfndEMkc1sWtpdF7CpXbkmY2j+7nemhYzofd6c7uCwZjOolFc7IgxYdPBfI7cwkm5MzGqlnGPftx
 EgbHdQnfWxA4gXWbrkW/EqMhMAAtPZuojoOkiukqnkqhfJt0F2sTjw5YvMJLyKQHjZdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3EOJ8u6cUBdJpk7YFY5mzmvMLrW3UokFC1yt6TbWqsM=; b=M
 uvLWtdxusHzjstGlc14CwOvwXXryZpJkx2y1OV3nIN+SikNter4CzQWHIAyP4QzaqTO/iEP6tc7Ez
 4q5sHsGIIopn6ulcsh0hlJs+8X2qLZmYCXZko48ajxEmYnpscS194pSOcGxZrxb4cWd06HsCpzYN0
 OLjqU3Qr07Oa0OTs=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtLp0-000IeG-MO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 01:57:59 +0000
Received: by mail-pf1-f193.google.com with SMTP id m9so321363pfh.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jul 2020 18:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3EOJ8u6cUBdJpk7YFY5mzmvMLrW3UokFC1yt6TbWqsM=;
 b=rpT763ZtXVtRFJZzC+mYrDD5V0TzXR8UbA3D8mmCaw7nudYZxGAy3M7MZ35tvaf0U4
 QSQKbBP4QqPbDs9WKeGDkwoaTWygs6EPVNIOS1JoHnlyhwEv1YzsknMBahVKtsuZ9eZE
 sEIsGewAi3aLHSDEO20X27Aq7AKOBGTRo81IiQppu7LojOnsJL+N3klBSjZ7NHs3ur7Q
 XQ1CFoRzJOcpOfxcNWEgMTzVtr/yhL00CCVXeYGJJqAfKKXeVTcYF5oGzdEiKw/2PwWE
 ZSK+Ue8OQZ4YbL3AJI0DpasraKyocSXJVT0VYFwitIxbVstapK5yQ5RLHUvgImJ/1Od5
 rOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3EOJ8u6cUBdJpk7YFY5mzmvMLrW3UokFC1yt6TbWqsM=;
 b=H/3PhYyUrpcoIYiw5u1BwPPiA0FKCuVn1Lx75rdtdHAmo/FavvCTPbQN/khfoKI7Wk
 ks2lirrhmZeoSAQFDropUNSYBG2M/sUN2PieiFzraEQafkc7oa57O6UoGXIhmRZeQuGq
 e+vOCPMenS8gYYN6OFqWaQN5YQm3y+od5ycEMqE5TthF0LafYL/PZJbj7zBJs5EEhq+7
 Lsb4gJRydaUWxlVh7d4oWMKUShkDvwACmZh6hpXFm9POUE23JyTRv11nrnW9IiFiWt3Y
 FN3lHMEKF8yJ5kzyUKXYvJqpkjAogZU3en9bQJm4WJcAYEFEcj52tJzTKK+FX0egCGh3
 gxTw==
X-Gm-Message-State: AOAM5304tx1MNfAgEaUhZI4EKTFigrj79mVlks2tNf5NhrpZCHjWeCks
 Hq75TKOLyJo0QBM99Sn0kTI=
X-Google-Smtp-Source: ABdhPJyKIq9mzhbS1XC/4twlgmQgDolvS0UpiaIdjgwna4HwalmSi95voBSbTp0Bs0VcDe0k7I3T0g==
X-Received: by 2002:a63:6c1:: with SMTP id 184mr53624374pgg.262.1594259865770; 
 Wed, 08 Jul 2020 18:57:45 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id i21sm911219pfa.18.2020.07.08.18.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 18:57:45 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  9 Jul 2020 10:57:39 +0900
Message-Id: <20200709015739.1653668-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jtLp0-000IeG-MO
Subject: [f2fs-dev] [PATCH] f2fs: ignore when len of range in
 f2fs_sec_trim_file is zero
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

When end_addr comes to zero, it'll trigger different behaviour.
To prevent this, we need to ignore the case of that range.len is
zero in the function.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 368c80f8e2a1..98b0a8dbf669 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3813,15 +3813,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	file_start_write(filp);
 	inode_lock(inode);
 
-	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
+			range.start >= inode->i_size) {
 		ret = -EINVAL;
 		goto err;
 	}
 
-	if (range.start >= inode->i_size) {
-		ret = -EINVAL;
+	if (range.len == 0)
 		goto err;
-	}
 
 	if (inode->i_size - range.start < range.len) {
 		ret = -E2BIG;
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
