Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8E616794
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGLI-00067g-9G;
	Wed, 02 Nov 2022 16:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGL1-00066D-Es
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K9oQGBma55+7a0HBQARXA8wNbnmnkmU7HtFBuB0SMcU=; b=eMVYqA4X48TzDgV/S+gxKFasEC
 aR9eh0Ow+9DyVCreUNgNQBp/6iFjcATALN0QG3Sys4PpjjpxQ62KmGNiY7Q9k08+yCr0JjBq2hQwg
 ZnoLyQa+fkN3VUqgcBVtJ2s4Nc6oqfexhacAo3cdc9t4u+3DRIWAe8mgW3tNhP7qlWCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K9oQGBma55+7a0HBQARXA8wNbnmnkmU7HtFBuB0SMcU=; b=U6ix/VFinIAS0orNsVc+xI/zlF
 s77qI2+8S281W2hv9UNIyCDIwpU8VZT/t1P6Wb7ZwZMpEykW3GLTsbCW8Sqk62TgdE02DvBvEj1qp
 Xg39J+XQ8GmewXkohWtzzqQrAz0H3D/9OsvJAUUqYzHDQFWJLJ0KWQiTd6/mSTpCtPlY=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGKs-000596-9U for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:32 +0000
Received: by mail-pl1-f177.google.com with SMTP id 4so17056700pli.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9oQGBma55+7a0HBQARXA8wNbnmnkmU7HtFBuB0SMcU=;
 b=lgRGvbBXfYuj04wlBtpVHwy2yZsFFIANJMcP3krdA79wzBh4OScTeSvjJg4lQ3GiI3
 qzedQnIEursJo8Y8wrorW1k3nnG6uW/QS2vrVmIvXFZlg1i7O4HcsiQIkHBi6LqK3Hws
 /m7aEjRd4+lrOka8mBd7EHcq45xsSi/7s+3yt3h27vjVFT6859E+s3o4irrHvYyKTxlH
 6KXijZ6dtNgWx/FcJ0jqINoyCdNdAJm6gC+OU2m4I7MMiT2P+IkB6xQggwX5UN9tdlUH
 oIy8W/ni9KIfG99ZHM5kVgqC7Om0fcn8SoY/XV7phYth7Ym2e9szQ6efXI8rxGZIQ5Qz
 7ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9oQGBma55+7a0HBQARXA8wNbnmnkmU7HtFBuB0SMcU=;
 b=b9Bz7B7QJAWmFm+qEw5H3jmyGkZQF0Bc+qlS9JjX69zt57Oa8kSnW1VbMAWL2kK4v1
 Bgv+5WOY5d4pDR8/v9ISzpeCjYVPSKIyXBeMhbkL7T4U9A/UbF4irbpegonv6pC+aC7k
 SAAy3sbE+mLTCkB0N+NEyzPncECADTUaEJYZx/URwPI96OhdAyILja0ogLkQPOyfQr5A
 vBK099xmdDl0siWPXT1JDFWH1HguQaW7/rnAT55a7oXFxeKxGo71EDGbgs7IFWpU6jm9
 Bx9wO3wsETm07S3pAatJx6tY7T5ELrkAcz+UyaSme8c5ZUPtWYmYEj5XsqqWsBY5PaQl
 dQpA==
X-Gm-Message-State: ACrzQf3S5sJnIrI5lD7UmEXajdLMTp8bxsqIEjrr+YQywi6GFk75zPTO
 NoEABonmTyY0Qb92cjUs/58=
X-Google-Smtp-Source: AMsMyM6/72+MYEmeobRp0nXOdIc9AWtvXPDkE1Loq96kr4fO9Vd06b8/zC8fQ3xgY4YxH0AYxNXhtQ==
X-Received: by 2002:a17:90a:3c8a:b0:213:8043:4b7f with SMTP id
 g10-20020a17090a3c8a00b0021380434b7fmr34554910pjc.99.1667405480651; 
 Wed, 02 Nov 2022 09:11:20 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:20 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:17 -0700
Message-Id: <20221102161031.5820-10-vishal.moola@gmail.com>
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
 no trust [209.85.214.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGKs-000596-9U
Subject: [f2fs-dev] [PATCH v4 09/23] cifs: Convert
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
index f6ffee514c34..789fd0397cb4 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2520,14 +2520,40 @@ wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
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
+		folio_ref_inc(folio);
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
