Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4F07CA0D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Oct 2023 09:38:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qsIAx-0000OI-FO;
	Mon, 16 Oct 2023 07:38:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qsIAm-0000O7-Ns
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 07:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8+QhPwObtMDJ/BcO8UcknpOxgJzt98jsZDPft6IZDg=; b=dDwpcF5YDBXnq+W71gjYZRU+wK
 1/sW6faMN9oEOOWhDf30v2mpRVcpEQWwh5xb3LCjPNKYUqmyhlFnjtn8lJQZiPZ1p5AlqoIxVuKBf
 QQvRGOsjTWN1sja4Itojx6pCVLceri4DOrRf4TYP3B6sZWB6iPfuMlvSiLsYAWPB8IIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J8+QhPwObtMDJ/BcO8UcknpOxgJzt98jsZDPft6IZDg=; b=F3YOj7IQo0e/nUGqGiveShHFzC
 uNyJCwJZuS/bsHiRmelatv8ainWYr/MNaJUyKfpKaFUVJjuL5BEnTIuawCswXYNPgEpX3nOAqcrCv
 t5qJrhxKVCyEpYPTGUPAlP2GQVK2vcCB5JUMiMp7SCgzFhx945n6Lpf6hO/UMnE1Znsw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qsIAk-0001dW-I2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Oct 2023 07:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43447B810D2;
 Mon, 16 Oct 2023 07:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D3BC433C7;
 Mon, 16 Oct 2023 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697441867;
 bh=FNzUTuBfzvrUXizLUlXqjLaF57+7wKA7RX7E+mW/uVs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uKl0gLR5aCbqsy4jq6YSzWsz0n0y3ptbS/D2PUkZCXzkW5lCvAgKT5xJGgGtLFDpp
 +7/na5QhVIk2t4dW+6d6Ea59iUAk6ISccysTCRNKY6YWrTFAKrn/57mMhBwLGAUXaS
 u7VXdfIEOmLEbPfGnbZYZ4EsqtyqBgn1lZEm5BAV1+CGwHbG4SHVRfkAF1QnHjDsL5
 8IJYpd+qDzrHEYprTR5s+kA/B/j99qxa2b6eJr1vSXoMfmg8z9039dTN2+/GjHmm7m
 GMBGUt3pdt8BFGmET8k68JAeq2WLxFU2pzDzReA/pOq6Bo5egaObVUKQjgZ0p8UB7n
 GFCxhJ2h4Mhag==
Message-ID: <1880a7c4-9ab9-8e6d-f1d4-c2172a99685c@kernel.org>
Date: Mon, 16 Oct 2023 15:37:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1697194703-21371-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1697194703-21371-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/13 18:58, Zhiguo Niu wrote: > SBI_NEED_FSCK should
 be set for fsck has a chance to > repair in case of scan_nat_page fail in
 run time. > > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -3.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qsIAk-0001dW-I2
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error path of
 __f2fs_build_free_nids
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
Cc: niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/13 18:58, Zhiguo Niu wrote:
> SBI_NEED_FSCK should be set for fsck has a chance to
> repair in case of scan_nat_page fail in run time.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Hi Zhiguo,

Can you please check below update?

 From 9a3459d2d62a12f8708d72aa7808a1def9f9d92f Mon Sep 17 00:00:00 2001
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
Date: Fri, 13 Oct 2023 18:58:23 +0800
Subject: [PATCH] f2fs: fix error path of __f2fs_build_free_nids

If NAT is corrupted, let scan_nat_page() return EFSCORRUPTED, so that,
caller can set SBI_NEED_FSCK flag into checkpoint for later repair by
fsck.

Also, this patch introduces a new fscorrupted error flag, and in above
scenario, it will persist the error flag into superblock synchronously
to avoid it has no luck to trigger a checkpoint to record SBI_NEED_FSCK.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
  fs/f2fs/node.c          | 11 +++++++++--
  include/linux/f2fs_fs.h |  1 +
  2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a2b2c6c7f66d..57d9dd3a43bc 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2389,7 +2389,7 @@ static int scan_nat_page(struct f2fs_sb_info *sbi,
  		blk_addr = le32_to_cpu(nat_blk->entries[i].block_addr);

  		if (blk_addr == NEW_ADDR)
-			return -EINVAL;
+			return -EFSCORRUPTED;

  		if (blk_addr == NULL_ADDR) {
  			add_free_nid(sbi, start_nid, true, true);
@@ -2504,7 +2504,14 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,

  			if (ret) {
  				f2fs_up_read(&nm_i->nat_tree_lock);
-				f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
+
+				if (ret == -EFSCORRUPTED) {
+					f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
+					set_sbi_flag(sbi, SBI_NEED_FSCK);
+					f2fs_handle_error(sbi,
+							ERROR_INCONSISTENT_NAT);
+				}
+
  				return ret;
  			}
  		}
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 07ed69c2840d..039fe0ce8d83 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -104,6 +104,7 @@ enum f2fs_error {
  	ERROR_CORRUPTED_VERITY_XATTR,
  	ERROR_CORRUPTED_XATTR,
  	ERROR_INVALID_NODE_REFERENCE,
+	ERROR_INCONSISTENT_NAT,
  	ERROR_MAX,
  };

-- 
2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
