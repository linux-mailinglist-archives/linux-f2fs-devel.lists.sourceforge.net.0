Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B69EB93878C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2024 04:40:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sViyV-0000QW-OC;
	Mon, 22 Jul 2024 02:40:32 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sViyU-0000QN-88
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 02:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elEEYZRwm6kdR8yLX+1o/shGO6nrBPkjdm0LE5hLK6w=; b=FfEpohrrI6PLKVNv7hnTD3+awO
 4kZGoWKZ4gFgdTMYicL3/rsk4siSJwCxswemf6/FTfUsSnSp8/6ElVeA2aoGrOjMu3bOyaubi7kOb
 UVJmfiIOVBT0yy2RUmVJPu6OGUWbFKJNAY0A2LqpeEmRhcO+S9Wq0ZKgwOe2MSg2OnfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=elEEYZRwm6kdR8yLX+1o/shGO6nrBPkjdm0LE5hLK6w=; b=M
 URsP4bHc/4dWN22Gw9mY01TsxkgH8EfZysxuH+T+iZWifjMM0Uq+aXE+W/r88EXMUykTT6ECmAIsP
 Q5L4OxGecuK1kItVkaF2DwTngfLYggIEzHgct/2vklQ6N7vvlH+j3u4RTtm7SIe5dJfimF2H5gr3/
 FDurq8byWaquz46s=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sViyU-0002Ab-Dl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 02:40:30 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fc692abba4so23032355ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Jul 2024 19:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721616024; x=1722220824; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=elEEYZRwm6kdR8yLX+1o/shGO6nrBPkjdm0LE5hLK6w=;
 b=Qe3mvnwYiopWJd9uA2dSAdmEGjBGePGvfMsUi3qCVlnp+I4dXm2wE9Q0KH5REP6YZX
 PxVVr/2IFLHFq+eTCg5qj7pNOKVuf6W/n/sCz5EwVZdPWtZKrW9YIylzUeDdUcefWiXE
 NYKdg3tEBRQCVfZJdd/2vIiTEnJ/rl4y4DWbHn1hHconffwqEjveAthfglue0DwJtct3
 axXsYSYgtCq6ZVe41bbDlBVBOfhAn3FIvlGMo72P54qLodcdE3dd7dwePLfid8jCQv4B
 2pnurukMQfyV8j8N3YF7YCzfuV/8LSTAzu73e3hNJjRkLta1950bQw8GmgWLr+qy6pxa
 2UyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721616024; x=1722220824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=elEEYZRwm6kdR8yLX+1o/shGO6nrBPkjdm0LE5hLK6w=;
 b=vtUSS5hiM3hUmZ40WXewEnoe6nRLLqXhHsPcHQ8ZmE/Ji9/S3Uaq+1qfoEZ5Y+AZRt
 PWE5m1FofuuQygNk22jCDmHjJbU4qWGgwk0UlpFcMOIJYR9eQCPAM7XGkLV6IfnP7jgi
 e8k8s4ckwy4CvIYMMUTZi8bjvVUPqSXZVvF0H3HTNoHAnpF83SO3NPpLHnhmtaHJgDiF
 IoW3FUz7s/2IQHG/9eDri623ommPkCDhKZb9Ydw1koh6peviLDYNVEXO3g6rYvxh8QGF
 LIpW6P3YUsOAkDimOv2CVIDNBH/T2CBQuDw3JdwwzQ5WZ9Ouzmr460yekXNkXFAb/U3z
 rLlg==
X-Gm-Message-State: AOJu0Yz7UVuZiGX6uiwfcTwnQqoSPluH0l0f6murlNrXLSBQiMAAwlKS
 ycpkaZmI4TN4rSesSo0s4RY1fvoErX9Hm241YMy+jJA+2lbiG08zZqF7yNjtb2M=
X-Google-Smtp-Source: AGHT+IEKI4x1Wl5vEQnLTJBYAlodFx72aEbEvTd8pBGZHw4GzeBO9F+7+fB1ZFOG2INQebf0Jct5rw==
X-Received: by 2002:a17:903:22cb:b0:1fc:4aa0:fb14 with SMTP id
 d9443c01a7336-1fd74520166mr37051425ad.2.1721616024246; 
 Sun, 21 Jul 2024 19:40:24 -0700 (PDT)
Received: from localhost ([114.242.33.243]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fda360473dsm4798135ad.203.2024.07.21.19.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 19:40:23 -0700 (PDT)
From: Julian Sun <sunjunchao2870@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 21 Jul 2024 22:39:12 -0400
Message-Id: <20240722023913.54788-1-sunjunchao2870@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The macro on_f2fs_build_free_nids accepts a parameter nmi,
 but it was not used, rather the variable nm_i was directly used, which may
 be a local variable inside a function that calls the macros. Signed-off-by:
 Julian Sun --- fs/f2fs/node.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.177 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.177 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sViyU-0002Ab-Dl
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: fix macro definition
 on_f2fs_build_free_nids
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
Cc: Julian Sun <sunjunchao2870@gmail.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The macro on_f2fs_build_free_nids accepts a parameter nmi,
but it was not used, rather the variable nm_i was directly used,
which may be a local variable inside a function that calls the macros.

Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b72ef96f7e33..58721a55f173 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -20,7 +20,7 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
-#define on_f2fs_build_free_nids(nmi) mutex_is_locked(&(nm_i)->build_lock)
+#define on_f2fs_build_free_nids(nm_i) mutex_is_locked(&(nm_i)->build_lock)
 
 static struct kmem_cache *nat_entry_slab;
 static struct kmem_cache *free_nid_slab;
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
