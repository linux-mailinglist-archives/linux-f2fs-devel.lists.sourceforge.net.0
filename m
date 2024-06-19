Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9F190E14C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2024 03:25:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJk4l-0001hu-IQ;
	Wed, 19 Jun 2024 01:25:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3ezNyZgYKAOQJXUYKTMUUMRK.IUS@flex--drosen.bounces.google.com>)
 id 1sJk4j-0001hn-GW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 01:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q0snxtFKtWwS54VMFBCX9VcL4eoWb6LM1BHnggyUhgE=; b=cX0fbtQxUj4rVs3GZH9t0geoqj
 B3+0gWCXcZ9ls4IBdK/OVbRBc38WxAO9vMXkRasyg9NOVwg2kN8Ga7hCzzJ531r9EyJ8Mdn2vtD3j
 3y7fbp3e756k4Jvn6GKe2/e4wGyhr2y4pmhpHxs7e+N57VYsrCTC0PHiilHCOe+vUVvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q0snxtFKtWwS54VMFBCX9VcL4eoWb6LM1BHnggyUhgE=; b=l
 FpvljZRQrETX5WWNbwJBj9eVRqQH8k+vcqsy5NFeUwiTAWAfmJ+1B/TRoKnbC45GmagPprbHgWc0W
 3gY+evLFYUMBRKd+pUgO70fb4oDIW9N107UpeKAy3zQSU46do0kaxSp2TqkXeiZRUuf4PWAlqLG7J
 lDq4Ruihj7f3e//4=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJk4k-0003l1-Qt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Jun 2024 01:25:26 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dfe44496da9so10804567276.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2024 18:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718760315; x=1719365115;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q0snxtFKtWwS54VMFBCX9VcL4eoWb6LM1BHnggyUhgE=;
 b=RK5vYEc4qxTl1t+BAFTnabVOA5sLFWDRjaKQxc/iYgqysm188hZ7Mo+R3jEbeSEjxf
 vVAqJyrSQ29oqc1MofqDUrg8OGxrEQ/NOq/gixf3ZKGhsHKP/TgS8SAQ4UoS5evXLtF+
 kZaIkZQVR8pDCEmQouxyqLOtA6C5kYpvVXZEWn8lQV+mqZvZHQ4k8lcq5vZIaWHvgxes
 Iog2eVkJDhAWpoxs6Yc128k1wU+lHHj0NYAXm8xIkmKQOClvJqxb7uAzEQz1jQdVW/j0
 JjNkH8js0+07hxiazKPCO8vPedKQe9vSHPVW3G0qDh+adePeXyI+1fbOiHyCPZiBRs5y
 osxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718760315; x=1719365115;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q0snxtFKtWwS54VMFBCX9VcL4eoWb6LM1BHnggyUhgE=;
 b=B3+LXBxKrfAzwN2yNhdyaqzcACbQeBJPsVAR4XI+zig5fQjceTWbYmH77WqLbdPZt1
 SrwXBmmYPcJCRbcgqImt4WZWEYLTnP8cDPA4eJrTrggQdugkq1wM3KuAFTJahZhOfi9b
 9PoMwO+9VNwnFo5RBZapsj3wvX9H8qNYizs1yOC5zEEnn4wzqMsDfQNrDAtCcDPsdGg3
 Dobcce+mNfgptX3RyU6rCrPQ6AYTICsQ2J9M+W8un6Dsyxd2P6dAF8yKn4oPtILCZp/I
 9JnT6Y6gjAR8ahZ0AjcxBVFi2RWvxbW5OsnrhnWGCShOgoG499Jmwq5m7XwzY1gKafwp
 PdGA==
X-Gm-Message-State: AOJu0YxROpjQCtSUxnlqeRHdUBTUEwc0SnXgLP6BllILSEuwiIgR/1sr
 Z846vu4ZCtUx+zP15Ev/cycKYktsPkS3sGo1KM9g+7TjpluK3SPV+aC55j7YQ/gq5CHtOC0K90p
 bb2ew37DqG/B4bq1isi0xVQ24tRNmNQ2R32ikW3Itk07gx/Ukgb9j7pnFOCkr9IHcsr2+gUi3PN
 GJVbQDWAM4jZvqSdtDf0p21FjZ8qFRsLN7zcAGCa11mbcHxSiv+0vquA==
X-Google-Smtp-Source: AGHT+IGGLDLYIechVZeo1Gdwt6ZmtoiFMacwRs8BjN0Vr3VR4tBL6xQHWspxmX98VWhrcW1/E4T6dVSquUk=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:a0:a667:2fae:dc56])
 (user=drosen job=sendgmr) by 2002:a05:6902:2b10:b0:dfd:a911:5722 with SMTP id
 3f1490d57ef6-e02be230aa9mr311117276.8.1718760315210; Tue, 18 Jun 2024
 18:25:15 -0700 (PDT)
Date: Tue, 18 Jun 2024 18:25:09 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240619012509.1885974-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  These were described in man pages, but not within the help
 message. Signed-off-by: Daniel Rosenberg <drosen@google.com> --- fsck/main.c
 | 5 +++++ 1 file changed,
 5 insertions(+) diff --git a/fsck/main.c b/fsck/main.c
 index 6edc902..901fa7a 100644 --- a/fsck/main.c +++ b/fsck/main.c @@ -97,6
 +97,11 @@ void dump_usage() MSG(0, " -S sparse_mode\n"); MSG(0, " -a [SSA
 dump segno f [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.201 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.201 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.219.201 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sJk4k-0003l1-Qt
Subject: [f2fs-dev] [PATCH] dump.f2fs: Add help description for -rfyPo
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These were described in man pages, but not within the help message.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fsck/main.c b/fsck/main.c
index 6edc902..901fa7a 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -97,6 +97,11 @@ void dump_usage()
 	MSG(0, "  -S sparse_mode\n");
 	MSG(0, "  -a [SSA dump segno from #1~#2 (decimal), for all 0~-1]\n");
 	MSG(0, "  -b blk_addr (in 4KB)\n");
+	MSG(0, "  -r Recursively dump from the root inode\n");
+	MSG(0, "  -f Do not prompt before dumping\n");
+	MSG(0, "  -y Alias for -f\n");
+	MSG(0, "  -P Preserve mode/Owner/Group for dumped inode\n");
+	MSG(0, "  -o <path>  Dump inodes to the given path\n");
 	MSG(0, "  -V print the version number and exit\n");
 
 	exit(1);

base-commit: c1a97862b05d8a736ad8719939395c61bd71c982
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
