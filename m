Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76074B10F4A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 18:00:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fVtA3I+2hnGe213VDRT4ealvtzuQtu8YD1oGiR2U7xc=; b=e3fQo8GH41S+qse0Dn/91KvsrE
	4SzlGWLD6+Xigv9iLaF9LiZRcdrJhXRsWx6wTS1r/sFLGSWWDw2A1nNqHfwxWwaIacgK6G8QrvJ92
	+nTo0vHMrpc7RgmgxSqXWTdYYB9mKOUn5ZBRHC8Gulzo4BwxBQBjiKg+saRLk8Djr9eM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueyMP-00070z-GT;
	Thu, 24 Jul 2025 15:59:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <masonzhang.linuxer@gmail.com>) id 1ueyMO-00070q-8F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 15:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WuBmFWQwikfC8gPKY8IQE2fOku/rGKmQAuOX1glBpG4=; b=j0X1yCgDU0Dxgo1UTVNim66Cr2
 zRHjhRCcefoGABVQ2HXrx+lZ7DfevD77//Z2gmOhru0H2wE0r9Sk+MjmJVErw0BkzPEjL8d0d2QD6
 G8eOmZ+qmFrQPycsKElDXJbiXwVih/om4JdPdd62oJNMU3lHvlGzHgi5yBTP84oNoaXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WuBmFWQwikfC8gPKY8IQE2fOku/rGKmQAuOX1glBpG4=; b=H
 l6ZHiO7ZU14CNxQPsE7ET/IfGmtWkznYEkji1CUsdUJzAYp04SvAWptThlnoLpX5JSnSbfsqVd/SF
 KvfOXhMalLTF0jrkkstGYrDuil4UE8M5n1gWyz+5KQWVNnGUlqHtZAGdxKLD8CESOyFUWZvbwqDJA
 Q5NbA3BiDuKN9lrU=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ueyMN-0004XH-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 15:59:56 +0000
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b3508961d43so1188729a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753372790; x=1753977590; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WuBmFWQwikfC8gPKY8IQE2fOku/rGKmQAuOX1glBpG4=;
 b=SOyPwwGSCXWvKf8aT6pZy04IPMbIIg+hQhfnSpWRmgj+otxYYW7BvCQVdsjmqQUe2u
 Q5lyDb22vseBP5vyOkRjztAGl5tW5ESzg8u6OAvuELgJ/o3MparUzYeVCktoMntQ2spZ
 i8cZwp62FoLtC7q4F3+D7tyX8XDmGTwKRwbLUyVutXO2i3Ks4UTgBvrJpABujSPP/MpR
 XfaMehKoM4737Q/QEI9VWq35SqYKTKmL4UbRonGyk/O9T7pj/gMm8u8gwZ3gN6KnUo20
 d34z79XV7yeTgp+hQS0GbyaPRWkFW6Kl8lHPx2RwBLOrQuaqF+YF+REJS+ChIhvQ11EA
 vCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753372790; x=1753977590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WuBmFWQwikfC8gPKY8IQE2fOku/rGKmQAuOX1glBpG4=;
 b=eSNCxiJs16QURCQQHZIYMg4ApbXoEJ4YGPtw2MY0ABmikwCfo0aPtgzOV4D0ROzJNZ
 SBNsSZKEZQEnCxoT9sjYJTHDJfwzfmlJ9jJ1sUvs8wZUvbqgs0Fskr3Zj4Y5xOHI9xE7
 G3g+qKwr971+6tFUG92gS1Ji2bMvFLAzoTgmV+9XGAgutTXXRr1eEhl0dXWWcrXlVs9Z
 4dCcrK9ySDlI4C/52mBA8vhFjnG5w1rV8Rl/edQHJMCQBvVNOt+dUnczc9L4SpvHsJk2
 1UJDheeUARkM8piawSNixqAHrZUSVNcq+2fVQxsAXzbihWVRJhv9/ttARCcu8aC9HXlA
 RnXQ==
X-Gm-Message-State: AOJu0YyoI41jhNTblp7bnOnvL3qD8d1yj3b/gfHKYsqKg2x9piqrUrLE
 FBOhou5XSra9/eAVZ7gG+k3cLatk9jqq1xmsMDb5x+30Ikv9qOtNCUm1
X-Gm-Gg: ASbGncvGoHLor70ewjlr99aI95UcqSmQs+Pw+iE9VjXnroWtNkZFebySaGd1dlHfO3i
 vwa9oSiOq5RhdPptrxJQ1ZT8cKsQgIa0g26iiQ19ip9uuDScDqR5NLzeks4udRk96QZHZrXjHqN
 NYUXnGbC6q7G3Kf2ITNied0y2cDtoICJ92am+e4+wNjToCeC3zBHn/eUZLoW3IPDdCoL7Sf1dH6
 Idv544+wU7sH2Vl/NLMF8N/LYW9qFaRwReSiEhj3vONrEyI6L+3eJYthAL2GKd4sfgsUkhkl8eK
 CuCcPa3Y6Z8PRs1G2y/5zBMxcKaiB5a576vRA3QEdRQc6b/3uUkdkqMjTJjKxAIqPknfz6WnK/o
 BFfAPkGH2yJUd5r+z9leJY0T//Js9khXzSwVY3z+xnuaxcCldkS8=
X-Google-Smtp-Source: AGHT+IEHPy9G1eCQC0UKeFfiz9xGRT9b/0wCsPG0VhqcmscnBnx5mZqt6oMjqwWw8Ndyu5+wJUkHvg==
X-Received: by 2002:a05:6a20:7343:b0:1f5:9098:e42e with SMTP id
 adf61e73a8af0-23d48fb1f73mr12003645637.7.1753372790189; 
 Thu, 24 Jul 2025 08:59:50 -0700 (PDT)
Received: from localhost ([61.152.143.57]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b3f6c10ab56sm1747924a12.45.2025.07.24.08.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 08:59:49 -0700 (PDT)
From: "mason.zhang" <masonzhang.linuxer@gmail.com>
To: chao@kernel.org
Date: Thu, 24 Jul 2025 23:59:45 +0800
Message-ID: <20250724155945.206801-1-masonzhang.linuxer@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 the filesystem may unaware of potential file corruption.
 Signed-off-by: mason.zhang --- fs/f2fs/segment.c | 7 +++++-- 1 file changed,
 5 insertions(+),
 2 deletions(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
 index ae1223ef648f..ce80ba226aed 100644 --- a/fs/f2fs/segment.c +++
 b/fs/f2fs/segment.c
 @@ -3936,12 +3936,15 @@ static void do_write_page(struct f2fs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [masonzhang.linuxer(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ueyMN-0004XH-Uq
Subject: [f2fs-dev] [PATCH] f2fs: add error checking in do_write_page()
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
 fs/f2fs/segment.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ae1223ef648f..ce80ba226aed 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3936,12 +3936,15 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
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
+		f2fs_err(fio->sbi, "Failed to allocate data block(%d)", err);
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
-- 
2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
