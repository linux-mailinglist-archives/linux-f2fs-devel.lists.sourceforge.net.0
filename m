Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C4D19D7A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 16:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmfs9lv5qFJKCoEr+saYuHWM5NoRLPWZnPhcycqWAIY=; b=dl91rKNWlPgxZRu0SbDFK2oJ6/
	qleMsxKv7YzRTcRSUa2v3b3w0C2bxTiRV7eqIT0phqj9HIzdiLvfOb1DIs/u86sLn0+3nxOLn9AvY
	yDiKemJ+G+5UzvoXA0dcHsCfbwAA1V8R750MfeyBwULHCp6olQPxYOGMnN6M2aTID1yY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfgDp-0004sk-P6;
	Tue, 13 Jan 2026 15:22:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfgDn-0004sc-Qt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LarHGKlNZcKKDY8RNJuV1QZgdBQz3zAwb0YtrS88uEs=; b=i0cbnMNauPvT8PqbekSKQfWXFF
 TQ5pBIlLwoWFL4v+OHRx5TFSQDhFtjA2bIEnNd4uZPOKS7FbZTEh+406FeygaIrdsAg1iQhaXEydF
 naInky4qHMs7CnPVyP+17PjlMBVZemIoN8HTt69BK0kpFGxC/FDp9aPMVhkzoY8UjdSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LarHGKlNZcKKDY8RNJuV1QZgdBQz3zAwb0YtrS88uEs=; b=OVZ1qZDz+mE0BJWkq5Hus8nLeT
 wQfqc5p7Yjfg/PLVoameENI73FO6szurcpgAFde86JZguCM/MVX0aF4oDPGXOcUZZhID4dkueW46/
 NFWZjqT7H7i68j9+7g+yGOQCqkz2s+iCcLe2ISCXFwb8on4OpnXh3dTtGmizq6M+BG84=;
Received: from mail3-165.sinamail.sina.com.cn ([202.108.3.165])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfgDn-00015K-9A for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768317735; bh=LarHGKlNZcKKDY8RNJuV1QZgdBQz3zAwb0YtrS88uEs=;
 h=From:Subject:Date:Message-ID;
 b=vECWfqdOjWR6tYwnP3Exo7NF9Y9vK6Z/JS7RBZ6wyXInlU/R3DAYbB0nRO6NxDYKw
 xBCM9wzCCzzXfN9emQJnQtUMTQeVVt64CISRZfK4sSkL/b2SWv4b5Gj5om2bneV8Et
 3tgR+PQO+G5nZG3JKCGm1U+Dq8Z2xdx9usjBKe08=
X-SMAIL-HELO: monty-pavel..
Received: from unknown (HELO monty-pavel..)([120.245.114.32])
 by sina.com (10.54.253.33) with ESMTP
 id 6966631000006BDA; Tue, 13 Jan 2026 23:22:03 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4225336685240
X-SMAIL-UIID: 479FE1EDA91D416F89D1E9E84DCF15B4-20260113-232203-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 23:21:38 +0800
Message-ID: <20260113152138.15979-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152138.15979-2-monty_pavel@sina.com>
References: <20260113152138.15979-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang All callers of __has_cursum_space() pass
 an unsigned int value as the size parameter. Change the parameter type to
 unsigned int accordingly. Signed-off-by: Yongpeng Yang --- fs/f2fs/f2fs.h
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.114.32 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.165 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vfgDn-00015K-9A
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs: change size parameter of
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
