Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9865DE32
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6T-0003PS-1Z;
	Wed, 04 Jan 2023 21:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6R-0003PE-R3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o5rMPwcVI+xSSROnSv680xsAXd0L9APPXdNmyKQVwfk=; b=FYFoWV6yti9lcA8NtjfdgSOP+b
 o3O3sR7EbwLoT68U5V3lwbsy51bpuo+VW9avowOutZWFnzh6zZs1M7XQGHUUxTMqpJ0RliTdVk0Dz
 0fLox8+cfs3EoIiTix3DoZ2WCgiuhOo04oKUNU5XPNT3Fa0aTuEsKMFF5dLJ34MQaeIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o5rMPwcVI+xSSROnSv680xsAXd0L9APPXdNmyKQVwfk=; b=AScqcvuZ1AwkVMqR/xK3l4K/Ok
 nq5hxYuRgo0P9KCig7oRMjqowmTPPATm6eiYYXIJXkbB+8VHRZSFY1zDLXREAgMlvzzVkyqvizjjx
 R8UtraDToQ6xVyoHXE93VK/gmWVRKMU0dwOo+Z8JwpWnWVerk1FTmfY2KpRjpRG5JtmY=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6Q-0050xX-Nz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:15 +0000
Received: by mail-pl1-f176.google.com with SMTP id jl4so30936462plb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5rMPwcVI+xSSROnSv680xsAXd0L9APPXdNmyKQVwfk=;
 b=V1E1lT+81O0Bma5i45Jhgrf33b8ZyAtb2k6sBn232f4UkEzENvpQBKf03VCx514eGY
 A6/X8hia12tEOrxhlqm2jbfpueF7iUxDQK73Qfx/HnU0C1qeC98Y/FJf4DdEA7/pzkhJ
 0R9L0J423oCq4U1iJLCVDadB2Wt5+nvV5hLoYRWJbhwd1xBn6WpVA0bJU8YE7e7wpuN2
 7595aSPavZoug9A+uF4GQmMXauKv9jF+a45BkfZqX76YcFFkYKhW2/vAA8fJsRJSuef8
 gAsMn3ncTXpb8uuk1BimZcT4C8iNt/aS5nfn00OIYDqHLLwCBHXgWFjBa8QQEThwOWQl
 z5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o5rMPwcVI+xSSROnSv680xsAXd0L9APPXdNmyKQVwfk=;
 b=b5Vvi6ioQCTKkbn+h8FfPF7FWNrQMQcNYvPwHc9TcGuuaLyvEzaT2oSaI6vb4uK3rL
 guutMnI9lpVhTsOIuH66nAfQUBySx9K9pl56e5JcXuppl0jW+UB1Afy2LIU9ZiReZXRN
 3GTv7DOSj6RVqThtjwe6nyb1Bt+O72n+YT5J/rDytHig7xTi7JDD5YREUqLkdfVsgxNY
 bDBFmB678B9v1w/um7AmcRb9GuA1851JR7tH0aaAlgTUC8SLaav2VyEI2uQCw3tM6GEJ
 XMCheDUoEkpvmFdD9xeJ8aWkh1Qw42SHkgGGXkFc5Y3xsF0dYqIQYboTtL9lUnEagyVr
 Mgiw==
X-Gm-Message-State: AFqh2kqcGdmzd0BsDzoy+4bHC+Qqw5Fzu2qisDmz2UFtqG77V+ceAUcS
 JnMHjFY7KGn8T1BdxgHos+g=
X-Google-Smtp-Source: AMrXdXu6t3Nt2/819SMAwDAr2w3gRs9/WxQKALxtb70CxJaSaRfG2mUZCKyO3UNaiTmg39rKgXBHzw==
X-Received: by 2002:a05:6a20:cf62:b0:ab:ee20:b003 with SMTP id
 hz34-20020a056a20cf6200b000abee20b003mr46906430pzb.14.1672866909161; 
 Wed, 04 Jan 2023 13:15:09 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:08 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:34 -0800
Message-Id: <20230104211448.4804-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is in preparation for the removal of
 find_get_pages_range_tag().
 Now also supports the use of large folios. Since tofind might be larger than
 the max number of folios in a folio_batch (15), we loop through filling in
 wdata->pages pulling more batches until we either reach tofind pages or run
 out of folios. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pDB6Q-0050xX-Nz
Subject: [f2fs-dev] [PATCH v5 09/23] cifs: Convert
 wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
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

This is in preparation for the removal of find_get_pages_range_tag(). Now also
supports the use of large folios.

Since tofind might be larger than the max number of folios in a
folio_batch (15), we loop through filling in wdata->pages pulling more
batches until we either reach tofind pages or run out of folios.

This function may not return all pages in the last found folio before
tofind pages are reached.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/cifs/file.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 22dfc1f8b4f1..8cdd2f67af24 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2527,14 +2527,40 @@ wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
 			  unsigned int *found_pages)
 {
 	struct cifs_writedata *wdata;
-
+	struct folio_batch fbatch;
+	unsigned int i, idx, p, nr;
 	wdata = cifs_writedata_alloc((unsigned int)tofind,
 				     cifs_writev_complete);
 	if (!wdata)
 		return NULL;
 
-	*found_pages = find_get_pages_range_tag(mapping, index, end,
-				PAGECACHE_TAG_DIRTY, tofind, wdata->pages);
+	folio_batch_init(&fbatch);
+	*found_pages = 0;
+
+again:
+	nr = filemap_get_folios_tag(mapping, index, end,
+				PAGECACHE_TAG_DIRTY, &fbatch);
+	if (!nr)
+		goto out; /* No dirty pages left in the range */
+
+	for (i = 0; i < nr; i++) {
+		struct folio *folio = fbatch.folios[i];
+
+		idx = 0;
+		p = folio_nr_pages(folio);
+add_more:
+		wdata->pages[*found_pages] = folio_page(folio, idx);
+		folio_get(folio);
+		if (++*found_pages == tofind) {
+			folio_batch_release(&fbatch);
+			goto out;
+		}
+		if (++idx < p)
+			goto add_more;
+	}
+	folio_batch_release(&fbatch);
+	goto again;
+out:
 	return wdata;
 }
 
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
