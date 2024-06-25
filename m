Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 347E6915D31
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 05:14:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLwdR-000895-4j;
	Tue, 25 Jun 2024 03:14:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLwdP-00088y-B7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFoPWh3n1vldeyDoiiwfNDaGFyKz3NB2faLdmiv25Cs=; b=LoaY7wRFJeu3UZ6AMpvs9w7Daz
 KKNLXjQ2jlD41Z5NNQFaYpTTwQLRZHZJWuW1f2gIfpF6MlYCJlijyNxxCoRbXFtwtxhyBVxYnrhkY
 lVvHwwDmtIKg/7AcqjhCQ04mlIRuWhPHSQdK+bP+wMSbyWY9EJ/37PqJ9irxDiykZzSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zFoPWh3n1vldeyDoiiwfNDaGFyKz3NB2faLdmiv25Cs=; b=AnpHDp5uMXeGNaO7UWsdIyvC0+
 84P/SIt2Y8600Eyn9Lv1NysRRLek/wosuNF0vdx8R0Ks6We4lhNNIJbZSwJhzsTwpWOcvCwec9wmx
 6L59GnnqwP6rvEPmC7y7A+zcParV59BQ4cVgU35WRepaxn7krxmNplwyWcBVnlDR2zvE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLwdO-0001Vd-QS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 03:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A85A6611DE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jun 2024 03:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CF7C4AF09;
 Tue, 25 Jun 2024 03:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719285247;
 bh=xmtO96A+N055YtD+3waXk7KlXygllEUWidyxOMqx4xI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=As17zSnO0H4YoH+VEVrP911ZuxvwpgRbdBTze0ZpkNW/ELFc5oFf3HykaV5PANk7V
 2ab/7PRTOjsr6r8s93ABFdevstCei9Equ9lwnzbWYj1q5ETshXq2OnFghqFDsYetV1
 Cde/ANAIZobA0uB4A09LUfECsCiwkmMdt3OW8WYqBlPQyRuSoNfvV/HYYSNknt6EPn
 P+LmSyn3ekDO+OGnl3c9P0GY+b3aoDdWe5ijfWLYOGBwW2xUP+oEaIkr0p5a5e6iD4
 akbjT990sIF+LS/A7BewqCDY92BD8N15JmuelcQLhk3z1FnqQL/qKl/J329434dGdF
 yGpMuq1R6GzIA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 25 Jun 2024 11:13:51 +0800
Message-Id: <20240625031351.3586955-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625031351.3586955-1-chao@kernel.org>
References: <20240625031351.3586955-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  atomic write can only be used via buffered IO, let's fail
 direct IO on atomic_file and return -EOPNOTSUPP. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/file.c | 15 +++++++++++++++ 1 file changed, 15 insertions(+) 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLwdO-0001Vd-QS
Subject: [f2fs-dev] [PATCH 4/4] f2fs: atomic: fix to forbid dio in
 atomic_file
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

atomic write can only be used via buffered IO, let's fail direct IO on
atomic_file and return -EOPNOTSUPP.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0355cb054521..a527de1e7a2f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2150,6 +2150,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		goto out;
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
+	f2fs_down_write(&fi->i_gc_rwsem[READ]);
 
 	/*
 	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
@@ -2209,6 +2210,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	}
 	f2fs_i_size_write(fi->cow_inode, isize);
 
+	f2fs_up_write(&fi->i_gc_rwsem[READ]);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	f2fs_update_time(sbi, REQ_TIME);
@@ -4537,6 +4539,13 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		f2fs_down_read(&fi->i_gc_rwsem[READ]);
 	}
 
+	/* dio is not compatible w/ atomic file */
+	if (f2fs_is_atomic_file(inode)) {
+		f2fs_up_read(&fi->i_gc_rwsem[READ]);
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	/*
 	 * We have to use __iomap_dio_rw() and iomap_dio_complete() instead of
 	 * the higher-level function iomap_dio_rw() in order to ensure that the
@@ -4948,6 +4957,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	/* Determine whether we will do a direct write or a buffered write. */
 	dio = f2fs_should_use_dio(inode, iocb, from);
 
+	/* dio is not compatible w/ atomic write */
+	if (dio && f2fs_is_atomic_file(inode)) {
+		ret = -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
 	/* Possibly preallocate the blocks for the write. */
 	target_size = iocb->ki_pos + iov_iter_count(from);
 	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
