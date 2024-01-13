Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED782CC86
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 12:35:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOcIS-000115-NB;
	Sat, 13 Jan 2024 11:35:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eadavis@qq.com>) id 1rOcIO-00010f-4L
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 11:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9hZq7TcGcl2DGxECsv0Ebzbyr1A9X1v0BNjSFl+A1aU=; b=UdRhZ29FGgSM699AURUlMcKxqm
 xrokQDYXHgJnvN/oMbkCFBr+FH/csG5v+wXIgA9nNDUSATCVyDBZdj1oXUrDwojHbYzK6T5CpNcrA
 dC09waDhs9KSBEMnhU77LS1QqqjyONMTt1g3sDuHDcbop50j93cHYvruI5OO/8duN1M8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
 Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9hZq7TcGcl2DGxECsv0Ebzbyr1A9X1v0BNjSFl+A1aU=; b=QcnfzzMptB3/aV7u+h0YBEOIS3
 meC8uOiVGllr1Ex+hXI4wZUF5ZzGf5gw5k7GEVvlQqjUPnDqe+RocDIGs+50rT2Kqiz54GrQwrf5C
 u+Xvt88nIOsOixyJQScIWRwPKQKFm0WIrrvDrW+ZwupS1Xb5fzwN7/+GgHHUsbZ0Uq3M=;
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOcIJ-00089b-6C for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 11:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1705145698; bh=9hZq7TcGcl2DGxECsv0Ebzbyr1A9X1v0BNjSFl+A1aU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DL45VZBd2peyLF1Wy47rjx2AonnXwFF1klgb3hVkKYSaWA7TUYCZov57pNJz6nQqB
 r3G91ZVmsQuUIgWwmAHFdZJ7yICNEQKpwr/+lauUPMN+HJ+ruTRy5YfaQUMPOkXSZR
 L7cug0cAyFE9g0yeC9v9ynQdaUHJwXTJE6kS+jTI=
Received: from pek-lxu-l1.wrs.com ([111.198.225.215])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id 7238E448; Sat, 13 Jan 2024 19:28:35 +0800
X-QQ-mid: xmsmtpt1705145315tbfs81lrf
Message-ID: <tencent_BEF36CE365896CC3B36456B765576766C105@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2w0/HgP7bscZFbrNQ6Z0syXFbsb9Ax6uOONSKscJtVTVn8sxCYS
 0VjKj33QxKGXISBSHshLRWBhU86KQ8KgM/LL6hMEn/zkEL6UlDZK09ijsxUOTQUZA3e/iQ/wJFo3
 d9Osf4cg7OsOIEQD1vfV0uBhorlv5s/XlpCfM4ivUgqFYUr4q2r8N9ubtb5URDldo6qtu9o+D3QU
 X5zcYN7ip2o/LPFE46ycXAWjE/y8+/nWH0ejHR+HWb9Kkmlc0R7GWMgOFEJ+PhLFmi8EtZHgg5Tu
 5f9sQ2rR36mym0GgBtc4AFxqoTuVFB573eTtCkgOHIqyw4AbhFuCYZRwd5yuZYkms4GU7AHlFwxe
 Fmi6foZN5ZWO5WYAU2dQKuSZ0A5INDHF249n4up705CZ/0+BkUKIaE0427MCLt3ReUUEnl+SN5Bl
 CLq+dkxElreY4WW2ArLKW00B7i43/sReYjVNZ1NJt9SSJuEadUAyeHFic8seENnt40uKwMzfnyRM
 9V54vt/GCN1gfO0SE0uXED4sNBoYVNRrFbjzlHaXN7tEmUtYApevUit5s7jelfZJ6Iy9MQMiSSzw
 F6hL6iKNtKdJBqEfAHO7JlMyVhlLCNuuwMxC7dFYqdD4RjY7jBTWKo2eEQrbnPgmZJxz8MOAzjgf
 Gcrf+h6r/R3LhRA+03nb8bn2qiGKg2rYI4WGsTB8jorEIw5o50gtNnNSfpO6MNc40cAfVffTKFJY
 13DmxDk+L6595jxI9o1dMz3slt+Esp3m6BigGNsvkENUTjJti7dYlCKCJIuXdaqrT1xxM6mTqH6J
 uV55l5cvWACvvFFsB2BHYb3fQ2k/JwKGfhLf0UB8Dfl2sjkwp0c1KDxyAfLcR6F28Pc+SqMB1Cr8
 E4OIzw9oh6qW9Nk6puiU1HjDZgK7xnyNahj60gZy51smUz9MqKocFHz55li9keR+J/R2wQRLcr
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
To: syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com
Date: Sat, 13 Jan 2024 19:28:31 +0800
X-OQ-MSGID: <20240113112830.1732178-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <000000000000aac725060ed0b15c@google.com>
References: <000000000000aac725060ed0b15c@google.com>
MIME-Version: 1.0
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When the call to f2fs_fill_super() fails, only the memory
 occupied by sbi is released, but s_fs_info is not set to NULL, this will cause
 the current issue to occur. Reported-and-tested-by:
 syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com
 Signed-off-by: Edward Adam Davis --- fs/f2fs/super.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.205.251.27 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [203.205.251.27 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [eadavis[at]qq.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 3.2 HELO_DYNAMIC_IPADDR    Relay HELO'd using suspicious hostname (IP
 addr 1)
X-Headers-End: 1rOcIJ-00089b-6C
Subject: [f2fs-dev] [PATCH] f2fs: fix uaf in destroy_device_list
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
From: Edward Adam Davis via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Edward Adam Davis <eadavis@qq.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When the call to f2fs_fill_super() fails, only the memory occupied by sbi is 
released, but s_fs_info is not set to NULL, this will cause the current issue
to occur. 

Reported-and-tested-by: syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d00d21a8b53a..9939e2445b1e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4879,6 +4879,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 free_sbi:
 	if (sbi->s_chksum_driver)
 		crypto_free_shash(sbi->s_chksum_driver);
+	sb->s_fs_info = NULL;
 	kfree(sbi);
 
 	/* give only one another chance */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
