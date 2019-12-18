Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6271252C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 21:10:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihfdy-0003Uy-UP; Wed, 18 Dec 2019 20:10:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ihfdx-0003Ur-NU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pnk6hpDsNruJt+mWqdk8MmJNsNKnSAoG/M0nIalUd9M=; b=HH7WoD5THZDko/slqVCh42+at9
 KkkiJ/BSCBbkK5tXIPPD3h6qaSG49dZXI5amOJ6Eda87sJj7QHtxohroCDjr6+ZcIq6O6XZbwiaBw
 QoZBZuAs/3lEyYcQLfIhNP6RRQVTm7Iaj6fr0v9IrUmK6KKCIIeiHT4geZye8meXE9EE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pnk6hpDsNruJt+mWqdk8MmJNsNKnSAoG/M0nIalUd9M=; b=P1jTJm283ukxtggVrf/7wpfgx0
 HtktfLEThjTyweUjdjoOGJDDc0oX5jpRW4g6CgZcwsXx0TBrW2YoQyLKZyFYVUSPTddPsnXwVU9fp
 kaVdGLI3oRdgxA5amaxb7eGOM9ZT5Wi6FJ4kbz1i32qyg1lgRMe55i9EyMCrZ/1Gmllk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihfdv-009Agr-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 20:10:01 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41EFE24672;
 Wed, 18 Dec 2019 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576699790;
 bh=hyyMtYEKhxzSeADhWhVSPTwVw+0j/nVaT1nPanMj+j4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pw3vmYA+s18rEXrjuBlxEtKHDmWBLGot+yMUmzX1vltxYqXmdP9LE9ZXMnAONhUKI
 kAQRDgOKhw4WVPYJ5gR9KKQwDHyCmK5y0RxS3GK2CybT2lu2OxXVk/g9TO6wRM2KV4
 4aSZLiyzX+mSHDidM7Fy5kwFoplid5QqPTHO54Rg=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 Dec 2019 12:09:47 -0800
Message-Id: <20191218200947.20445-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191218200947.20445-1-jaegeuk@kernel.org>
References: <20191218200947.20445-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1ihfdv-009Agr-Hc
Subject: [f2fs-dev] [PATCH 4/4] f2fs: free sysfs kobject
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Detected kmemleak.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 70945ceb9c0c..5963316f391a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -786,4 +786,5 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
 	kobject_del(&sbi->s_kobj);
+	kobject_put(&sbi->s_kobj);
 }
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
