Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657D4B660E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Feb 2022 09:28:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nJtCF-0006ni-M4; Tue, 15 Feb 2022 08:28:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1nJtCE-0006nc-AH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Feb 2022 08:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UHv1n0i7998YMl6pCrmGBhHuQg0Ik9GCJVUwsgk6NyI=; b=Q8Ltvsd68SOGNEn+h1yiYULd/l
 Q3rJt5Ee7W8gFVvZoS5ETbKEtv3b4zc+QcuRXy46LBjjxe7TORj5iyXANZyjpxFJsLzzlRVADFltx
 oOb1c7gNs2pKKsN0JR4/9sgMENzYe7FUeei9EKAS4j4C+9VJnxGcsaz/4h93VLXlV37M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UHv1n0i7998YMl6pCrmGBhHuQg0Ik9GCJVUwsgk6NyI=; b=j
 S2ia2wxTlgpKEhz4RWUtpucbsQKRfJVDHHrcdV2Bo6iwCi6qVrevuNCsR+Mm4Lejq0rasyePDlTGC
 LqmMoA2thVB6cPkgC/rgKYLP/DHo3hl5ybWDxl6hP01Ju6KrbuFrYAwZW8Xzn1E0ciPSE1JRng4GW
 dDMG4bcoRIeWuKf8=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nJtC6-0003Jo-W9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Feb 2022 08:28:24 +0000
Received: by mail-pf1-f179.google.com with SMTP id y5so33686920pfe.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Feb 2022 00:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHv1n0i7998YMl6pCrmGBhHuQg0Ik9GCJVUwsgk6NyI=;
 b=SzEHHpKLORB6RP1qqruYIcx6VMi8e0779AWKhYGz7pzLCfMfFAgISkF7EDQ9RikxeH
 D0bnE96X4izeLFBWiwodswLJIfmyxETqQWaXoHUH/OxX73UUPoIElNvGkJtzd4XMiLk3
 o7mvECJ7LjQuWeSeTj7c1UbSC8BB0mQiPd1k67UKAxYwCchUexiZWOktRJ1SsqwqPpnH
 bxd5q8uXdOipb02YG28Dkywbcd6x5grIappWpHIXZiHBtZ8Zts1LmTA+dxkW1D3vJTnG
 ehKHgGZlA5neRXp8c7iARaOBLm7UOPhK1Fzzn+I9lproCs7sM7I7l6IDvXSEThlge1j3
 5nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHv1n0i7998YMl6pCrmGBhHuQg0Ik9GCJVUwsgk6NyI=;
 b=18pAlmegKLC/L75fQjYL9S06CPShQlBM+OQxIhwx3MnkNvKt1IyC/cAuSbkowwuzFH
 lZ79oW0ryQW3Laa+RYTEPxjdg4mEPPL19N/8ya1wf5tA+wIzqOaKF8m4qXYvTaKqDAkx
 a6F2xdHf8TUCzj6O+hhUz+FDpG5pBNL6UuZCv2ErSdYS6yArHXR+Y6oZp0j8AxMtvBKq
 DJXmlFO4AciQMC4h7yen/drgfYz3HicMGz1Ugs0/AE8gkZMJTwDg6dFRL22xjqOo9G+q
 gkRC1ROyiPw7I4s7DDymzVbgbfMaKq+CVJ/LzXF7Nya0qkJfPuO/k9sUh+AsD1IR4og1
 OaYg==
X-Gm-Message-State: AOAM532hyVtK2rn68DJjmERQr5qLv3QEbuERUzDKmdmbTI2aVkvQuRT8
 ipTqG1QSg4iDhtGODGgkdJtMiW9EIrY=
X-Google-Smtp-Source: ABdhPJyciS7qFarR3EclpnfMW1amIke6GYxl0mxpjsNqdTuwmQdSUMQQyI50Q1fks29FiDWHqkpULA==
X-Received: by 2002:a63:8942:: with SMTP id v63mr2638880pgd.106.1644913692934; 
 Tue, 15 Feb 2022 00:28:12 -0800 (PST)
Received: from localhost.localdomain ([222.104.200.120])
 by smtp.gmail.com with ESMTPSA id nm15sm16494859pjb.17.2022.02.15.00.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 00:28:12 -0800 (PST)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 15 Feb 2022 17:27:21 +0900
Message-Id: <20220215082721.844244-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: cnt should be passed to sb_has_quota_active() instead of type
 to check active quota properly. Moreover, when the type is -1, the compiler
 with enough inline knowledge can discard sb_has_quota_active() check
 altogether, 
 causing a NULL pointer dereference at the following inode_lock(dqopt->files
 [...] Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nJtC6-0003Jo-W9
Subject: [f2fs-dev] [PATCH] f2fs: quota: fix loop condition at
 f2fs_quota_sync()
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cnt should be passed to sb_has_quota_active() instead of type to check
active quota properly.

Moreover, when the type is -1, the compiler with enough inline knowledge
can discard sb_has_quota_active() check altogether, causing a NULL pointer
dereference at the following inode_lock(dqopt->files[cnt]):

[    2.796010] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a0
[    2.796024] Mem abort info:
[    2.796025]   ESR = 0x96000005
[    2.796028]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.796029]   SET = 0, FnV = 0
[    2.796031]   EA = 0, S1PTW = 0
[    2.796032] Data abort info:
[    2.796034]   ISV = 0, ISS = 0x00000005
[    2.796035]   CM = 0, WnR = 0
[    2.796046] user pgtable: 4k pages, 39-bit VAs, pgdp=00000003370d1000
[    2.796048] [00000000000000a0] pgd=0000000000000000, pud=0000000000000000
[    2.796051] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[    2.796056] CPU: 7 PID: 640 Comm: f2fs_ckpt-259:7 Tainted: G S                5.4.179-arter97-r8-64666-g2f16e087f9d8 #1
[    2.796057] Hardware name: Qualcomm Technologies, Inc. Lahaina MTP lemonadep (DT)
[    2.796059] pstate: 80c00005 (Nzcv daif +PAN +UAO)
[    2.796065] pc : down_write+0x28/0x70
[    2.796070] lr : f2fs_quota_sync+0x100/0x294
[    2.796071] sp : ffffffa3f48ffc30
[    2.796073] x29: ffffffa3f48ffc30 x28: 0000000000000000
[    2.796075] x27: ffffffa3f6d718b8 x26: ffffffa415fe9d80
[    2.796077] x25: ffffffa3f7290048 x24: 0000000000000001
[    2.796078] x23: 0000000000000000 x22: ffffffa3f7290000
[    2.796080] x21: ffffffa3f72904a0 x20: ffffffa3f7290110
[    2.796081] x19: ffffffa3f77a9800 x18: ffffffc020aae038
[    2.796083] x17: ffffffa40e38e040 x16: ffffffa40e38e6d0
[    2.796085] x15: ffffffa40e38e6cc x14: ffffffa40e38e6d0
[    2.796086] x13: 00000000000004f6 x12: 00162c44ff493000
[    2.796088] x11: 0000000000000400 x10: ffffffa40e38c948
[    2.796090] x9 : 0000000000000000 x8 : 00000000000000a0
[    2.796091] x7 : 0000000000000000 x6 : 0000d1060f00002a
[    2.796093] x5 : ffffffa3f48ff718 x4 : 000000000000000d
[    2.796094] x3 : 00000000060c0000 x2 : 0000000000000001
[    2.796096] x1 : 0000000000000000 x0 : 00000000000000a0
[    2.796098] Call trace:
[    2.796100]  down_write+0x28/0x70
[    2.796102]  f2fs_quota_sync+0x100/0x294
[    2.796104]  block_operations+0x120/0x204
[    2.796106]  f2fs_write_checkpoint+0x11c/0x520
[    2.796107]  __checkpoint_and_complete_reqs+0x7c/0xd34
[    2.796109]  issue_checkpoint_thread+0x6c/0xb8
[    2.796112]  kthread+0x138/0x414
[    2.796114]  ret_from_fork+0x10/0x18
[    2.796117] Code: aa0803e0 aa1f03e1 52800022 aa0103e9 (c8e97d02)
[    2.796120] ---[ end trace 96e942e8eb6a0b53 ]---
[    2.800116] Kernel panic - not syncing: Fatal exception
[    2.800120] SMP: stopping secondary CPUs

Fixes: 9de71ede81e6 ("f2fs: quota: fix potential deadlock")
Cc: <stable@vger.kernel.org> # v5.15+
Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 22fb4d3b1170..8e3840973077 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2689,7 +2689,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct quota_info *dqopt = sb_dqopt(sb);
 	int cnt;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Now when everything is written we can discard the pagecache so
@@ -2700,8 +2700,8 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 		if (type != -1 && cnt != type)
 			continue;
 
-		if (!sb_has_quota_active(sb, type))
-			return 0;
+		if (!sb_has_quota_active(sb, cnt))
+			continue;
 
 		inode_lock(dqopt->files[cnt]);
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
