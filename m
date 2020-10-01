Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B752808CB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Oct 2020 22:51:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kO5Y5-0001ks-Ds; Thu, 01 Oct 2020 20:51:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lkp@intel.com>)
 id 1kO5Y2-0001kf-6j; Thu, 01 Oct 2020 20:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GudAcBfO2aHwVvPZH6uHcPJdmR4/X7WkRhgHdvLJ5S8=; b=KjcfZvmRjTgS4GG4fcCdaW7WmV
 dF7gyzkRPIls6sFLKvAVdMAbcJ74KT50Ww4SANQDykeNc52DF9SdJcQXvKtJcEYUgYcttyiquYTcl
 zs6B+wtF3fTL4jjCA79qA3OuIiMHVMw/M6Q0pjKPkJOnETEgdyp+SYkSTaMUnVzxRIiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GudAcBfO2aHwVvPZH6uHcPJdmR4/X7WkRhgHdvLJ5S8=; b=asx2KrxHbJe05dmGmIBr4+TJl8
 jbQ2/2CmZux3x+cK0ToX5RQ+FflzqJLIHBGLD0qyaA0A+JGgKrYy2w8pDNgnS+eR1xZWBRU7tSpsq
 ji53Y1/wq6L0ZmqnAwABQZX5cEETk1TqzI2Ndmj8LTq2sWlkjQk2CK5/7meGyM4BErEA=;
Received: from mga09.intel.com ([134.134.136.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kO5Xx-00GWCV-N5; Thu, 01 Oct 2020 20:51:30 +0000
IronPort-SDR: hfDtq88zA8Gqt1leyX/3buGIIswzznG80YnZL2tkedUP74B3dozmGQNS/JuKwI6g8JN98/KpIY
 nxH19ffQJMaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163690500"
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="163690500"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 13:51:10 -0700
IronPort-SDR: 1WoWD3tSYbFzQBWeDTTaPfvEOu+7ixNbKFfbkUjqGno6QjTOAq4jaTjd3jXSQ7+Ly60CB5l7FW
 2VRpEozO+XCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,325,1596524400"; d="scan'208";a="339703561"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 13:51:08 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kO5Xf-0000kE-FY; Thu, 01 Oct 2020 20:51:07 +0000
Date: Fri, 2 Oct 2020 04:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <nickrterrell@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20201001205049.GA6920@f58d09cd8e1e>
References: <20200930065318.3326526-4-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930065318.3326526-4-nickrterrell@gmail.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.24 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kO5Xx-00GWCV-N5
Subject: [f2fs-dev] [PATCH] lib: zstd: fix semicolon.cocci warnings
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
Cc: squashfs-devel@lists.sourceforge.net,
 Chris Mason <chris.mason@fusionio.com>, kbuild-all@lists.01.org,
 Nick Terrell <nickrterrell@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: kernel test robot <lkp@intel.com>

lib/zstd/compress/zstd_compress.c:3248:24-25: Unneeded semicolon


 Remove unneeded semicolon.

Generated by: scripts/coccinelle/misc/semicolon.cocci

CC: Nick Terrell <terrelln@fb.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

url:    https://github.com/0day-ci/linux/commits/Nick-Terrell/Update-to-zstd-1-4-6/20200930-145157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next

 zstd_compress.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/lib/zstd/compress/zstd_compress.c
+++ b/lib/zstd/compress/zstd_compress.c
@@ -3245,7 +3245,7 @@ size_t ZSTD_compress(void* dst, size_t d
     ZSTD_CCtx* cctx = ZSTD_createCCtx();
     RETURN_ERROR_IF(!cctx, memory_allocation, "ZSTD_createCCtx failed");
     result = ZSTD_compressCCtx(cctx, dst, dstCapacity, src, srcSize, compressionLevel);
-    ZSTD_freeCCtx(cctx);;
+    ZSTD_freeCCtx(cctx);
     return result;
 }
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
