Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBCF5315F7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 May 2022 22:31:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntEiB-0006K9-Vn; Mon, 23 May 2022 20:31:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ntEiA-0006K3-Vb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 20:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0RLKIfkuXXWYU9D0gZpXgwZwjFwS2cI6rwKaQI6z/80=; b=G/b7h6eePkGVTy4J9SAHzvuvXV
 7p0Ot/0NbFCINE6g/qJZ38dehn/scTQpqIxt5wUWNtXsjzThbEaxs7NZ3JadjpoyMJtVQ1zVfIWcp
 xQSvATyvCLmtdprivxEMyG6oWl1+lKVJHVHI/AgzeN82I2mwZ3bMmmcCxbfwSHzIZJG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0RLKIfkuXXWYU9D0gZpXgwZwjFwS2cI6rwKaQI6z/80=; b=V
 VIcdyFZaUF2xB/cj/lAFcW3J4hj3jyG6lwCdrv2wmQ6KzcGsNeHt96rN9/QvIAUqWfvBKw8fERacp
 27jdmPvnfBC/NIafB28ZonNKCH51HplqRW2+3un2yyNK8dp8JLlsi8M2PVifX8NGBxLaKszOVNFho
 IvqfnHy3S49n9grM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntEi9-003FA2-5d
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 May 2022 20:31:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BD1A614C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 May 2022 20:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D88C385AA;
 Mon, 23 May 2022 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653337879;
 bh=ATBLJd4R9p2BH2k5eNbEbBTxitdH8pJ6jfCAN1Nfncc=;
 h=From:To:Cc:Subject:Date:From;
 b=XtRPOX3zTsY6p+zWpqOWmnZg8gvZwvBjV6Nr36naqn2hYe3N5GQQQINLf3A9oIrzO
 8hQyeIRsibdv0AFgcA8vxU3nHXs1CSgoCZSQCyFrJhFmeLooP2Gj8JDwmvWCip/HWX
 t3xMXku2H4gEYW2MANR1OKMzN68lpM3HPaGnpT3HmVUJupyO7OofP22N+ze+KKoeZT
 O8d4jb1UMu6QwGfmfTmZrMuwClyP5mZpG3oYPUllx7xPHLaCnDaKMuI/H9S+n8E9yv
 dyCCUij1kTLUcQA4+OGJQtaywRIA9wL982TQBnP67B6FDAjWc7Wi1srxnX+MU9SNHk
 Qqfix5kjamhJA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 23 May 2022 13:31:17 -0700
Message-Id: <20220523203117.1810289-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Android security team does not allow to use SG_IO.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- include/android_config.h | 1 -
 lib/libf2fs.c
 | 4 ++-- 2 files changed, 2 insertions(+), 3 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntEi9-003FA2-5d
Subject: [f2fs-dev] [PATCH] f2fs-tools: do not use SG_IO in Android
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Android security team does not allow to use SG_IO.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/android_config.h | 1 -
 lib/libf2fs.c            | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/android_config.h b/include/android_config.h
index 4bcd5890313f..5f5c693cbbb3 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -24,7 +24,6 @@
 #define HAVE_SYS_XATTR_H 1
 #define HAVE_UNISTD_H 1
 #define HAVE_UUID_UUID_H 1
-#define HAVE_SCSI_SG_H 1
 
 #define HAVE_FALLOCATE 1
 #define HAVE_FSETXATTR 1
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 961e70cb7b1b..ad8d1bd03509 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -896,7 +896,7 @@ int get_device_info(int i)
 #ifdef HDIO_GETGIO
 	struct hd_geometry geom;
 #endif
-#ifdef __linux__
+#if !defined(WITH_ANDROID) && defined(__linux__)
 	sg_io_hdr_t io_hdr;
 	unsigned char reply_buffer[96] = {0};
 	unsigned char model_inq[6] = {MODELINQUIRY};
@@ -998,7 +998,7 @@ int get_device_info(int i)
 #endif
 		}
 
-#ifdef __linux__
+#if !defined(WITH_ANDROID) && defined(__linux__)
 		/* Send INQUIRY command */
 		memset(&io_hdr, 0, sizeof(sg_io_hdr_t));
 		io_hdr.interface_id = 'S';
-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
