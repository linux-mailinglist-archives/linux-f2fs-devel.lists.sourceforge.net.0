Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8093223BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Feb 2021 02:33:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEMaF-0007bH-Ky; Tue, 23 Feb 2021 01:33:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yehanxu1@gmail.com>) id 1lEMaD-0007b4-WF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Feb 2021 01:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=smby/yISrTbD7Ag5so/UjLKlT0IUNUKC9xD+ASY5i6s=; b=ASEk4rLmg3JW1HmUUf9kIogiB7
 xpOC+xAJoX9TLVtUob4IhgOES5zZsPv+lZuWDbWmFzWPiawRIS3UGRr3g1Rrp46FR+y+8IBmFRoaH
 DcQdMdiZrpxkN//mRPwekHBUBpFmFbjKhlGu/NRoGxkJx+qVYac+0gpUAAGkK9kVsHLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=smby/yISrTbD7Ag5so/UjLKlT0IUNUKC9xD+ASY5i6s=; b=CsIkgfXSxNadvn1yKYcv7mqs0i
 8baLGPsGT32LStTQe6MsjGuS+Kp7MhyLM9IytcrhDSLHDQ6Ek6MTdlV3fuEzcgh21Chti/Q6w0r6x
 G7rmavqJGbIE6Qm872H0gc28AGLBqhayO6iFSxhfsDJJcAIIJOkwCRx6P+GlMM26nTG0=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEMa3-0008Cl-Tp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Feb 2021 01:33:49 +0000
Received: by mail-pf1-f196.google.com with SMTP id u26so1810921pfn.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Feb 2021 17:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=smby/yISrTbD7Ag5so/UjLKlT0IUNUKC9xD+ASY5i6s=;
 b=GYiiiqrxbRd+SU8wAVkJr23hjPHL5TkJHMn9MBGknejuNggofVq+D4MW7jg95gPm+o
 bPzJ2eaVI6AeO0DLsAyS3u9jeBoQCzKuMpnbmNVpUtwdieYuuOY0WjGq0WT6O6gFpUPW
 QHjz7g647ZgCIZ4j7uYR8e/ioxHrmNYhAZQgZ0AZdeD4owMyO/3QKSy82BfOUVkls5A6
 PwQ7YgUzqUpxZsQCzm1cFpUK/PyxGrBwcHssCChZFTIndByZWjPHYPtveXUJdovcL/U3
 pdrajkACfwU6JxWqGuY29Xg2ozpu08DML00uC97GpLnN3BaBOnMgBUQTaGYuFtf7wvad
 jP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=smby/yISrTbD7Ag5so/UjLKlT0IUNUKC9xD+ASY5i6s=;
 b=uIvi1dwaYfzusXiymys7qoMjZnqui5iRWj/WvpRtCPho/NFKje6UTlyc+VWQTNEyyp
 CySCfBW01ficiKN1sw07mttxrqvmFhKtGM04Nh7LQFwpCz+6/yAuxX9ytYeaEh/DxHk6
 1IeRfENIiXglSWYhuJL7LdFRd7VkjFRMuL0m4NaZJ5ueGsGMg4ZCLUPBrtpHZSLOYYQ4
 0QXajhIjrlfsE5lKQVKhEJE5Jqm5NhOHSpHlm05SpAm9BBFaivYs2603WXXQ1+e7gitQ
 q133A+4QOdgxqWlQg6Waqx8M6YjKoyijGMT3dTXrpuOmdeGuudFCJRSSud8OZDEWagW6
 Kgig==
X-Gm-Message-State: AOAM53143UecjYDRSTvE3DVYTc30Ow8st/1g1G4I7urjdflrtHo6cK7w
 FZpz3LV3FUbGA89Jy7vhUyU=
X-Google-Smtp-Source: ABdhPJwYiDQufR4zO8udNMr9DXChprskj8Oty96PpE28zbNvz5ztdwNJ6ZFpPxVzdt8muKvcxDKwCw==
X-Received: by 2002:a63:4d52:: with SMTP id n18mr21659838pgl.237.1614044014321; 
 Mon, 22 Feb 2021 17:33:34 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([209.9.72.215])
 by smtp.gmail.com with ESMTPSA id u7sm19976983pfh.150.2021.02.22.17.33.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 17:33:33 -0800 (PST)
From: Yehan Xu <yehanxu1@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 23 Feb 2021 09:31:43 +0800
Message-Id: <1614043903-31388-1-git-send-email-yehanxu1@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yehanxu1[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (yehanxu1[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lEMa3-0008Cl-Tp
Subject: [f2fs-dev] [PATCH v2] f2fs: fix a spelling error
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
Cc: xuyehan <xuyehan@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: xuyehan <xuyehan@xiaomi.com>

Delete the letter 'e' before 'number'

Signed-off-by: xuyehan <xuyehan@xiaomi.com>
---

changes since previous version
- modify the title of patch 

thank you very much for your help Mr. Chao Yu

 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3dfee94..21d14fa 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -276,7 +276,7 @@ Date		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that
 		are unusable.
-		If checkpoint=enable it displays the enumber of blocks that
+		If checkpoint=enable it displays the number of blocks that
 		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
