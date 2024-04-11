Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DEA8A1E8D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 20:38:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruzJL-0008Qv-Dh;
	Thu, 11 Apr 2024 18:38:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ruzJJ-0008Qn-H8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 18:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XKRQnKissdHCzmGNa2PV/255DMDi6uK/FNddjpC3dpw=; b=mkwJNoDaBV7bgU0LmRi8tNKM0X
 WzV8CzdeyXUI7KsYWJGFOT65QOfaymIZ6DPvdOwlLluN6j2bTengMhD2RS3QKuilWXHEKBwc90DQL
 rVc059q93Pn8u3kg1GjGwJBTwbfDKaXxHdR8qX/gss8L7LBwfqUflADJVT0p2NM7Ve6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XKRQnKissdHCzmGNa2PV/255DMDi6uK/FNddjpC3dpw=; b=U
 /7tJs2rb3ew7h3K3zv2hQDKnyzQdunZfizKMdQ+bMamRDTa9UhB06O6wHP+PdySRH6KkLpNmPVISO
 iw1a1/q71+NTlDdfjhk/46OoAIwMfbsChCNy2xNjQTPvzcJN1x63A/Gpg3zpVuZGC1jhyEaiU/Y9g
 Xde528qNW7jYVVuE=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruzJI-0000hq-VH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 18:38:09 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e2178b2cf2so1537285ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Apr 2024 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712860678; x=1713465478; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XKRQnKissdHCzmGNa2PV/255DMDi6uK/FNddjpC3dpw=;
 b=BGpHPfaI5R07HHBNiZWcYn7aLGnuoDYmw+d5Yio4M3ZdCLrhprpCcsIjQgnWus/9LQ
 y7tiZ3NyXBsnTeccauCuN/jT6GKrdXIYIKeIwxDeMoNwDv3JYuG9Hd2IPxemn5MSKDUz
 B9u2zBVOs+6GHMbAyi+mKN1qKHRBinCR9EEqvAtGt6g6g9/v+9IyyiI60ko0152MT/Cq
 ZylfbB2SV2wforY7OTCZdh4SjtTynuQqPDW+G/ZgSC+kTYAOxO0bjJAaFaa8xXT+gzXe
 zoL5q4PMUV/q/1OfG2MA4aIPzBEEcPvV58TKaW6N0pXnLprbuWSWiq8WVcF65KBUnEfu
 YPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712860678; x=1713465478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XKRQnKissdHCzmGNa2PV/255DMDi6uK/FNddjpC3dpw=;
 b=UGJt+zpgap64+fMxtWKfPjk5mIh3zoyWAhcanKmnAx00RQXDr2/cJASHAzNP7l3nfU
 vuaJ2iDZIuFBdnbMfNp4Ph193PIoCVZqjabFqsPobUaly4nV7Fx7omlaQrnZ86EUBzUL
 zl2ZBON6UoX/6P0dSnwOUjhl5K+U9+9OSMNoz8H23pMZkLlM2SXKooBZY40PXxmMYeY4
 JA7boBIkSL3DR/ZfiOL0rmuoHZtCQF9lKHwj1Faxem4OZlmaAH7a1PxpQA94FWg179mh
 GY+PHbEOS44jDB8wX4m4UqJ0CJk6JHoWdTdBH5McTTnVVkojfOIez86GblvQPMi8YS0K
 EsSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX13LX3DTXwQW5N/klew98YrlgGH6HF1JqzaT8yR4v/EX6BwSr5WkcK3qG78GTvRLHtEj4FKh0OYuKD+Wz9oxH+QE5GNXjuVo8PM6XcqJTBPf0/6d5AEw==
X-Gm-Message-State: AOJu0YzeNSPvZQrmv3VtpBH3rt4Abx2UCu9yn+rE1i2bHjtBLkAz2QA2
 uzyU9u9Hy8CwgUAb/Oe3Z7ybOotjce3Ey52ToVleAXw1ATezs6cF
X-Google-Smtp-Source: AGHT+IHJi3RIP7UZY7UtB+xmE16TsC8pukDMA+4xkNNmB+DzJ+cIUjpElTTwSZwvMrAJDWzMVnCEWw==
X-Received: by 2002:a17:902:780a:b0:1e2:a42a:af5d with SMTP id
 p10-20020a170902780a00b001e2a42aaf5dmr317714pll.30.1712860678506; 
 Thu, 11 Apr 2024 11:37:58 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:e309:9090:b8ac:35b1])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170902a38600b001e425d86ad9sm1519906pla.151.2024.04.11.11.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 11:37:58 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 11 Apr 2024 11:37:53 -0700
Message-ID: <20240411183753.2417792-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
MIME-Version: 1.0
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Since the allocation happens in
 conventional
 LU for zoned storage, we can allow direct io for that. Signed-off-by: Daeho
 Jeong --- fs/f2fs/file.c | 3 ++- 1 file changed, 2 insertions(+), 1 deletion(-)
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.214.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ruzJI-0000hq-VH
Subject: [f2fs-dev] [PATCH 2/2] f2fs: allow direct io of pinned files for
 zoned storage
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Since the allocation happens in conventional LU for zoned storage, we
can allow direct io for that.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3ee61bc82c6f..c8e086077a48 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -833,7 +833,8 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 	 * for blkzoned device, fallback direct IO to buffered IO, so
 	 * all IOs can be serialized by log-structured write.
 	 */
-	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE))
+	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE) &&
+	    !f2fs_is_pinned_file(inode))
 		return true;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		return true;
-- 
2.44.0.683.g7961c838ac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
