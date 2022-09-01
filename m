Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 895F55AA1F4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 00:02:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTsH3-0000MK-0z;
	Thu, 01 Sep 2022 22:02:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oTsGp-0000Li-3R
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+d28bepiquHWlxilFueNkEADr0o+je+NLAZFPUKTbIY=; b=SF39Ea9yboOvHAAUA1IB2eaDnR
 wTtuogenjtEHxoknQnic8nYpapsH6rX8KHvj9Bv4Kwg6X3f1cBk+lx8TKkDPh1ea6QOzQhbu9H3Q8
 OeugJdSKqLWd4cbegOm+yF6Xcbd7M2GGtrQ0d58qBAwlFARUko1WoK7+GD3iP5xuv9Ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+d28bepiquHWlxilFueNkEADr0o+je+NLAZFPUKTbIY=; b=DWK5uk0y1T9/ubx3JU7QRo+5WR
 TXhjiKkRi0u8BoS3/vrQP1vzvE1qn7AJ/ULuDCncNHc0shI6VXFZEkUFAtnvU4XPP2Ojruk6QfXIV
 9npxa6UWRmb0hKGqow1CqaveJNPxXG+ZWhZw65dPAayx5mgIDmr0TNQ5vELLXTqFIe8g=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oTsGn-0007uU-Dq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:43 +0000
Received: by mail-pj1-f41.google.com with SMTP id q3so257058pjg.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Sep 2022 15:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+d28bepiquHWlxilFueNkEADr0o+je+NLAZFPUKTbIY=;
 b=ghwmH7OBtODEG3q6T97VdwhOtKpgroD8O6/eJME6RxcE0RCt6y1f0k8Z+Nf438szjC
 f1Tz2jCtqotWMYX7jAfk8pOks8r2uw1MbNfVxQq0DoggwzPzqUI1rjL/zYCVH96CDWOv
 6N+BySbmSBpBiAynr3+ZISEA0FDbCfqFR2qcMY0YXtQvpxu9mYXWpYrIjN0m8121kRUK
 taJIkqf7L0HTr7GIXny4HPFg0cC9mjsMx0m7GnMMBPB1n6WD1zCiOVAj8NMqjbSN/CwY
 UiWg2L5Utibhg+ppDHvNeQZKqE6Q7TMiSRDWsRr05n+F5Hbq6n90JrOCXpSrF4pvJHUr
 61YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+d28bepiquHWlxilFueNkEADr0o+je+NLAZFPUKTbIY=;
 b=1ktyMy8FBQulqxDfGujF2kprHaUB/n8I+7Ql4U3xXXYw4BWFajv9/wfpMtTov0WOc3
 2FSbHzaW6XyBUqus6PAMQ8fUTPT20K5uPDpHZdDGxDEhCbEDr7Eq2yYZjTqRuolWA0FL
 X4cFaB9BTckbdcoMj1lkhgni0vZtNzR56YhBpVr8bJdBbC7+KiAB48jGYCLxcTSLW9Zb
 rNSGIWRXKwzGasg+kQnr35pygkZz6Jhutx9zXNwBlZWKdjOlp1H165rGMUhyc4uOsclM
 svq95wa5wYOZZ6FG0yb07ho9Iowi+h3y6MMqMfLRWJEGrSxX+agudKR+kjkDBaGuT8t9
 xD4A==
X-Gm-Message-State: ACgBeo2EQvPc5kQUHnGoob/2X/u1X1Dj+G99U+wyWck/gzo5J1zOPKFu
 Ldo8/xzRaVkHOWFDzNEXcgg=
X-Google-Smtp-Source: AA6agR66279h5kRGOp1743YusbEZncu2V+e3ESCBIyAmjv+FQyjI4ExArRN8AnvHyGVWNl+1uieWjw==
X-Received: by 2002:a17:902:e88c:b0:175:2471:8d8a with SMTP id
 w12-20020a170902e88c00b0017524718d8amr13575643plg.0.1662069755764; 
 Thu, 01 Sep 2022 15:02:35 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:35 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:16 -0700
Message-Id: <20220901220138.182896-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901220138.182896-1-vishal.moola@gmail.com>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
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
 no trust [209.85.216.41 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oTsGn-0007uU-Dq
Subject: [f2fs-dev] [PATCH 01/23] pagemap: Add filemap_grab_folio()
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
index 0178b2040ea3..4d3092d6b2c0 100644
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
