Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A87F973E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Nov 2023 02:42:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7QeB-0004rQ-8v;
	Mon, 27 Nov 2023 01:42:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7Qe3-0004rJ-U8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 01:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WAIrT79llJwAvBUmn7Vab6k0s4D6hQ+YgZiI1XfCVw=; b=fi5x1xli53H5TmjiFZtvIzRECL
 bqb1N2f/F+RI5tY4aQMneWxRm5iGeIjJZw3sjyLLkdDm0Cx+G8CL9HFVFcNUxXXV5nYXbBdvzoRjl
 2eOpOF0t0jq/yvNwcpZTJKXUWpswoKtnSn/qR/10OZykpT+R/D/keFUiXft23UkRVJOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8WAIrT79llJwAvBUmn7Vab6k0s4D6hQ+YgZiI1XfCVw=; b=IpGk8v8bfjKAGlOyPaIM2GFRaK
 2etq5K3Phk2NAQWu54h/1AWDlxUJV8oexGMxg0M8+qKOmvePlWVtzz7N0U+i3D9powfTPncUQXrcR
 3BFcoLXfpD/q7MWpUoTluAi8h6SHGvhH2oAndTiA1esoajif1nQBtN0xbG6vZWarj87M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7Qdy-00GNvK-Dp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Nov 2023 01:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0E317B8068E;
 Mon, 27 Nov 2023 01:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87903C433C7;
 Mon, 27 Nov 2023 01:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701049349;
 bh=GKA8lckA3kiQfjh53FN2ORU9KZtTZWD6/Z2Dx/V3PH0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cxxBwkbU4t3nGMeuDHzg2zQ7+TbDsVJ+XkAuCpffwyymzX24qozLPHN8dElmndxkv
 Fb+ZhjqWRZhuqyPNnnDbbqvnHmj41xTTe46lPMk+XACuUS/4fIbM6ACzedrC3hE7O0
 U6oTtDR7KwYr/1x/y+SA5kBrnxgjcJ9Bff+3g9g+qTsF7yvdHPKpafrugYuqdSVDXV
 bLVwjCxy6Vw76WshxShERA8XFZAiRdB3o0ePC+PwbanLv6lmOPqZNxDTzPFaNE+HhR
 eaRbthkA+nRU3nE5XCJtgYYwhJswL1v4z1smEnGsIuTTChA6jR5ZXLEZo4tm7l+JZO
 kKveGLC0y0/4w==
Message-ID: <b68dfcda-5e30-d752-1539-e88db98949ee@kernel.org>
Date: Mon, 27 Nov 2023 09:42:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20231118020309.1894531-1-drosen@google.com>
 <20231118020309.1894531-3-drosen@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231118020309.1894531-3-drosen@google.com>
X-Spam-Score: -6.0 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/18 10:03, Daniel Rosenberg wrote: > The cache is
 initialized during the first read, however, it requires the > block size
 to establish its buffer. This disables the cache until the > block [...] 
 Content analysis details:   (-6.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7Qdy-00GNvK-Dp
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs-tools: Wait for Block Size to
 initialize Cache
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/18 10:03, Daniel Rosenberg wrote:
> The cache is initialized during the first read, however, it requires the
> block size to establish its buffer. This disables the cache until the
> block size is known.

Hi Daniel,

How about this? It be more explicit to indicate the logic?

---
  fsck/mount.c      | 2 ++
  include/f2fs_fs.h | 3 +++
  lib/libf2fs_io.c  | 4 ++++
  3 files changed, 9 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 72516f4..4dfb996 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1238,6 +1238,8 @@ int init_sb_info(struct f2fs_sb_info *sbi)
  	MSG(0, "Info: total FS sectors = %"PRIu64" (%"PRIu64" MB)\n",
  				total_sectors, total_sectors >>
  						(20 - get_sb(log_sectorsize)));
+
+	c.cache_config.blksize_initialized = true;
  	return 0;
  }

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 6df2e73..e377d48 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -460,6 +460,9 @@ typedef struct {
  	unsigned max_hash_collision;

  	bool dbg_en;
+
+	/* whether blksize has been initialized */
+	bool blksize_initialized;
  } dev_cache_config_t;

  /* f2fs_configration for compression used for sload.f2fs */
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 39d3777..bb77418 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -199,6 +199,10 @@ void dcache_init(void)
  {
  	long n;

+	/* Must not initiate cache until block size is known */
+	if (!c.cache_config.blksize_initialized)
+		return;
+
  	if (c.cache_config.num_cache_entry <= 0)
  		return;

-- 
2.40.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
