Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020C49D846
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 03:48:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCupQ-0002Sb-5V; Thu, 27 Jan 2022 02:48:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nCupO-0002SN-J1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M8NYMcBcZD8GUv0cDvsP1eePtGigG8J8np/yV6nLjQQ=; b=apj5OwIuqmS9KzpzFQc8efrdoi
 /46I34ZrfRM3T4pu0hjHsXqQonctldRMeb7kMV3DaYTMXLA0/qOwU2vPSVDEmXzUx4WklCrBqS/YT
 9/ZZD4G2up5ozRlyViQ/pWKQr7q4HGUhA0EuXp+MTmn60m7BxaGaKCN/J59NrkRU9O0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8NYMcBcZD8GUv0cDvsP1eePtGigG8J8np/yV6nLjQQ=; b=iRqlnQyO2EaD85bWL7MHqjixZl
 ++EoAK6MyJVdxey4iUgIhEi8kr7pmRM8RTCdtP2pQBCay6pcRAvjW6a926oaucBQzLCFIjsbiMOEB
 hjGIUa6C58cacezgHxPEBdE2mKUTYclTtUU8pZBlcCovj/F9GY3/4nXezpcDuwpFxhaw=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nCupK-00FTNy-UH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:48:01 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D50621901;
 Thu, 27 Jan 2022 02:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643251668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8NYMcBcZD8GUv0cDvsP1eePtGigG8J8np/yV6nLjQQ=;
 b=lpTMtDdgzXu6IXlWF2Cla7JZeA4O6IZP0tjrp8fZaU7ivDos+PHoL/XQMfCABF+bEfNOP4
 asGZxs7WKvGfhEBJWG6JTtSILEhDDfyUZDxdz3isEFlXeNYP4t4z60IMGMWtpxXKM9DXAB
 qZWJthZJaYv1R8Swu1zG6SDpKtDJcMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643251668;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8NYMcBcZD8GUv0cDvsP1eePtGigG8J8np/yV6nLjQQ=;
 b=GajJ1CW7bGmknt+eypyqRIr6NQ5RkVudFMz7+fbL2W6FyuUKWG82yY6INCh5zJBg+nHfCU
 1tfjV2LY/eskY2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5662613E46;
 Thu, 27 Jan 2022 02:47:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1653BcwH8mHgKwAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 27 Jan 2022 02:47:40 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 13:46:29 +1100
Message-ID: <164325158956.29787.7016948342209980097.stgit@noble.brown>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_write_single_data_page() can return -EAGAIN if it cannot
 get the cp_rwsem lock - it holds a page lock and so cannot wait for it. Some
 code which calls f2fs_write_single_data_page() use congestion_wait() and
 then tries again. congestion_wait() doesn't do anything useful as congestion
 is no longer tracked. So this is just a simpl [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nCupK-00FTNy-UH
Subject: [f2fs-dev] [PATCH 3/9] f2fs: change retry waiting for
 f2fs_write_single_data_page()
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_write_single_data_page() can return -EAGAIN if it cannot get
the cp_rwsem lock - it holds a page lock and so cannot wait for it.

Some code which calls f2fs_write_single_data_page() use
congestion_wait() and then tries again.  congestion_wait() doesn't do
anything useful as congestion is no longer tracked.  So this is just a
simple sleep.

A better approach is it wait until the cp_rwsem lock can be taken - then
try again.  There is certainly no point trying again *before* the lock
can be taken.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/f2fs/compress.c |    6 +++---
 fs/f2fs/data.c     |    9 ++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d0c3aeba5945..58ff7f4b296c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1505,9 +1505,9 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				if (IS_NOQUOTA(cc->inode))
 					return 0;
 				ret = 0;
-				cond_resched();
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				/* Wait until we can get the lock, then try again. */
+				f2fs_lock_op(F2FS_I_SB(cc->inode));
+				f2fs_unlock_op(F2FS_I_SB(cc->inode));
 				goto retry_write;
 			}
 			return ret;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8c417864c66a..1d2341163e2c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3047,9 +3047,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				} else if (ret == -EAGAIN) {
 					ret = 0;
 					if (wbc->sync_mode == WB_SYNC_ALL) {
-						cond_resched();
-						congestion_wait(BLK_RW_ASYNC,
-							DEFAULT_IO_TIMEOUT);
+						/* Wait until we can get the
+						 * lock, then try again.
+						 */
+						f2fs_lock_op(F2FS_I_SB(mapping->host));
+						f2fs_unlock_op(F2FS_I_SB(mapping->host));
+
 						goto retry_write;
 					}
 					goto next;




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
