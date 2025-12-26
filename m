Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA66CDE6AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 08:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GUwts/VPVNBLasz2Ob+jht6a9uIgVY2MCUOi1jKFHP8=; b=dEhkLhIQMbM5N8l6hYUAfSKq6A
	AzyjLjLJNMwOo+SXZlu+qVHj0isVHcjgS8oxC+wCA02MRQ0NWyPLcLgfKzZ6UDCLOBTzVZ3YBMBPa
	I5YgagLFqpgGu48Z2YndkF3rivlm2giLzfyj3SjUEgBjlWxuyIUvE5yP3rFyqiM3BSPw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZ1v9-0007q7-PO;
	Fri, 26 Dec 2025 07:07:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vZ1v7-0007pn-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 07:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pA9/wzIhn5Y6aje2IHgU2uEXT6gLcOk7IWwPc9LyMwk=; b=IMcGLL/9R3E7TpE/8Gsytt0HrB
 gLU0QjxVbX8sPBHmez/7jdvC2K1N162bBhHGvX4+ccqqWWi+gL9qB3Uw1U8Pml/11so5sHj7KCyQY
 oPPWMmpv4qIcZUnfE/9/5+gpwh1RBOZn8swq6ZTg62aXtp5fBQSjjqtaHTvjflY/wl5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pA9/wzIhn5Y6aje2IHgU2uEXT6gLcOk7IWwPc9LyMwk=; b=g
 25lQBwDYYZQgxQ22R3eMXaDfzGy90Wqe6vY63TnbYgFOZBBvyc+8ZjGvlW+qAK/26ZaXJ7Rvor+O3
 T6S8mXfUoI7HKOB0OUwPKR/jJP0FR/k0sjlIqIFIvWeF2w5npCvlghKRb7hyJ1EqGzkzTlxTMpX8z
 7OwiDJqmODbsFKhg=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vZ1v7-0003tm-O9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 07:07:30 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-29efd139227so93826085ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Dec 2025 23:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766732839; x=1767337639; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pA9/wzIhn5Y6aje2IHgU2uEXT6gLcOk7IWwPc9LyMwk=;
 b=FrU8BJg7LBY+UNG2Xotqy2SKXQNupdCdMo6DmFBVKUBv9a5mrqheKHOfZ1fL7GD4Ho
 d/hxftS3982Eq/i3g5a78RlkKnKmShtiTPZcyhkTzxAnwSEaIcuiowPHZVVllK2HKVlc
 RhRFy42vkOIZDqSReHJ7p+zflFjGmS6XrsGtE5vHxrOxYvKiILi7eJvUBa0z5nQb/b2s
 TE7dotMRYjPiYyR7UbtGRSdcO84g6A1FazBH02BWn4ydkH3sLkvXDod92Fex+46dgc4U
 M7Clu5ZYptsRCQa1gaLdEq7N03z9gqVPuZ3ZIidtZjq+plnvA2H6CNLdql+dtEtokKK9
 JrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766732839; x=1767337639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pA9/wzIhn5Y6aje2IHgU2uEXT6gLcOk7IWwPc9LyMwk=;
 b=mvbWhyAfFzslFGYng3xw2Y4ovIAsfyJMXrSEJKsGcWpO9FOH30yv7xkcfGU6qCB8zH
 LhO2i1qY5V31ISBu13uhZt0hudX1/zMfrXK9BnM0nF4KfV6WfpZVT/3g28iBDzGkyYKU
 vH08PbkKfB2LCf/9PzdyjbdC7prXZ/QkOHjXSxneiRU6h5Ep5uMAeeR1fUUP1odCnu8t
 EdaYp1B1f8Qvk+g10LCkIgOCToxFbSbwmXpjf1RdqNHJenvK0T0Y/Ffaw7S1M/yVl9LV
 1yBlX49xIhcSeHw7cv15w3XW+AwnBpGeEOyUq1LgU/cuP5O8c1fNcqjKsyJjcEAyH+Zu
 4a7A==
X-Gm-Message-State: AOJu0YxS9Y1rVSxzkoantAHUBMpqNvk1Zo1FQ17bsBXjpWR9QadfAA6C
 4ANzVdkIQrMOLd8g1LOrth92D8y2slinmDVW9EmX+Ed8GrpKBVq4sWXZ
X-Gm-Gg: AY/fxX60qdPCjV+HOQmouctegwSX59XEAlQ+NYxlYFNFFq2gk7BIfUN2oxwTicaqeF4
 MfJuscuWQr92zVUKl70KvMbMHfelTx5hM5S765WotqkDtkoPU2nR2jE2bIQ2EOkVS8+GRJJm9tj
 su+ZHtAymY+rQ3d/nPA9OXwheXfzKCKk8sLg3Y2TSUYDUUtYP/yp+r/KMfWV+1KLdJOjRMRv5Kq
 HZG59k9Jd5XUf4N/ihWB9/wkke23JnWFeGFuMZS2xBKz/bXmU+nXKie3J5P/fNgj4K0LbiFiYwQ
 RbGSPjvlMrIreUbHPcpEkJfeR9Z3zfSrZwCr7Hj50dxtX8FPaIJbTtscx+EVEN1TrlUKs3W4bFG
 2Utj2aqB17943r7qW7ZRq2JKvxwiL24WCtaiwzGpCcxUKd1+dTZpq09106+FEeU16IsBfEDuYfo
 X2sd/ejzIzXrFJIltx1ZxtkN2p+Akr9Q8OOGDxPcg+/YmKJMeiaBh/T98OfA==
X-Google-Smtp-Source: AGHT+IEv5tYUTdyXm1PISLM+b0g19tY0jCmjo9p7bm8ewJdRtJzGH6EbU5ByeV9fdGRQSZSOXpDZgw==
X-Received: by 2002:a17:902:cecd:b0:2a0:909a:1535 with SMTP id
 d9443c01a7336-2a2f21fc33fmr227464645ad.11.1766732838858; 
 Thu, 25 Dec 2025 23:07:18 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c65d71sm200242235ad.17.2025.12.25.23.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Dec 2025 23:07:18 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 26 Dec 2025 15:06:42 +0800
Message-ID: <20251226070641.21147-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang During data movement, move_data_block
 acquires file folio without triggering a file read. Such folio are typically
 not uptodate, they need to be removed from the page cache after gc complete.
 This pat [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.170 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vZ1v7-0003tm-O9
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs: remove non-uptodate folio from the
 page cache in move_data_block
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

During data movement, move_data_block acquires file folio without
triggering a file read. Such folio are typically not uptodate, they need
to be removed from the page cache after gc complete. This patch marks
folio with the PG_dropbehind flag and uses folio_end_dropbehind to
remove folio from the page cache.

Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/gc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6afd57fa5387..d138648d2b97 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1453,7 +1453,13 @@ static int move_data_block(struct inode *inode, block_t bidx,
 put_out:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_folio_put(folio, true);
+	if (!folio_test_uptodate(folio))
+		__folio_set_dropbehind(folio);
+	folio_unlock(folio);
+	folio_end_dropbehind(folio);
+	/* folio_trylock(folio) may fail, so the flag must be cleared. */
+	folio_clear_dropbehind(folio);
+	folio_put(folio);
 	return err;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
