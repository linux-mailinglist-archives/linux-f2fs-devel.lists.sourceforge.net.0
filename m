Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F7CB8ED7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Dec 2025 14:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b8bFK6dLqxvnOgn2CPOhKShH+F0NIFvHC23KDfr+4Ds=; b=iUtZjac9qOgFNNUvMFIxj8DLwU
	GfUIOmzxKxdSzgXpU+B9guXUxRz1G7EGePAKnz697fIMg6j93csX7ozi1pVo0NVdJiD5MEutunLys
	6fd2W6/og8BMEr7FItVhztNC7nB/4hjc3UVCzgT1f8tXFOutEkvD4md682WphsMMrqP4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vU3Zi-0001Kk-4R;
	Fri, 12 Dec 2025 13:52:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vU3Zg-0001Ke-Qy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 13:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=78+debK4JtcQzoXfeUOiXLziJ8MT5wuvIPBhNSWKCQ8=; b=SJOkU7nchrE4ksvjjiS+mZyw9w
 E/fTfYwN8q+ITdxviRyHvGIgavvVjS3NVFijNG/EScK44V70AqaRoYghcXJ95qY4bcmV5Kcnx6S5H
 qddACWJiUtVA9Y2ntzJA56DDDcGpBbcrslEI2OC7ryjm269DOH7iClJH6bMC4YkkW37c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=78+debK4JtcQzoXfeUOiXLziJ8MT5wuvIPBhNSWKCQ8=; b=T
 dOXKMXBj9QdpEtxAlQDBqqDAHOr2FY68XAyoFHO5e4wxWa1NCOFNxOlOME00I5702PE0/H9ap/X0l
 q8QGFAJoEI/9Xs3+Q0cb8XIuKmovyYsFp537VGa1/g83KPTOs8mNE3bixOpSsoBH0GzykTYnwpn0B
 ROCiJ8ZOIL8y/Vio=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vU3Zg-0005qv-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Dec 2025 13:52:48 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-34abc7da414so683816a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Dec 2025 05:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765547558; x=1766152358; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=78+debK4JtcQzoXfeUOiXLziJ8MT5wuvIPBhNSWKCQ8=;
 b=VazWbgjwSglKIdTbP6ll+Yq7Ko/I9GycZpYsGDht+4OlPzPVN4RM+rqKr8NnPBLBrh
 eDJovqsvFjfZMQdYKppxq4oSa0XuAH4lVmuJs715pcbO9LNuDrYc2k72myh6+lyDQDcA
 j4WD6z+6VHPLMWH4ARz7a/kT1FnD6f+I83GOMLCmy+exci1SfUbQaXzOMxnQTE1lMGAP
 uyhKYW3Bqdj/DS3hNpZQg4A0ZaH9EdJkLbkIhLc+NAdzkg412wmcTHsnxHBiP200m1nO
 AlC6ZePjASbJSwmInUQyo9T4my9igXwhfS9CviQ/J1oB9vpsG0g+dSxg1V5ZbmrkEcP9
 Zy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765547558; x=1766152358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78+debK4JtcQzoXfeUOiXLziJ8MT5wuvIPBhNSWKCQ8=;
 b=D0hyNFhgBCrrD/kN4H9K85l35Dn8CQ3OgQ3LS8Idcr4GgyCgfbrf26bfICn+yfcXDq
 5BIxrkwYqeMEE54zaTiE/K9ehyiYreXjqS3F8JqzaIBJdyuQzPSsIgKhdI9aDJeUiXs3
 RJAamHoURc0SCMOlZsDIL/EMqonow0dpHuM6+/vLbprlGeOike4WptzA/7kGA5C2KGyC
 fvG4rwIWDUNTcF82fN6mNDLN6BknN7chGcepg9p24sft1oMw7+jfnOphlqlJelbxJNFm
 1ppBfhCDsF0cCvanANGzCnuu289B+NW+VtIcJ2rSjVabA1WqBbLTegSiYFwYJdFqnGHK
 +bQg==
X-Gm-Message-State: AOJu0YwE463UieQhRKCPx/NgM/qHX1tkCA16/CnCLRrWG7rdFxpCl5TW
 rKC3lk298Cd/30Nz0mDlzsVdygSpGG3UdVu9RAaVDu571ZLXwvHWhPxw
X-Gm-Gg: AY/fxX4jjqpI+jX9TjYpm4TfW6OT1fA2OEWDiFK46V5AOsaEWrH1JgsHCYrfJXcrLVz
 EXeyW4ZcSWX8bePQoJbI9bYFIv0dJsja1+3zFXBuMIo8aFEkCyFb5iVjWQffF+8Oflf9vWTP7r4
 NKka1+seqj+gmG95T12PdMKD6a+Wa0KXoB2HDe+TjKA5Ko5p3t7bWCCqIZf/86rH4shTpKbmmf8
 Zldks9SCJ/uJAdVoTf5DkkXvphgsmW59pNzGGFwQPRNxybwBnSYbKudpTo0fAkxe7V6FfgKKpif
 v4YWigkP3i7+IhydrZLQ4h6+JlW5zdvwHPS1jOesRK6ZE/lVvZf8mz3eXanmskhMedEKBW2nwJ0
 skK+UmDbftE4lLJMG8jhbOYyRq6BgiAtOHddYEQZLR3cQQXSLRHcO6Sr6Noqh27RzWO/n6EByOp
 iTAqyp9EU9jmhv0PdVnFuBxEGRmUIl6WL6Xd5Sm/kHpnYAk0mQCaOH92LA1Q==
X-Google-Smtp-Source: AGHT+IHWCdoJwE+CHaMFS4yGkW6c0D452XsUkkTfPWOpSSccocH5zo3wDVv6CxYF1WlKcaT3t01ZXQ==
X-Received: by 2002:a17:90b:28cd:b0:341:3ea2:b625 with SMTP id
 98e67ed59e1d1-34abd6d8751mr2059530a91.12.1765547557560; 
 Fri, 12 Dec 2025 05:52:37 -0800 (PST)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34abe41237csm2019834a91.17.2025.12.12.05.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 05:52:37 -0800 (PST)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 12 Dec 2025 21:52:21 +0800
Message-ID: <20251212135221.690241-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang For readahead, if the current readahead
 window is smaller than the extent size, expand the window so that larger
 bios can be issued and improve overall read performance. Signed-off-by:
 Yongpeng
 Yang --- fs/f2fs/data.c | 11 +++++++++++ 1 file changed, 11 insertions(+)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vU3Zg-0005qv-Fa
Subject: [f2fs-dev] [RFC PATCH 1/1] f2fs: adjust readahead window based on
 extent length
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

For readahead, if the current readahead window is smaller than the extent
size, expand the window so that larger bios can be issued and improve
overall read performance.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/data.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c30e69392a62..2e5cbdb7729c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2377,6 +2377,17 @@ static int f2fs_mpage_readpages(struct inode *inode,
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
 
+	if (rac) {
+		loff_t block_in_file;
+
+		block_in_file = rac->_index;
+		map.m_lblk = block_in_file;
+		map.m_len = max(nr_pages, inode_to_bdi(inode)->ra_pages);
+		if (!f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT) && map.m_len > nr_pages) {
+			readahead_expand(rac, block_in_file << F2FS_BLKSIZE_BITS, map.m_len << F2FS_BLKSIZE_BITS);
+			nr_pages = readahead_count(rac);
+		}
+	}
 	for (; nr_pages; nr_pages--) {
 		if (rac) {
 			folio = readahead_folio(rac);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
