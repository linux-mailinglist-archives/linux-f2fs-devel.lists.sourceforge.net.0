Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0D38B5FF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 May 2021 20:30:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ljnQc-00079z-5T; Thu, 20 May 2021 18:29:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yashsri421@gmail.com>) id 1ljnQb-00079t-8k
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 18:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A5d5aXdYt4hUl4+OV6UCI0Ehr+lwjM7hULNb+KOTJBk=; b=E1v/NV2jJb4r/fxgZkPzINX6eF
 ZCiUz6plgVwMB3mTfQuR7NTnKGXkU96BU1jWXtUHrSGxSepQHcnnhE7bjepvNbMFRMQWOZvP+U8gh
 aO2ADwzjzPvZCOgaMCgF6S682SSmwj6iS/IPJpsETXYxMf89uw9U0aiboDohyrXkPIZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A5d5aXdYt4hUl4+OV6UCI0Ehr+lwjM7hULNb+KOTJBk=; b=LiaWECJoe2iMtNSuVlfLy87Awh
 M7VZPfxZKSh580tsE0bv2BmjDozVmVmlbAi5eRCz0dj89Ti0EN4B2DvI0Rse2FyEGwLuXJQ/wfE+/
 ND6bbTCgBtBeEoI0InkWJUnSXeKt8JVnnpUO6hzPFowGd0CBTu27C98xRn3K+AVGm1JI=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ljnQa-00GvXd-Tm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 May 2021 18:29:51 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so5752761pjv.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 May 2021 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=A5d5aXdYt4hUl4+OV6UCI0Ehr+lwjM7hULNb+KOTJBk=;
 b=mHfOQeUu443DNLDYLp+xnnQrdjLJ9NJVfNCnG8FbZQmy/mHxwfnSZrF6h3w2bB/FGG
 4/LGzuyWtTWnFozYltQlLTcWw45iYC/cMWdv2yw2wwOAU7AK8Qiad11ZkSYEc2mQSLDk
 RIquag+KH3ks4SDPhJZYEYhjEtxJ/4A0AEoDAG0kLVPHPFlS93ce8HmwDhPEyuezmHYi
 a5V6gsuwKD7TSWzTB2iauRm9pgKf3dbjQHracgbofMh4Ybnm8hmb9sJA3g9vecOe0PgC
 aExfunlVz8ZmyC8qwRMRQr0cX1lrogoITi2Tb+FoATqys39dHsZuXM3fyDKAwBAIougB
 qLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A5d5aXdYt4hUl4+OV6UCI0Ehr+lwjM7hULNb+KOTJBk=;
 b=T7cqkmaOrgi3GYGpvM3ynF8TGjO+100uOlLxrzGPop1y+C8pGjXR/bSPacqHTeXhGG
 ROvrBpdgescxVebiPV54wW69aK0ShA4cjSP4NMtX5L5+IYwXY5Q2QuarMwxnJOaQR5D+
 Wlufql9IvawOg0IolLHeDwhClIyBwTwVHxRpgHExFUwtGvjbl0d0v5Yth34RC53jAXjH
 jW/mHFJh+B4zxGpZazrr/U0evPBTmnQq1OjyIE4e9RA1F/m8vDfxOj6grZ0sXHLCjjZe
 YBVLIbeK5vqiG0vRI787ozRaGEYn1Nip3MyE4IN87bjJje4MBy15yMf/65lUOT2KGoGW
 UVhw==
X-Gm-Message-State: AOAM533AOe8grsGE8zJc3LA/F8xZSXbI/K9wVSMzMu/upm1skcikem6a
 fQeiRZPVvHLwaZlu2HLUIdY=
X-Google-Smtp-Source: ABdhPJxOsKiisPY6gD0XTtm54BHxN5/X6kqG62g5FH1fZk9hUMPUlWOM4/wQPAZ7w0t0LCRDV5Vt8Q==
X-Received: by 2002:a17:902:8d83:b029:ef:9dd8:4d9 with SMTP id
 v3-20020a1709028d83b02900ef9dd804d9mr7421444plo.40.1621535383183; 
 Thu, 20 May 2021 11:29:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:4822:12f2:8c52:6d8b])
 by smtp.googlemail.com with ESMTPSA id 66sm2764268pgj.9.2021.05.20.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 11:29:42 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: jaegeuk@kernel.org
Date: Thu, 20 May 2021 23:59:33 +0530
Message-Id: <20210520182933.31965-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yashsri421[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (yashsri421[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ljnQa-00GvXd-Tm
Subject: [f2fs-dev] [PATCH] f2fs: fix kernel-doc syntax in file header
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
Cc: yashsri421@gmail.com, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for include/linux/f2fs_fs.h follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * include/linux/f2fs_fs.h

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 include/linux/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5487a80617a3..028d1b18f0e7 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * include/linux/f2fs_fs.h
  *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
