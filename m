Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA9801A2E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Dec 2023 04:04:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9GIo-0002zd-Eq;
	Sat, 02 Dec 2023 03:04:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3m55qZQYKALQXlimYhaiiafY.Wig@flex--drosen.bounces.google.com>)
 id 1r9GIh-0002zX-02 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Dec 2023 03:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/X+nKitsMY3rmCpR7SNJX2uebsoXggelnHWtO9TTwsU=; b=XxnvBpChfS8RCXc8zJkJ3bdS9l
 Pe4ztcgP323LtrJExc1O5giMhhdQcp0RWy0CvGOR2eyUeSCZPA83hYA8OIQizi/8AmUM6cku3HhLg
 2efKto+iH5ErkyjR/hS0LBRCKnZX0xaPY/c28BfEYfn/z+tY+GbVEFvFmCC7NvCGKdsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/X+nKitsMY3rmCpR7SNJX2uebsoXggelnHWtO9TTwsU=; b=X
 Wfb4J0y7JCBEkygxh/LLH0R5yrOMNHHoHkF7PteUULLca5ErgAUwYNSgjIXWvfdPdNeMhy86cuvh0
 97EOTnxuSWLepcqjnHoCm/vE2q44gsXMxGdwoZW/ceFkfJ0mcwScM5mr9TLywLT019+/9aEOocKeS
 QuUrs0i9WMLCMZ+M=;
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r9GIb-0004mc-T3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Dec 2023 03:04:14 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-5cef61289fdso48199557b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Dec 2023 19:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701486235; x=1702091035;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/X+nKitsMY3rmCpR7SNJX2uebsoXggelnHWtO9TTwsU=;
 b=xnUlcJoMO9XgQfSYfl7RY+LrC8u3AVAhZH4iv1Mpe16o4UGyzsPufKCgCPtsE/ANG0
 JKzR7Pmfe5a9giJdwnF+0h7rlS668sLw9b5iLXHWSVfHHSzU2r09Bk3UBvzNE1LJwvYh
 HcPFyUqTP/MDowJvCPocSiZCUs4p3le160IrBuQSdqI+N7OaZyxS3VgrgTI6SKXj3UIb
 EM8Y/bObSl9tZBq271q6QhFHjuDKP6OB8W5TsRRM6CRB9alI/4Hnlx8oBYpaLUDFYMFm
 kwWt9RJjjM3XyCmNRDtchnfKsSA4hsNDPHQYh3NyJC8F2aFf8g0Dkfgva6oKmKlC9Dg4
 TSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701486235; x=1702091035;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/X+nKitsMY3rmCpR7SNJX2uebsoXggelnHWtO9TTwsU=;
 b=QGpm7JQotXO2hhkN43OcJLWzDXsbYR8yMXlh/etT/pGZnz2BLxQzBYEGZMKfns5kP4
 dqRF40NfWc8j6YOvwOfMXajUQQvrQSGv0HvX0UtlhwPfytUcs1oo9OewIP4BfOx+67M+
 KctlOYaD9q21SbDxtyKsPhvesiRARQO30YqhEuhx3jD0Vy9g0dufpJhTSEkx33SIpO1C
 VrL2kAvxMkUPMZecN6IzzoBw+F62Pun3v5k/xqeqOEN+npSESJPJhq8vXgufw1gf2/O8
 +3bfbuNlJK9Hy9Bh0G6RR2BxpPyrlgd3bbjuzgTN/D+wi7Q68cpCu2vQx8N/rtOQaG97
 MTtQ==
X-Gm-Message-State: AOJu0YxtcaVrqjFztBgol0oabIHJnSd83piLw25RNNkQN95+JR0F0+HO
 fGI2hs20AtyYf8HCehRq9ior3iGAUAse4rJT5WLZR4JmMM/MWYj8IADcDVpq8tKBnfyUJJDnJSs
 c1fSClSkjLrU0NRIDyLNUhCrCn3pcaulI4Q9JcDlCx7s9hCGihVO2ZlJagiXV1Rerp6IsHg5cOV
 2Y9aKjlPY=
X-Google-Smtp-Source: AGHT+IH42DMKj1tZvdadBCiyzi+jWhB4e+Q9vl9z0MYQIBZPNOzJRZZlM8zL00FjfO3gt0OacECQ7XP0uGs=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:e3a2:452f:f377:df27])
 (user=drosen job=sendgmr) by 2002:a05:690c:fd3:b0:5cc:41c1:606 with SMTP id
 dg19-20020a05690c0fd300b005cc41c10606mr1127954ywb.6.1701486235257; Fri, 01
 Dec 2023 19:03:55 -0800 (PST)
Date: Fri,  1 Dec 2023 19:03:47 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231202030347.2330936-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Blocks are tracked by u32, so the max permitted filesize is
 U32_MAX * BLOCK_SIZE. Additionally, in order to support crypto block sizes
 of 4K with a 16K block size, we must further restrict max filesiz [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.202 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r9GIb-0004mc-T3
Subject: [f2fs-dev] [PATCH] f2fs: Restrict max filesize for 16K f2fs
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
U32_MAX * BLOCK_SIZE. Additionally, in order to support crypto block
sizes of 4K with a 16K block size, we must further restrict max filesize
to U32_MAX * 4096. This does not affect 4K blocksize f2fs as the natural
limits for those are well below that limit.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/super.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 033af907c3b1..7258a8bd6433 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3364,6 +3364,15 @@ loff_t max_file_blocks(struct inode *inode)
 	leaf_count *= NIDS_PER_BLOCK;
 	result += leaf_count;
 
+	/* For compatibility with 4K crypto unit size, we must restrict
+	 * the max filesize to what can fit within U32_MAX 4K units.
+	 * Since the blocksize must currently be equal to the page size,
+	 * we can grab that from there. inode is NULL when setting up
+	 * the superblock.
+	 */
+
+	result = min(result, ((loff_t) U32_MAX * 4096) >> PAGE_SHIFT);
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
