Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A22950AA7B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Apr 2022 23:11:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhe51-00037G-Uu; Thu, 21 Apr 2022 21:11:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dossche.niels@gmail.com>) id 1nhe50-00037A-U6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 21:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xmn7fgz/DX5pe6KzGVJFNT++9fKto0JI4/Q+RCB9FWk=; b=ewaBnqcVxeiBCWNAzTvR3xp1yS
 lB20JRf8TrNYCy39SBrfn9NNgcem/eDkSKTw+r/DbBu5XezmxM7qT+WFCeW+5e1IFPKzoFZK5YOm2
 HOXoCrkGh/gI7rzwhXDHTO/6sZci4YygsUrEfO0ZHmXI/dm/OoUDYGhTe9dbGcS47QnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xmn7fgz/DX5pe6KzGVJFNT++9fKto0JI4/Q+RCB9FWk=; b=S
 znMeyVmQnQSnPN2U179lyfP/hggRdluLUCRVoXC/cpEXh7gIDA4SXStqMN82YIHR+wN6U4jAcWzSt
 WcnjESjVMx7KcYfjdu7g8XVKJHSmRzD4LtXugxLwFHMrKrrKplTjhP54oMvlBDjDXNNjzJCRr3J9d
 Uqc6Oi0+KOgtdahI=;
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhe4w-0000Fj-DP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 21:11:09 +0000
Received: by mail-ed1-f52.google.com with SMTP id e30so4561191eda.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmn7fgz/DX5pe6KzGVJFNT++9fKto0JI4/Q+RCB9FWk=;
 b=jZghCctg0SY2qAMgjDHC4cmIJrZKgP+G0AYJ0C3o3PaaymuF+o+7oVmkCFk2oa00yf
 RI+M9KkpQ1F5pcVLoQ8cGKvJQXNmdtbQGMuhD79HFPVgOy8/QoqInjCY5v5o0xAX6VIx
 GoGFMQ0AMST17tWEu4zpeKgU/F+gOre7UNNGR+rDYE/ADaDjzoUlIvl4u4fuD6C25RQU
 jhrd7BNdRrfUD8ZvIvncB7IeRAJJDeGjoS/Cj3HjKUKSX+FH+aNQrtvklUs+KyYalEzo
 fHx5e2LhDZf8M7U//WrXN/z78iHWgEz6Ed3cnQuB1v8i8a091Qs3MxTkSL+Azu4X6hXo
 XS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmn7fgz/DX5pe6KzGVJFNT++9fKto0JI4/Q+RCB9FWk=;
 b=QvCluSQL8mCZrnD29B0aK8JQ3wK41WQk94oSWqFyTMrQl7SV4Oaybi/wGwDYlNdO/r
 asPShT9WFkAE4M2LqJ7r6wQYbVgB38BzMYWj20ovpjRllmQk5WpQfFANMyzWMOuUSu8/
 766gU4XLtUZ1IDS9f2fg2HhEZKcKgNLGd7jTh36ZHZBWEa2ifTTMfsd/RzKmdBc+pZ3W
 nxB/ZJKO8QODtP9dhDw0H79rou6qEFMtJqQlecD4zz2TqGpdKaj1TAeUaXhY8xiIFdwZ
 jD/Flu9o9j3nLxzdgo6p0Gn/Ybap48NScMnYe2SyNSGXTM6oBfsHQ29wjUZiY3Jj0vAL
 C2zQ==
X-Gm-Message-State: AOAM530cBDEnqJNT0xk4K7Gleu2EEpTyTA8NYyz5xKEizl/hbNoZMo6u
 chhqaA2iouc6H0L6IaVhDlcfEKxfF2U=
X-Google-Smtp-Source: ABdhPJyzJBZiYD+Q6Z6oobQ4Kvy+MquQ2F8uyRrr7qGZI2IylcZtCQcIl92Xi1YDg9I2fKY70y0c4g==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr1571192edv.94.1650575460065; 
 Thu, 21 Apr 2022 14:11:00 -0700 (PDT)
Received: from nlaptop.localdomain
 (ptr-dtfv0poj8u7zblqwbt6.18120a2.ip6.access.telenet.be.
 [2a02:1811:cc83:eef0:f2b6:6987:9238:41ca])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm53791edt.80.2022.04.21.14.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:10:59 -0700 (PDT)
From: Niels Dossche <dossche.niels@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 21 Apr 2022 23:09:49 +0200
Message-Id: <20220421210948.73198-1-dossche.niels@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The calculation for f_bfree performs a calculation involving
 current_reserved_blocks and total_valid_user_blocks. Both can be modified
 under stat_lock. As stat_lock is not used to read both these valu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [dossche.niels[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1nhe4w-0000Fj-DP
Subject: [f2fs-dev] [PATCH] f2fs: extend stat_lock to avoid potential race
 in statfs
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

The calculation for f_bfree performs a calculation involving
current_reserved_blocks and total_valid_user_blocks. Both can be
modified under stat_lock. As stat_lock is not used to read both these
values in statfs, this can lead to inconsistent results. Extend the
locking to prevent this issue.
Commit c9c8ed50d94c ("f2fs: fix to avoid potential race on sbi->unusable_block_count access/update")
already added the use of sbi->stat_lock in statfs in
order to make the calculation of multiple, different fields atomic so
that results are consistent. This is similar to that patch regarding the
change in statfs.

Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---

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

 fs/f2fs/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ea939db18f88..ece768869187 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1739,10 +1739,12 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	buf->f_bsize = sbi->blocksize;
 
 	buf->f_blocks = total_count - start_count;
+
+	spin_lock(&sbi->stat_lock);
+
 	buf->f_bfree = user_block_count - valid_user_blocks(sbi) -
 						sbi->current_reserved_blocks;
 
-	spin_lock(&sbi->stat_lock);
 	if (unlikely(buf->f_bfree <= sbi->unusable_block_count))
 		buf->f_bfree = 0;
 	else
-- 
2.35.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
