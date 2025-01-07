Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A891DA04D28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2025 00:06:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVIeO-0006kf-SW;
	Tue, 07 Jan 2025 23:06:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qasdev00@gmail.com>) id 1tVIeI-0006kU-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jan 2025 23:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XPemyXbGyvV6+ScDDFDykFExz4MulQ9KtjAgrvdBziM=; b=aouLblihd9vge8sY+NmimzZq/5
 qBzJmEIf/TKxReTJ3PGgp70k6x539WoHhp6fCtwKXf/z9oI++I9h4O7hMOuKQ0PHplCVVaseauuKL
 OtUCPPh9KbQCGt2dE5Kczh7v9aURlm86TldXQYHWiRLLM8LqLAod4OhacM57SKWx2cDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XPemyXbGyvV6+ScDDFDykFExz4MulQ9KtjAgrvdBziM=; b=l
 s3TsitcLnor418UdM0jRsF76BkAy7b/vDnlE+CJSzoXhAYfLITbQKvQDoPeXqmPMd9I1yLfPa+sje
 wh9cd5lNUV0gswjYXpqp9Yn35a3Chdy1gPGm2oF3sG7Uoo+o9RBULPOSMIGPRklcMJph7dpR3afBH
 9rE8zbTlGIDovUgs=;
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tVIeH-0004si-NN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jan 2025 23:06:10 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso115557845e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Jan 2025 15:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736291158; x=1736895958; darn=lists.sourceforge.net;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XPemyXbGyvV6+ScDDFDykFExz4MulQ9KtjAgrvdBziM=;
 b=LW5Bx0UbOoBd9YzA7XIAuCL8VAfhgN6hGwYSohRp6dhi+/Nst6M4YY6l9xKw8qdzGA
 cdJONc24qR3NDV2jzj/ZuxOT45kywACFuIM/LeYFzdl4tpGi6RjmY7+Eo5dGjksJBrtE
 xZqgyJM/M6fB5p5+X8EPLkYOhldHL4MIKZBhnNWWq6Zlc9CRjPxjOV8fnYmY3kpUzFxZ
 V8UuPUYAp4+xqcnaZ3yrbuX1RnNdAmUIApE6QwWnHfRzsRznP0IEa7FmbvPX+o75hd+P
 qVp4b+me2SLFO6UPaTP7JcYhehPCWMUL2AxVhKucHKMB1uAQ34sc7PaLjiKDoGwX1KpL
 o5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736291158; x=1736895958;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPemyXbGyvV6+ScDDFDykFExz4MulQ9KtjAgrvdBziM=;
 b=uKo/zZiOI46K99Jj0k7l8xIdgBcPfPYHIp2PEDFZhOf9MAtvN5a9BewPQKDSlvYpuA
 58b7WF+PanhFEJnrq7VMLLqkvHpO1uLTTtWqWCWcwbFZoODqXchp2aBzqvguScQPBIY6
 uYtGRmxx1G/nu6XR+ybr9qeCHDzGkuFCf3xxt1gX/wQbMMICu0HZ3ecVHNjRmOXjSnBD
 XaWSzu2N1eQbDuaTRkhhiVa7laVJg0OhtigM1Rnm7q+ec2R4Hd/0BTmxV030MrtDCiHC
 VfihgxopUWGqVZYV2DYdkO5LViyFI9bZTttJZtUAv94MlSuHhCJKIp1KBgPkWqaaPIEj
 cnYw==
X-Gm-Message-State: AOJu0Ywb6pKfwU272ueSjLz3RM2CeEwNStuAcoXkEk/GM4+pv6eXzQqI
 F43ycBrmvP+hE1yXKIhmB6FQh6PfzFwB7smdGbC4zKtB1+2Ci3hr
X-Gm-Gg: ASbGncv5kMfdAKmN8bJpEaJGapwoN9Qm3T90Me0uNrBaROYFqBd7A+3smErHgiJQhc4
 k2fkv6ADPQjBOZtcgX9a3kRF/rTvRoHwP05/sbukfYtmFfL/JUX+IfC1PHiElFov3+hoPhIWjdK
 aWwXpAzjSngRh/d6s7JBm35jDC6ALmyv3a0Shjn4k7B9lqcOZNm1mn/MBu7kIeXK9SywFRwXiKV
 LNp/zMIJ0YC9/zkxqyIS1lJQ2y1m+SsNfzFRdYawRyMOqFp4cP6/kl7Q+KX
X-Google-Smtp-Source: AGHT+IFGCe0C20Fo0avw1jLEwAvhWq8rItDlf3GJUdm69RUiJxtO3tf5B2yb75utz9xvlX4+Jtq+dw==
X-Received: by 2002:a05:600c:4510:b0:434:f3a1:b210 with SMTP id
 5b1f17b1804b1-436e27076bcmr2361305e9.32.1736291157873; 
 Tue, 07 Jan 2025 15:05:57 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:bdab:f479:c8fc:cd3b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8292f4sm52311645f8f.3.2025.01.07.15.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 15:05:57 -0800 (PST)
Date: Tue, 7 Jan 2025 23:03:50 +0000
From: qasdev <qasdev00@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <Z32y1rfBY9Qb5ZjM@qasdev.system>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_getxattr(),
 the function lookup_all_xattrs() allocates
 a 12-byte (base_size) buffer for an inline extended attribute. However, when
 __find_inline_xattr() calls __find_xattr(), it uses the macr [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.47 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.47 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.47 listed in bl.score.senderscore.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qasdev00[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qasdev00[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tVIeH-0004si-NN
Subject: [f2fs-dev] [PATCH] f2fs: Fix slab-out-of-bounds Read KASAN bug in
 f2fs_getxattr()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_getxattr(), the function lookup_all_xattrs() allocates a 12-byte
(base_size) buffer for an inline extended attribute. However, when
__find_inline_xattr() calls __find_xattr(), it uses the macro
"list_for_each_xattr(entry, addr)", which starts by calling
XATTR_FIRST_ENTRY(addr). This skips a 24-byte struct f2fs_xattr_header
at the beginning of the buffer, causing an immediate out-of-bounds read
in a 12-byte allocation. The subsequent !IS_XATTR_LAST_ENTRY(entry)
check then dereferences memory outside the allocated region, triggering
the slab-out-of bounds read.

This patch prevents the out-of-bounds read by adding a check to bail
out early if inline_size is too small and does not account for the
header plus the 4-byte value that IS_XATTR_LAST_ENTRY reads.

Reported-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
Tested-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
Tested-by: Qasim Ijaz <qasdev00@gmail.com>
Fixes: 388a2a0640e1 ("f2fs: remove redundant sanity check in sanity_check_inode()")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 fs/f2fs/xattr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 3f3874943679..cf82646bca0e 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -329,6 +329,9 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	if (!xnid && !inline_size)
 		return -ENODATA;
 
+	if (inline_size < sizeof(struct f2fs_xattr_header) + sizeof(__u32))
+		return -ENODATA;
+
 	*base_size = XATTR_SIZE(inode) + XATTR_PADDING_SIZE;
 	txattr_addr = xattr_alloc(F2FS_I_SB(inode), *base_size, is_inline);
 	if (!txattr_addr)
-- 
2.39.5


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
