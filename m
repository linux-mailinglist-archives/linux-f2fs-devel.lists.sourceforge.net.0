Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C5B15DCC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 12:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Uq9qvS/279qUFaMoAb66sQ3V/it6miRFZuIpwsWdDg=; b=NUN5TDphNcNiuyzUKpKV4BBEKJ
	IfKCmjTa4QH9TMss4AbGT5MklgiYKc27PBqpf5tj8sEo7g1tN1qnI/X0zug0txJwKrF4tq1G/XtUQ
	YnNDucGkqU/2CQdu86iM4V1zCEl7Yp6MmxkfjMIdRVtJqNHdK++NrFzIJkXvqzyUC/5s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uh3hw-0000Yn-Lz;
	Wed, 30 Jul 2025 10:06:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <masonzhang.linuxer@gmail.com>) id 1uh3hr-0000YE-At
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 10:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a3NHXtKl1WYxzEukpqzzAix9WcGat22WB22yDRcRvYU=; b=fUICcSIhrlf+m4dgY/JrucZJBP
 B4RgHO+lq2mHJEF5LYlw/E8Jf5jUWuwq5eOSVubdgMGi0Y7axw5qHyjDHQUvHuwwWf0ZfVwqJA4h1
 b+MteJGEVMAfN1JZ8QnM1n9Up70xSVJLfCsczvJoMvrPIGxq+XR4iMpOWsLaxmrI0Jdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a3NHXtKl1WYxzEukpqzzAix9WcGat22WB22yDRcRvYU=; b=T
 cCKc2h6Ue6ceGx+luV/cYPGbBodChvot87QDDOFIY+w7QIXJpdUUYIzedV+vnZ6Xj5q5havB7yNHS
 G5vB3vxHX8cKNvXpE+KyAu2glXDJ6olceRFeAIm+zom1FYXup1Ip02Mfpc7cLQb2IIQpCWZAY6GxK
 YcGjlZ06xoQSyS50=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uh3hr-0005iB-Nt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 10:06:44 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-24063eac495so20112465ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753869998; x=1754474798; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a3NHXtKl1WYxzEukpqzzAix9WcGat22WB22yDRcRvYU=;
 b=izfbv/pHRqeCYOF0uY9XBiaPZ2mK6VkD0LRKa8lfzZspeHgBSeHkK3Ik/weWG2pRYn
 81L52CUcijNJaCTt41KFlZKfMaRoPmkUxs0LHFgz+zqOcvVzfKq2tpJJFtak8JXySF9u
 AP7zwJRWXhoa+7ru1QK49IYsxJuUpRW0NrEcnG2PiQKgXamKETCwDGuY02UU/BYiQg4s
 LHr2KcGQSo0LkxuO20RrWbniiI9d4XtHgLNmT55MrRPoO4LepkslqUCTlsD2zeWyPug/
 Si7tL9uVuQRNIIgBGMrB0fRmisZxE7CrXpnBM7wjjK6KSPZ17rVaeme8YZsNdQZj42t4
 XhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753869998; x=1754474798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a3NHXtKl1WYxzEukpqzzAix9WcGat22WB22yDRcRvYU=;
 b=ryMMR7NvHUZl6SSbnt7Xb3ncUt1vanuhvO43Uqhx7GOQESGycAA/JwveCizI+nZ87z
 MhGmyai2s461hJ42SZMLKpO6tMqy+Svni8sJG4pY7cY8Iyx6M4zrP1hlfMLhsvs4BewB
 zqsgoNELe8ObO/oKA6tH5KczDyK+80Jqzz63ef35Vyxuo5OwsrQ8l0+XlOiyWa8pbceW
 Og5RzEEej/jIgkReVYIcyUHt2OKvLv1aRehU0z9qEiDx3iBtk3fKFXHW+x6u7vz5aUTG
 5bD66necmPXkrU5b0cDr6nWsUnWQqVpjnIU7HIghXiD0Mkz9HSLes4MFROzZEmFIVt7e
 YNgg==
X-Gm-Message-State: AOJu0YzipVwPBSWgTQh4bRZGn6MuewlXo0+HIDQXI2S4jldYjIyJ7DIE
 tkPtwZB62X2mpEDf38ZXADisQNGnRWAHgVbqwNQdl8+Y33qMaGfTuQTo
X-Gm-Gg: ASbGncvsn5HUwa79N9Tg0cdaLi8xuKLr/sMP1ZvS+zFbJn7Cp8IzY7aMjZwAfd38I87
 jSPYSJN6JQYJxC9RjFeWA6Wa8zuCLq+6GP6OWRpdObh8J6htr/rDauEAmGogvusDVua5sIsj6p8
 y0joM6qXgTboVeb7oYdn1v9kAKibAR5sv/TJfACsqjfO5pdW3MntFfbV5QWe2Rf94gGP7dSxNM3
 Nra2MRD0teU1TOr8JoUFAvOx1n5cE6Om0mY981sXYOcdpn9ZUVe8jjVE2Mb3kZrdk6UsUoLVUrG
 za8+ELvHpBSajy01Y4G/8sObxKKQ6AbLt6HHt4tJuUMVYUlYk3Ai0+PaZ20u95+aO82rzFyZz4E
 WlEn8N77wBUvzUkEFXaLMXmQwRvZAAA==
X-Google-Smtp-Source: AGHT+IGjmz171p/eMAUj0vv69q71m0C38ra0zQDkESB7ci9lp4BxyaZXgaej7D+7K682ECMo73417w==
X-Received: by 2002:a17:902:fc50:b0:234:ef42:5d65 with SMTP id
 d9443c01a7336-24096c0dcf7mr38804835ad.52.1753869997911; 
 Wed, 30 Jul 2025 03:06:37 -0700 (PDT)
Received: from localhost ([61.152.143.57]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24007d98b25sm76878685ad.97.2025.07.30.03.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:06:37 -0700 (PDT)
From: "mason.zhang" <masonzhang.linuxer@gmail.com>
To: chao@kernel.org
Date: Wed, 30 Jul 2025 18:06:33 +0800
Message-ID: <20250730100633.26292-1-masonzhang.linuxer@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 the filesystem may unaware of potential file corruption.
 Signed-off-by: mason.zhang --- fs/f2fs/segment.c | 9 +++++++-- 1 file changed, 
 7 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
 index ae1223ef648f..10aaa32defca 100644 --- a/fs/f2fs/segment.c +++
 b/fs/f2fs/segment.c
 @@ -3936,12 +3936,17 @@ static void do_write_page(struct f2fs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [masonzhang.linuxer(at)gmail.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.214.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uh3hr-0005iB-Nt
Subject: [f2fs-dev] [PATCH v2] f2fs: add error checking in do_write_page()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, the filesystem may unaware of potential file corruption.

Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>
---
 fs/f2fs/segment.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ae1223ef648f..10aaa32defca 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3936,12 +3936,17 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 	int seg_type = log_type_to_seg_type(type);
 	bool keep_order = (f2fs_lfs_mode(fio->sbi) &&
 				seg_type == CURSEG_COLD_DATA);
+	int err;
 
 	if (keep_order)
 		f2fs_down_read(&fio->sbi->io_order_lock);
 
-	if (f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio)) {
+	err = f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
+			&fio->new_blkaddr, sum, type, fio);
+	if (unlikely(err)) {
+		f2fs_err_ratelimited(fio->sbi,
+			"%s Failed to allocate data block, ino:%u, type:%d, err:%d",
+			__func__, fio->ino, type, err);
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
