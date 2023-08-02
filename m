Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8576D0A0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 16:52:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDDX-0007nU-4p;
	Wed, 02 Aug 2023 14:52:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qRDDV-0007nJ-Nr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 14:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2whAwSRDGUint+YXiXaBpUSnZXVze8REujirNqjwe84=; b=igoGZa6DX9ITQe/sESmW2oqdVV
 HmiWMd4J6wUDgHcdPhTFohxQnfLML7NVktX5YGJ02JuuZ+jmIr63Cdxm2uf3elZXMgcWlNSIpgDr9
 +yRbiuCRkzzM2K60Lzvo9+kKFrpmb68yP35gbVtN2339AiSiJu5RIKVqc3YjzS+ldzuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2whAwSRDGUint+YXiXaBpUSnZXVze8REujirNqjwe84=; b=jOVuQ/L9jEt0hE+6AV0RolAAg4
 xVzaHYVuaOGCDljq2+IfuxFP6l9reWxhs6LzU93FhufQ3NkU2QW8rR5WUlSgaQXa7kEmIF775KI3l
 o+6aYiiKAW1cCjy4jZX2mY08aJ04KX0OcFgVrxDDgQ4K/chTZDYDbZb6gB+hS5Lg6WbM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDDT-0002tJ-RO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 14:52:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BA87619C0;
 Wed,  2 Aug 2023 14:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9636CC433C8;
 Wed,  2 Aug 2023 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690987961;
 bh=96S0siV280ta/jjrcvQR/DheSrkoJg3LEb6hR4HvrG0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eM9iwk6g5CHDvdPAVWiuo3IMf2tFXTMqUQIs/MFbsC8aV7EECvDkC0MnxfA1REgCd
 heinj+te32aXhZeLZvfrKSclikVz+3Woy+tqKe/m8ZPLLlvOtJJgEXK0I9wNF6eOpY
 CGHgSM6fQgZ3NyrCE8n78MUfOqdtVX87SdxhxIN9wyTOCICCkmhW4FrxdqDfj9wfLy
 Ll9K5Tk7HgoIEDB6o+lg5mfLp79PiVZUiKhHNaPiMRp6AQLldRUHzhGBf+DNiCeAFp
 cVFXasAiXMHX0HGGelHepW9ad1q1Xe5PMtvMp+vun3xUwICzg3G3/fGZIusWa63OOi
 dQV2iv/2tGc4Q==
Message-ID: <3fbf56fd-5b4c-0f80-5758-5addfffe83a6@kernel.org>
Date: Wed, 2 Aug 2023 22:52:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230620141035.69782-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230620141035.69782-1-guochunhai@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/20 22:10, Chunhai Guo wrote: > Now f2fs support
 four block allocation modes: lfs, adaptive, > fragment:segment, fragment:block.
 Only lfs mode is allowed with zoned block > device feature. > [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRDDT-0002tJ-RO
Subject: Re: [f2fs-dev] [PATCH] f2fs: Only lfs mode is allowed with zoned
 block device feature
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/20 22:10, Chunhai Guo wrote:
> Now f2fs support four block allocation modes: lfs, adaptive,
> fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
> device feature.
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>   fs/f2fs/super.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c917fa771f0e..6249483be905 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -861,12 +861,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   
>   			if (!name)
>   				return -ENOMEM;
> +
> +			if (strcmp(name, "lfs") && f2fs_sb_has_blkzoned(sbi)) {
> +				f2fs_warn(sbi, "Only lfs mode is allowed with zoned block device feature");
> +				kfree(name);
> +				return -EINVAL;
> +			}

What about:

 From f6e71f1d33c2cca543ebb41734c7a95af5190767 Mon Sep 17 00:00:00 2001
From: Chunhai Guo <guochunhai@vivo.com>
Date: Sun, 30 Jul 2023 10:06:50 +0800
Subject: [PATCH] f2fs: only lfs mode is allowed with zoned block device
  feature

Now f2fs support four block allocation modes: lfs, adaptive,
fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
device feature.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
  fs/f2fs/super.c | 9 ++++-----
  1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 099e126c61e1..1d0593358125 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -864,11 +864,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
  			if (!name)
  				return -ENOMEM;
  			if (!strcmp(name, "adaptive")) {
-				if (f2fs_sb_has_blkzoned(sbi)) {
-					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
-					kfree(name);
-					return -EINVAL;
-				}
  				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
  			} else if (!strcmp(name, "lfs")) {
  				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
@@ -1333,6 +1328,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
  			F2FS_OPTION(sbi).discard_unit =
  					DISCARD_UNIT_SECTION;
  		}
+		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS) {
+			f2fs_info(sbi, "Only lfs mode is allowed with zoned block device feature");
+			return -EINVAL;
+		}
  #else
  		f2fs_err(sbi, "Zoned block device support is not enabled");
  		return -EINVAL;
-- 
2.40.1



> +
>   			if (!strcmp(name, "adaptive")) {
> -				if (f2fs_sb_has_blkzoned(sbi)) {
> -					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
> -					kfree(name);
> -					return -EINVAL;
> -				}
>   				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
>   			} else if (!strcmp(name, "lfs")) {
>   				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
