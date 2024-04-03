Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6F896744
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvQD-0002nN-0s;
	Wed, 03 Apr 2024 07:52:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvQ9-0002mh-Ul
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5WH/5LPzN9bHNaWy1O6F7SVrQKWYv/okRnljM021VRQ=; b=HcwG2XfNwGqvuyHwyyzlWzQAKA
 gJpDKyIvS/HCcOYs1jprEU2dS2+8IlZ1ZacjVpkGc2R5yRstucF2hdPTIRPwbe95s95/tqMo2rgii
 O3n26vJmgvjjC8n7Hpo6C861lEcUdIP9KcZ2YqVucJNryoyCX7enENyhiTpnNfd7RHek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5WH/5LPzN9bHNaWy1O6F7SVrQKWYv/okRnljM021VRQ=; b=egxWEVOM/qImna+vkJTNG8xO9E
 +k3UjIcP/bXXMTP8IOwZu8HuwUbsyMskrHX6YM32G7qd3QXLr2MWxgYODIpb3cBn0K/HGzhGuErJF
 cgqUmKAi6kwB9pmX6ATBg55wX24Q2sVli3QY/k3JZlnxSK/tVD3Iqr6EWa7fnkWAeOTU=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvQ6-0001m2-D8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:31 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id EFBB2807E8;
 Wed,  3 Apr 2024 03:33:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129592; bh=GM61hCA7kvAHqNWRBNMS7+3u4Ivx/tDJO9J885fhLWo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QEytHR5MrDl3eno9gSXLyQB780SiYAwX/SZdkiJabaBXvfAUR2a/I55tLnkfL+CpI
 LnJTjdaz247j/qKvYwDUu7CxYvVbE8cVGMf0WclMBiAvAT10XgKz3HSg1Ml/SaYXQa
 rg2PstwGLpZAeUn5EpHRZFRcrevxmhyfmtSUhkJtQUFuxI0LSJpShGx9d+xVczDG3M
 x8y3lzEBsciaVn1VquDjmkqOHeXLmOzuRycxl5c2xZombu1LEM3DPEHr6zhFU2SLrO
 ClzRjg6qvWGUqMZ4Ods46LlfFVGV113DU5DLef8bULDeQuG84gvVvSjV6FppbEL/WO
 qyopps01ElZSg==
To: Jonathan Corbet <corbet@lwn.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Date: Wed,  3 Apr 2024 03:22:45 -0400
Message-ID: <ed3a3c3edbf01b728c20c0718d227ebb79611f47.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
 --- fs/btrfs/extent_io.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-)
 diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c index
 9e421d99fd5c..e9df670ef7d2
 100644 --- a/fs/btrfs/extent_io.c +++ b/fs/btrfs/extent_io.c @@ -2706, 7 +2706,
 7 @@ static int emit_fiemap_exte [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rrvQ6-0001m2-D8
Subject: [f2fs-dev] [PATCH v3 04/13] btrfs: fiemap: emit new COMPRESSED
 state.
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 fs/btrfs/extent_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 9e421d99fd5c..e9df670ef7d2 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2706,7 +2706,7 @@ static int emit_fiemap_extent(struct fiemap_extent_info *fieinfo,
 			if (range_end <= cache_end)
 				return 0;
 
-			if (!(flags & (FIEMAP_EXTENT_ENCODED | FIEMAP_EXTENT_DELALLOC)))
+			if (!(flags & (FIEMAP_EXTENT_DATA_COMPRESSED | FIEMAP_EXTENT_DELALLOC)))
 				phys += cache_end - offset;
 
 			offset = cache_end;
@@ -3236,7 +3236,7 @@ int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
 		}
 
 		if (compression != BTRFS_COMPRESS_NONE)
-			flags |= FIEMAP_EXTENT_ENCODED;
+			flags |= FIEMAP_EXTENT_DATA_COMPRESSED;
 
 		if (extent_type == BTRFS_FILE_EXTENT_INLINE) {
 			flags |= FIEMAP_EXTENT_DATA_INLINE;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
