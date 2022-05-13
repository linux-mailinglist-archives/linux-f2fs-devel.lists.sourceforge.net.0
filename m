Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB610526D6F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 01:21:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npeas-0008Dl-Bc; Fri, 13 May 2022 23:21:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npeaq-0008DV-Le
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mzjFt3Uep6ZHt+0RJxUADGXLsQOpJNCPf4KdRrjArVE=; b=Q4mXVrZoYda9LIFpMa4lsg0T3I
 BCMMzGNU8xXStmeRZKtAnq8Hdh8wc9zQyFFXbc9S3Vq2nD7mEc6jWWcwQ5OkGcw0JDn7K/dwJs5T1
 j+zDhpdX4MHTIT1bKG2skoXZsQfbNW42Weq3nG7HARrujVN8uWtn3IXejdN//hBVsryg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mzjFt3Uep6ZHt+0RJxUADGXLsQOpJNCPf4KdRrjArVE=; b=LJ7K1oFn6wUd1hMVG8WT3wwql+
 2wVPhwG2AxGqO9mH+CrDbtB7BIP7o6yhZHDQFYK9tlrJKY+7+wdaFnRXFa4iXpRJK3zPAN65vkg79
 5kkIsIsgaS7SJ3z5r9ohtmHmWTzsQg/OiARRR9xgNb84aEP6najPzRugGQFJPCwggmTc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npeao-0005Jg-3I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC596618C1;
 Fri, 13 May 2022 23:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102ABC34113;
 Fri, 13 May 2022 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484055;
 bh=b92LkAqhO5PUVsDiRTBhHHeNaJDTEdm3bJ8lN4kNIfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FXmYdsz0VOS5bnNgZiePUFvY4PBeM7didV6ZMHJAFIjZZs4OxD+YKw2GWUImfihKT
 I8p8PLNSwblLJPzYS1xBLQqBf3UyVdPRXQs5c6Q3ZcvtDXZ1T0ZYBdfkaCNlPlX/nx
 huOW+ydQXjo9tTd/MnOeIjMJeZqu+6rIbUWJyArYj9QWq/CTnSgQYXYC6w45Y6WtpG
 XzXGz36/vK8xYXOKx28jqW5Oy/gvZW1zVTH9FOXNZuyC3HmOK640v0tJapmDRcKgdU
 p6ktSn+1jBvoJ4nOagefuu1EsctNc3giLo6APE847uxu1aYEDfdlJljZI3kyaHHC5i
 +E/A/Nb3JLh7w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 16:16:01 -0700
Message-Id: <20220513231605.175121-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513231605.175121-1-ebiggers@kernel.org>
References: <20220513231605.175121-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> If processing the
 on-disk mount options fails after any memory was allocated in the
 ext4_fs_context, 
 e.g. s_qf_names, then this memory is leaked. Fix this by calling ext4_fc_free()
 instead of kfree() [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npeao-0005Jg-3I
Subject: [f2fs-dev] [PATCH v3 1/5] ext4: fix memory leak in
 parse_apply_sb_mount_options()
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
Cc: Lukas Czerner <lczerner@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

If processing the on-disk mount options fails after any memory was
allocated in the ext4_fs_context, e.g. s_qf_names, then this memory is
leaked.  Fix this by calling ext4_fc_free() instead of kfree() directly.

Reproducer:

    mkfs.ext4 -F /dev/vdc
    tune2fs /dev/vdc -E mount_opts=usrjquota=file
    echo clear > /sys/kernel/debug/kmemleak
    mount /dev/vdc /vdc
    echo scan > /sys/kernel/debug/kmemleak
    sleep 5
    echo scan > /sys/kernel/debug/kmemleak
    cat /sys/kernel/debug/kmemleak

Fixes: 7edfd85b1ffd ("ext4: Completely separate options parsing and sb setup")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/super.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 1466fbdbc8e34..60fa2f2623e07 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -2625,8 +2625,10 @@ static int parse_apply_sb_mount_options(struct super_block *sb,
 	ret = ext4_apply_options(fc, sb);
 
 out_free:
-	kfree(s_ctx);
-	kfree(fc);
+	if (fc) {
+		ext4_fc_free(fc);
+		kfree(fc);
+	}
 	kfree(s_mount_opts);
 	return ret;
 }
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
