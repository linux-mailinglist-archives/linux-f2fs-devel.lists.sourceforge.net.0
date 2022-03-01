Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A14C83F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 07:25:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOvwf-0008Qg-G3; Tue, 01 Mar 2022 06:25:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rosenp@gmail.com>) id 1nOvwe-0008QU-Co
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 06:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJfMj8kj+HmWGfKE+BSfDT2StMptd6L4ufsQyTNTz9s=; b=gtX6j02bUVHR27uWeNPEzHnMzf
 S8j8YD8psl2bvF3gLVHbO1XmtbPEv9mx7fNqv/x88C4NRAZy8EFgWa64/jzZtQn0ZlyvmkyWKldGn
 DuAb4icFfvvPapZe69V3f0oI0a10N9RR4NqbtNYjZGi/xYULa7So6kkLSzOXSkxGBTS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kJfMj8kj+HmWGfKE+BSfDT2StMptd6L4ufsQyTNTz9s=; b=Q
 HIB9FEs0LTNEoRdrNW8d8jXwNQAAkAqYtW+cRwd/K5lDANAGkY2DA0NKKqgY9weU8wmHVWIdk+XLn
 a3SNyXS2OKB6HxPi3UYlWx6TCViZezFa+MbGvXo+gBmtpFTg+t9m15mWz3ucSkjT0yCMP96NbPjRI
 M41HZTKts2YMeMNc=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOvwc-000s9P-8N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 06:25:10 +0000
Received: by mail-pg1-f175.google.com with SMTP id o8so13590484pgf.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Feb 2022 22:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJfMj8kj+HmWGfKE+BSfDT2StMptd6L4ufsQyTNTz9s=;
 b=RzsYe3gjF7F1txWQ5hIeKxrGBnE2/Z4HQYVCMYSYbi4l1OMoPbLki3WjgSLwwsnVIz
 QEPcyRLyaruTFejV7+yl5umP6zV7htcwARLPBRHyOHegKcjzMfXjMy7EO2Rtfz5d46Q5
 R5Jlgxl/u9OWllH+/drP0OtKcgWE6psxBxlfveInkSeY7ckMRo1fJ54iusdtjn5SmyMA
 XW56zu4UOPSHY2yINH9/U0rVfmzEOM2dnop9aBiNXqL4O1Fwf/nxsLVlGoGnLyZoLJIq
 E01xQNKiV8HYs4h4Sml3LEujly4SXElVJ1v554kE+j0cVyIjswmrvvI9px0W6jIe+tmO
 Eqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJfMj8kj+HmWGfKE+BSfDT2StMptd6L4ufsQyTNTz9s=;
 b=fp+xeUVmjSmng3S5vh6udUrypEKGbbOf3SG39NA4+Quv/8+VRR6hdmSDpGeFmuMFQb
 UFJeN4x/5JUwdcf6edIySXMuPndjetc53HAn4NHNwHdN69Km4+Fxn15M3w9NyQYExT/G
 sKzbOouGY+P2da29LUaIuUqC5KX0tY0ijNcKj8lJg7KoG/bnuJoBVS90E1Z1UhOlkXTg
 KX7DA8pI/1czACGqWvSjVR6/bIoF+/1gCo5UusL2pjr+oWbfaL06LAkpVSVGrh72C5WC
 pWFxAwDMO6K6366wFBsA7/mXu3bxMeIk8J9S0roy22KxxJzUpIYIkFIDG4ww35h2bHgW
 Cjjw==
X-Gm-Message-State: AOAM532A9h1FAR8sP0JACfHjwLPlgEbqUBZhoi+0222S2jlQfNpXhBBd
 0XOocAgUw59fN1/vjFFfq933B/xLclI=
X-Google-Smtp-Source: ABdhPJwvplwp1qieCiVKqHxXxrLjhLG+MSVLpaOaBNgpiZekdtyqvPmCssA8I7vxXIrv56RzA77Zzw==
X-Received: by 2002:a05:6a00:d5b:b0:4e1:2007:87fb with SMTP id
 n27-20020a056a000d5b00b004e1200787fbmr26095434pfv.38.1646115904398; 
 Mon, 28 Feb 2022 22:25:04 -0800 (PST)
Received: from ryzen.lan ([2601:648:8600:e74::8c6])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00218700b004e0314bc83csm15478161pfi.139.2022.02.28.22.25.03
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 22:25:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Feb 2022 22:25:03 -0800
Message-Id: <20220301062503.37096-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A specific define is needed. Fixes mostly issues with
 -Wformat.
 Signed-off-by: Rosen Penev --- include/f2fs_fs.h | 3 +++ 1 file changed,
 3 insertions(+) diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h index
 d236437..412130f
 100644 --- a/include/f2fs_fs.h +++ b/include/f2fs_fs.h @@ -41,6 +41,9 @@ 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [rosenp[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOvwc-000s9P-8N
Subject: [f2fs-dev] [PATCH] f2fs-tools: use proper 64bit types for PPC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A specific define is needed. Fixes mostly issues with -Wformat.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/f2fs_fs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index d236437..412130f 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -41,6 +41,9 @@
 
 #include <inttypes.h>
 #ifdef HAVE_LINUX_TYPES_H
+#ifndef __SANE_USERSPACE_TYPES__
+#define __SANE_USERSPACE_TYPES__       /* For PPC64, to get LL64 types */
+#endif
 #include <linux/types.h>
 #endif
 #include <sys/types.h>
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
