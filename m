Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B477C93
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 02:55:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hrXTf-0008HT-8c; Sun, 28 Jul 2019 00:55:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hrXTe-0008HG-5y
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 00:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CggYIT9w6dPArjN2N10wA0HZtvCbRn39GiP/jmg/Cv8=; b=k3gB9TjM60trhqNN/L6DKNjWVW
 P/K1QqM/4ckhWvfGvI842X9hAMcNRwUPaJL3FZJh0fWVwsrtDRl54kISw+M31FKKWpOk+UT0Gp1Fv
 lwA8exvPc4z81L2cdpW2RYx+ek2RM9MVHa8uNs6kDXcIIfPhfyGkry/3zvRPO7QRcKDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CggYIT9w6dPArjN2N10wA0HZtvCbRn39GiP/jmg/Cv8=; b=OwPL2YBpORVqejJQBo4pZlqV67
 JNxMOEwckFeLyKs9vP5LvkRGcd88TK2g+XGH59jkixdlkmqITJuDACLJfhd+mdl15icN6HnfKxNCd
 d/ZoHwxDWlrf/GNuBiPP2pE971xcxiCOIt3ZMwn2NDmUn4zPrluyy+LEEdi5Uhn1VUfY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hrXTb-001ovm-F5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 00:55:54 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76E7E20840;
 Sun, 28 Jul 2019 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564275345;
 bh=ib6sX26AXwbDi3ZB+Fz05tdgLXwFegl+X7JA9+1MoA8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FE3s7pPpLKE6fNyKadY5IvO9j3S1hknF451M623wEBUgqt0JGE9vZCVBBFQuPk0SE
 loiQOaF8fG2Sdz6nOUVA+6MVkXudeCNLGAeIkDS93jjeSjR5LzpvrnXVL/kyoAd504
 DLc40YM1HqlcAxRpN5F6aCR6xZ4q/oMIIgUapNZ0=
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190723230529.251659-1-drosen@google.com>
 <20190723230529.251659-4-drosen@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <9362e4ed-2be8-39f5-b4d9-9c86e37ab993@kernel.org>
Date: Sun, 28 Jul 2019 08:55:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190723230529.251659-4-drosen@google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hrXTb-001ovm-F5
Subject: Re: [f2fs-dev] [PATCH v4 3/3] f2fs: Support case-insensitive file
 name lookups
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
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-7-24 7:05, Daniel Rosenberg via Linux-f2fs-devel wrote:
>  /* Flags that are appropriate for regular files (all but dir-specific ones). */
>  #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL))

We missed to add F2FS_CASEFOLD_FL here to exclude it in F2FS_REG_FLMASK.

> @@ -1660,7 +1660,16 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  		return -EPERM;
>  
>  	oldflags = fi->i_flags;
> +	if ((iflags ^ oldflags) & F2FS_CASEFOLD_FL) {
> +		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
> +			return -EOPNOTSUPP;
> +
> +		if (!S_ISDIR(inode->i_mode))
> +			return -ENOTDIR;
>  
> +		if (!f2fs_empty_dir(inode))
> +			return -ENOTEMPTY;
> +	}

I applied the patches based on last Jaegeuk's dev branch, it seems we needs to
adjust above code a bit. Otherwise it looks good to me.

BTW, it looks the patchset works fine with generic/556 testcase.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
