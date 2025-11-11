Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC2C4D9F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 13:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kK2QEnEByGu/GxXZssdpvQV3hy3yyDwhwGt450FlkTk=; b=IjYTHdh2MrQFz8xgOiADFMfnDL
	jVS8EvV4tn56ixg9/j81OFFrq4BnOt4PUZ7BI9q3oLtVJq6pB0bUJeL+d3wiGiQ6COJtYSK0tMctT
	zSGVaYz88g0dhNRLnzpeeFuGYDUHfSFkHwlD0PHANQO7nwN1vjW1xHb2uJqoA7703i4k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vInJz-0004nA-0t;
	Tue, 11 Nov 2025 12:18:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liubaolin12138@163.com>) id 1vInJv-0004ml-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 12:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfANCpYyQtu2FJq3xTseeaI1UO6gnRjQwEJ6h27gj5c=; b=KAX7Vd7I8RE25Ha6pO16Mko0xQ
 LtQpbWTvTypRhfBieoOIvs5FORfPUF4JjQ4+Z1maB4bIUlhRK6jKRViaWq5iQ2HsmZP46QPmZs4S7
 xdg/d5XRi+7JXDnaZ9kg2VtDudLimsjM1S2+/ZXw4G0XJ/CWLSh/UsTrz4WKT11ouw40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gfANCpYyQtu2FJq3xTseeaI1UO6gnRjQwEJ6h27gj5c=; b=m
 GReww364t0YY3sWmUef6SXfdrTCrZKZE3BFjiZEN6jl9LrmUj1vKE66tctzmPEKykpJ28djGqK72u
 V+38XbUPIs7GSEe566U7YIh83x8ZN8IGsV81ts+juhXKWoT9W0AYlnNjPxGntrgNuqzKjNo2T3xRD
 2BFNmyiBwW91mn/w=;
Received: from m16.mail.163.com ([220.197.31.2])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vInJv-0004bk-4O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 12:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=gf
 ANCpYyQtu2FJq3xTseeaI1UO6gnRjQwEJ6h27gj5c=; b=Y+W9Co0N1od1BE3IoA
 b0g2sOOT20rNm3KOj3xlnP9vsv7uiu+3Gt5SQqYjl3OaStwUy2/n4cWC61wLKdkk
 BkjdefiKRM/BKQ9mSgtZpMomAn6/dDqzfdHckrzjKR1aHkLM0QbGcM5/z+hpvnps
 wDPCrm80jlGlLZCixSkrSc0e8=
Received: from liubaolin-VMware-Virtual-Platform.localdomain (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgD3P4RcKRNpN6BPDg--.37327S2;
 Tue, 11 Nov 2025 20:17:33 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 11 Nov 2025 20:17:28 +0800
Message-Id: <20251111121728.29433-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgD3P4RcKRNpN6BPDg--.37327S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF45KFWUJF1kXF4Uuw4UArb_yoW8Gr1Upr
 98JF4kKr4UCr18WFWktF45CrZ5ta4UZ3sFy39akan3G3ZxtrsYgF93tFyUXF15J348u3ZF
 qF4vkF15ZF17Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UpUDAUUUUU=
X-Originating-IP: [183.242.174.23]
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwR2AS2kTKV0JIAAA3w
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Baolin Liu In f2fs_recover_fsync_data(),
 use LIST_HEAD()
 to declare and initialize the list_head in one step instead of using
 INIT_LIST_HEAD() separately. No functional change. 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [183.242.174.23 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [liubaolin12138(at)163.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [liubaolin12138(at)163.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [220.197.31.2 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vInJv-0004bk-4O
Subject: [f2fs-dev] [PATCH v1] f2fs: simplify list initialization in
 f2fs_recover_fsync_data()
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
Cc: Baolin Liu <liubaolin@kylinos.cn>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Baolin Liu <liubaolin@kylinos.cn>

In f2fs_recover_fsync_data(),use LIST_HEAD() to declare and
initialize the list_head in one step instead of using
INIT_LIST_HEAD() separately.

No functional change.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/f2fs/recovery.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 215e442db72c..3d85d15a4f8b 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -869,8 +869,9 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 
 int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 {
-	struct list_head inode_list, tmp_inode_list;
-	struct list_head dir_list;
+	LIST_HEAD(inode_list);
+	LIST_HEAD(tmp_inode_list);
+	LIST_HEAD(dir_list);
 	int err;
 	int ret = 0;
 	unsigned long s_flags = sbi->sb->s_flags;
@@ -882,10 +883,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
 		f2fs_info(sbi, "recover fsync data on readonly fs");
 
-	INIT_LIST_HEAD(&inode_list);
-	INIT_LIST_HEAD(&tmp_inode_list);
-	INIT_LIST_HEAD(&dir_list);
-
 	/* prevent checkpoint */
 	f2fs_down_write(&sbi->cp_global_sem);
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
