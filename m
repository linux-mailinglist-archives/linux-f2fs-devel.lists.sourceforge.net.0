Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B34D18A49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 13:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmfs9lv5qFJKCoEr+saYuHWM5NoRLPWZnPhcycqWAIY=; b=TRl0Io5ZobqUqYc1PXxCnnArQE
	gqh1FSdZazDTNEutWwQ8zAQmUsNBeexKz0vCUWVU37I6mFH8S7bt8AKkrzcjItxAgw9Sk8dZ8aOb2
	AtSaGBe/ocT7E263VZpy77ykYJTtlP0ADC7B2G9J2kEfRGFNFiBlrjZA0B7prqfbtWn8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfdGN-00040O-Ns;
	Tue, 13 Jan 2026 12:12:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfdGM-00040A-46
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LarHGKlNZcKKDY8RNJuV1QZgdBQz3zAwb0YtrS88uEs=; b=SDUNj0pOC7SP/xlwtF7odIXEQG
 Rb82MwsCnkyVBLSCi21ZTsQC/rRDBF4xe7GPZRhWn4guf2xu7ATsaS5UQYFvllHIPuIQRJPS2x0aE
 xFtPhedx0nV23vXGfTLVW1vEjPNw+rW3RGCEpNVqORqWTBODHgWT1jMw12hdWl+n5jIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LarHGKlNZcKKDY8RNJuV1QZgdBQz3zAwb0YtrS88uEs=; b=iuXLWK1Rhar9JhEuiU4TtpFnXd
 liEfEPLPJ17J3mcjGXk3Yz1C6hV3gm5nqFSI1OGY+MvUJEvofle+o89nsaPj9t4N7KLWrj9hZkpBd
 bqpxF5GxpMK7vmzTVney3jBRzm3WcepJz0i6TJcriLNJtU6CrNAD8HuI9Fkeg5MgItkc=;
Received: from r3-22.sinamail.sina.com.cn ([202.108.3.22])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfdGK-0008Ml-RS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768306360; bh=LarHGKlNZcKKDY8RNJuV1QZgdBQz3zAwb0YtrS88uEs=;
 h=From:Subject:Date:Message-ID;
 b=AKn0OFT7AXH6zUkpSkstdGSYhfK3x8LRK11BTk/OFBl16B5iWxpEp5MMM6LNhlBK5
 m31aK/d3lur2QvMb7jOTqqQ8HrJwMDZPUIn0Ik48szjokHq3hoTtlF0rYr/Y0GPxUL
 8Xvv9bOUwtKfF8uQeNokt4ZyVhTd3nOOsDWd1YAs=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 696636A700004646; Tue, 13 Jan 2026 20:12:25 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8005386685223
X-SMAIL-UIID: 4D8B0B145BBB4B26A10DC74D8BFB8B8C-20260113-201225-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 20:11:45 +0800
Message-ID: <20260113120837.215336-6-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113120837.215336-2-monty_pavel@sina.com>
References: 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang All callers of __has_cursum_space() pass
 an unsigned int value as the size parameter. Change the parameter type to
 unsigned int accordingly. Signed-off-by: Yongpeng Yang --- fs/f2fs/f2fs.h
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.22 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vfdGK-0008Ml-RS
Subject: [f2fs-dev] [PATCH 2/3] f2fs: change size parameter of
 __has_cursum_space() to unsigned int
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

All callers of __has_cursum_space() pass an unsigned int value as the
size parameter. Change the parameter type to unsigned int accordingly.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bc666cfa83d4..1f4698a7b72f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -572,7 +572,7 @@ static inline int update_sits_in_cursum(struct f2fs_journal *journal, int i)
 }
 
 static inline bool __has_cursum_space(struct f2fs_journal *journal,
-							int size, int type)
+						unsigned int size, int type)
 {
 	if (type == NAT_JOURNAL)
 		return size <= MAX_NAT_JENTRIES(journal);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
