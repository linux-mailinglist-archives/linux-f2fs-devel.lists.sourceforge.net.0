Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED622CE1A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 20:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p40Y8Xk+Bc9WgI2eVbj6rDi2c1NV8Gj++SvbT1ghHrM=; b=BhPZjHRstL2KMkA69qtItPsLQ
	w+B0YtoCQq3NVUQR99SW+RPeEbPTDEutB0qCLZOCEG+YyTwgjt27iHt2PjiEdfPneQLP8cmvtvHiQ
	SykfRNinqJo2ewpZvtidfH4RaH6mm8rm7LZ/YylJ7njw2Dzt5pSnoe9inrOaX4V7bAdSc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz2hH-0004D3-1P; Fri, 24 Jul 2020 18:45:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3OiwbXwYKAP0xfy3fylttlqj.htr@flex--satyat.bounces.google.com>)
 id 1jz2h7-0004CA-54
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=; b=De4UCjeVLoo0/5AUzQvGH1FeD
 VWABG1Fm22zllSL6SQKD8t2OCeYuSSsFhIIFtlGqRrNPAdHVzGZz0erAiaN98ulAqbKqximjfs6nw
 6mjdwVg5bfuIAX9NOUBFnVVag8wUtM2Yi1xvsNarvKw3KgJw+7u6/WZVcYgrbsEKJ8CR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=; b=KWpUn6WYG4aXnBGR51GcR2QMiQ
 5EYgFxeOqtU19mvs8JbsUW3jx0ZXUbwq1S/gmNoe/s//zL8p8dI5SAAaAoAPqvKX61Z7krfX9qB1d
 M1Fq5IdPKGHV9ka9YQC6bBfsGMALalTbxvIWhBLwoo1p6YgRL27a4h+dS0cSk1yXG40s=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jz2h6-00GEOW-0U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:21 +0000
Received: by mail-yb1-f202.google.com with SMTP id a14so2913899ybm.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 11:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=;
 b=wIgyWZnmLwySzWDZSlBrKLMi9o7JvXabuPmirleI8ql4xoXo7sERCN6n1iqc7ulrPe
 +0bTFhJB6lh8er/OHOe2MXTTa4FGq9Z3I6vsRXEScezsqzlDDr2vnow9hUL76dFd4t73
 LSY7AXOCLmvkf5lykey7j+KVR2MMALlndNl2R6YrkZFHfXwGZkrfnHwyHn1h/uaaOf9l
 uJnX4cyIXqW+w1n+7Eb7Pxn4EQVXztt3YcG5WdnGQg5++z/bnqsVqqqlx/TYg5agIJhj
 WavGB7UKwBzo7jCeULL7RegHdYo0aLeV9COGmhAu19Pyol/rjfmG50iF+cCQ2zkbz44I
 mBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oZN8SnIpsU7aOjS5+8MoI/0a82Ym0e3d0O/7K4J6ac4=;
 b=LNP5ODXiRxzb7RA8sxJhqFpGWvi+VTk67zhf7DiXTIFEEDhkfsFraoItlkM4wbrRqA
 C9axgio3dKVpRKBIH5YYnkqyk40HWC8a/JYSKcXpZTcmDD2m/gXMTIZfFnjYhnXu40PV
 AVdPe7C0K9CygpGy41v+BIYCR47BGPwKccM10tIFVl2FjvBZ/X4f17LcVWi7BytQixEX
 4tCtU2gJJO51JL3SYXONlQ/OzazmQewSmdpldV0tr/ZwVO2MCiH8VlAIDO00/A4GJiSb
 hfaeGiqdxR/5xnRF2b9mlekTsBJ+22/TXRxZfl6JKJDh0i7GmInhuSaXdROJ7Gzsy4wu
 yWRg==
X-Gm-Message-State: AOAM532/0UF+oH1Gaj5TFY0LuTbtCeVEI+S9d2SN+6xLfFStqX8/pkdm
 JqPVOW75KkD59hX+AFtWCKBj7Tb4XrA=
X-Google-Smtp-Source: ABdhPJzmZ43+VRZcOd+tePRiD99mq4GfMup1JpMkWtUBzFz9rcQiFfN2MHUCR4TgOqatdZ2Tf8jsOOl0B2c=
X-Received: by 2002:a25:c483:: with SMTP id
 u125mr16946975ybf.194.1595616314284; 
 Fri, 24 Jul 2020 11:45:14 -0700 (PDT)
Date: Fri, 24 Jul 2020 18:44:59 +0000
In-Reply-To: <20200724184501.1651378-1-satyat@google.com>
Message-Id: <20200724184501.1651378-6-satyat@google.com>
Mime-Version: 1.0
References: <20200724184501.1651378-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz2h6-00GEOW-0U
Subject: [f2fs-dev] [PATCH v6 5/7] f2fs: support direct I/O with fscrypt
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
