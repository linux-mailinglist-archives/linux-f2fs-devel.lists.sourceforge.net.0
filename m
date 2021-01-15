Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD872F8445
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:24:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0TmL-0002VY-Ke; Fri, 15 Jan 2021 18:24:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0TmG-0002Uj-TK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2NG672elvREwj0br4+URvSxkR9bBrok3ZX8jw+exV24=; b=edKhjdV/n0ggDYKeKTgq23ZsY9
 /lNIPpf3H3grrgdMzhejLTUGunHmLtvIlxM3pDvl4GgdiW17GeITpWVfY6V8kknRwOmzxg+7xfuWs
 5UZutGSLtJJan1dUtW3tSYWKsT+4LhOZR/nmOkXiZPFRXNiGHP7IrLOlCsZC6rHBd4qw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2NG672elvREwj0br4+URvSxkR9bBrok3ZX8jw+exV24=; b=B/oC6Mhw6Ob94lzRln2YlS3bvL
 8wBVKNQ4vrhxxEX44yPRTfyb8MYH1RCUfAqCs0CUSsDxya5Ws9t/LEty/r/LZms76KZ4bDXQ39E0Z
 wsHG2DJ8mwDuHEWpY69KwSxOPTjifGaHpCh0PI9FaiViCo7hGfEvC58HNeoG/cScCBq8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0Tm5-00GNtk-Cs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:24:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C41C723A58;
 Fri, 15 Jan 2021 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610735076;
 bh=74tyf/NRyjp7aV16DxHd1CVRi/GRx0Qd46mVqvrlGkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bmnt1spENj8MmoMybeWfmF4QggXk38vl8jZ1YhVw3SJ/x99Xf3dwVGsWJAHU2VdyO
 1VH06vEUULKmh5JtOfqGcK3ztJqKQfqOq9RopUBwd6G/sbjtbpnsrXRDgOgJ6EUDC1
 gnL3wVcqUOk0rTjokAspYz9VXzJGtLSJ0lc86AmckDLgvwtR5AJS02ECmXtoWKXtmz
 OjlWlsUFureSpe4wHWNHJf62sJXMo6XnWDiN52Vo6lX5vj0TBjwFfkbguN2tos4WlO
 ZYJQMR8/Gt8JW/M71D9irOzVEc6OkskjU3nGpN45KH8QZm1G4/OWN6Odh3t1So6IMA
 eMtBJJwePdPjg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:24:01 -0800
Message-Id: <20210115182402.35691-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115182402.35691-1-ebiggers@kernel.org>
References: <20210115182402.35691-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0Tm5-00GNtk-Cs
Subject: [f2fs-dev] [fsverity-utils RFC PATCH 1/2] Upgrade to latest
 fsverity_uapi.h
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Victor Hsieh <victorhsieh@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add the FS_IOC_READ_VERITY_METADATA ioctl.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/fsverity_uapi.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/common/fsverity_uapi.h b/common/fsverity_uapi.h
index a739c9a..c59a897 100644
--- a/common/fsverity_uapi.h
+++ b/common/fsverity_uapi.h
@@ -85,7 +85,21 @@ struct fsverity_formatted_digest {
 	__u8 digest[];
 };
 
+#define FS_VERITY_METADATA_TYPE_MERKLE_TREE	1
+#define FS_VERITY_METADATA_TYPE_DESCRIPTOR	2
+#define FS_VERITY_METADATA_TYPE_SIGNATURE	3
+
+struct fsverity_read_metadata_arg {
+	__u64 metadata_type;
+	__u64 offset;
+	__u64 length;
+	__u64 buf_ptr;
+	__u64 __reserved;
+};
+
 #define FS_IOC_ENABLE_VERITY	_IOW('f', 133, struct fsverity_enable_arg)
 #define FS_IOC_MEASURE_VERITY	_IOWR('f', 134, struct fsverity_digest)
+#define FS_IOC_READ_VERITY_METADATA \
+	_IOWR('f', 135, struct fsverity_read_metadata_arg)
 
 #endif /* _UAPI_LINUX_FSVERITY_H */
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
