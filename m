Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E690C622CF8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Nov 2022 14:57:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oslaC-0002TF-St;
	Wed, 09 Nov 2022 13:57:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oslaB-0002T3-NB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 13:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eIOC7gAMoPfG9Zad8uyNeRzws/ODEBuudUK2KRFRtxg=; b=RkgRGMRaoFSeNir8R7t6Uzx/KW
 WbvoxcwyxKyYTfMC5q/ocIgR6YIVaFPn4xbwM0Cc4UT+/XxUhtwRVdEC3LjDVAHF9soGgFoPluXfY
 QtbB4cnKN2KZpiBFCyXgcPtVsKVfTWOKAnebnWiQMhgU40DSUX4/C5bjw7xja/pUCK04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eIOC7gAMoPfG9Zad8uyNeRzws/ODEBuudUK2KRFRtxg=; b=cfzfqtiElShgQMLFAsGWgkiwcM
 ++9F4K3bSpxnIxRWBASUvxAx3Ty0AAzbSyX3OLkWW1iVCnjCq1I3RVNgP+Ck/QR/tO/r3pRZZmaa0
 W+QUVIGnxmWnMmPSwu6gk+BwFzuGflp+y9rbZMHA6C2gi4bL8yf1YX6N0Oo3PP2GT2qs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osla7-001yPD-R8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Nov 2022 13:57:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2AE6ECE1F73;
 Wed,  9 Nov 2022 13:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E90C433D6;
 Wed,  9 Nov 2022 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668002238;
 bh=KwiACjdLcyiVh0MCd9x3j5YHdUGXO2t1t0ygrXm++pQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Su/0js4mWkYiSBI3zBkPjObgkTe8AM/FtMrjYu5uUz7/CuGARYpr3Eii5kXoLwq3W
 msY3jA6qdEmApuDYlCmSqoSVGZQPN5M3qvQkpfT3nxk2YZMJSWfepL1mnefuCpyyYu
 GzfyaymP584WCPfw+il41zQYy4zsLzNyfsWIY6ohHqd88xxIrIXdlmBJ70H454Kmhp
 aJFAx3lruoUJ7rphtiI9na5HxTHDq+WIyAGHsb2o2ZGkkSKOV1InZeQWGOgXftY23V
 70FeoFf70YdPH2ToWx9RXJIHs8COQj9lSuQsB/3V0rMtQ+CJAFpLYduLTca/aEmnzM
 c5WCqhs5fhyng==
Message-ID: <2a474126-ae64-ac31-9ba4-8d6b68f31bd6@kernel.org>
Date: Wed, 9 Nov 2022 21:57:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20221109110148.3674340-1-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221109110148.3674340-1-shengyong@oppo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/9 19:01, Sheng Yong wrote: > If compress_extension
 is set, and a newly created file matches the > extension, the file could
 be marked as compression file. However, > if inline_data is also [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1osla7-001yPD-R8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to enable compress for newly
 created file if extension matches
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/9 19:01, Sheng Yong wrote:
> If compress_extension is set, and a newly created file matches the
> extension, the file could be marked as compression file. However,
> if inline_data is also enabled, there is no chance to check its
> extension since f2fs_should_compress() always returns false.
> 
> So if a new file is created (its inode has I_NEW flag and must have
> no pin/atomic/swap flag), instead of calling f2fs_should_compress(),
> checking its file type is enough here.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fs/f2fs/namei.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index e104409c3a0e5..99dbd051ae0ba 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -295,9 +295,14 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> 
>          if (!f2fs_sb_has_compression(sbi) ||
>                          F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
> -                       !f2fs_may_compress(inode) ||
>                          (!ext_cnt && !noext_cnt))
>                  return;
> +       if (inode->i_state & I_NEW) {
> +               if (!S_ISREG(inode->i_mode))
> +                       return;
> +       } else if (!f2fs_may_compress(inode)) {
> +               return;
> +       }

How about moving set_compress_inode() into f2fs_new_inode()?

	if (f2fs_sb_has_compression(sbi)) {
		/* Inherit the compression flag in directory */
		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
					f2fs_may_compress(inode))
			set_compress_context(inode);

		set_compress_inode(sbi, inode, name);
	}

	/* Should enable inline_data after compression set */
	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
		set_inode_flag(inode, FI_INLINE_DATA);

> 
>          f2fs_down_read(&sbi->sb_lock);
> 
> --
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
