Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449B85B0E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 03:37:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcG0C-0005m8-7r;
	Tue, 20 Feb 2024 02:37:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcG0B-0005m2-7f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 02:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OeucudTczSKOnladSFQIbjhIHwAJ5KzM8G4n1miPrq4=; b=EqVG9GGbkKtOjrVLBX2mVu52cG
 r+evUprygUMJ374E1ZjbZiuASOLABHIqUy6whs2A2BYytyD2bM4f42VHVGXwVlmhDMMBvaELSrFgs
 8X1oxtgkzap/lC8fddtn2r+b/rNw381L/v9VJtQhW3adMXwxty42HQw+JZoh3loGPYa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OeucudTczSKOnladSFQIbjhIHwAJ5KzM8G4n1miPrq4=; b=NGHZEXjAGRgP10o3R1Nq/hsH5G
 YL4YUXUjHM4usrarjtxikk9FgfoUsQNG/T81UeEC3SPieowXOpSd0nalgso9qG1347hb78VfdIKYn
 HV+GBii6pD7o8nXVPYa+qu4+/HrTydugMxNvI30A97zgX6BcYP2b5DQek3SV+vhAuidE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcG05-0004cm-Jr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 02:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8770A60E8E;
 Tue, 20 Feb 2024 02:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C43C433F1;
 Tue, 20 Feb 2024 02:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708396604;
 bh=iSqzuEwP5M5h88YQ8/0qjtxCe233s6JS7YQMV0b2XT0=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=CFF+bwTkDYEfAGpoNEmpskKPYUwflaqHqw2rJ+jEHkpin693UEE3uhkcmzzKxn4q4
 Q3uVA7eXjoc2mMdK5nFTqjEdJsjweTE2HVOF2zcmfR9xTylHXy2Xm51rkSZr7StZl/
 w5Zi1ZQl+gWFOAQdwYMHt25duTo2eJDfMgSYa95lVhURM42tf9zF8ccptG0K4pH07A
 b0bUdk/b+qMpu8DYejrUW2eu/26FQ58O+UcNl6ZIx2VYIlpWQm5FFD3NCWrdmENfz0
 DqhwhqSUcwfuRbXZLcsm3VPRcj9/Ldnz/mAGGRskBUt74vZzseZveYcBzMCLPj16Qd
 1Zd2V5BCYj+Yg==
Message-ID: <4bcf0a1c-b21d-4735-bf57-b78439a65df5@kernel.org>
Date: Tue, 20 Feb 2024 10:36:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1707103845-17220-1-git-send-email-zhiguo.niu@unisoc.com>
 <e2680238-9e9c-422a-adf3-bcee71dfe0a8@kernel.org>
 <ZcGoWAsl08d5-U0g@google.com>
 <6f01fe1b-d580-4a2a-adc5-7eb3baebeb7a@kernel.org>
 <CAHJ8P3J6CrYeBHUHmk4rQXRr=V0jHkLWOKHjdC+xuLgb4a+NQQ@mail.gmail.com>
 <17c9e85a-54b6-4e1c-b95f-262c771b0f1d@kernel.org>
In-Reply-To: <17c9e85a-54b6-4e1c-b95f-262c771b0f1d@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/19 22:36, Chao Yu wrote: >>>> Please think about
 how to optimize this, which is really ugly now --- fs/f2fs/checkpoint.c |
 12 ++++++++---- 1 file changed, 8 insertions(+), 4 deletions(-) diff --git
 a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c index 87b7c988c8ca..089c26b80be3
 100644 --- a/fs/f2fs/checkpoint.c +++ b/fs/f2fs/checkpoint.c @@ -135, 7 +135, 7
 @@ struct page *f2fs_get_tmp_pag [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcG05-0004cm-Jr
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

On 2024/2/19 22:36, Chao Yu wrote:
>>>> Please think about how to optimize this, which is really ugly now
---
  fs/f2fs/checkpoint.c | 12 ++++++++----
  1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 87b7c988c8ca..089c26b80be3 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -135,7 +135,7 @@ struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index)
  }

  static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
-							int type)
+						int type, bool *record_error)
  {
  	struct seg_entry *se;
  	unsigned int segno, offset;
@@ -160,6 +160,7 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
  			 blkaddr, exist);
  		set_sbi_flag(sbi, SBI_NEED_FSCK);
  		dump_stack();
+		*record_error = true;
  	}

  	return exist;
@@ -209,10 +210,13 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
  			dump_stack();
  			goto err;
  		} else {
-			valid = __is_bitmap_valid(sbi, blkaddr, type);
-			if ((!valid && type != DATA_GENERIC_ENHANCE_UPDATE) ||
-				(valid && type == DATA_GENERIC_ENHANCE_UPDATE))
+			bool record_error = false;
+
+			valid = __is_bitmap_valid(sbi, blkaddr, type,
+							&record_error);
+			if (!valid || record_error)
  				goto err;
+			return valid;
  		}
  		break;
  	case META_GENERIC:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
