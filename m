Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF0061E209
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Nov 2022 13:19:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oreco-0003ee-3A;
	Sun, 06 Nov 2022 12:19:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1orecl-0003eX-NF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 12:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ymiy5cq4M7mcegN77VDmr6qsSy2rh8V4DwGLs4agxXw=; b=Hi0RO45byHS1ESX7V6ZpIlUbcL
 yBKnsd+Q3S/O29o6MhsKyS/HpQrB2oUXh4QfGExvJ/wXvZxEa4UH31g4xEttmt1wn9rzGD0vwmcx0
 gW7qhGmOlFGMUEx7CUD0vR9XT/h1gq2KpZx/AOUxHdbtLSWNH++IfK79y2H9zIGfAQy0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ymiy5cq4M7mcegN77VDmr6qsSy2rh8V4DwGLs4agxXw=; b=V
 Ma8OG2/Z5k4Rq0WKlGnClB84E6WhZqEcvKwg74VAulZ2s2R4+erzZAtdXj9wMuUGE1hi0iFgmsd1F
 zQyBf5DvUYj9sD1hPeukM/1KunLJg80ROdncQU1bId/edT+xzLFQbKoapjj8TTunohY7hHb41Nr7W
 AURxbObXpHoQJIx4=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1orech-0002kC-9Z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 12:19:39 +0000
Received: by mail-pf1-f178.google.com with SMTP id z26so8322978pff.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 06 Nov 2022 04:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ymiy5cq4M7mcegN77VDmr6qsSy2rh8V4DwGLs4agxXw=;
 b=K+zdLzKu+Vw0w/nWYOtpmfwUPrRdW9NAVQ7s941p5xS8hQcvCxIHcf0g3pzjwShQrR
 2QSibzn/xMocsWmQEa0/j5WxEgJNUVyLkoAvwUSt5HgJwKrwK1ScY8B50PeZOGVcu0MC
 Y823msMCxqaR3ecjYBwNYwRtcV9eZRKMJa+/HAUpSOQOSkIP1vm4z4yhJNprYU3H08yH
 hsWvMU2FcqSn4WzIHo/z8FY9cXOpGI2sLMqNjqZbppC/jYuxc7UnJRWo+srW/WzaXVUN
 PkLbi40YfpkEWo5sy1Glie59GJ+q+YRQAJ9hi1zWaSG0gfSNVw3qVaM3OxAyrIZBJ4WA
 9NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ymiy5cq4M7mcegN77VDmr6qsSy2rh8V4DwGLs4agxXw=;
 b=sEFFfcPqM709QuJQNXeMS97F8hTYZ6iD7VUwRjDhZq5Alv6062B8R4Mqe3CO63bccz
 k9jVbkZrJQErlS5E7spOXsVDjRI5id8TOBqVUgsnoRm9C+A7y0uLxCSa2GZObN4p4EH9
 8BJw5i0BlDCuOmAfkTYgTxNLYdDgFDt0soBzoEqLVLy7Xa5I6uMi16QyH1RRIL9cfmyc
 zaw8FmICIqaU4EdVoMBgIJEyh1EbmWxohIAf0GuE9xGv7DO7jlEZdEq8QX7n7zirY6g9
 cy2IQmiG9abrdrncFlmtTKhFYUxJ9SoBQKkUrSrZZ6UsJcASkWslmBAfrCDIWgeNiuc7
 Mnhg==
X-Gm-Message-State: ACrzQf2pbUQkoDlsaHfZ2Jqt5Ag4w2+TWyFey15MfW5GWfYg/Fw/c8i1
 RMAOtjHhfH0GHxUfK5J2Wi3izB0u7gA=
X-Google-Smtp-Source: AMsMyM5otYXXqM7OW/pWCMM6N9yPX4upxigFtyVgqZ12YM1PdipmuMF+5k/dt6/1Pxxk/wjks0p3PA==
X-Received: by 2002:a63:5761:0:b0:46e:b96b:e76 with SMTP id
 h33-20020a635761000000b0046eb96b0e76mr39443732pgm.534.1667737169348; 
 Sun, 06 Nov 2022 04:19:29 -0800 (PST)
Received: from localhost.localdomain ([218.150.75.42])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b00172f6726d8esm3031258pln.277.2022.11.06.04.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 04:19:29 -0800 (PST)
From: Juhyung Park <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun,  6 Nov 2022 21:19:23 +0900
Message-Id: <20221106121923.59552-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  HAVE_CLOCK_GETTIME wasn't defined during autoconf, leading
 to messages like "Done: 0.000000 secs" on Linux distros. Signed-off-by:
 Juhyung
 Park --- configure.ac | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1orech-0002kC-9Z
Subject: [f2fs-dev] [PATCH] f2fs-tools: define HAVE_CLOCK_GETTIME properly
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

HAVE_CLOCK_GETTIME wasn't defined during autoconf, leading to
messages like "Done: 0.000000 secs" on Linux distros.

Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
---
 configure.ac | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure.ac b/configure.ac
index 91bf7ff8e0f8..3aabb698e0db 100644
--- a/configure.ac
+++ b/configure.ac
@@ -151,6 +151,7 @@ AC_CHECK_FUNCS_ONCE([
 	lseek64
 	memset
 	setmntent
+	clock_gettime
 ])
 
 AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
