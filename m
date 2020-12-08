Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED62D2585
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 09:16:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmYB2-0002Qo-JR; Tue, 08 Dec 2020 08:16:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robinh3123@gmail.com>) id 1kmYB1-0002QX-3S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 08:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jirsaBDzo/DYSNUUoXouAzzmgq1svQEaxyCrEMF0PXQ=; b=Z8hxUJh5NDCirk7/UcNNfVzAqR
 JQW70Jqj4RaihUhWZWBqGeaqPP3mCGFyY7EyqKhFNCikPO85DQIPWqcsFW5fvBZW3a4qLMln/3qc0
 60vLA9UjlXd5pBLHfT1j+u3ZBrpf563I1q9mDjsGlo5zUuF9GVr4No4169Io735Uvw1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jirsaBDzo/DYSNUUoXouAzzmgq1svQEaxyCrEMF0PXQ=; b=hwqP0xfDX8hr2FfdqMSjbfY5F1
 DQqQHsPqX9XKHK+CvThjM499Acs4LfZ6ouYCBF9hYVIZI0AaDsjB4TdpHZf243IX9hRCoPpAdST/D
 n6+IqJ/0AYiu3sVgpq2YCYDF8m5a3MNeTIlLNp6q9fU/dIpzxPiQQSBWuvHm+htJ0NFQ=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kmYAx-006JMn-52
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 08:16:51 +0000
Received: by mail-pf1-f195.google.com with SMTP id p4so7316938pfg.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Dec 2020 00:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jirsaBDzo/DYSNUUoXouAzzmgq1svQEaxyCrEMF0PXQ=;
 b=BWUgMeS7C73PPLQ+/D0+gd5Hbr1sRVwdsA4PlFl+qr6lchxiCLwvp0uThxF9xjeg2P
 1E7rTwr9537r3Q0QrUj8BPhZIbo/cJFwXWVfZP+9pwrwHS5Dt6lbPulUwg8mthwvEqFy
 LNSptu0B/Oaoy4RvPX6TAe6HvkArtlNM9ZHsslpfjZO5IYKtQLNo+oxvM8pBtHKiYwRp
 +w2uDImsLdEEM5c2cZAIiBPAHJzzEuC2m6LWCC8ttDZHQe/vSTgTkiUJzI25H35BnHZa
 L5Byrk/Bq6/3AV7oDzHr4d3uKTzM6Z77QZiLW6THOSPwRTc6zb9f4Fjvc8gXRi3Kqxw+
 zq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jirsaBDzo/DYSNUUoXouAzzmgq1svQEaxyCrEMF0PXQ=;
 b=bvZnN7dLRV+YHviMdgDdqr0PuovbS3Fev91+AMg1UvIFUN6x6B0ko0aiEgv6untmVb
 X0eQOTi1Cmp7VjiUvavEaojut9SSaNai3I26ESoYHIXRBcgz19VV2z4JS7PQSK4qPewY
 gdrv8Y5LIR9fBQC6KoVx77nFT5qsyLJpl71vq/lU7N0mMt0IXmo0zop4z2S0DpY2VJ2X
 9lHsTwb7RL2HfsoXynxDOIzRTDeJ41c2olmG5Yywuoy6UWDXYNeLzW6+u7zJ9kdqSgFb
 Wyn8MlANYvC1eQzqSBIzjlqxhPh+xnNqeJu3a/9BtSurjLORZEyprcwS1pkfjCxNtmLu
 4Dsg==
X-Gm-Message-State: AOAM533zDQcsoI6sjUiwszssh27ixwDiegfJ5NGOs5NoVxiYYMFRlr1x
 nCEwvQl/tUwyuxI60I1wYJRcF4KzLAs=
X-Google-Smtp-Source: ABdhPJyAy099yWD65prigmyuRklbUEuvGo/7MOmEQKupg1xm525YnUbf9PtN53sQtco6k7/yCo+4Yg==
X-Received: by 2002:a17:90b:68e:: with SMTP id
 m14mr3156632pjz.228.1607415394346; 
 Tue, 08 Dec 2020 00:16:34 -0800 (PST)
Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 by smtp.gmail.com with ESMTPSA id d4sm2093574pjz.28.2020.12.08.00.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:16:33 -0800 (PST)
From: Robin Hsu <robinh3123@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, chao@kernel.org
Date: Tue,  8 Dec 2020 16:15:55 +0800
Message-Id: <20201208081555.652932-4-robinh3123@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201208081555.652932-1-robinh3123@gmail.com>
References: <20201208081555.652932-1-robinh3123@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: configure.ac]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robinh3123[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robinh3123[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmYAx-006JMn-52
Subject: [f2fs-dev] [PATCH v3 3/3] f2fs-tools:sload.f2fs compress: Fixed
 automake
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

Fixed automake for sload.f2fs compression support

./configure automatcally compile in liblzo2 (for sload to support -a LZO)
and liblz4 (for sload to support -a LZ4), whhen the libraries present.

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 configure.ac     | 12 ++++++++++++
 fsck/Makefile.am |  9 ++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index 1e5619d..01d1a05 100644
--- a/configure.ac
+++ b/configure.ac
@@ -52,6 +52,18 @@ AC_PATH_PROG([LDCONFIG], [ldconfig],
        [$PATH:/sbin])
 
 # Checks for libraries.
+AC_CHECK_LIB([lzo2], [main],
+	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
+		AC_DEFINE([HAVE_LIBLZO2], [1],
+		[Define if you have liblzo2])
+	], [], [])
+
+AC_CHECK_LIB([lz4], [main],
+	[AC_SUBST([liblz4_LIBS], ["-llz4"])
+		AC_DEFINE([HAVE_LIBLZ4], [1],
+		[Define if you have liblz4])
+	], [], [])
+
 PKG_CHECK_MODULES([libuuid], [uuid])
 
 AS_IF([test "x$with_selinux" != "xno"],
diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 1fc7310..74bc4b8 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -3,12 +3,15 @@
 AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall
 sbin_PROGRAMS = fsck.f2fs
-noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h quotaio_tree.h quotaio_v2.h xattr.h
+noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
+		quotaio_tree.h quotaio_v2.h xattr.h compress_wrapper.h
 include_HEADERS = $(top_srcdir)/include/quota.h
 fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
-		node.c segment.c dir.c sload.c xattr.c \
+		node.c segment.c dir.c sload.c xattr.c compress_wrapper.c \
 		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c
-fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} $(top_builddir)/lib/libf2fs.la
+fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
+	${liblzo2_LIBS} ${liblz4_LIBS} \
+	$(top_builddir)/lib/libf2fs.la
 
 install-data-hook:
 	ln -sf fsck.f2fs $(DESTDIR)/$(sbindir)/dump.f2fs
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
