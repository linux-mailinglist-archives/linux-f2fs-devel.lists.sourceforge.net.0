Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B21163B439D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jun 2021 14:50:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lwlIG-0005Yc-Ln; Fri, 25 Jun 2021 12:50:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <wangshilong1991@gmail.com>) id 1lwlIE-0005YU-MM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Jun 2021 12:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZUq608a0CdvBqwD7yCvfHQWOXGkaGQdKVIBwrXyYDCI=; b=LCyxeBmCi3h0gtEaRi9yR8omOc
 znUfTSqIJhj+25lSzAveKwPs/xtENpvHUHQp4PSRn3GJ417jS7S5dBb5on8PE+pgnHCxD2TvYpumS
 3kBdmkiHLoJNDBPb1SXbEvNrt+G5c5d9rVTO7NM/e6nVtCUjrAhr+KRvWEIOkZm1FwIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZUq608a0CdvBqwD7yCvfHQWOXGkaGQdKVIBwrXyYDCI=; b=N
 3HON8MJf4xpVX71EPrqKwFOjoUngQaBTkEKmmpExTMaOO3dDpPYzX8aizmFdOEpEN0cXDwnBcRlzw
 YVNfzDDsemB0vQ+LfNn/Klraqq6N4NkWdZO1FHaHhu9oYmdtUxlRMiCHmNZjZzrLAmBsB0Wb5WVtO
 GmvMyDWFjEC8vlHE=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lwlI9-00DwHC-VF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Jun 2021 12:50:48 +0000
Received: by mail-pf1-f173.google.com with SMTP id d12so266720pfj.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Jun 2021 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUq608a0CdvBqwD7yCvfHQWOXGkaGQdKVIBwrXyYDCI=;
 b=mmS8qNWYNafL9agaCqylHH9RjOARKlq3nflhDINhZ4ypk9BIbp9+OvmSNsvS2vLQpA
 nYS8rWEDKe9B/MzNvZnUvp5FJxLrAVrrCYiRiZ6Gkzow8ad3bj0ZGBMXesWQfvL739xa
 Ym1R6Rl73YI24n84sWVcnetggSaEsk5+q7xivstuYjHo8uOo5NrCpGp4Ur+xBJ6vcaNu
 c/UYN6C3KacoLe3cz4k5eXQfH04HOWCUbVIZb+7eZRvn36pSkj13DOmJS9wI5JSuEx7t
 39GBxj2X0cod/rGkzUeKhNrjHuheXGSEt4bbcwQ035gvQgP7EgAygrIsvgHrCKSwZ5+E
 EEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUq608a0CdvBqwD7yCvfHQWOXGkaGQdKVIBwrXyYDCI=;
 b=BolGiJJ/yZu+fdAJG0cNwRU+DNa+4Fzw7oufrYp4bcQInkoy6AKQPzuJcdCSjTsUZg
 wYLZ3AgIjXQcPnk+XklVeeKhTmKjleVMvJw0Re262rWHEm39gt2FlGG4z2fV7zlcLCrF
 fDuBxpHTFhCKG3LshtuLA9m+9VPcrnZ8Xps5RWCbZQf85q6VnJ5c/GeVqS/gp9MhcSTt
 /Kh2ij/T4OD3ZjqXv/OBBntMURWOmQwzeOtwMHU+MJJI6EY6I0mAexB6+HbjhO/e3C8D
 RzrlK0Tv0PR6E8QjzGbBfwjJ9DkhQVf3GDkGs+l6wQYBvkK3cRoc2tlNG3Bx15kf14ff
 ZFeA==
X-Gm-Message-State: AOAM53345ZDgMkGHVdpVEcVZbHEr+djiTLqSrMaVvF1etRvn9+xZK99X
 dveGriMyATLoyPliCUoeXIRPgNwHhDAw8g==
X-Google-Smtp-Source: ABdhPJwJtGYXi681HFZtuwFPrRW5VZtsWP+jjc6VTFWGtmHHwNPrNi2UZ4k5vtOQd4VLaPRHvEomTw==
X-Received: by 2002:a63:cc:: with SMTP id 195mr6561964pga.249.1624625435859;
 Fri, 25 Jun 2021 05:50:35 -0700 (PDT)
Received: from localhost.localdomain ([36.62.197.104])
 by smtp.gmail.com with ESMTPSA id t14sm5995853pgm.9.2021.06.25.05.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:50:35 -0700 (PDT)
From: Wang Shilong <wangshilong1991@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 25 Jun 2021 08:50:26 -0400
Message-Id: <20210625125026.5796-1-wangshilong1991@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (wangshilong1991[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.173 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ddn.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (wangshilong1991[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lwlI9-00DwHC-VF
Subject: [f2fs-dev] [PATCH] f2fs: forbid U32_MAX project ID
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
Cc: wangshilong1991@gmail.com, Wang Shilong <wshilong@ddn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wang Shilong <wshilong@ddn.com>

U32_MAX is reserved for special purpose,
qid_has_mapping() will return false if projid is
4294967295, dqget() will return NULL for it.

So U32_MAX is unsupported Project ID, fix to forbid it.

Signed-off-by: Wang Shilong <wshilong@ddn.com>
---
 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ceb575f99048..861edf3c01d5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3066,6 +3066,8 @@ int f2fs_fileattr_set(struct user_namespace *mnt_userns,
 	u32 iflags;
 	int err;
 
+	if (fa->fsx_projid >= U32_MAX)
+		return -EINVAL;
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		return -EIO;
 	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
