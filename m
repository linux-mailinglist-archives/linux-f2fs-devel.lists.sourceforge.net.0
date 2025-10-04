Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D969BB88D8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 04 Oct 2025 05:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXbbaUupL6Yp3f0n7UBqjZP/tfTB0EJZtyZJxBki+ng=; b=bRPeSCjOx2EJEUHzeH/c7O8vUD
	oVnNqpXx3sDH79LMZJer0rRCBSSytIpwaxIhslKx4Jccyw7jzN1bhU4r9AeVnd3EKmLZQw8hDjaUm
	84tEq9eKHUysJ/i+ZCKZsKEyo3llyojvF5F59bZlS+vKpBU1cRIvngB2k+XuV8jfeMxw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4snj-0000W3-LG;
	Sat, 04 Oct 2025 03:19:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pedrodemargomes@gmail.com>) id 1v4snh-0000Vv-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Oct 2025 03:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/0f0fZbuAlYt0xeXxD/vlMHdXsuSwiOqxloUzhTU7h0=; b=coeQMYenIp4yMBYePF+sNOjdyU
 WYKASr15+zkxQ9O7nSCQqN1le+a7PHNFSzC0r2h9CaYvSsPStFUf0IbJCxYI82tG0m8p11f2KW+ZC
 o6sv/0lwoHwdRvmDmgcc5vwoT8nbgiXCB6s+2KCLZe8RQOJI27Eg9Mgl94b7U1xgO0d0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/0f0fZbuAlYt0xeXxD/vlMHdXsuSwiOqxloUzhTU7h0=; b=i
 Jp5jcrIh8fNSqbnaTTS/hnNMeMQR14BWpCAssx5mF0rJ7Z7au2fBtUid/bf5jEneeLbH69EZsuzAm
 MuM5UNMi4NSc3FbQ3cGQkRWDDHwQdVWw2ry6LcPmomDh9UlnEb3rIn8RotsI3D0R7YK8qCMnGWaw6
 Ai4lnHM5vStgIcVY=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4snh-0007B9-DB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Oct 2025 03:19:13 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3383ac4d130so2835684a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Oct 2025 20:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759547948; x=1760152748; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/0f0fZbuAlYt0xeXxD/vlMHdXsuSwiOqxloUzhTU7h0=;
 b=I+WZEeLDMzorPpwlG5M0duFD9IQo0RCZO7WxSCFWhrqGp38JOm/GlOXVcpnH2ctDLL
 vQyGiMxQP6Tf2c2B9mfMonHNf5VqiPwb5AECRCw52Bre5vWufVcReK5W30UnkJx0WsYb
 RTskKwfueAuxuNYKcvONwvkfTaVHKlLUwTleypNk2+VtJ/G3Uj4eWmSpuFbUDuxufchV
 onRjuRGOVp0HS1LzN7B58Or9HaAobOXHTld9bpm9MbfgkqeqW+/yQontVNULpCqbt/Q6
 4F+csfvSs/FcLPjWwQt0znM2F/HjjzzNQ4LwCkiW81R2L7lRDTbD1/uKu2E0lE3rohRs
 01ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759547948; x=1760152748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0f0fZbuAlYt0xeXxD/vlMHdXsuSwiOqxloUzhTU7h0=;
 b=uvYs8H9zQ5016t2L7LUjPbkyksG0hnbJeo11FMbCZCfOvjgo6A6hHD3EopZQm15vTA
 Bj43/huAnoso/d45qFb8dQDQ5w/T4uJ9pYuaIA96Q8IPC0EBNoKhCQ8vfvja1FUckM39
 lcdIFhgxcY+rNJDm8wqKZjBR7O+Ufg0qNI9u/08BCaiHkK8sTmxuEoHKAvYMw0CIHdAC
 bgsMZNPC441uxNd2q+wxCLAQSQKqs3U3Cb0KVxz30L8L3E0nzYiCb3Fuh1lZdehv6fX9
 Z5OPhzQWS/cplTszP4TxE/KIAXTIJHXH5TaB4EyjiaaoeDHAaZMUy7w1vIEGUPTe2HQg
 f8pQ==
X-Gm-Message-State: AOJu0Yx7UgIi5QV+Tu1JffXFKgMfZy0pmTqTNoYwopadG9iEDe6F3R+5
 oKxduFIyvMthal1chCKG3R1mlNFVlc8TGPjmfNRV9PO0sntjrsuTSgt0
X-Gm-Gg: ASbGncv6TgPA0zo41pZ4eiLChEKQRyckq/zVo7PSa+3WZTZbqCg3vZloDV/FCMxTnoe
 uvtGofcq67siWcg4+Kvade8qcoBOTLBBvS/uVCO9LFNY7XqZxyOr6gTrKml6CiuQM4HoSp5/Kwo
 cUjivFzzgQyHOX4wD33kYGC3/FpI1fi2d6zw/tr9Ji0Tgutsa3/poelly/rxQ4XqzEphWfG/iGD
 Olw4YyIyqjFU9QqFWIaIWF42+igK+Af5LBCqaqNPCE5lBNyEJXqhDSLQ6TE4gPuErAREycajaoX
 ZrixQWjj8op6YxMv5/mnJmvhT4/TjSUdsSZqxJwaOceaeRiE/0f68qFQACjwPeak1Pbmkb0jczS
 hQy+AqjM5fnMw8sRZ+NLU4nrjSXSref5NGBXdClPJZxGyWdCp24/MinWNs7cLHg==
X-Google-Smtp-Source: AGHT+IFHpHALD1sa8acPWIspep4hCEYuuObgcuOhGvCURHwQmbAKZkGTZZw7wpWCSvK4aIHv97bBPw==
X-Received: by 2002:a17:90b:4b06:b0:32e:a60d:93e2 with SMTP id
 98e67ed59e1d1-339c275afafmr5941447a91.11.1759547947698; 
 Fri, 03 Oct 2025 20:19:07 -0700 (PDT)
Received: from ryzoh.. ([2804:14c:5fc8:8033:c5aa:36f3:14cd:8995])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-78b02073d00sm6282924b3a.77.2025.10.03.20.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 20:19:07 -0700 (PDT)
From: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat,  4 Oct 2025 00:12:17 -0300
Message-Id: <20251004031217.50242-1-pedrodemargomes@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: folio_nr_pages() is a faster helper function to get the
 number
 of pages when NR_PAGES_IN_LARGE_FOLIO is enabled. Signed-off-by: Pedro
 Demarchi
 Gomes --- fs/f2fs/f2fs.h | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
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
 [pedrodemargomes(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v4snh-0007B9-DB
Subject: [f2fs-dev] [PATCH] f2fs: use folio_nr_pages() instead of shift
 operation
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
Cc: linux-kernel@vger.kernel.org,
 Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

folio_nr_pages() is a faster helper function to get the number of pages when
NR_PAGES_IN_LARGE_FOLIO is enabled.

Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..4467a6e7471c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2036,7 +2036,7 @@ static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 static inline struct f2fs_super_block *F2FS_SUPER_BLOCK(struct folio *folio,
 								pgoff_t index)
 {
-	pgoff_t idx_in_folio = index % (1 << folio_order(folio));
+	pgoff_t idx_in_folio = index % folio_nr_pages(folio);
 
 	return (struct f2fs_super_block *)
 		(page_address(folio_page(folio, idx_in_folio)) +
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
