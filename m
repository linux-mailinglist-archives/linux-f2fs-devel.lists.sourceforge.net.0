Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABBED25D70
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jan 2026 17:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fSKsOxcPkgkfjnGppdoeKKGZUTNuW5BfJ5X2p9YDNdY=; b=f1d4sKmoIk0vQwzq9PkF3V1Dqt
	kuP87O25xhU61hmZZ+0NR706HFd45M0n8fLQ2cC7PgdN9NTlbGcbeyN+fCl4UkuCmK5ppnmDXfmFE
	onaBUqamfcDDpY5MmIbveOxNA4DCco4Q56lYV3uz0ubyM5qeDy4rJgA6Rf/9nfKbI6Pk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgQXb-0004tX-C1;
	Thu, 15 Jan 2026 16:49:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vgQXY-0004tB-Li
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 16:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TtMDwjJmQDCysAjZU4J+sR1UmiIVmhUbTayH2sHz6Mg=; b=iG5k/V7RavNxNxfqvFYQEr5eyG
 a7FJimf25iGkjc+PKJANOe+hAoYIGCVQ2UlcteY0zMOIxXBcVxb0SqyWC8MBXVarY3OGeIWb8jNzO
 gpVYk5sKPSS34Jvh7mXfBZtGJgGWwloB3uePXPQvaRe6IQfpYZESi5SFfPhcNhdnTEV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TtMDwjJmQDCysAjZU4J+sR1UmiIVmhUbTayH2sHz6Mg=; b=j
 lTidPoEkegzLiIaWgvh8Xgm76UwDt0oQKysX4QeLfVrVwt5jPK6JhupGxnF7/geDhmdwrijag4pZA
 L7xL7CCL3fu8KqaLmwaKn8fXnuxqxksIe0gDtTvxns7s4PIZFt3JqCCY75whlGa4Ne3Tg+qjlWyB5
 Zx+dc1G/hpDCXkWI=;
Received: from smtp153-171.sina.com.cn ([61.135.153.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgQXY-0004vx-E5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jan 2026 16:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768495784; bh=TtMDwjJmQDCysAjZU4J+sR1UmiIVmhUbTayH2sHz6Mg=;
 h=From:Subject:Date:Message-ID;
 b=oovd4FmMPa29iBstC9kOK9iQ5iXUHH/u7iECtoc129Gs+FjBFK3kOQfhh8n5KLpVU
 vGu7fFf6Du8TwX2CzFhQX7hjKi1BlHiNa9DffSdt/l9Rqt7Bv5gwOeW3Agy+DEOOTN
 KRCIIB3FLJ5K9h8bNsLeiapMi18d21YRAJ52cuH0=
X-SMAIL-HELO: monty-pavel..
Received: from unknown (HELO monty-pavel..)([120.245.114.32])
 by sina.com (10.54.253.34) with ESMTP
 id 69691A9C000022AC; Thu, 16 Jan 2026 00:49:34 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9255746291927
X-SMAIL-UIID: 077BAD82E8554D9895B5C0622614E5E6-20260116-004934-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 16 Jan 2026 00:47:50 +0800
Message-ID: <20260115164749.11900-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang For pinned files, the file mapping is
 already established before writing, and since the writes are in IPU, there
 is no need to acquire the sbi->writepages lock to guarantee write ordering.
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [61.135.153.171 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sina.com]
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.114.32 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vgQXY-0004vx-E5
Subject: [f2fs-dev] [PATCH] f2fs: pin files do not require sbi->writepages
 lock for ordering
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

For pinned files, the file mapping is already established before
writing, and since the writes are in IPU, there is no need to acquire
the sbi->writepages lock to guarantee write ordering.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/data.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f32eb51ccee4..5b09b13289b7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3456,6 +3456,8 @@ static inline bool __should_serialize_io(struct inode *inode,
 	if (IS_NOQUOTA(inode))
 		return false;
 
+	if (f2fs_is_pinned_file(inode))
+		return false;
 	if (f2fs_need_compress_data(inode))
 		return true;
 	if (wbc->sync_mode != WB_SYNC_ALL)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
