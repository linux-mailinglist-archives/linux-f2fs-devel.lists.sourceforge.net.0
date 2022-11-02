Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0B61679C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGLK-0007fV-As;
	Wed, 02 Nov 2022 16:11:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGLD-0007eA-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0kIQ32jgESZghl2JsFuRf0mmCK8FvEn1HKHvqp4B/UI=; b=Drf6GUt/RDj3zxPPKfWt9eNRPP
 5lHaaO55/94S7BDKByPRoXmOfRnGW2ORztB+2n2XJ4dMHNJ45bdJc/Y6UrhdSbLGT+bpb4wOfMfXM
 uoj7Yy/WKckW/VL1XEK0Ap97OkfhsWWgueVmujF4ZU2WdAf4lC0EqWXKU7AwS3DKpQM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0kIQ32jgESZghl2JsFuRf0mmCK8FvEn1HKHvqp4B/UI=; b=RYPhUYeYO0Xweijph3EnjYxk/e
 aMcKE2tFkpmY9Vmv0meJAg9zlxI8TDxQFAy3TAfbyiXOhqvZfYi1Fe68o+um+dwBhfkSt3G+As6Um
 0krU7OHbdaRfvRUHr2Hv0i+S4QkNpkv5obhq25EuGpZ0eDTYMGgDiR1T8fEyCc6QX+2Q=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGLD-009aAs-3U for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:47 +0000
Received: by mail-pf1-f181.google.com with SMTP id 130so16836188pfu.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kIQ32jgESZghl2JsFuRf0mmCK8FvEn1HKHvqp4B/UI=;
 b=dfQedKuymKKcgaBkhG/S6LPnJ2O+4EvsNOgODJ6HJIVIONp85PHUPikgR1OK0QEXN5
 yllHZOH3ybASQiMP5BnKEWHTPiCoHka0zDja58Ru610nhX2hFD55wJ8Gd376sGcaf689
 bZrfvpTt8G5QxybOH/Q6elDPBkfe6Fc3kWWsMNhs/R9vrbLsrZ8uD+rka72YKKWWWGgG
 dWU5w6rAAJp2LD2+bLNGgBA0LMOcxmf8XyqrkCvTB+U0KRHPVRqOWqltLY33KWJ08EtL
 x4VuHCxKqbKwgsffO/TRtj8XIVLeukEUR03vIqJL55yVembQK6w940oX9YlEtm9O5Cyv
 atIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kIQ32jgESZghl2JsFuRf0mmCK8FvEn1HKHvqp4B/UI=;
 b=0PWhPuWKsq/YozXWWkLrlpb5jqu27EQP3emTWh4lKZJWTZ5Ik+18i84/Z+HYYtZj7g
 Y6dd94cmrOojwLaCxlGy5hGj5+GWrhSKV+2bV7amPlnm7vCb81nQGONyI3KKypCdbbUS
 RPfoDuB1rNvJx6CiTQELm2BjAgk1KtWfaL4VjxNy4iBY7diKrqfz6HJiNJR9U6Xi329A
 6O6dhC9SV6eL2TcnQtGcYmhpAUeE2lrcs5ZTu20Foho5npoS/H/tvtfPWFntMn0BO7w7
 77VMh0ipN8/UK9gDTExw1V4fbrqd4JbC5jwA4m8kxFlkORwYC8mro6tcj/UYyChiWihx
 KT5w==
X-Gm-Message-State: ACrzQf3u4/0Op3lsR9oEDWhXeGa3ciZsfLFf5BqE62DVcaUQZirY/AoF
 NOddIXWjg2t8bSPmnnIDCqM=
X-Google-Smtp-Source: AMsMyM6M+HYXpiH0U+VfyXFrJ89SEz8gDigaYYVWPndroJTYZEBXjmxNBwyGQzQ73aNi+YK3GqHHhQ==
X-Received: by 2002:a63:5a1b:0:b0:461:9934:6f62 with SMTP id
 o27-20020a635a1b000000b0046199346f62mr22432948pgb.266.1667405501408; 
 Wed, 02 Nov 2022 09:11:41 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:41 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:31 -0700
Message-Id: <20221102161031.5820-24-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers to find_get_pages_range_tag(),
 find_get_pages_tag(), pagevec_lookup_range_tag(),
 and pagevec_lookup_tag() have been removed. Signed-off-by:
 Vishal Moola (Oracle) --- include/linux/pagemap.h | 10 -------
 include/linux/pagevec.h
 | 8 ------ mm/filemap.c | 60 mm/swap.c | 10 ------- 4 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGLD-009aAs-3U
Subject: [f2fs-dev] [PATCH v4 23/23] filemap: Remove
 find_get_pages_range_tag()
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

All callers to find_get_pages_range_tag(), find_get_pages_tag(),
pagevec_lookup_range_tag(), and pagevec_lookup_tag() have been removed.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pagemap.h | 10 -------
 include/linux/pagevec.h |  8 ------
 mm/filemap.c            | 60 -----------------------------------------
 mm/swap.c               | 10 -------
 4 files changed, 88 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 28275eecb949..c83dfcbc19b3 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -742,16 +742,6 @@ unsigned filemap_get_folios_contig(struct address_space *mapping,
 		pgoff_t *start, pgoff_t end, struct folio_batch *fbatch);
 unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
 		pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch);
-unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
-			pgoff_t end, xa_mark_t tag, unsigned int nr_pages,
-			struct page **pages);
-static inline unsigned find_get_pages_tag(struct address_space *mapping,
-			pgoff_t *index, xa_mark_t tag, unsigned int nr_pages,
-			struct page **pages)
-{
-	return find_get_pages_range_tag(mapping, index, (pgoff_t)-1, tag,
-					nr_pages, pages);
-}
 
 struct page *grab_cache_page_write_begin(struct address_space *mapping,
 			pgoff_t index);
diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 215eb6c3bdc9..a520632297ac 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -26,14 +26,6 @@ struct pagevec {
 };
 
 void __pagevec_release(struct pagevec *pvec);
-unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *index, pgoff_t end,
-		xa_mark_t tag);
-static inline unsigned pagevec_lookup_tag(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *index, xa_mark_t tag)
-{
-	return pagevec_lookup_range_tag(pvec, mapping, index, (pgoff_t)-1, tag);
-}
 
 static inline void pagevec_init(struct pagevec *pvec)
 {
diff --git a/mm/filemap.c b/mm/filemap.c
index cc4be51eae5b..8ad45c2e22cd 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2318,66 +2318,6 @@ unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
 }
 EXPORT_SYMBOL(filemap_get_folios_tag);
 
-/**
- * find_get_pages_range_tag - Find and return head pages matching @tag.
- * @mapping:	the address_space to search
- * @index:	the starting page index
- * @end:	The final page index (inclusive)
- * @tag:	the tag index
- * @nr_pages:	the maximum number of pages
- * @pages:	where the resulting pages are placed
- *
- * Like find_get_pages_range(), except we only return head pages which are
- * tagged with @tag.  @index is updated to the index immediately after the
- * last page we return, ready for the next iteration.
- *
- * Return: the number of pages which were found.
- */
-unsigned find_get_pages_range_tag(struct address_space *mapping, pgoff_t *index,
-			pgoff_t end, xa_mark_t tag, unsigned int nr_pages,
-			struct page **pages)
-{
-	XA_STATE(xas, &mapping->i_pages, *index);
-	struct folio *folio;
-	unsigned ret = 0;
-
-	if (unlikely(!nr_pages))
-		return 0;
-
-	rcu_read_lock();
-	while ((folio = find_get_entry(&xas, end, tag))) {
-		/*
-		 * Shadow entries should never be tagged, but this iteration
-		 * is lockless so there is a window for page reclaim to evict
-		 * a page we saw tagged.  Skip over it.
-		 */
-		if (xa_is_value(folio))
-			continue;
-
-		pages[ret] = &folio->page;
-		if (++ret == nr_pages) {
-			*index = folio->index + folio_nr_pages(folio);
-			goto out;
-		}
-	}
-
-	/*
-	 * We come here when we got to @end. We take care to not overflow the
-	 * index @index as it confuses some of the callers. This breaks the
-	 * iteration when there is a page at index -1 but that is already
-	 * broken anyway.
-	 */
-	if (end == (pgoff_t)-1)
-		*index = (pgoff_t)-1;
-	else
-		*index = end + 1;
-out:
-	rcu_read_unlock();
-
-	return ret;
-}
-EXPORT_SYMBOL(find_get_pages_range_tag);
-
 /*
  * CD/DVDs are error prone. When a medium error occurs, the driver may fail
  * a _large_ part of the i/o request. Imagine the worst scenario:
diff --git a/mm/swap.c b/mm/swap.c
index 955930f41d20..89351b6dd149 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -1098,16 +1098,6 @@ void folio_batch_remove_exceptionals(struct folio_batch *fbatch)
 	fbatch->nr = j;
 }
 
-unsigned pagevec_lookup_range_tag(struct pagevec *pvec,
-		struct address_space *mapping, pgoff_t *index, pgoff_t end,
-		xa_mark_t tag)
-{
-	pvec->nr = find_get_pages_range_tag(mapping, index, end, tag,
-					PAGEVEC_SIZE, pvec->pages);
-	return pagevec_count(pvec);
-}
-EXPORT_SYMBOL(pagevec_lookup_range_tag);
-
 /*
  * Perform any setup for the swap system
  */
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
