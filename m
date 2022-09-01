Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B068C5AA1FC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 00:02:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTsH1-0000SZ-Oh;
	Thu, 01 Sep 2022 22:02:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oTsGp-0000SE-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVjZRQRXjU7sjBLr6rHvAQKfUIl2rAWam+cMUVwdi8E=; b=jJHNbSIlSAwYXkaSNLXOcZkEUP
 y14niLbt2rYgMk2uzssirzr1p9IIAY+TOVyzxxWGA1ZWNHkznyA0cT5tXmlUrNtPSKk77pTINV4ur
 P11yUENeYb7xEHU5PfcwqE+wSEvsSmvPyltjcznrpd89bMTxvwAugrKNL95+fJdCUTyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CVjZRQRXjU7sjBLr6rHvAQKfUIl2rAWam+cMUVwdi8E=; b=enevF5iByEnFWkoPA8yXl4dUTB
 ruGS4ixxRrS2OmVAYMk32cOOQCeyCCkI35UlEUKCuXauXmqy0IJRxAR5KnVxnTYe08o9bK3BC8xOF
 kHaE6zzYV1u55mlY0sehkIqheoOByGp786tPWqhWDnKHtGW4XEBfGSaOInMjbTLnz20E=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oTsGo-0007ue-Qb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Sep 2022 22:02:43 +0000
Received: by mail-pf1-f170.google.com with SMTP id t129so112885pfb.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Sep 2022 15:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CVjZRQRXjU7sjBLr6rHvAQKfUIl2rAWam+cMUVwdi8E=;
 b=bv0LlXMBz1E57HLrV0PxYhOttdXPLA9G/hmytg6Pe0rd+F6zlztjWzFwbENyiMaQWR
 F0y9cniRQ6tVYw7gWA96HxH7uvhLa7fAV6j9jf6hJKnH+nqTOa6IuccLgG2jeB4wnKbN
 dXNbKHhDCRc0KcSaeocdSfxm7jfTTYEBJlJdkL7KuMup4EyoA3sh9A1lYrEFkmC6fktZ
 zYtzraSEWM+6VBSfJSxJZMDmzsg1bohGoHF4buE8zyNN/Y+ges7udin1m1Ip09ANb1qi
 yx9Dumn8NExq4UnKeww1kfiOzJo2ul+62vzxa7uoxr+6j09KzXtjhQLvasVG7qC/0CUb
 sXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CVjZRQRXjU7sjBLr6rHvAQKfUIl2rAWam+cMUVwdi8E=;
 b=vmlvwSmzJSCx/qfwyYIJXAzqTa/aRT7fqU3YA3g+qAqcyT7pVnH/FNQ5OTFcFK9Yqi
 aWdKOSZVJ6GPMPo86bzfrXks4ibGnv+EyY6kuBgZ0uy8f9/bwOqORUG7wqiB3qkmBIlm
 n0zG+aAfv0Zq1ABMuBFeqXD5iVrBRglj9kz3UDPlFhIwu2gDsEbJkK7tDN1+hpwIl5MO
 FXb+dfKmSyQG0X2t2WVbJZjo/MO/Zx2JRkF6pvn/uhDbEYIoPonlSHfn5CxrGASYxHvI
 3sglplG1frHXA+nvsFii8lbr3fjHb9y+Rg0xkp2kkx7yIXNNTf4DsKVXMENTP6vQMWAN
 G5CA==
X-Gm-Message-State: ACgBeo3kVzBytDzc9cXrzJJo8ism8ifpDIK8wU9Xkx0R/TSwCrtP2J31
 m6yZwx9jmSkYhsphMzXNQzg=
X-Google-Smtp-Source: AA6agR5teCrNzMyLQkKmpfunK2hBqhwsyte/cVkAvHsCIIzpnsrjuH2ApmtR8GoGrfaDovrF9RfZdg==
X-Received: by 2002:a63:6cc4:0:b0:41a:ff04:661f with SMTP id
 h187-20020a636cc4000000b0041aff04661fmr27931509pgc.600.1662069757234; 
 Thu, 01 Sep 2022 15:02:37 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 fv4-20020a17090b0e8400b001fb350026f1sm128894pjb.4.2022.09.01.15.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 15:02:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Thu,  1 Sep 2022 15:01:17 -0700
Message-Id: <20220901220138.182896-3-vishal.moola@gmail.com>
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
 Content preview:  This is the equivalent of find_get_pages_range_tag(), except
 for folios instead of pages. One noteable difference is
 filemap_get_folios_tag()
 does not take in a maximum pages argument. It instead tries to fill a folio
 batch and stops either once full (15 folios) or reaching the end of the [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oTsGo-0007ue-Qb
Subject: [f2fs-dev] [PATCH 02/23] filemap: Added filemap_get_folios_tag()
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

This is the equivalent of find_get_pages_range_tag(), except for folios
instead of pages.

One noteable difference is filemap_get_folios_tag() does not take in a
maximum pages argument. It instead tries to fill a folio batch and stops
either once full (15 folios) or reaching the end of the search range.

The new function supports large folios, the initial function did not
since all callers don't use large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pagemap.h |  2 ++
 mm/filemap.c            | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 4d3092d6b2c0..85cc96c82c2c 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -740,6 +740,8 @@ unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, struct folio_batch *fbatch);
 unsigned find_get_pages_contig(struct address_space *mapping, pgoff_t start,
 			       unsigned int nr_pages, struct page **pages);
+unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
+		pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch);
 unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
 			pgoff_t end, xa_mark_t tag, unsigned int nr_pages,
 			struct page **pages);
diff --git a/mm/filemap.c b/mm/filemap.c
index 15800334147b..3ded72a65668 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2254,6 +2254,59 @@ unsigned find_get_pages_contig(struct address_space *mapping, pgoff_t index,
 }
 EXPORT_SYMBOL(find_get_pages_contig);
 
+/**
+ * filemap_get_folios_tag - Get a batch of folios matching @tag.
+ * @mapping:    The address_space to search
+ * @start:      The starting page index
+ * @end:        The final page index (inclusive)
+ * @tag:        The tag index
+ * @fbatch:     The batch to fill
+ *
+ * Same as filemap_get_folios, but only returning folios tagged with @tag
+ *
+ * Return: The number of folios found
+ * Also update @start to index the next folio for traversal
+ */
+unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
+			pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch)
+{
+	XA_STATE(xas, &mapping->i_pages, *start);
+	struct folio *folio;
+
+	rcu_read_lock();
+	while ((folio = find_get_entry(&xas, end, tag)) != NULL) {
+		/* Shadow entries should never be tagged, but this iteration
+		 * is lockless so there is a window for page reclaim to evict
+		 * a page we saw tagged. Skip over it.
+		 */
+		if (xa_is_value(folio))
+			continue;
+		if (!folio_batch_add(fbatch, folio)) {
+			unsigned long nr = folio_nr_pages(folio);
+
+			if (folio_test_hugetlb(folio))
+				nr = 1;
+			*start = folio->index + nr;
+			goto out;
+		}
+	}
+	/*
+	 * We come here when there is no page beyond @end. We take care to not
+	 * overflow the index @start as it confuses some of the callers. This
+	 * breaks the iteration when there is a page at index -1 but that is
+	 * already broke anyway.
+	 */
+	if (end == (pgoff_t)-1)
+		*start = (pgoff_t)-1;
+	else
+		*start = end + 1;
+out:
+	rcu_read_unlock();
+
+	return folio_batch_count(fbatch);
+}
+EXPORT_SYMBOL(filemap_get_folios_tag);
+
 /**
  * find_get_pages_range_tag - Find and return head pages matching @tag.
  * @mapping:	the address_space to search
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
