Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 877193467C6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 19:34:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOlqw-0003zp-9d; Tue, 23 Mar 2021 18:34:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1lOlqG-0003xN-PD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SR9GYzClhPtlgbtKvTINRCmtCiv/xx+djENxsAUHwII=; b=FVlHkZuKjW0oqEiaf+MBOqVf17
 u8tWgtX73uUEtjHG6qzeZsyt85UXSoX8kP+QHlLnYSesOysnDDHnt05itzlQKTWQlzQNHVm+N30sg
 osdXc1cwPia2f5xWruY+SzVlW/qdbsclQ4Go0qF8Ot2daeUpkk6aQKCU0NoWIKDoC82I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SR9GYzClhPtlgbtKvTINRCmtCiv/xx+djENxsAUHwII=; b=UnkUdazDaDXNOOD+B3TY2UJIS7
 WhRA0ckEO8hFdF0sZc/WhXVZx5hS35WHB6TLHbhxUBzUCJLFqQcNbtHRexhbCVpRVQdwSDhnFuC5u
 XJOyiNpNFCY+vf3TjnPXtASfViVzRrSFaIzYb5CUKKUxFTPkhsipP3VBc3CGrZT29l3c=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOlqC-0007G9-Uw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:33:24 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2401:4900:5170:240f:f606:c194:2a1c:c147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: shreeya)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 484801F44A65;
 Tue, 23 Mar 2021 18:33:04 +0000 (GMT)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Wed, 24 Mar 2021 00:02:00 +0530
Message-Id: <20210323183201.812944-5-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323183201.812944-1-shreeya.patel@collabora.com>
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1lOlqC-0007G9-Uw
Subject: [f2fs-dev] [PATCH v3 4/5] fs: unicode: Rename utf8-core file to
 unicode-core
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rename the file name from utf8-core to unicode-core for transformation of
utf8-core file into the unicode subsystem layer file and also for better
understanding.

Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---
 fs/unicode/Makefile                        | 2 +-
 fs/unicode/{utf8-core.c => unicode-core.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename fs/unicode/{utf8-core.c => unicode-core.c} (100%)

diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index b88aecc86..fbf9a629e 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -3,7 +3,7 @@
 obj-$(CONFIG_UNICODE) += unicode.o
 obj-$(CONFIG_UNICODE_NORMALIZATION_SELFTEST) += utf8-selftest.o
 
-unicode-y := utf8-norm.o utf8-core.o
+unicode-y := utf8-norm.o unicode-core.o
 
 $(obj)/utf8-norm.o: $(obj)/utf8data.h
 
diff --git a/fs/unicode/utf8-core.c b/fs/unicode/unicode-core.c
similarity index 100%
rename from fs/unicode/utf8-core.c
rename to fs/unicode/unicode-core.c
-- 
2.24.3 (Apple Git-128)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
