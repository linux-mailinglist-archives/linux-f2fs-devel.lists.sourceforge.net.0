Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A1B2DCD4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJ9HnzNr1gp5NGT4LfcB2RqzvMrE0C/92CB2P3xEhpU=; b=moExNxcXU7tOrdnrGLqfDPUwHB
	zYIgwePf8MhmNsdsihYaJyxI5THfC6YWDudmaj86iObf98pKDCYlFLBtcAhRDXDGvmMq33xeWhtJx
	NOteVYEkijRZFOWxE9fU/z6bNu2RqrtYyV8kda6OL4kXwxWyLad9Yscgg1u8P4yg6sUc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9w-0008Rb-OH;
	Wed, 20 Aug 2025 12:43:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9w-0008RT-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EAb8oZnCF32xuOImVSoD7G6BFLhOj6lwjbQtH1giaF4=; b=DMUU5ErErDEV7VmS2zsHQDbypj
 WYjn2BVlHUIamdlUcybHim+0nD5GjRTGEjROG73yLKWxwueLqz6qbJM1MtL1d8Kuk1WsNM2Zx1ABB
 PZM0NmFixd/KkMQnlnqTtOxsWAgnuk/ibAS0HmVNEQHry9jIzYxXAuoTtHk+aJRx+WK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EAb8oZnCF32xuOImVSoD7G6BFLhOj6lwjbQtH1giaF4=; b=CzyHWGtSc3qe143rk6pxnG97U5
 +vQCLsSnBQk8WT0GzQZxOdn76kwQgb654vv2Gr/vlwpNpS7T7ZnSA+8ovIJ8mFhFKDhU9zDIeNeAd
 3kZhdtd8U5bm/un9Fo/S9RR07yPS5i+f9YPfhp3GfzRIR6hg/dNeQrqHycZIy+NuRCJg=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9v-0003mL-NB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:20 +0000
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b47174beb13so4624699a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693789; x=1756298589; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAb8oZnCF32xuOImVSoD7G6BFLhOj6lwjbQtH1giaF4=;
 b=Cp3sjZnQaSq3/mgif0yd1wc0Le0WgW/+c3ja2t29zUdmP50GodQgvt8LIk4CTtUruW
 yRqNt3o6PPFKVSMh6laZNV1hyY4w1O4hfJkvigqZ1aYchXmoJKM/tEl1AUeoaRG3al4d
 JgPjKOF6YZDQZwGMT1DG+iSpjCTUVSSA/6FYH0yBENRofrC7SIMAa6SzRW27qEskecB9
 mDjdaqmACEees7lFLYlu+TNckO6KIW468T/672o0MD9riIy3YeB1uTGfSV+wsPm2plHl
 sUl43j7eEjvP3mnehITuhWQEQypOwYvgU4NzdQABredJUKjVdDogn5RxYStvockLnhH1
 5/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693789; x=1756298589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAb8oZnCF32xuOImVSoD7G6BFLhOj6lwjbQtH1giaF4=;
 b=gcaRGyJ/XskzORL7k+auZBUPRV0sokN8h6JcLrlE3HFVWjAV6SR7jFQDgR8Hrqwt6y
 5rmTzDjQ7zb3rcxLrgCeI1vyH2sD7R5oli/y/fHyvR20Dm5L9P6Z5+LA+aZnav076N9D
 ju44u5pXKVHDtTfEqhSbzI/42t2LKlnPTSVMOlnyqq2uEo9jw0/gxpSiLQRJ6O6F1ZIS
 GexT0ItKQTAJfPXGmctJKp+9g3sz6qRiB1LLndY+4jTbJVlFcCg0xhYPfoNFSpg9E79H
 FJQmHJv73PkcWmbPDgMHDQOHHG95Mk2/cYf8Jvgsk/LYVghUt2uHbXrixjAMmB7KeeNt
 P9DA==
X-Gm-Message-State: AOJu0YxNIh9LbmUoNsN2+GEMfIFlI78fV2cFwnS5gWaYvc0mbrAb6KDo
 H4Vz9bZG+1ZPVxjCFX2LAbNIFduLdjJ7h46cOBlQbNcXL9jQ/OLuhGax
X-Gm-Gg: ASbGnctV0a23QeCzPsiwLOWrRkunFmwm1V1IhbnvQALiRwtFsaUeC4u5oAD/z6Svbgq
 rrv6JVhpTRMkQ9DQObACAV482zAsmBqQxT8Yz8khQhoDcTbpqHBZnXrBCDqdXjP0lKlUltPq+Iq
 u8pLe1Nzff4mzgpEcj6RrZJ5aAQNq5Fqa/S3jclJSiikPsN5aH0qAyGIUT53aCBrXXmNKkmHnPK
 f6UuHAaozbzde7DJ0ujM9+FO4tR0dyGP9d0/Ei2o/JVQfI0fYCVByWLyIW4obkfhhk+ki7LwlrF
 OK2NSaVon461dKC6ETsz44DH4tAIFlawJPxSQjFuKZpBZmXPa/hsDJj5x4Pd8qEKkd7ML42OBel
 HYowM/rNzDaPGetuKDyFoMTrHRY0F
X-Google-Smtp-Source: AGHT+IEIR4PRUfVXfXhlQLCgiviZRGHnPWLI9ELAjPPhY1DSQAw5IW7/yKqCqkxpv64mMvWZ17f0dA==
X-Received: by 2002:a17:903:124f:b0:242:9aaa:1351 with SMTP id
 d9443c01a7336-245ef141014mr29815245ad.13.1755693788959; 
 Wed, 20 Aug 2025 05:43:08 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:08 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:31 +0800
Message-ID: <20250820124238.3785621-7-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Add lookup_sit_in_journal() which is similar
 to lookup_nat_in_journal() to get the raw sit entry from journal if exist.
 Signed-off-by: Sheng Yong --- fsck/f2fs.h | 2 ++ fsck/mount.c | 18
 ++++++++++++++++++ 2 files changed, 20 insertions(+) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
X-Headers-End: 1uoi9v-0003mL-NB
Subject: [f2fs-dev] [PATCH v3 06/13] f2fs-tools: add and export
 lookup_sit_in_journal
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Add lookup_sit_in_journal() which is similar to lookup_nat_in_journal()
to get the raw sit entry from journal if exist.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/f2fs.h  |  2 ++
 fsck/mount.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index a4888a817284..60e3a2ebb0ee 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -613,6 +613,8 @@ static inline int inline_xattr_size(struct f2fs_inode *inode)
 }
 
 extern int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid, struct f2fs_nat_entry *ne);
+extern int lookup_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
+				 struct f2fs_sit_entry *raw_sit);
 #define IS_SUM_NODE_SEG(sum)		(F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type == SUM_TYPE_NODE)
 #define IS_SUM_DATA_SEG(sum)		(F2FS_SUMMARY_BLOCK_FOOTER(sum)->entry_type == SUM_TYPE_DATA)
 
diff --git a/fsck/mount.c b/fsck/mount.c
index c671811941ad..f9f780d4aff6 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3297,6 +3297,24 @@ int lookup_nat_in_journal(struct f2fs_sb_info *sbi, u32 nid,
 	return -1;
 }
 
+int lookup_sit_in_journal(struct f2fs_sb_info *sbi, unsigned int segno,
+					struct f2fs_sit_entry *raw_sit)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_COLD_DATA);
+	struct f2fs_journal *journal = F2FS_SUMMARY_BLOCK_JOURNAL(curseg->sum_blk);
+	int i;
+
+	for (i = 0; i < sits_in_cursum(journal); i++) {
+		if (segno_in_journal(journal, i) == segno) {
+			memcpy(raw_sit, &sit_in_journal(journal, i),
+						sizeof(struct f2fs_sit_entry));
+			DBG(3, "==> Found sit [0x%x] in sit cache\n", segno);
+			return i;
+		}
+	}
+	return -1;
+}
+
 void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
