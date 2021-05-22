Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C73C38D5B4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 May 2021 13:44:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lkQ3R-00066Y-Jk; Sat, 22 May 2021 11:44:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yashsri421@gmail.com>) id 1lkQ3J-00066C-I4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 May 2021 11:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NYrmw5RMTV2aEThz0kjImVo1vw9pbKW0fAr4kqrkC5U=; b=btZuNQ7VQDWkVicU2MEUwbUmAx
 ClTmBLbB8TG8KYVJSqXk4uqeWTk9oAOWlrQplibb5RFOx/9bdm9S65qwzjj2q3PLmwEqU/V4JLIDd
 YBAv4HIoXcUkgrr77mtEB5s3IZBjPwqGlJYklRVRbg+31cfxuou1tDGKSOjmLpq/HlY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NYrmw5RMTV2aEThz0kjImVo1vw9pbKW0fAr4kqrkC5U=; b=VytYERrpKYVDI35Q2C90T6UBCl
 otYF313BA2AxtjGcZwjBnpxiPvBsRS4cMjCmYZObDYABydlr4+RtebYB9IhlyNQ26+yHNwxQVJbLw
 3APqcqeenAGS62U51k0u9tcfdG9LLIUdZt8wCeYgAb/SevyAUQ9pFKsP7QwTLJ2NPqLI=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lkQ37-001wHP-Bw
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 May 2021 11:44:19 +0000
Received: by mail-pf1-f178.google.com with SMTP id c12so5312122pfl.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 22 May 2021 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NYrmw5RMTV2aEThz0kjImVo1vw9pbKW0fAr4kqrkC5U=;
 b=FS/Gl1Fewy5oyhiSGr7ZZMYAGTWOr5VtIkUwhWPkdngRV0eRo6u71ya9tTqQ+pUXu8
 UgoAvaBYxbLuC0ZBWgOoqQqbm5YcYd0yvIDOO1rLIVkXqHAnpTk5nXZ7aCaYEoKn5eHZ
 AxrK5332IAVsKQQ2df7TDEyyy0bv1WPfUvc2H1URset8B9nvGIX36gxyHLt1K0k4W9VT
 lM391jrsV+edzNtMvqBqhFqigNLS6n5kwvHcvE0/WL8TAA7mLpLy8uPi0+zZkFDK5ItT
 OHpeWx2Nz+Mttz8kRrkB0D+hMnZOpX6pXR2Pk3dxsL2xGl+HAuwkYKWd7oMv+5osN+qc
 SfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NYrmw5RMTV2aEThz0kjImVo1vw9pbKW0fAr4kqrkC5U=;
 b=NnwXxlmFTRWMoDudDSobg4FXidvvC7mFTUDX2Sk+6IlS1a9ntq36JMwweiIRxR4nZK
 47YOMnbaRhSzAADLC1rL4ZfMyH+FRpogldit9kmKBM8dhWpu9Nw7Q7T1Gpqllm4qWN8I
 SXhS9efCkY9KkcglFxLbaAb4goy6QxGvplzCVpd7IaGE95WT6p8xzxNoT1K2FQ+CnFT7
 FCZJcxQYlRL4Bh/KsPMhyXKilJ/FSieCw0epp40WNKXHoshPxHValQQrbhdBOQfDVtDr
 KCzSVwmMiCfaZCmuwxjlKxun+YKOhLjUXzHRtKMi9pXJU4L38c9RB8DF2lS+tUr/x8qx
 dtJQ==
X-Gm-Message-State: AOAM5304VlEQ7KWLYb0DlqM/wP2gT9enCu/9Oyxm3fDfUuRt0FLk5j13
 lwr81YxrWi8Fpps0Rf2D1jk=
X-Google-Smtp-Source: ABdhPJwoGHtGQ7e19/ifanrSR37U7sgfx1ePhQ9yHTJ5Quj/3sn448HDDTa5HMl5L8sl0Wza5fDXkQ==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr3790275pgl.190.1621683843669; 
 Sat, 22 May 2021 04:44:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
 by smtp.googlemail.com with ESMTPSA id t25sm6459270pfl.68.2021.05.22.04.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 04:44:03 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: jaegeuk@kernel.org
Date: Sat, 22 May 2021 17:13:51 +0530
Message-Id: <20210522114351.9538-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
References: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (yashsri421[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (yashsri421[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lkQ37-001wHP-Bw
Subject: [f2fs-dev] [PATCH v2] f2fs: fix kernel-doc syntax and remove file
 name from file header
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

Also remove the redundant file name from the comment headers.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
- Remove file name information from header comments, as suggested by Randy

 include/linux/f2fs_fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5487a80617a3..b5a081aa86c4 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
- * include/linux/f2fs_fs.h
- *
+/*
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
