Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F780320F9F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Feb 2021 04:06:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lE1Yc-0007F2-0s; Mon, 22 Feb 2021 03:06:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yehanxu1@gmail.com>) id 1lE1Ya-0007Ev-HV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Feb 2021 03:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ifwY+K3DGDVE8I0fPuDEawPR/idvz3X1KyWG92YlP7Q=; b=HljOkjcm068oTFUX58dcbVBlhz
 58v+B+TDJ0dpiMejOU9yPT9cJswcNXJzclH2r5XqBRE5/266FZZvingEHopWY58X7i+m+X8aRI1Q2
 qqEYWVqvBn29+x2hBJpPCNI4VbLIbhGUvyMNkA98xDDWoFIYRREAMCO//AjK2r/ngNPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ifwY+K3DGDVE8I0fPuDEawPR/idvz3X1KyWG92YlP7Q=; b=Tg0XrbgbIMuhqqdfcV2iAT8wwh
 iJ0w6Vn+aecRB4rzkOFRvin0zINYJvt0uk4jZ7OrG93c5ot+PqELv8uCCdI2XDR8vSxnJslkxvdO2
 MPOZiTzQKN3iVdKn+jsZBqfP3vSIywklhM4n1ekrYdr7W1a6EjZtaO4DjnV18EFAGUns=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lE1YU-0002z3-Jg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Feb 2021 03:06:44 +0000
Received: by mail-pg1-f194.google.com with SMTP id o7so9376979pgl.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Feb 2021 19:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ifwY+K3DGDVE8I0fPuDEawPR/idvz3X1KyWG92YlP7Q=;
 b=d4hNSdjWAyEB8dGRDngbGNIdJWAR92fB1TqLMDQAqH3vRQ2ATeKOqanW3ThV4FM5xb
 0l0uT9euAV8i94Jijxbp5cCq+vRVxGYjMgboH38A4lMyOZNiM6lQgUNkranHwupfL+OF
 kmDmf2SIYyhpUNdjfJgU+0kzxCUYjo2INHAVbxXSvDOqSMOjFxchdeeiRbCv+2z3Lsjv
 f+8ovlgVXiLsBZ89/lfCmEGrju4nmDVlTxNCxWe7/6iA7N6CWXMp137EUJ3xV4HXo8CD
 1fbtMWgrTfn/pKbXMOUJgP1WRU7MvrUn9Yi4TmbPzvBogfvoQPo7A2EfkhInMGP77lRK
 toQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ifwY+K3DGDVE8I0fPuDEawPR/idvz3X1KyWG92YlP7Q=;
 b=YnICFFjorGFUczZo2CXik4/2qgk9fiUFwq+Q5ZSJG7aB4h9ki9MjVNL5E7PhsJX0/U
 jTraDHxt3OFYjB4AhId8tYkfy8wUNMhqxG2xGHawrdSjxPAVgj68C8zX/rfhTGEKBYxf
 5QVA8r2fNfU8nF6idy8qOpgtgetLpQj9NSFstDx9AEdvLFTcUomuoOf19j3MxsjuhzvY
 Kj+zYP34QRCS0NQa4gDUOdG3RZca9TgPKFpYtoBGahjGqSX14v9Nkm2apD8OttlyQBQ4
 QhqQ6p9wPRKVY4sHnfZmlecN/sPq5RyFwt5mt1Nx8xCa3vkgWp6i+iXqJhAFSUWxYcr8
 ePOw==
X-Gm-Message-State: AOAM530KhWQVV6CBtJqIozoIrZddw4POGJ/miNy0fsc/2M5h3EKIQl5r
 lduVsXFVyUylaW0UKgXNe3Q=
X-Google-Smtp-Source: ABdhPJylE+H5xMZAZU/R9gwSuZmwNyF0hWU0J8hajfvV6cjFdgC3FgIq8U5Rp+wonCB697wPCnUjCw==
X-Received: by 2002:aa7:98ca:0:b029:1ed:4469:f03c with SMTP id
 e10-20020aa798ca0000b02901ed4469f03cmr12205119pfm.78.1613963193103; 
 Sun, 21 Feb 2021 19:06:33 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([209.9.72.215])
 by smtp.gmail.com with ESMTPSA id f2sm18851683pfk.63.2021.02.21.19.06.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Feb 2021 19:06:32 -0800 (PST)
From: Yehan Xu <yehanxu1@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 22 Feb 2021 11:04:43 +0800
Message-Id: <1613963083-29332-1-git-send-email-yehanxu1@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yehanxu1[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (yehanxu1[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lE1YU-0002z3-Jg
Subject: [f2fs-dev] [PATCH] Documentation/ABI/testing: Fix a spelling error
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
