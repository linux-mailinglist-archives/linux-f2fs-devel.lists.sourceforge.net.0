Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694685B2F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 07:32:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcJgQ-00028N-CK;
	Tue, 20 Feb 2024 06:32:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcJgP-00028G-DN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6dSmE8FMyPdc8MuR95a+sZiwVrspvLTSuIgPeC4Nzv0=; b=F5YNwSHY+y1p6ImWeSrqOzyyXl
 PskpnigGHqvsdEI5aeduqirm/RfN5asSMfv/WzREdcNWiEY3S2XE8/yq4evam9yTCFy4SdXHWjqwb
 CfNsAu2F7HuZl3wQMIWRlP4B6eea2YTKBgd9jpQRLZkwkFiTAFOSZc/FsF5/f+wgq34s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6dSmE8FMyPdc8MuR95a+sZiwVrspvLTSuIgPeC4Nzv0=; b=NsGSJn1HPtg/NRAHcnSZgMvSX4
 ZAK2aj+8AD+ezRgl/QcOJwBHYGtqxuBJzEjodYR2iRicFIDtrfPPfNcQl7nHKW1F35zOiYjPmGzxc
 zplWpknmvqwxTYOMKbVYJHYPlW/bJZ1ATjXIg/pC65o+Z3kEqiRxYMM18hQNyO2uIQEw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcJgO-0006Qc-Ar for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5004860FBC;
 Tue, 20 Feb 2024 06:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0538BC433F1;
 Tue, 20 Feb 2024 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708410764;
 bh=7FCbXtCQC8jbpAcxOBZSP4jrUqIhvyAjm9IBPtEbhfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WP2M/23HX7YWMbhL8/Bow1LNmCxN2KckoW9qywyZ468y9WBPfOmJ02RukitahCCEH
 HoLJZX8MZ1dnaWOF0Xh8oYkPxSPRQxu/X2MU1DWRqLDiiIkQgtP2KbysqsQ9ckfPnK
 e1YvgDrpqZWls7lDz3PdguHxG5IPEB1bnSNbnALOZmIt1FyAD1r5j0S0rQNFmH2W3L
 RsKBYYs/UyAAz4cFhVeu7aQTvg9Ir8FDi/UG25GGhrpXqQQ2XwQjFqh9F9A04afrBH
 eZdN2W5fegnsIJC5bIPxO/g25SsrfhM7ED3ydxgj+Ogl+ylEMvQimx9qE8u7oT0mpG
 zNoCwZwK6uy2g==
Message-ID: <c82f8a3f-0184-43c2-b67d-ca53338a153c@kernel.org>
Date: Tue, 20 Feb 2024 14:32:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <1707103845-17220-1-git-send-email-zhiguo.niu@unisoc.com>
 <e2680238-9e9c-422a-adf3-bcee71dfe0a8@kernel.org>
 <ZcGoWAsl08d5-U0g@google.com>
 <6f01fe1b-d580-4a2a-adc5-7eb3baebeb7a@kernel.org>
 <CAHJ8P3J6CrYeBHUHmk4rQXRr=V0jHkLWOKHjdC+xuLgb4a+NQQ@mail.gmail.com>
 <17c9e85a-54b6-4e1c-b95f-262c771b0f1d@kernel.org>
 <4bcf0a1c-b21d-4735-bf57-b78439a65df5@kernel.org>
 <CAHJ8P3+25FxdpqWNW53yyiLLG8J7LnMAeYr_DV3ARF9-3LCUUg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+25FxdpqWNW53yyiLLG8J7LnMAeYr_DV3ARF9-3LCUUg@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/20 13:34,
 Zhiguo Niu wrote: > I think do f2fs_handle_error
 in __is_bitmap_valid is a good way. Like this? --- fs/f2fs/checkpoint.c |
 28 ++++++++++++++ 1 file changed, 14 insertions(+), 14 deletions(-) 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcJgO-0006Qc-Ar
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/20 13:34, Zhiguo Niu wrote:
> I think do f2fs_handle_error in __is_bitmap_valid is a good way.

Like this?

---
  fs/f2fs/checkpoint.c | 28 ++++++++++++++--------------
  1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 87b7c988c8ca..b8a7e83eb4e0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -155,21 +155,24 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
  		return exist;

  	if ((exist && type == DATA_GENERIC_ENHANCE_UPDATE) ||
-		(!exist && type == DATA_GENERIC_ENHANCE)) {
-		f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
-			 blkaddr, exist);
-		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		dump_stack();
-	}
-
+		(!exist && type == DATA_GENERIC_ENHANCE))
+		goto out_err;
+	if (!exist && type != DATA_GENERIC_ENHANCE_UPDATE)
+		goto out_handle;
+	return exist;
+out_err:
+	f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
+		 blkaddr, exist);
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	dump_stack();
+out_handle:
+	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
  	return exist;
  }

  static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  					block_t blkaddr, int type)
  {
-	bool valid = false;
-
  	switch (type) {
  	case META_NAT:
  		break;
@@ -209,10 +212,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  			dump_stack();
  			goto err;
  		} else {
-			valid = __is_bitmap_valid(sbi, blkaddr, type);
-			if ((!valid && type != DATA_GENERIC_ENHANCE_UPDATE) ||
-				(valid && type == DATA_GENERIC_ENHANCE_UPDATE))
-				goto err;
+			return __is_bitmap_valid(sbi, blkaddr, type);
  		}
  		break;
  	case META_GENERIC:
@@ -227,7 +227,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  	return true;
  err:
  	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
-	return valid;
+	return false;
  }

  bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
-- 
2.40.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
