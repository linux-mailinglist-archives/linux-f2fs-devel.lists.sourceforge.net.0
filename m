Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4F95249E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 23:17:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seLMh-0005Jj-UF;
	Wed, 14 Aug 2024 21:17:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djahchankoike@gmail.com>) id 1seLMa-0005J9-99
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 21:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Hw8lz23tqDzKkzkY8nXMHYNLEk2gqVka2W0RkG9/44=; b=AsGjWPyu/6daaZ1Awad0rIo8LT
 rObFeMj511tLZ+84p3LqE90ETOi3QMZSHeP3czdGPaCW2I35LrDM9a0rAH7kFOswOKHYRAGL8tMmQ
 r8AsrV9gOG9zwRNe/PF1Yw3ZPsgV5htRDL/6NDNuGBR3G5D9pcdot61JlJMX/bXGdyNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Hw8lz23tqDzKkzkY8nXMHYNLEk2gqVka2W0RkG9/44=; b=d
 U9ltgHEhOeqhkIP9csUat525x9oc+Aanrqki6CmjEhvz0YUjHGXDDDLwq4SJRBKD6UMlPp+2yGcWD
 sJxGg5Tq97b95EqJ+bBtyAnGa4gSPBPewsoRXd6XQEiKZ/T+wyBzvWiNmy8BypzFbpw1Poj6a5dNF
 3APC6+72YSPSuDNg=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1seLMU-0007Va-3i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 21:16:58 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-70ea2f25bfaso219740b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2024 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723670208; x=1724275008; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Hw8lz23tqDzKkzkY8nXMHYNLEk2gqVka2W0RkG9/44=;
 b=BAhqjBDI/+0a89BBEBR0khzIdmoR967pPJL9it55tBP4GvH89yPnFvStOdZO+ZfUEU
 X38+PxKwfMQltH8qhgRz3D8ZUjxhTtbGMActhAoKhcCIvzglDz8f0PvaArXcklniYNuR
 8wo9Hdz8bVetPIjdydGKJEzN9x0YPvB6Gr+wQ69dsiiaogtqqebew7e5rnbONlUbDvz/
 EBxxAkkYMhG8OQ5tUlrnQyAs8bAVDQ4Fm/2p/mLeoX5q62ICriB1x7Vr9CJyjC4ExPXG
 0mEPBz3Bq08CYwGXDmYZ+NYxYOJemlNFVN3GKr3oflP+O61FaBrOBRY4SZChAAayej9t
 ylbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723670208; x=1724275008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Hw8lz23tqDzKkzkY8nXMHYNLEk2gqVka2W0RkG9/44=;
 b=JJ8Urgk2uJG4M7HeBiGV0Rog9lb2F1vOgJaThQmtD3ctMOZWmpUdbydGL2zOefo5I5
 uSPO+B1vsXFs8EPnRSKDUrzgLYPAMG4qL67wavIOZX9AdwvtLPu1BKYnPPkb1J/UL8uF
 SwQwRiaUWezlIFLz/t/fBcn8jJw/VoBnYi5WKb2qLKrUvknppRfElJyYMOv35btY1v4m
 HTkNcZ6jSUgPG2VVFeNCPaRp4/YNIAOGFf4sOT4Mmt7ZoWug4WBNhSYFbemBhbFXHP4B
 JXJ7Wbx2MUkwzFe92fF/AmYZeDWjvFZ+/xMGMwUSamE8xM1v40PXDgPzFmvNWD68zUge
 Znyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1nbK+5/wmz9/AKfq63Nz5u9Km7pHLl0Gc/9hOqfCFdbNBzTAHMh7sC3Gc5eXH9O1Fn6Yb1J53FdTKS5Nbo1X6HBnOJNm0xj2As2XKHZdVg/m8L8rQAQ==
X-Gm-Message-State: AOJu0YwWHoBmRlIR0c24iP7wcMKIVOBEvZFnEx0aeU6/F8enjraOwSq6
 xc7KwBzn5avv1dX/MZvYE65BVPBVkQR+ERW7voNBefyflffYbAqG
X-Google-Smtp-Source: AGHT+IF40yt88J2Butglx46sQdOzBwoONfypAPbzL+xZUb9dsPF3jvjvcdDQmIzPIc31FfLEnidnqA==
X-Received: by 2002:aa7:88cc:0:b0:710:5825:5ba0 with SMTP id
 d2e1a72fcca58-712670ec998mr5006066b3a.3.1723670208263; 
 Wed, 14 Aug 2024 14:16:48 -0700 (PDT)
Received: from ddebjk.ddebjk.net ([200.4.98.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127aef5457sm14738b3a.127.2024.08.14.14.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 14:16:47 -0700 (PDT)
From: Diogo Jahchan Koike <djahchankoike@gmail.com>
To: jaegeuk@kernel.org
Date: Wed, 14 Aug 2024 18:16:40 -0300
Message-Id: <20240814211640.167728-1-djahchankoike@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fix reader lock unreleased in error path. Fixes: 374a8881ce4c
 ("f2fs: atomic: fix to forbid dio in atomic_file") Reported-by:
 https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
 Signed-off-by: Diogo Jahchan Koike --- fs/f2fs/file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.181 listed in sa-trusted.bondedsender.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [djahchankoike[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1seLMU-0007Va-3i
Subject: [f2fs-dev] [PATCH] f2fs: fix unreleased reader lock on return
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
Cc: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Diogo Jahchan Koike <djahchankoike@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fix reader lock unreleased in error path.

Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")
Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 51f6ffd5f4e2..c9eda5dbd11f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2172,6 +2172,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret) {
 		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+		f2fs_up_write(&fi->i_gc_rwsem[READ]);
 		goto out;
 	}
 
@@ -2181,6 +2182,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
 		if (IS_ERR(pinode)) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			f2fs_up_write(&fi->i_gc_rwsem[READ]);
 			ret = PTR_ERR(pinode);
 			goto out;
 		}
@@ -2189,6 +2191,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		iput(pinode);
 		if (ret) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			f2fs_up_write(&fi->i_gc_rwsem[READ]);
 			goto out;
 		}
 
@@ -2202,6 +2205,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
 		if (ret) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			f2fs_up_write(&fi->i_gc_rwsem[READ]);
 			goto out;
 		}
 	}
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
