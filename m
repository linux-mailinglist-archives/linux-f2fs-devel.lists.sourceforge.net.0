Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE239C476
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Jun 2021 02:32:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpKEv-0002rU-EN; Sat, 05 Jun 2021 00:32:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lpKEt-0002rM-20
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Jun 2021 00:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZYPvxC7Xj7nFfwiiNVhvdd0yi7cqLnsS9t1jefgt1UA=; b=lGsM+wBOEUkVzPjjLEjBoeUuR0
 gF1nCCPcl/uD4gLmiUP7HmyiDezfci0MLOXJ1thmgqJoGfJ6d+jOfQoX0xnVlMaA51Lj0DPpDv+Ht
 6VY3ZG6pGxmbwfnSXGOMCI1fJOWfGIRAjzFlLqiEKf1NxUTFRzN0J2UQwT5sFTU/HPV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZYPvxC7Xj7nFfwiiNVhvdd0yi7cqLnsS9t1jefgt1UA=; b=UegyVV0LR4JwCKPQsleE3Ev2br
 vhQJCi+pKlljUJ1uOej0yVddkhi/67GqKYtUtGvqeqbF356h7NoNlkQz3UfK3Nj0BWDO7vRiW4Qyq
 O49Vnzk6rX31rvIiaaJGibA53zk28RzGz20KuEMiziVQ3x31daby5NSerBvaiFf46+EM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lpKEj-0006T9-QR
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Jun 2021 00:32:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 110F3613D8;
 Sat,  5 Jun 2021 00:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622853137;
 bh=hnj4YdZSKapllVOA4ACyYPr0+WwJm/RSY5vJAduBcmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Drcs8VOdy4l7ev9LFryG94KmJnmCwF3oLFuqzx163jFdm6nby5k1mhZx0lSSeFoek
 VpWGFGT8mN7lHDsN48La3zJP5Slpk3NzG/Thg1O9b0dewrN7uXxqUZ+NBWtn64OYbP
 M8m1TgSnHIa2Qd63IxaTuF8YrJLX7kNynQMQBWnDL+WCVJdC+eDsdl9aa6EkrR+nfa
 B/Jz+HZYq4WH61n8GutZVxEEjSO5o7UL2eUbB0lOvPkfxQltb+Y1tc0+LwUVmDr1Sv
 oSKchH4n3Z4/UbIBmqpQeZ2//u0hm6CBpEct1uHZFlhIxosKWnvp6cXPnxy/q/ztc1
 dwIbjdOdfLBlw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  4 Jun 2021 17:32:09 -0700
Message-Id: <20210605003210.856458-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210605003210.856458-1-jaegeuk@kernel.org>
References: <20210605003210.856458-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lpKEj-0006T9-QR
Subject: [f2fs-dev] [PATCH 2/3] f2fs: add pin_file in feature list
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

This patch adds missing pin_file feature supported by kernel.

Fixes: f5a53edcf01e ("f2fs: support aligned pinned file")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 4daa6aeb200b..e4d5090b7cb3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -740,6 +740,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
 #endif
+F2FS_FEATURE_RO_ATTR(pin_file);
 
 /* For ATGC */
 F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
@@ -853,6 +854,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compression),
 #endif
+	ATTR_LIST(pin_file),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
