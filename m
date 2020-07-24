Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D789822C4CA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 14:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p40Y8Xk+Bc9WgI2eVbj6rDi2c1NV8Gj++SvbT1ghHrM=; b=NqhyxlXtOI2MrYkEBey0yuarK
	9oA6v2Zr6yrwvLK+sZFchvqPYVDoyw35aMIzS/v+Oxf8qWTWsyWi9OjjszKXElPaKoiZz3DzGTb2+
	QXhBAlvttf1GlQ+4IUetWuMd/MIPwHBOxVvjZGvOCismT+bK2zpmYL0YR8xFLzlni5DvE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jywYf-0002sH-Kj; Fri, 24 Jul 2020 12:12:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3DtAaXwYKABkHzINzI5DD5A3.1DB@flex--satyat.bounces.google.com>)
 id 1jywYX-0002rs-1s
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=; b=jpdLwoRHlbZie9l4VcJOjCDt1
 psdgJXR2ze3VNigI9ee6eTfExmD2K6Gewsb3ZqqDfe1jj3CWJWd9gG0NOpMuaz80ZzugbWREFUE0a
 oWUiFi8E5nnbEokcURCUCVjtd+rhG3YhER0/G33X65rW492tDMeJb+374Ejt03e/Fsdu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=; b=AFFFlag1R7nmENvT3lq90JM3Zg
 MNeaeS9Z0LW9iP1Awgh9JiaNJt47JDt6mmlJkfwjQY/GSP3knNQPIfUthFMfK8zMNcnh5/pjTwy6I
 e9qA1ILPwGtzo8ckRvnFatr++q+l+exK+6bDX7CD+E++B6BjdpBs3mme1yZ0ZmXjDMws=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jywYV-001MK1-S4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:12:04 +0000
Received: by mail-yb1-f201.google.com with SMTP id u12so10325752ybj.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=;
 b=slmTUkhiIwbSQEjfkgmbeV4KCF4u08msiGK6SabnKAiv3CvAYVrGboynyzzbTajxKw
 dZH2xvPQR8jXzK/qntUI9lKlDPtetaRmLCjNT5omgxxhrMizgoRnSC0roIaFgwopHXTv
 IXhLjv+xSOfUUk6gqkYmieytlR1L9nV3xvpbFcQbtEdY9WsWZGStH0uxtSTg0ybo+Yxm
 vNqm/3J1IWd3IHGexMF628lSrVQrvqvd4tFPYBV1UKFjQMZxtGxh9xzY6EDBXANOm8ma
 khmwfHYWnDUYIZDYcO3J3ycu2JUI8GPQwMez8LsY1EOnHkqtMh2j3Mt5z7kSMvf3UCRW
 rFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=;
 b=j7FN03lREicp5dR79zzVDXuYVgfKHXpo/gBo4Wndvqc2BRoE+P5OkTnDytKssrGvdq
 q1W3EkFgVDhVxzlLtYuLCVg8SZ6QLIfuWgHxlwX57CiCP23/EwXIZnyCGYOIZ7AnrGkZ
 sUWBXm3ej0q/0OqUYsqTd5ZMuAUWpD38GaWFG8rTZ/NIS9zoWM0SLSFyJ3PtFQHhaRPv
 lAjdqHaYKYaFL5iXeUIwsPxqGn/jSaUT+vHI3KE52pocRUCokXxiwsacORhWTmarOYDo
 URpYQBLyJGtlLCTxMDwjZJ3OiOiWqIU3qKyn7ZO5rTTq9Ai57I8I5BrZfxE5iR2s5r6X
 6T7w==
X-Gm-Message-State: AOAM5336guSouhqAXkPk6JZPr4pkosanHGZxrhKiFxyV/d2XanzI4mqN
 5KUkPwWEVfadVFf5aabB7OoPeZjWlBY=
X-Google-Smtp-Source: ABdhPJyouJ1E2gRcgMN/M3G2tNtXRlKvJhp7ZjedMaUfi7bBr8eQzy4Glr/QlcgRyBhW5mboqWuW4qtyaT8=
X-Received: by 2002:a25:bb07:: with SMTP id z7mr13476612ybg.343.1595592718109; 
 Fri, 24 Jul 2020 05:11:58 -0700 (PDT)
Date: Fri, 24 Jul 2020 12:11:41 +0000
In-Reply-To: <20200724121143.1589121-1-satyat@google.com>
Message-Id: <20200724121143.1589121-6-satyat@google.com>
Mime-Version: 1.0
References: <20200724121143.1589121-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jywYV-001MK1-S4
Subject: [f2fs-dev] [PATCH v5 5/7] f2fs: support direct I/O with fscrypt
 using blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up f2fs with fscrypt direct I/O support. direct I/O with fscrypt is
only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
have been enabled, the 'inlinecrypt' mount option must have been specified,
and either hardware inline encryption support must be present or
CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
direct I/O on encrypted files is only supported when I/O is aligned
to the filesystem block size (which is *not* necessarily the same as the
block device's block size).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..978130b5a195 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4082,7 +4082,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (f2fs_post_read_required(inode))
+	if (!fscrypt_dio_supported(iocb, iter))
+		return true;
+	if (fsverity_active(inode))
+		return true;
+	if (f2fs_compressed_file(inode))
 		return true;
 	if (f2fs_is_multi_device(sbi))
 		return true;
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
