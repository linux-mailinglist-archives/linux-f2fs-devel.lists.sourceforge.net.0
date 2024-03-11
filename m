Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8A878BB3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 00:59:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjpYO-0006An-Ps;
	Mon, 11 Mar 2024 23:59:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rjpYM-0006Ag-SS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 23:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bqpi+pK0eQZfpPuAwyq71F3S97nx5NBT8dYXZNYP/vo=; b=RmRGNaAsOL04ZePMLOuEb55+/O
 5lswU9/IbBrEyTcisn2LIrcTahAkH0AR9P+TXWLpg2PQfJLb7Eb1Abboc/FIh5CPTHnt4MPs0LlYp
 u9EuYlPZvazV77Nn7g5q1GAZUIAtkbuR63sXAUz4z9L6lG6a4MjYGOn0EKoLs0AgYjdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bqpi+pK0eQZfpPuAwyq71F3S97nx5NBT8dYXZNYP/vo=; b=H
 Wko7BYz7qHRrDhoKY4ujWAPJnokXfNQz1Ge9kM5XcHYsmJMHDGF+/b4zr8SGZzOoPwIB/fDFOjrwn
 Jw1B2ReRBGZNAosb52gNqHLdv2w4LRe/ciDlb80eXeSPuQVbmVZCQsoSLl5T8dhMOn2boN32WQ9Cv
 uw0ohWDHNRcV0BL8=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rjpYC-0006aN-TQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 23:59:35 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1dd10a37d68so42108935ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 16:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710201565; x=1710806365; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bqpi+pK0eQZfpPuAwyq71F3S97nx5NBT8dYXZNYP/vo=;
 b=bdTCoKdW8OX+Ra/b8cWb83Hf0Lh7CMSDE9OP9JArlti1bTDCB86k3mu3lucOPS0Mku
 ovxqsL4cuT6UsYjQf2ocTbJ9dxefcofmORe1xQSS7aNZqy/pqNKBD1z70fp745qiQbzr
 rndvvWUCj9rlesTA7vOAaObXqydkREJt/2JKHKhSD069KopNCWdPsbzUYe3JsFBTcjQg
 HJOmXfw+aO2Lj9roiozdyJNXOoWWnaD7cBXAd8KwRcyEpMyKa3Y5kB4qpLD+OPuN+0A7
 f5gn5LvuXwgwiIhRYOwx1L39fo175EKwv5MfoxdDZG4kaDko43L7eET7XLzb1T5xM/lc
 UDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710201565; x=1710806365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bqpi+pK0eQZfpPuAwyq71F3S97nx5NBT8dYXZNYP/vo=;
 b=ivnnsCrPgqeNS09fT18LjTMvdDsM7Lw3t7oYKtKTRdn4mvMHMigk/iJ/obqT6/DsuH
 qOPiBc6ytPdM1HBwLrj4NsvPQW/gzQ1YUqOFr+JbDgKIMb8iUX0MGdLQLVJ2BRY5Dz9n
 sjxhzEAPkBidMBQetILdO8fktmXS5y+bAAyYCYt0JfyUTfHu298IYJhsV60SQcVowfZ0
 6E8mT1wswZDyoMDIffuDVFr3rIAkevyB+Rb0+K+sZLMud5NX2waP3uzYgcr/UggLtN7t
 VEeDnwyVxfgMKBysL8w6XiartNXg4BynM9nG5FCU5l4PaZGMZypDg4ZtS3r46OkINuiP
 wjtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBCpjUUDXSaw2lj6uBZO0MhYd5ES0N8xavz89cdoIvMqD/8MV0Ps3NBlaYlLjYK7W/FmEoiHN7GwQwwVJA8WIHlkfA0+a9a0ILFKL627Ss+bvz4VxlDQ==
X-Gm-Message-State: AOJu0YzrfTB4HoFdVchN1z1HNKMI3rlcPt60JPkWbAtGdwdtty+6uzN/
 iU0dBsi1c+Jvhd+Fvw8vStSAM3C2TJmAvY6GmZRq0BQdIyF9i4bV
X-Google-Smtp-Source: AGHT+IHn75XVEeeY8/1CG7cnADq6V0jic+dEdxIKLujyLw/Dffes5RFhnhz2xzg1f3QKb1JYtA3MzQ==
X-Received: by 2002:a17:902:e801:b0:1dd:5872:386a with SMTP id
 u1-20020a170902e80100b001dd5872386amr8937023plg.59.1710201565055; 
 Mon, 11 Mar 2024 16:59:25 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:d706:f56a:f0d2:75d])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902d2c500b001dc8f8730f3sm3473272plc.285.2024.03.11.16.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 16:59:24 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 11 Mar 2024 16:59:19 -0700
Message-ID: <20240311235921.1832684-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Since atomic write way was changed to
 out-place-update, 
 we should prevent it on pinned files. Signed-off-by: Daeho Jeong ---
 fs/f2fs/file.c
 | 3 ++- 1 file changed, 2 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rjpYC-0006aN-TQ
Subject: [f2fs-dev] [PATCH 1/2] f2fs: prevent atomic write on pinned file
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

Since atomic write way was changed to out-place-update, we should
prevent it on pinned files.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1c044fb19c87..82277e95c88f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2085,7 +2085,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 
 	inode_lock(inode);
 
-	if (!f2fs_disable_compressed_file(inode)) {
+	if (!f2fs_disable_compressed_file(inode) ||
+			f2fs_is_pinned_file(inode)) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.44.0.278.ge034bb2e1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
