Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D778B978
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 22:22:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaikc-0005QM-1Q;
	Mon, 28 Aug 2023 20:22:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qaikZ-0005QG-IR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 20:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QcsBGmSlC5E9cyJeTzdcHt6/KnHeWmvE1N0C6e4n6ZU=; b=dCygkQPyb8PgZs7dxlkM3sxPPG
 XM0AB7eqKK/KV2erCsMP4Yo873o9LprHlcrcHp0DrlBOcqsXz6saYQNUMVBPi3F7RRwtRFBl9dJnz
 rO/Wm2BT1xvqmOOKXvM/qtawf1/5veBZHWZJGGy7yFYaO5WX5T/7K8ICTABc6hda9rPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QcsBGmSlC5E9cyJeTzdcHt6/KnHeWmvE1N0C6e4n6ZU=; b=GjDVm1HI5l0NNFtSGVQYoS7EzS
 iqPmk64QeZAPh4ABHeQU3IwYZpSo5mZ/Xg0fEHyfAIsU7DtbO0RUkEYIqNzivwECo1ikzH+SapHXU
 uSz2vX/YY5/JSqpvv9+VDHAfPJPDs7BAfAyH7qGrj/F2h/2vWgJIihOA7K5E3TvSG+Wg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaikZ-0003At-RE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 20:22:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4253061E13;
 Mon, 28 Aug 2023 20:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8735CC433C7;
 Mon, 28 Aug 2023 20:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693254129;
 bh=9pNcKAkIMYipke52z+jhBsTfBUdX048ccmXmyWHsqgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sLj92tLz+fWPBJgJSfpB8EQ6qVA27AUidY0CTY0paA/CeU5Q7Z5JOMdloUDBPBFhy
 RtxLyAVrYkW+aL+R+Vu7uzLVQlhsKaPD52dX5nxNUBfun9hY6Sb7yVYa/upAB4H9SD
 spayxwyHEYqWBA/RUfNHvtCQtCV9xvG0Mvka/YrOPrRBT1MYsGKcg7H1qCpz4cj4KS
 5SN8P12nIgjSC3FmCS73jPSPOwVxnDf6DJ98KyzLPa4g3Mj5iGqDcVx7RsFRg97HN2
 bRBTxe9n6Rg4iv0h7c59/ST242fr6AQG01fiTDGhYrNmWKy+S5JnSlpiSVh6aEjqku
 TBEVFYrYcTWXQ==
Date: Mon, 28 Aug 2023 13:22:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <ZO0B75KPr2u0Z/av@google.com>
References: <20230825224400.2206278-1-drosen@google.com>
 <20230825224400.2206278-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825224400.2206278-5-drosen@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/25,
 Daniel Rosenberg wrote: > This converts f2fs_nat_block
 and f2fs_sit_block to be variable length > arrays. This does not change the
 way they are accessed, but removes a > misleading statment [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qaikZ-0003At-RE
Subject: Re: [f2fs-dev] [PATCH v2 4/7] f2fs-tools: Refactor SIT/NAT block
 structs
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
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/25, Daniel Rosenberg wrote:
> This converts f2fs_nat_block and f2fs_sit_block to be variable length
> arrays. This does not change the way they are accessed, but removes a
> misleading statment that these sizes are fixed, as opposed to deriving
> from F2FS_BLKSIZE
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  include/f2fs_fs.h | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 13a1c14..b2d479f 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1119,11 +1119,9 @@ struct f2fs_nat_entry {
>  static_assert(sizeof(struct f2fs_nat_entry) == 9, "");
>  
>  struct f2fs_nat_block {
> -	struct f2fs_nat_entry entries[NAT_ENTRY_PER_BLOCK];
> +	struct f2fs_nat_entry entries[0]; /* NAT_ENTRY_PER_BLOCK */
>  };
>  
> -static_assert(sizeof(struct f2fs_nat_block) == F2FS_BLKSIZE - (F2FS_BLKSIZE % 9), "");
> -
>  /*
>   * For SIT entries
>   *
> @@ -1169,12 +1167,14 @@ struct f2fs_sit_entry {
>  
>  static_assert(sizeof(struct f2fs_sit_entry) == 74, "");
>  
> +/*
> + * On disk layout is:
> + * struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
> + */
>  struct f2fs_sit_block {
> -	struct f2fs_sit_entry entries[SIT_ENTRY_PER_BLOCK];
> +	struct f2fs_sit_entry entries[0];
>  };
>  
> -static_assert(sizeof(struct f2fs_sit_block) == F2FS_BLKSIZE - (F2FS_BLKSIZE % 74), "");
> -
>  /*
>   * For segment summary
>   *
> @@ -1995,6 +1995,14 @@ static inline void check_block_struct_sizes(void)
>  
>  	/* Check Indirect Block Size */
>  	assert(NIDS_PER_BLOCK * sizeof(__le32) + sizeof(struct node_footer) == F2FS_BLKSIZE);
> +
> +	/* Check NAT Block Size */
> +	assert((NAT_ENTRY_PER_BLOCK + 1) * sizeof(struct f2fs_nat_entry) > F2FS_BLKSIZE);
> +	assert(NAT_ENTRY_PER_BLOCK * sizeof(struct f2fs_nat_entry) <= F2FS_BLKSIZE);
> +
> +	/* Check SIT Block Size */
> +	assert((SIT_ENTRY_PER_BLOCK + 1) * sizeof(struct f2fs_nat_entry) > F2FS_BLKSIZE);

					sizeof(struct f2fs_sit_entry)?

> +	assert(SIT_ENTRY_PER_BLOCK * sizeof(struct f2fs_sit_entry) <= F2FS_BLKSIZE);
>  }
>  
>  #endif	/*__F2FS_FS_H */
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
