Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 489CE601970
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfa-0007YI-8y;
	Mon, 17 Oct 2022 20:25:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfW-0007Y7-V0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbkaK1BhnmuuyeEPYHO1j/C42qAqDKaBYuSZ7EsnhRU=; b=Gpviankgu2Pge7conePEoJWyTC
 0FUJeq1gb4qDuBFLroT/eKgahScJg0ieSUUXYADRf0U2J09p9ZWZCfrlryIorH7GWhYEDhf53I0Do
 r29cQ859tMRuCb2z5X6aX3s3NpD1+3LOhEZNEYzAK7F5ku7T9fV3GZQ3c0+Tr/kAA7SA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GbkaK1BhnmuuyeEPYHO1j/C42qAqDKaBYuSZ7EsnhRU=; b=au7Lg5yG12pPVjGXJ0YhGGUGIT
 1uw4dTGYiXAXyFpK5K2oAVVzBktPHjKj5EUkS2oNR7gmNNv1szabp4PzlVsMthz9BqTlH1Y7XOypu
 WwTV3rLD6pLhY55kzG0cm78WJNN9H7J0ZqOdtrwbNbQYTDgY3TRsH9T5X3P/nbXOsVXg=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfU-0008RV-Hu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:02 +0000
Received: by mail-pf1-f178.google.com with SMTP id d10so12137024pfh.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbkaK1BhnmuuyeEPYHO1j/C42qAqDKaBYuSZ7EsnhRU=;
 b=NQ3KvRSSCU8wPaTgediDqeAMel/vIah0+7k422IToZaKZI3bGfU37b14iH42kEU0X7
 Qzi6EP9hjDaf1fqg1ZQFK32c9ILuCZG+zRyKOIFQp5ZQMoB2jLD4q1Gyr0WQ8mtE2qRq
 m8TScIwF6nHJLl980ya+Sr2hxZTVlJg4LpKy1hFXQBj8kaEyxSareN0Oky9YZM7BiaNw
 2vWb6xBDZgHXAKHRWn3JDalz3e7jNZ/tPokjvwD0EzjqbULHQtABSVFlz/pa4stgqdUZ
 akBnIoIm5M5fDRlS5Fp6GmmllvS/DMn6w9C+Jv33XGjD/jl12SrDdjixrx8PhoYvdeEc
 +A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbkaK1BhnmuuyeEPYHO1j/C42qAqDKaBYuSZ7EsnhRU=;
 b=jPqBpivLZsJH3nBWULMIg1iLsJKSmscVF7rXjyvpxtDMVaCkOb/i29FLlKN1UyKdEW
 YgRzj3nmaQ9XGed1ArfuRWkqCKJklUO+P8HFLBeg58xPq5qtZ2liiDWgzXcUcWNAxKW7
 MkfQp8WycpOHwzmZudzvgVZbPSJP1wSrsCFROGIsASNiZ05SKbmJe0ivjZibn7CmCfNm
 ns4VVxsxjR7xAikJXXLj76TPzcywjXuL/hBT+btIiUtcKYj/cidVvXJrTp4v0YcOUiNL
 fqiW74YnPsq9unS1khx3V2x2tDoXdigMt1Z/1D+gP/sS4mtbGbaQHoZU2iZctKIqan+1
 fSuw==
X-Gm-Message-State: ACrzQf3B8XHRhGAfRfsdM8MMoUuFD4gO1uJM+zBbD7S18AJrcS9uOTrI
 YbaW2RLaXjHrS9wyTD9lltE=
X-Google-Smtp-Source: AMsMyM4YYYiMlGZioccUtzsgvC8/uYYs8dSo4tR5iZYGSvU1XAyZz6D+QISkFp8v5lRsZ6zJPWfGpA==
X-Received: by 2002:a05:6a00:230d:b0:53d:c198:6ad7 with SMTP id
 h13-20020a056a00230d00b0053dc1986ad7mr14548828pfh.67.1666038295539; 
 Mon, 17 Oct 2022 13:24:55 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:24:55 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:29 -0700
Message-Id: <20221017202451.4951-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add function filemap_grab_folio() to grab a folio from the
 page cache. This function is meant to serve as a folio replacement for
 grab_cache_page, 
 and is used to facilitate the removal of find_get_pag [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okWfU-0008RV-Hu
Subject: [f2fs-dev] [PATCH v3 01/23] pagemap: Add filemap_grab_folio()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add function filemap_grab_folio() to grab a folio from the page cache.
This function is meant to serve as a folio replacement for
grab_cache_page, and is used to facilitate the removal of
find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pagemap.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index bbccb4044222..74d87e37a142 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -547,6 +547,26 @@ static inline struct folio *filemap_lock_folio(struct address_space *mapping,
 	return __filemap_get_folio(mapping, index, FGP_LOCK, 0);
 }
 
+/**
+ * filemap_grab_folio - grab a folio from the page cache
+ * @mapping: The address space to search
+ * @index: The page index
+ *
+ * Looks up the page cache entry at @mapping & @index. If no folio is found,
+ * a new folio is created. The folio is locked, marked as accessed, and
+ * returned.
+ *
+ * Return: A found or created folio. NULL if no folio is found and failed to
+ * create a folio.
+ */
+static inline struct folio *filemap_grab_folio(struct address_space *mapping,
+					pgoff_t index)
+{
+	return __filemap_get_folio(mapping, index,
+			FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+			mapping_gfp_mask(mapping));
+}
+
 /**
  * find_get_page - find and get a page reference
  * @mapping: the address_space to search
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
