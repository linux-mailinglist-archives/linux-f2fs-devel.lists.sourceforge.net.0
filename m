Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F050BF4F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 20:05:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhxeh-0004A0-2t; Fri, 22 Apr 2022 18:05:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dossche.niels@gmail.com>) id 1nhxee-00049u-To
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 18:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tuuFCM3G6kDB6VwEiueHbQf2NcAQf0ybGmyAt+ZFK+c=; b=QCs89pRa4UKhdO63AJwB5pFB2U
 Qf0stp5d0GxHAS3lPLibbgOZaDsbGwTDXFPsqATT52OntyAqC3836/ejPpnqLTUKwhXMf4AhGZ+pd
 57MwsK8mxkdg7QpN3ca81wCkBcrJ7KH+r9A1uPRMZw5w/16+HUQQVFFwIDe8Zayhz+qY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tuuFCM3G6kDB6VwEiueHbQf2NcAQf0ybGmyAt+ZFK+c=; b=X
 0N2dIUuxIv7JIs1BRhIw/KQa9eScUg6cuaP3XGlFfP9Tv/pyM7F3Hflo0Ynq6qK8ZfNlBJcQnH100
 eJX2NDfKQ8eR82xF6yUmr27TYobZRBwCE5ZG3nBqAjzKFy4+HNf1X8U75Gl4TZvpL8Bgzs9aFDntD
 SV/YyY4s/lsd84DY=;
Received: from mail-ej1-f46.google.com ([209.85.218.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhxef-00081e-3J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Apr 2022 18:05:17 +0000
Received: by mail-ej1-f46.google.com with SMTP id lc2so17815004ejb.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Apr 2022 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tuuFCM3G6kDB6VwEiueHbQf2NcAQf0ybGmyAt+ZFK+c=;
 b=CTpDBVe+abwX/fV23DjNwXLmp+aLMgvCJ5bZxWzu1ERo/Za0vrhpJdUC4G0nLZ0WJN
 R+sWNzGs2VRJLHhpXp4Tux1hjgVH0zaRRWhPfBja9HVngc8/IWEl1gHmCSJusPKX2CD5
 LPhhGHsnXxxvIGu1IwWOXasY8afYfiDf8tmsyfornYOT/y/u3gjOxq2vQA0Pik423TRw
 Q/YcxCjR8eu3EnBiV+bXeX0ucdNj2mJ0INw/gFUF/9XgndhMsXXgS4jXqqCf0jWt17KD
 Vv/geMjdXkb6oVIvfv0uYYcQbAF4QP8YDs5oUwnjEfAqSCVmBF6ZiCHQpxv8/V3KM3gX
 yo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tuuFCM3G6kDB6VwEiueHbQf2NcAQf0ybGmyAt+ZFK+c=;
 b=BdVqd9BXO+er2jGA7aTTEdtjJSQ5YmdUMkrlws+6SGXPt40LZ3HlRMLjDp2IvlS2JV
 KxYy9VLagLQUqKSpL/tP0qPPPa+foxE5po6ZDRbPVXH2OzYgb6B8fzEzrwt5cTPyEXj4
 9dhubft5t+nz+p+9PJrk2JaXuzKLesj6zvp+wnauaPymfBnyHrPxtUffMxCtxKpsZ1Fq
 u7FR5iFvMWxTqb4QG+IXO6RjMh1wM8dGuiu0S/E3r7ZAJU87w40wu2ZSBJVbwTjpdoKd
 Kwz5uZemWltsvykOTrmcATVblr6a7qA36jt8iAg3Fkk/TRkBZEa/BjdzZpToPza5bNNo
 CQTA==
X-Gm-Message-State: AOAM533l4d4i/aOAIm3oAYssLW0Yed6ZG9oTwucV99ECoYxBYvwB3fOB
 jPrj6zYiM2+z9VSOkSi6av2fB5HzH0E=
X-Google-Smtp-Source: ABdhPJyuc7tlwhZZ5UQJCLRqKuVpgSdB2ictRlrTSS3s44sGnQl6hsVO0vEanoQeX8qiq/j/onXCmQ==
X-Received: by 2002:a17:906:52ca:b0:6ef:907e:53c8 with SMTP id
 w10-20020a17090652ca00b006ef907e53c8mr5177893ejn.761.1650650710303; 
 Fri, 22 Apr 2022 11:05:10 -0700 (PDT)
Received: from nlaptop.localdomain (178-117-137-225.access.telenet.be.
 [178.117.137.225]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0564021e8700b0041d03a94f27sm1094438edf.66.2022.04.22.11.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:05:09 -0700 (PDT)
From: Niels Dossche <dossche.niels@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Apr 2022 20:05:04 +0200
Message-Id: <20220422180503.14463-1-dossche.niels@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There are multiple calculations and reads of fields of sbi
 that should be protected by stat_lock. As stat_lock is not used to read these
 values in statfs, this can lead to inconsistent results. Extend [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [dossche.niels[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nhxef-00081e-3J
Subject: [f2fs-dev] [PATCH v2] f2fs: extend stat_lock to avoid potential
 race in statfs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Niels Dossche <dossche.niels@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are multiple calculations and reads of fields of sbi that should
be protected by stat_lock. As stat_lock is not used to read these
values in statfs, this can lead to inconsistent results.
Extend the locking to prevent this issue.
Commit c9c8ed50d94c ("f2fs: fix to avoid potential race on
sbi->unusable_block_count access/update")
already added the use of sbi->stat_lock in statfs in
order to make the calculation of multiple, different fields atomic so
that results are consistent. This is similar to that patch regarding the
change in statfs.

Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---

Changes in v2:
 - protect more fields with locking
 - update commit description

Note:
I am currently working on a static analyser to detect missing locks
using type-based static analysis as my master's thesis
in order to obtain my master's degree.
If you would like to have more details, please let me know.
This was a reported case. I manually verified the report by looking
at the code, so that I do not send wrong information or patches.
After concluding that this seems to be a true positive, I created
this patch. This was compile-tested and runtime-tested on x86_64.
This issue was found on Linux v5.17.4.

 fs/f2fs/super.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ea939db18f88..a432c80e5e2e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1731,18 +1731,23 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	u64 id = huge_encode_dev(sb->s_bdev->bd_dev);
 	block_t total_count, user_block_count, start_count;
 	u64 avail_node_count;
+	unsigned int total_valid_node_count;
 
 	total_count = le64_to_cpu(sbi->raw_super->block_count);
-	user_block_count = sbi->user_block_count;
 	start_count = le32_to_cpu(sbi->raw_super->segment0_blkaddr);
 	buf->f_type = F2FS_SUPER_MAGIC;
 	buf->f_bsize = sbi->blocksize;
 
 	buf->f_blocks = total_count - start_count;
+
+	spin_lock(&sbi->stat_lock);
+
+	user_block_count = sbi->user_block_count;
+	total_valid_node_count = valid_node_count(sbi);
+	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
 	buf->f_bfree = user_block_count - valid_user_blocks(sbi) -
 						sbi->current_reserved_blocks;
 
-	spin_lock(&sbi->stat_lock);
 	if (unlikely(buf->f_bfree <= sbi->unusable_block_count))
 		buf->f_bfree = 0;
 	else
@@ -1755,14 +1760,12 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	else
 		buf->f_bavail = 0;
 
-	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
-
 	if (avail_node_count > user_block_count) {
 		buf->f_files = user_block_count;
 		buf->f_ffree = buf->f_bavail;
 	} else {
 		buf->f_files = avail_node_count;
-		buf->f_ffree = min(avail_node_count - valid_node_count(sbi),
+		buf->f_ffree = min(avail_node_count - total_valid_node_count,
 					buf->f_bavail);
 	}
 
-- 
2.35.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
