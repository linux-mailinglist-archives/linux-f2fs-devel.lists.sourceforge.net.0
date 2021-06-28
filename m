Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9733B5E26
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jun 2021 14:38:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxqWw-0005du-W7; Mon, 28 Jun 2021 12:38:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangshilong1991@gmail.com>) id 1lxqWv-0005dl-L6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 12:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WT6v9uHvNGHnkrWHqw+IXv7PjvRxi0xOsDaWugRiQFY=; b=Z1NiZURf5NGZrg+lWUAhKe/XTy
 pYG58XpG45CuNX4cOS3Jq/F77Ky1xTAUbIo9dKN/c4BoIZXLKht1p/0OGGJiHvwNyFkqoU+NnmUeO
 v1lQYG5cWwjh7txrqDT14JTrUb79a5LMm+b/+hScdVnsxZ3J/0vX+wOZVQNvbcqnSQwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WT6v9uHvNGHnkrWHqw+IXv7PjvRxi0xOsDaWugRiQFY=; b=Q
 SXywS2OoXf9D3NvNzBSBUPacMOcQAPdA8TNnpKude3InNUlfFAWJ5icQBGBeVYgfQ+wn0gCafC/GF
 zK+fSRozP1fF5PEIsWrXPGZbcPuvPpbv46k1LZm6tp/fXO8mWROxfj1QKQtboxJm6Lmoi5kvxSyYi
 UvOYQrN37fqMe3DM=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lxqWm-001r1p-AO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 12:38:30 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so1529523pjb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Jun 2021 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WT6v9uHvNGHnkrWHqw+IXv7PjvRxi0xOsDaWugRiQFY=;
 b=QBNZk2FzsKVZFkEr2ZWCddj45xygaewHlKrtuogtrs9agXtqPkt9I87Pg8ePtRsK86
 4KEp6j8xcsOlWbj+fRie+VbcwEsfUlSm8Vsgl2GVEpbNYZ3XrfE8Q6a0TGPq5Yp6wmqt
 sp8FLOKmtRdqhCAdsdoRPhOzrf8mdLp3v+AG//g5HC9SKt6/KQQtnw9OCXOna1cHHdfm
 wahn2cLq5XCPwGdTgPwa5L/lzgSbnJq7Fs2dZUKPgxuN6DhvqHaWDS6t2UMfwFVkxEDy
 o31Lfac7whjlPs3ig1RDDBaBtd2O36KPpwfRPRrFIuS+enwfsX8ut6XBEwlQi1x3ZgMI
 XYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WT6v9uHvNGHnkrWHqw+IXv7PjvRxi0xOsDaWugRiQFY=;
 b=sxnXiFNj+kY/WFJlZGMwaZBpXHMcxkOMumkKV7JFFLEena0Q/0th42EoEUx2fGSshc
 1yUlK+menssK28G53pL3PQSsjFR/vzfzr+wMwxtv5IJfBVQvgzLRlfBdYFQ4UFviAa/X
 q1CPikSlavqfGbmWBSfF61szVbL1sNGhQ2YibHvFkuev3k0PA5MrWP9sGrFUB07K+fQp
 iDPYfMOeCwdPCyA9Hu8BZdWmRb4LyMxFHNQ516LFUno9Aif3PxyMVdYYp1bcI3Wb/k2x
 rDKQvWGAl1z2a3uC9nSiAGwvvHJ6SA7ufMkWAXdvbzs6++KsCBeo95ejaF+TFwTneFyg
 k32Q==
X-Gm-Message-State: AOAM530wMoheNwGq8qwn8V0UfP5rNBqhRCfpXIOU3hAkmeGngf/Pfei6
 sakBG19VAukXofVWBznHEyQ=
X-Google-Smtp-Source: ABdhPJzdkVuvbX+deaYXYvXccVsMs9GcFLfmgAKhU2DOdgfJq1F9YYoem/FHmnOSftHIvwN94oL18A==
X-Received: by 2002:a17:90a:fd11:: with SMTP id
 cv17mr5786896pjb.8.1624883890837; 
 Mon, 28 Jun 2021 05:38:10 -0700 (PDT)
Received: from localhost.localdomain ([36.62.198.29])
 by smtp.gmail.com with ESMTPSA id gl17sm2822835pjb.13.2021.06.28.05.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 05:38:10 -0700 (PDT)
From: Wang Shilong <wangshilong1991@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 28 Jun 2021 08:38:01 -0400
Message-Id: <20210628123801.3511-1-wangshilong1991@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (wangshilong1991[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (wangshilong1991[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lxqWm-001r1p-AO
Subject: [f2fs-dev] [PATCH v2] fs: forbid invalid project ID
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 wangshilong1991@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fileattr_set_prepare() should check if project ID
is valid, otherwise dqget() will return NULL for
such project ID quota.

Signed-off-by: Wang Shilong <wshilong@ddn.com>
---
v1->v2: try to fix in the VFS
---
 fs/ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ioctl.c b/fs/ioctl.c
index 1e2204fa9963..5db5b218637b 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -845,6 +845,9 @@ static int fileattr_set_prepare(struct inode *inode,
 	if (fa->fsx_cowextsize == 0)
 		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
 
+	if (!projid_valid(KPROJIDT_INIT(fa->fsx_projid)))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
