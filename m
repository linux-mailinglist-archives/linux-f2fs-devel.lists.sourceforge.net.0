Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOF1NiL6GGqvpQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 04:29:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5655FC63E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 04:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZGa9RwOMC7xhJuV9iF1XiLCqbDU94G0loQ0OlNeRsFg=; b=aeT4WLv/i1booNzwnfm4C7/uJs
	80aI9p0dnxNFb5BVIX7xTvesUnWAgwpgBtWtoClv5p0QP6H5DOQBYJpD/55rIkxHcrtKK0I9r1+qU
	Lt1+t7zdz7irFlJaKT2G4loG0h9Fy9wGGPrmw4xvbp4aqe5RJN3j/70kBy7XVIBLE02Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSmym-0007vy-Ft;
	Fri, 29 May 2026 02:29:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wSmyl-0007vq-RI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 02:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ZOkaYrqky10WkHIDKr7bJwwYWzRRoO9WOSbHh2V/Zw=; b=jsbcGScU3UIufwB8azvY8zUEDk
 O+iRtKAWXFuSHg2/VWz/BG3n8Z5/BEanpCEUmwtK1JfQ6R86N2i5P8akS8JSW6I7j2MEXRSDxe/o/
 YqUz3HmpbnuCAMLrilFzUFP6wKOY4eV4zxj/R5VZHcZNZ/eTh5Dh0uLG7TgqRBA1spAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8ZOkaYrqky10WkHIDKr7bJwwYWzRRoO9WOSbHh2V/Zw=; b=h
 1mVBmMRTakWY/4akUgr2knLofD10TJVGKK7SlRTCIFy09YmTykiDsyZ5TZJkHz3Zih+i41TEAnqsU
 9wM96AEiNKG5aCooYNbNo0f3YLf4qhKu6bpvoRmCWO2+Phhe6fI5D3WxurXumglZGDdGYPaSybtiW
 KYTU/Ka/YYtLJJWY=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSmyi-0002FZ-8M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 02:29:41 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-36b9ec98144so616439a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2026 19:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780021770; x=1780626570; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ZOkaYrqky10WkHIDKr7bJwwYWzRRoO9WOSbHh2V/Zw=;
 b=W6Zc2+KuQ/U+LcZSs7TL1zC84mbD74Yyaj1WQLIyXgqX6OpL44y7FhTXUdW+HhFnmL
 foflZ2OkVKNWsoWj5aE6AIDtb7znqb2Hj3USTbTEMB1/w82fjWfirStABkCaEfh2ZLT9
 URjx50qKSEhb2mPGlUr9zRaX4ObhGMEb4fmo6Bsj0JpFYLEOWefXLHrKqHax0icPNMcP
 4wwbTM9QGBHl0XAhT+AxCeMNepuG6xEsl5bA1EQzR5I/Z+Cxkh62ics9oxnb09mAlIok
 2DOGKKM6NLIbMot+6TfE1EmRBekbfIM9DGzyCSIBVL4LMHg/JVsF65yg8bMGlFLhHKO8
 3ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780021770; x=1780626570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZOkaYrqky10WkHIDKr7bJwwYWzRRoO9WOSbHh2V/Zw=;
 b=L5SwAxfIkAC5PWtUOjcOAe1wViM37x8Na5M2iBfwJQiv+d5MvOW56qgV2wfyzLk7Oq
 XN/68LmsGJfSp+M3piIzCaLaDxF92/69M43OwMIeRAoEdKRhpgusl6LLge2ciXH+9ABl
 PqwxYnGfFDx6n4GDt+g1EyHMcLc9Opizrcu4J8odKeQM1oe+e/qNu89ZZAGl1YLBR7wK
 o5FZB+kFLVQqCusdmAvsMxWVS3HkvvFrZYt/tq8GtKEDHy3j3ip92oqAy5FO/qJ0bkDJ
 slu7j1i6X8nJFnk54aFLpDamA6/CsWdYq6JqlL9tyPQ5fOXh8TYqCVJ6B1IRWCw2dep6
 XWWg==
X-Gm-Message-State: AOJu0YxGwdFKMJ9RKiqPsgjqTikikPTyhXPpXYox0j9kalr6YkU+W21c
 yVqOdB2J3idtq0Rh84nD/Eb4FMemDcVLPvvLOve6cEr7ANik/iW0UPfM
X-Gm-Gg: Acq92OEl2wGN9igmwJk5vZze1CTZ5t6obZMW1F/5weaQjJ5tmUS5973LbSoA+1nJAuL
 xXGIyUCny4hz/Yw+aCA03h7ZzlUQcFv9skd7GJ5DrmEHs2XoD+pv3UvqPJgGdLpnTb5ZRt3Qhdd
 aZYK5tq7kb1vZU8PZkR28jzEeCh6vE2D1stugnyjKElfLJVcNdg1HSllE6S8xpBNLWUk6oQXZJZ
 IXC2pqYsBK1+kzPoUAxxRWCO+T5SGcpG4D2E5pjucWEWsJ9g+jwCyAejtQDg+dneGB/2JcEmbGD
 CUS5ytRzzWwcLRQtcMRNTxBhTaNFRrv59r/sV2ISpyLjsH7CdrQ0kG9EKQ/dnfU9XKJScZFeD6i
 adj1r9xjWOFwFecR6bDL5xrWmhoJ4W6WMoS1pZBAG4qc+aZp+DjBC6X6T3jXZAzR3g5Z7JiReFQ
 Dtk2rMrAwn2IPA9y7t20ESAdX4MtlZGPy5hId4nX2d7F/tQDr83rGUIlyjF38ELpI+4y3GhA==
X-Received: by 2002:a17:902:fc48:b0:2bd:8822:d8cb with SMTP id
 d9443c01a7336-2bf209b0cf6mr12616285ad.23.1780021769903; 
 Thu, 28 May 2026 19:29:29 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23c2da36sm1375735ad.69.2026.05.28.19.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 19:29:29 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 29 May 2026 10:29:24 +0800
Message-ID: <20260529022924.3655519-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: prepare_write_begin() first gets the inode folio and builds
 a dnode, then checks the read extent cache. For an ordinary overwrite of
 a non-inline and non-compressed file, an extent-cache hit already g [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSmyi-0002FZ-8M
Subject: [f2fs-dev] [PATCH] f2fs: skip inode folio lookup for cached
 overwrite
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 1B5655FC63E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

prepare_write_begin() first gets the inode folio and builds a dnode,
then checks the read extent cache. For an ordinary overwrite of a
non-inline and non-compressed file, an extent-cache hit already gives the
data block address and the following path does not need to allocate or
update any node state.

Check the read extent cache before fetching the inode folio for that
narrow case. Keep the existing paths for inline data, compressed files,
and writes that may extend past EOF, where the helper may need inline
conversion, compression preparation, or block reservation.

This avoids a node-folio lookup in the buffered overwrite fast path when
the mapping is already cached.

In a QEMU/KASAN x86_64 VM, using a small buffered overwrite workload on
an existing 1MiB file, median time improved as follows:

  64-byte overwrites:  1724.93 ns/write -> 1560.24 ns/write
  256-byte overwrites: 1713.38 ns/write -> 1577.85 ns/write

Function profiling of 20k 64-byte overwrites showed
f2fs_get_inode_folio() calls drop from 20004 to 4.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/data.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..3b32f9b75b77 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3719,6 +3719,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	int flag = F2FS_GET_BLOCK_PRE_AIO;
 	int err = 0;
 
+	if (!f2fs_has_inline_data(inode) && !f2fs_compressed_file(inode) &&
+	    (pos & PAGE_MASK) < i_size_read(inode) &&
+	    f2fs_lookup_read_extent_cache_block(inode, index, blk_addr))
+		return 0;
+
 	/*
 	 * If a whole page is being written and we already preallocated all the
 	 * blocks, then there is no need to get a block address now.
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
