Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A81C09D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 23:59:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUHDW-00044c-LX; Thu, 30 Apr 2020 21:59:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jUHDV-00044V-Lk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 21:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Cwm7q37wd5a49T4hM9tpsz7D3qzUxu8CT8JBwv0w4c=; b=HxLJEhCRUDL53rw1J6S9v8FcyC
 +Uz4x2I2lJExVAA0dQYQXZxd90+t7vE2cI9GdB5nGFZo0mjbf6RuNpKPVUQ67qvzzJjf0F2Fw0ep3
 Ab237HanV9rpXSAZ4vtyz5K3vEinYGqvku/LBXGBDZK805HNNE3pXGc58Tkm+VjWT1KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Cwm7q37wd5a49T4hM9tpsz7D3qzUxu8CT8JBwv0w4c=; b=hjC1frVBuhS5r7aKlRQSMqa9qD
 lfVIo0oAl1AmLHK+wJeHFu/2OAkhmYEJu6l/fxAsbgQx0segTIEWkWJ9jpDlQFKtYPC9IVckOXlXS
 joq8/bTMr2vPc6dWw6+fri69EeJB7hDjcGSKAorWONWoMqmB7MkFwmhdmXoPfy4QEm0Q=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUHDT-0009eH-GL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 21:59:37 +0000
Received: by mail-wr1-f68.google.com with SMTP id i10so9199432wrv.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Apr 2020 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Cwm7q37wd5a49T4hM9tpsz7D3qzUxu8CT8JBwv0w4c=;
 b=NGAEKGruhKtx7ZWTrFdEqTmqAVl/YDbNX5SVHiheCt5mgGQXMvPqVsB2mWj4W+6TZx
 avj1y2aqFM2fM4mYbpeY1mNHjz5L5wFBJHZ7nqGDO/UfrsVe7K3fK+19Qz0xhaRBCJF8
 cnG9jsv0Y3cuCHExnrUC59PgGg5ldN6zReZ4l/MkqDih/pWf2Qq5leOqyJa1Ea1uUvqL
 KSJUgjKhSgiIMTbhcESV0rK/2/wlrqs0rRp/j53oVanG3NSXpHazoglUXFC2CIoq8QGs
 T0RBK7fYVyj0odwSJ7t5g5PDfIz9c6vhMkT7fz1ruAgadlRAj8EWlz0SjkauUs46ppHW
 r7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Cwm7q37wd5a49T4hM9tpsz7D3qzUxu8CT8JBwv0w4c=;
 b=A3/NF9i8fgzINtlvvaO9uxF98QgZkGEgllhQ1AEbg2MSo4NtPQcS0VqYTPME0Ut68g
 zMyy7usLcXKHlKk/WqTw7tfzgZJoBn9MnVJoqUVrlmnWunkL+P4wfKHGYWO/hV+tDHv6
 B/vMWFlKyEuOkB2mh5lxZpsiHXmSxFDs5nJGK4itposr58EyUC6arAL8Cg1jRbYRLl1q
 0CiJR4StjXdazPOmVDQL3OYsQmrdrjppFCh9g4gtJoy00E1UF8FWNxfhB7W0GnSjyK7V
 ekGWPRXoHDdOn2aAWtxtzOlpFEalqbFOZWliztZZ0h6kZog+DbXwqO8DFdl68a+51yhF
 UexQ==
X-Gm-Message-State: AGi0PuZESg1O/T9dxTY3sqQBahcVEEa4ujpsk1cH87AHLjXBGaTnXDJg
 7/h10YwoTuNcBZY9447O25DVWMr1PnpHHQ==
X-Google-Smtp-Source: APiQypIDTj3Uj7biPphTd2Cba892cORi5pdinqFvBm6XPxrzHDikqrxlAy/dZ1nN6NDVa1Eq5TMhqw==
X-Received: by 2002:a17:906:b2c4:: with SMTP id
 cf4mr538626ejb.340.1588283557346; 
 Thu, 30 Apr 2020 14:52:37 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b82f:dfc:5e2a:e7cc])
 by smtp.gmail.com with ESMTPSA id f13sm92022ejd.2.2020.04.30.14.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:52:36 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 30 Apr 2020 23:44:42 +0200
Message-Id: <20200430214450.10662-2-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxera.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUHDT-0009eH-GL
Subject: [f2fs-dev] [RFC PATCH V2 1/9] include/linux/pagemap.h: introduce
 attach/clear_page_private
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, david@fromorbit.com,
 Song Liu <song@kernel.org>, Yafang Shao <laoar.shao@gmail.com>,
 Mike Marshall <hubcap@omnibond.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Chris Mason <clm@fb.com>,
 willy@infradead.org, hch@infradead.org, devel@lists.orangefs.org,
 Josef Bacik <josef@toxicpanda.com>, linux-raid@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Altaparmakov <anton@tuxera.com>, Andreas Dilger <adilger@dilger.ca>,
 Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
 Yang Shi <yang.shi@linux.alibaba.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 linux-btrfs@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The logic in attach_page_buffers and  __clear_page_buffers are quite
paired, but

1. they are located in different files.

2. attach_page_buffers is implemented in buffer_head.h, so it could be
   used by other files. But __clear_page_buffers is static function in
   buffer.c and other potential users can't call the function, md-bitmap
   even copied the function.

So, introduce the new attach/clear_page_private to replace them. With
the new pair of function, we will remove the usage of attach_page_buffers
and  __clear_page_buffers in next patches. Thanks for the new names from
Christoph Hellwig.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: William Kucharski <william.kucharski@oracle.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Yang Shi <yang.shi@linux.alibaba.com>
Cc: Yafang Shao <laoar.shao@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: linux-raid@vger.kernel.org
Cc: Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: Christoph Hellwig <hch@infradead.org>
Cc: linux-xfs@vger.kernel.org
Cc: Anton Altaparmakov <anton@tuxera.com>
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: devel@lists.orangefs.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Roman Gushchin <guro@fb.com>
Cc: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
RFC -> RFC V2:  Address the comments from Christoph Hellwig
1. change function names to attach/clear_page_private and add comments.
2. change the return type of attach_page_private.

 include/linux/pagemap.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index a8f7bd8ea1c6..2e515f210b18 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -205,6 +205,41 @@ static inline int page_cache_add_speculative(struct page *page, int count)
 	return __page_cache_add_speculative(page, count);
 }
 
+/**
+ * attach_page_private - attach data to page's private field and set PG_private.
+ * @page: page to be attached and set flag.
+ * @data: data to attach to page's private field.
+ *
+ * Need to take reference as mm.h said "Setting PG_private should also increment
+ * the refcount".
+ */
+static inline void attach_page_private(struct page *page, void *data)
+{
+	get_page(page);
+	set_page_private(page, (unsigned long)data);
+	SetPagePrivate(page);
+}
+
+/**
+ * clear_page_private - clear page's private field and PG_private.
+ * @page: page to be cleared.
+ *
+ * The counterpart function of attach_page_private.
+ * Return: private data of page or NULL if page doesn't have private data.
+ */
+static inline void *clear_page_private(struct page *page)
+{
+	void *data = (void *)page_private(page);
+
+	if (!PagePrivate(page))
+		return NULL;
+	ClearPagePrivate(page);
+	set_page_private(page, 0);
+	put_page(page);
+
+	return data;
+}
+
 #ifdef CONFIG_NUMA
 extern struct page *__page_cache_alloc(gfp_t gfp);
 #else
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
