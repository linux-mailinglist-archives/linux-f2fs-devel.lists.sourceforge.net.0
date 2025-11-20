Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA8C76AF1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 00:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Is35RbkZw/8EgkwOrr27LS7peufLKJTznrcJJ6jHnQE=; b=lUCp80r+C6iJAcIzxzEBAAfRWJ
	ca7AAc+oJ+Zwap95YCRFjzeIFg9CkYIgnsU9wnlaS2HY4AnnxZOVo97PpGd9bpR9IOMO9HvXtc82J
	3hU8T/5x5TdVMPXeKT4wEp3aE11iRlXpq9+zEDBbtf60BHf41oPt3cu0+WwHncYALb/Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMEUR-00061r-1S;
	Thu, 20 Nov 2025 23:55:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMEUO-000610-IG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Nov 2025 23:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3tWrGGPq/x2mecmYTCC9zuk+XQuiH8YbTkkDwxdD/d0=; b=ZQoR05W8n2QTdNxxP1OqM7Qui5
 OV7f6fKdTBh3c2ka8J9t3ZU69fQhD7UWOlYsMIDF/GD38bWH7dMGPkuM1li11vusZwoEnAwTAnzha
 oVR38CynEz6AYV+REwCnR3tl/CufbWuf4bGr24kXAvIJ/eblxpMjiVl6HzOAyZhnc8G0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3tWrGGPq/x2mecmYTCC9zuk+XQuiH8YbTkkDwxdD/d0=; b=kqCJaOxGa1v35+Es9cqpkYwy3q
 A4Q/Hd9H27ItQQdxV/C9BqZIn8MUkSfg8Nv8uPGHN6uasOZey/LUMhs6CqvcjcKC89afb4vXq0S8j
 VrEycsjq/z6MYachunRLPjnMgK9XXXyVN58NTzCq3NZnO6Zwfsa9gnvsz6+73smVauwY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMEUN-0006Ze-SE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Nov 2025 23:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B0BC60214
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Nov 2025 23:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E0BC4CEF1;
 Thu, 20 Nov 2025 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763682893;
 bh=7hadHWrex7l0Qk6dVFcgcDvJ11aMBT9m5I/BvqT03tk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BsuX1d/kl1pyU18SPvxiad1NiiuHDD8ICiLhchwgEq2YHI7s41vPonFfcAf1SRIyh
 Utix4jutajaGJztKQ/UrknBCmK6NjV0pPf5Z0m2ocN+1iv3CmqfD2YFu3jPc3hQWI6
 ORkyw3tqNEiIlVpzaOfqqhXeFWhhofsAgohvkcXRoBCkRNmfojzgqQ6kr9OrWx9Rhm
 c9aOq4V/sQoanFD9kb0KoVMLNkJzibNCtSC02MJ2CzspjT5ZhagKSuou6iyPguZTK/
 711O8qQHUBrA3HbiHzuKZU5IlT8w3y/PUuE10uS9lJlU3c8zKCeeeIXmVqnFPI3bho
 HZY5PV5Vh8VJw==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 20 Nov 2025 23:54:46 +0000
Message-ID: <20251120235446.1947532-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
In-Reply-To: <20251120235446.1947532-1-jaegeuk@kernel.org>
References: <20251120235446.1947532-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For example, 1327.539878: f2fs_preload_pages_start: dev =
 (252, 16), ino = 14, i_size = 4294967296 start: 0,
 end: 8191 1327.539878: page_cache_sync_ra:
 dev=252:16 ino=e index=0 req_count=8192 order=9 size=0 async_s [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMEUN-0006Ze-SE
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add a tracepoint to see large folio
 read submission
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For example,

1327.539878: f2fs_preload_pages_start: dev = (252,16), ino = 14, i_size = 4294967296 start: 0, end: 8191
1327.539878: page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=8192 order=9 size=0 async_size=0 ra_pages=4096 mmap_miss=0 prev_pos=-1
1327.539879: page_cache_ra_order: dev=252:16 ino=e index=0 order=9 size=4096 async_size=2048 ra_pages=4096
1327.541895: f2fs_readpages: dev = (252,16), ino = 14, start = 0 nrpage = 4096
1327.541930: f2fs_lookup_extent_tree_start: dev = (252,16), ino = 14, pgofs = 0, type = Read
1327.541931: f2fs_lookup_read_extent_tree_end: dev = (252,16), ino = 14, pgofs = 0, read_ext_info(fofs: 0, len: 1048576, blk: 4221440)
1327.541931: f2fs_map_blocks: dev = (252,16), ino = 14, file offset = 0, start blkaddr = 0x406a00, len = 0x1000, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 0, err = 0
1327.541989: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 0, nr_pages = 512, dirty = 0, uptodate = 0
1327.542012: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 512, nr_pages = 512, dirty = 0, uptodate = 0
1327.542036: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 1024, nr_pages = 512, dirty = 0, uptodate = 0
1327.542080: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 1536, nr_pages = 512, dirty = 0, uptodate = 0
1327.542127: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 2048, nr_pages = 512, dirty = 0, uptodate = 0
1327.542151: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 2560, nr_pages = 512, dirty = 0, uptodate = 0
1327.542196: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 3072, nr_pages = 512, dirty = 0, uptodate = 0
1327.542219: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 3584, nr_pages = 512, dirty = 0, uptodate = 0
1327.542239: f2fs_submit_read_bio: dev = (252,16)/(252,16), rw = READ(R), DATA, sector = 33771520, size = 16777216
1327.542269: page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=8192 order=9 size=4096 async_size=2048 ra_pages=4096 mmap_miss=0 prev_pos=-1
1327.542289: page_cache_ra_order: dev=252:16 ino=e index=4096 order=9 size=4096 async_size=2048 ra_pages=4096
1327.544485: f2fs_readpages: dev = (252,16), ino = 14, start = 4096 nrpage = 4096
1327.544521: f2fs_lookup_extent_tree_start: dev = (252,16), ino = 14, pgofs = 4096, type = Read
1327.544521: f2fs_lookup_read_extent_tree_end: dev = (252,16), ino = 14, pgofs = 4096, read_ext_info(fofs: 0, len: 1048576, blk: 4221440)
1327.544522: f2fs_map_blocks: dev = (252,16), ino = 14, file offset = 4096, start blkaddr = 0x407a00, len = 0x1000, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 0, err = 0
1327.544550: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 4096, nr_pages = 512, dirty = 0, uptodate = 0
1327.544575: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 4608, nr_pages = 512, dirty = 0, uptodate = 0
1327.544601: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 5120, nr_pages = 512, dirty = 0, uptodate = 0
1327.544647: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 5632, nr_pages = 512, dirty = 0, uptodate = 0
1327.544692: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 6144, nr_pages = 512, dirty = 0, uptodate = 0
1327.544734: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 6656, nr_pages = 512, dirty = 0, uptodate = 0
1327.544777: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 7168, nr_pages = 512, dirty = 0, uptodate = 0
1327.544805: f2fs_read_folio: dev = (252,16), ino = 14, DATA, FILE, index = 7680, nr_pages = 512, dirty = 0, uptodate = 0
1327.544826: f2fs_submit_read_bio: dev = (252,16)/(252,16), rw = READ(R), DATA, sector = 33804288, size = 16777216
1327.544852: f2fs_preload_pages_end: dev = (252,16), ino = 14, i_size = 4294967296 start: 8192, end: 8191

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c              |  1 +
 include/trace/events/f2fs.h | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8f433677c49d..a0433c8a4d84 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2521,6 +2521,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		index++;
 		offset++;
 	}
+	trace_f2fs_read_folio(folio, DATA);
 	if (rac) {
 		folio = readahead_folio(rac);
 		goto next_folio;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index e00611ead024..d406b047c50b 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1349,6 +1349,7 @@ DECLARE_EVENT_CLASS(f2fs__folio,
 		__field(int, type)
 		__field(int, dir)
 		__field(pgoff_t, index)
+		__field(pgoff_t, nrpages)
 		__field(int, dirty)
 		__field(int, uptodate)
 	),
@@ -1359,16 +1360,18 @@ DECLARE_EVENT_CLASS(f2fs__folio,
 		__entry->type	= type;
 		__entry->dir	= S_ISDIR(folio->mapping->host->i_mode);
 		__entry->index	= folio->index;
+		__entry->nrpages= folio_nr_pages(folio);
 		__entry->dirty	= folio_test_dirty(folio);
 		__entry->uptodate = folio_test_uptodate(folio);
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, %s, %s, index = %lu, "
+	TP_printk("dev = (%d,%d), ino = %lu, %s, %s, index = %lu, nr_pages = %lu, "
 		"dirty = %d, uptodate = %d",
 		show_dev_ino(__entry),
 		show_block_type(__entry->type),
 		show_file_type(__entry->dir),
 		(unsigned long)__entry->index,
+		(unsigned long)__entry->nrpages,
 		__entry->dirty,
 		__entry->uptodate)
 );
@@ -1394,6 +1397,13 @@ DEFINE_EVENT(f2fs__folio, f2fs_readpage,
 	TP_ARGS(folio, type)
 );
 
+DEFINE_EVENT(f2fs__folio, f2fs_read_folio,
+
+	TP_PROTO(struct folio *folio, int type),
+
+	TP_ARGS(folio, type)
+);
+
 DEFINE_EVENT(f2fs__folio, f2fs_set_page_dirty,
 
 	TP_PROTO(struct folio *folio, int type),
-- 
2.52.0.487.g5c8c507ade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
