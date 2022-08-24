Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC2059F2BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 06:41:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQiCi-0003d1-44;
	Wed, 24 Aug 2022 04:41:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1oQiCa-0003ct-6B
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 04:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jt/G83ni7I/FU67eFbWq1WL9BdjfSCuvjzHq4MUmPEs=; b=S4tXQeHQdt9InNWbNTAfTskJPx
 0AR94+4Fd5eiSTgxAr1NJ49kv2tEkr6zWJZONdohffVVtAYAMeZFMEJ/9JDh3nBcblCpGxnwnfwDP
 wpJeJOj7en7Fgb9zMrSmcfT50TjFjwii4sXged2GSbGnu4A93L6lqmOamfa6lWfdl8gA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Jt/G83ni7I/FU67eFbWq1WL9BdjfSCuvjzHq4MUmPEs=; b=X
 iwYmw5p33IqGZaQTO3YVVa/1pfuGCIYrQZOFZJ9CtI/Lgm12I4Z48AprqcLrxu61vXu1gS7zJ8kW4
 glSGjb6jeqQOP+xJjBOulMxEt2QQrNVzUJHes0KHxcAAWCE4+HEmEKOhSLgW961W8wgk/GRSuWb5/
 iI2mNAr+EdzT34yw=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oQiCU-00FB5l-Kr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 04:41:16 +0000
Received: by mail-pj1-f43.google.com with SMTP id bf22so15902501pjb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Aug 2022 21:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Jt/G83ni7I/FU67eFbWq1WL9BdjfSCuvjzHq4MUmPEs=;
 b=q1XIf8ztW5mT9Sh2FdsF9dkp7at9wmuUtHs7Av1YAgmiTtmG6WZUs0+SUrfEYPDpQo
 6oe6YnWx7Sk6v2rJg79rpBc2hQ9108SMJMziJ7P6rzmg4MrA9I220VYwz+6YrC3GSVsE
 f1MZnUr6IiM22JgngydNpGMo7q6vWG0ZQNT29sEOKTnZqrMEMfRATKwK9dQWf4wwKkrg
 rOZ4cbprq7pmkkCghzJu5CB+Bwzt9z+H6lpGFJXov6GbtI3cUGwDWcus9hYkmVVX9prB
 XKtVmeL3guur/Xp+a+XpxgZaGFV4Ykx1D/a37yZqeBprGDQCiK26FGmLlurP9ep6WqDS
 D8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Jt/G83ni7I/FU67eFbWq1WL9BdjfSCuvjzHq4MUmPEs=;
 b=ovsDmhwUpn+aZxj2mgVsmGFSvnYCHB4C5du/K9XRaAEq7jd4Qb/JI9xPVz04u72oRi
 TBFSsMYU2aVzOC/eKxYS4Wrz1JkNm0d1Hf0CLlWHKkjwgwdWjyC8UuYK6QS26UIuemAr
 Rb50vb5s3321LJvTsmxThXHSJh5zzG6HRQM46RaF1SXUM7HYw520nvhC3jvkpD7+vcAQ
 up9tT8MuDQpbnrMcntnttjeo3l4A8/QirC5Uro949SODuqgE0qmoSHjrk/2WOLGaYW8a
 CRbg6QazDp8fC+U/BMdZMiYcZGeFz9yaFqaHnTr+SmsGu7WKniTxc5/bz7T3/xd3oij5
 VF5Q==
X-Gm-Message-State: ACgBeo2TWnqQTtJH6iOtWNJ/iqB4VJmblC9loOz/JjS6xOTCkVfZOADw
 QCrQjud5+ttr1DHWkTsQywk=
X-Google-Smtp-Source: AA6agR4y83+GFBiVnDjmvYo0cbNHn+OGbaSKsWoLdo6c8JA1AqWsywufMRb7rrB6FtrkxBmKBkYVfQ==
X-Received: by 2002:a17:902:c94a:b0:16f:81c1:255a with SMTP id
 i10-20020a170902c94a00b0016f81c1255amr26475771pla.35.1661316064937; 
 Tue, 23 Aug 2022 21:41:04 -0700 (PDT)
Received: from localhost.localdomain ([218.150.75.42])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170902ebc700b00172b27404a2sm7551512plg.120.2022.08.23.21.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 21:41:04 -0700 (PDT)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-pm@vger.kernel.org
Date: Wed, 24 Aug 2022 13:40:13 +0900
Message-Id: <20220824044013.29354-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 2fd77fff4b44 ("PM / suspend: make sync() on
 suspend-to-RAM
 build-time optional") added an option to skip sync() on suspend entry to
 avoid heavy overhead on platforms with frequent suspends. Years later, commit
 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP Kconfig") added a
 dedicated
 config for indicating that the kernel is subject to frequent suspends. 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.3 HK_RANDOM_FROM         From username looks random
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oQiCU-00FB5l-Kr
Subject: [f2fs-dev] [PATCH] PM: suspend: select SUSPEND_SKIP_SYNC too if
 PM_USERSPACE_AUTOSLEEP is selected
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
Cc: chrome-platform@lists.linux.dev, len.brown@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, kaleshsingh@google.com,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 2fd77fff4b44 ("PM / suspend: make sync() on suspend-to-RAM build-time
optional") added an option to skip sync() on suspend entry to avoid heavy
overhead on platforms with frequent suspends.

Years later, commit 261e224d6a5c ("pm/sleep: Add PM_USERSPACE_AUTOSLEEP
Kconfig") added a dedicated config for indicating that the kernel is subject to
frequent suspends.

While SUSPEND_SKIP_SYNC is also available as a knob that the userspace can
configure, it makes sense to enable this by default if PM_USERSPACE_AUTOSLEEP
is selected already.

Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 kernel/power/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 60a1d3051cc7..5725df6c573b 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -23,6 +23,7 @@ config SUSPEND_SKIP_SYNC
 	bool "Skip kernel's sys_sync() on suspend to RAM/standby"
 	depends on SUSPEND
 	depends on EXPERT
+	default PM_USERSPACE_AUTOSLEEP
 	help
 	  Skip the kernel sys_sync() before freezing user processes.
 	  Some systems prefer not to pay this cost on every invocation
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
