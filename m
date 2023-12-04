Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6BF8042C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 00:46:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAIe1-0002Ft-86;
	Mon, 04 Dec 2023 23:46:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3zGRuZQYKAIEiwtxjslttlqj.htr@flex--drosen.bounces.google.com>)
 id 1rAIe0-0002Fn-HE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 23:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mUymHRPuxHIIlrnrqmrnoyhDvTW+Hjf6wrxLrnIWncc=; b=HcxMfvtg3VOGUzMnMAGxy3GYDh
 SG1CH2BjcyK9f+26FUeiTvw5y7CXTpZh8jPh1YMK0itMmjMnOSCO+uzJ7m97RRmRljPHDMT9Gv92r
 B8/B18MidQ4vaGhpI2MA/ZakrugUS8qUbeVc7al0jNwjv+ZAbWFY79W2g/3+VsuuesT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mUymHRPuxHIIlrnrqmrnoyhDvTW+Hjf6wrxLrnIWncc=; b=K
 IaCGgZtPh2TiuRK/3erAqtQ1lbO3o1zz+7X50xzJtgnznttlAi7mQUuCtedWcDkUovI98Rzjbe2dV
 /dd7+ad7wus8iJNzeKAFmBYzIi4pbcEJ97WT+aM1/L81GOUjVrYo3N/oXbEXoIMyl5QeGOw6mfqnN
 knKPROkwCG9SkU/8=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAIdy-0003gs-Sl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 23:46:31 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-db542ec49d9so3495975276.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Dec 2023 15:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701733580; x=1702338380;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mUymHRPuxHIIlrnrqmrnoyhDvTW+Hjf6wrxLrnIWncc=;
 b=C/J1j3MIb4ieCDEeoTp3hRpqoPG3J/mk1Tgwvq/GpMPa9cjFfXXf5URLGTamuIiD3x
 GdOa0HtDI3C0jGQ/RnbJdqSgeQviD7ta/JDHCcoeFNkb6yh1VGIfsFpUPOGQzzjGcJGP
 2ktqL+/05ZWseaPLVrWSWK5qLlq9tXEjIQHDBPOLQwZgEErEi1yBw3Oy2cQsAylAxFYx
 RSQc/LsLn/ohknFRJFFUwqZGTWPITi/h6D7+K/6wy+xCCIOCnGk3DM3SxVYplRepVlpW
 bN5jx8u8817pb3rKhWh/Y1p+iwQpTD3TYf37OQcMNI7lzjLwCOb0hgziA/kRU8rVt3Wb
 WZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701733580; x=1702338380;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mUymHRPuxHIIlrnrqmrnoyhDvTW+Hjf6wrxLrnIWncc=;
 b=UYTD4t+VZJbmPnZfkcvcZ2ldFrgqh4rohY+iDYfPnSk7zFs+NN27dNPn6CPTJnkdHL
 RdR6X4SkyOuAGkiQUWCY3uK5QlUrbFyFlHznKoZuTFlg8WSJoMYuWeFNZegQHI8nYKte
 6w5ei9z5dAxeUSqxSRrLlZ1WSJLX2bt2/mT55SVBAlxzegAAELJt6Tv8K1X9j/Bv84/u
 hDz1drkJH18ITrT3MbsTVh7uemwsPMElawlQ4kPZF7HQOcBeIS81w1nD+tjvulvrWoLQ
 tEcYsIL7802/oAMYgavkDrZrzv9myINQ1eSidHtXuY83fuNskhk/iSDsIgnDP6dodcSi
 s01A==
X-Gm-Message-State: AOJu0YzLK4i6P8H+gS/IiqlZH9oCxq9k8el0OHsqVbSIUmUaRFRzb3uV
 kK6QBTPqKDqoQRYhnnVT5PrBf5q8jLO9V2DDGiFV1sjXETqvelmf0YtgDEP7ACXa15lfvEfgzJZ
 OUe+Wevexv3FlPcp9Sn66X8ZTm/v//Rn6Jc7f0AwdiWVgKw4kk+QLf4UvC+tBfh5YVre5H4q6U8
 mbO3JkDa4=
X-Google-Smtp-Source: AGHT+IHq0SjWmG+nLZUtdxneA/JrpUr7QGWRDcSdZO7VpafKGKWVxgfIRv46tf+blV+TIKsoHoyYIge4lyY=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:5074:e7bb:c7b:6a8a])
 (user=drosen job=sendgmr) by 2002:a25:ca16:0:b0:db5:382f:3999 with SMTP id
 a22-20020a25ca16000000b00db5382f3999mr474717ybg.1.1701733580100; Mon, 04 Dec
 2023 15:46:20 -0800 (PST)
Date: Mon,  4 Dec 2023 15:46:15 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231204234615.3592624-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Blocks are tracked by u32, so the max permitted filesize is
 U32_MAX * BLOCK_SIZE. Additionally, in order to support crypto data unit
 sizes of 4K with a 16K block size with IV_INO_LBLK_{32,63}, we must [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rAIdy-0003gs-Sl
Subject: [f2fs-dev] [PATCH v2] f2fs: Restrict max filesize for 16K f2fs
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Blocks are tracked by u32, so the max permitted filesize is
U32_MAX * BLOCK_SIZE. Additionally, in order to support crypto data unit
sizes of 4K with a 16K block size with IV_INO_LBLK_{32,63}, we must
further restrict max filesize to U32_MAX * 4096. This does not affect 4K
blocksize f2fs as the natural limit for files are well below that.

Fixes: d7e9a9037de2 ("f2fs: Support Block Size == Page Size")
Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/super.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1..18a2189a0dc4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3364,6 +3364,18 @@ loff_t max_file_blocks(struct inode *inode)
 	leaf_count *= NIDS_PER_BLOCK;
 	result += leaf_count;
 
+	/*
+	 * For compatibility with FSCRYPT_POLICY_IV_INO_LBLK_{64,32} with a
+	 * 4K crypto data unit, we must restrict the max filesize to what can
+	 * fit within U32_MAX data units.
+	 *
+	 * Since the blocksize must currently be equal to the page size,
+	 * we can use a constant for that. Note if this is not the case
+	 * in the future that inode is NULL while setting up the superblock.
+	 */
+
+	result = min(result, ((loff_t) U32_MAX * 4096) >> F2FS_BLKSIZE_BITS);
+
 	return result;
 }
 

base-commit: d346fa09abff46988de9267b67b6900d9913d5a2
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
