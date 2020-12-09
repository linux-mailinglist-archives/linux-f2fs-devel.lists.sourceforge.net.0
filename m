Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4552D48AA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 19:13:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kn3yJ-0007fQ-OO; Wed, 09 Dec 2020 18:13:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <anant.thazhemadam@gmail.com>) id 1kn3yH-0007fI-IA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 18:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BPpiVwJwbCA/SJkH1A30g3V3EvTXlK0B5wY4Rt0mSqQ=; b=DG5y3IPXH6amOMAkwq8M9h/NAi
 qS6Q0ZWYS788nOOkobeE2XmdiMptwXKjuJ+DxDV+BqY4bDYnih9nj178aZzBLIp/Z0hTgtNM2MVnJ
 2358QnL6CMkkP1RYic8mW3DKYy1nzo6o52l84hTGaBdIVJw/f0sCEoY+BuQFLepgS39Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BPpiVwJwbCA/SJkH1A30g3V3EvTXlK0B5wY4Rt0mSqQ=; b=m
 nrHNxi1itZap94hVkUUr9g4xt/GgzhdmXgWf9fDbKQpOrWG9iJGGFvgpn/y50uvI/g5o23kOblqSu
 3F7JKkViWQY0QubXgjUEx6u10DcUcBuOZyHwNbBlwevfV6DcYpfELxscE6JuQfkVdDhPzVYSvOhrU
 dPU6pQ4e+07nkAaw=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kn3y5-005Kk2-Mr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 18:13:49 +0000
Received: by mail-pj1-f68.google.com with SMTP id j13so1420587pjz.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 09 Dec 2020 10:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPpiVwJwbCA/SJkH1A30g3V3EvTXlK0B5wY4Rt0mSqQ=;
 b=Zev595F216Rc3TBUQGuC7gFiQSKi3xmHZh9VbmYr2J0aZ/2J4H0gNmA8rAoP2iJxzw
 XQ01BR8WSQPUviY2uVghZHY9gDSWP4KGi2xuAkF+QfYdzx8EPAUSIXFZYG+p/KsREBql
 KuSlbePTtq1SyObqovFY8f6hdx2QKVK4ZLD0YMotel1p/8OBlAg4nm7rzar9GAKcATnU
 4PjK6uNuC8rYwtxW6ICdinsGM39GvkgviGaovxs5BShJsXa3SFqh4Z4MCZXPYBAI4mK9
 Qj1DxRlkSnGKf7v179o+nfd9tOmE5D7lf8LitLofCqkruylF/PsLMJr/TEdiwOHvRzsA
 UYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPpiVwJwbCA/SJkH1A30g3V3EvTXlK0B5wY4Rt0mSqQ=;
 b=TalTz0FFgeQ461c7Zjsz5Ctpfrxzv9WHhxsTD9ab9esd2ms/mTktSTlPWALVKjDT2y
 PDzzkaDvSuG/7sUOaIP0L+Txl4Go+Sox6ulRBtN7h6dqkaDqlVA2re1j3wSpCgbX4KBu
 Xt2Ahyf6wgFf+F+gP07SUiwmmo2VkRMxaYzbubP9r/RE8yyTHZ1f3apm6n+i7gCCdoxC
 jluecD5ebj/mClyCLDi8F/Zkmugg34guh7wq1e/PnpMdBs4nI19K+Vw8Mth0E4HT9Fef
 slcT4B9RnHrxmCDh4SIA+i8CEaajV6UkYS7LOaERwn5g0RfV8k43kKuzPgZlPCkzaRUL
 2t+A==
X-Gm-Message-State: AOAM533uhe6sQNO4vCYsKT/aIRJcs8ZVmakBcSS2oUxP7wn0PjxRwoEu
 1k9dwwjsH32X/dFXuiuIRxo=
X-Google-Smtp-Source: ABdhPJz+LnsD+M/2QOtOCDI6Djqe7Vn94N8UA5khAEi/S9ljjHipC9M2D+eY2yr4Pj2X1gTSa4KG3g==
X-Received: by 2002:a17:902:63:b029:db:c0d6:96ec with SMTP id
 90-20020a1709020063b02900dbc0d696ecmr3262997pla.13.1607537610507; 
 Wed, 09 Dec 2020 10:13:30 -0800 (PST)
Received: from localhost.localdomain ([49.207.201.111])
 by smtp.gmail.com with ESMTPSA id p21sm3078636pfn.15.2020.12.09.10.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:13:29 -0800 (PST)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed,  9 Dec 2020 23:43:22 +0530
Message-Id: <20201209181322.27932-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (anant.thazhemadam[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: appspotmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kn3y5-005Kk2-Mr
Subject: [f2fs-dev] [PATCH] fs: f2fs: fix potential shift-out-of-bounds
 error in sanity_check_raw_super()
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
Cc: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In sanity_check_raw_super(), if
1 << le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE, then the
block size is deemed to be invalid.

syzbot triggered a shift-out-of-bounds bug by assigning a value of 59 to
le32_to_cpu(raw_super->log_blocksize).
Although the value assigned itself isn't of much significance, this goes
to show that even if the block size is invalid,
le32_to_cpu(raw_super->log_blocksize) can be potentially evaluated to a
value for which the shift exponent becomes too large for the unsigned
int.

Since 1 << le32_to_cpu(raw_super->log_blocksize) must be = 4096 for a
valid block size, le32_to_cpu(raw_super->log_blocksize) must equal 12.
Replacing the existing check with the more direct sanity check
resolves this bug.

Reported-by: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com
Tested-by: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 fs/f2fs/super.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 33808c397580..4bc7372af43f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2775,7 +2775,6 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	block_t total_sections, blocks_per_seg;
 	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
 					(bh->b_data + F2FS_SUPER_OFFSET);
-	unsigned int blocksize;
 	size_t crc_offset = 0;
 	__u32 crc = 0;
 
@@ -2802,10 +2801,8 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	/* Currently, support only 4KB block size */
-	blocksize = 1 << le32_to_cpu(raw_super->log_blocksize);
-	if (blocksize != F2FS_BLKSIZE) {
-		f2fs_info(sbi, "Invalid blocksize (%u), supports only 4KB",
-			  blocksize);
+	if (le32_to_cpu(raw_super->log_blocksize) != 12) {
+		f2fs_info(sbi, "Invalid blocksize. Only 4KB supported");
 		return -EFSCORRUPTED;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
