Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA132AB16
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 21:10:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHBLR-00075m-J6; Tue, 02 Mar 2021 20:10:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lHBLQ-00075g-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N7uA40PVM9zWaaAU/yZPETyzLaS7LTxc9wF/be57ZVg=; b=FYfrRq3laZnwW1sw7mty2cU8Ng
 +/9VPbIWbHqkDp++4KVkalHXdvuqjbR7mI1Srv2MWlOTCqnzfETU684MWaIMu4pm+hJvwyqlDHAJ1
 zg3WWeMPruI9u8C8jQjea4mgu3sAycboKoCBFTsE5xuPE8j9v8lVEG9hb9dlFYrejuGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N7uA40PVM9zWaaAU/yZPETyzLaS7LTxc9wF/be57ZVg=; b=nMdKr9RPFEnyNImpZRIz4n2p3J
 Q5bVaglucbZZKB0V3iJLhrI6b/kj/ALVjxke2318D4lRDHpIvCNFVczpXlYxZq2RxucCrOdyVBuPg
 eV4E93AchRu7CrrGufuwWaFYN1TZX5IFjZg+71B0jKlASUn3laQd+5sChHtaoPtzAuvQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHBLJ-0005nT-BX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 20:10:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 998C564F25;
 Tue,  2 Mar 2021 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614715799;
 bh=IMcrxgy4pmTw3Hovh6U4Hmr08wWkOgVJt217xAmKh8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gZ3pOYDJL32Wn2tUnLNVfnH+JBmp05+FEraOT4R/knoCxY7elpBpThss27KJjnz4q
 1PtzKuB60Jq/FV+e4AW3ywg3xKYz3vcBAHN6rUV7NEoL1QNPBaewE/0OP4Paytruoc
 zXRNJqNfu/L2px7Cq2dtD2hCGkehFWqU/znNmBAaYBC0y1bIpC6BrvAfccpMvQga4y
 wSHafouruIh7z7ByTm3+V8waH/8XM2ETRY8UcGCUynmmj8JDQ7H7xPdwq/lL0iLVpw
 eMr4KzOSMtrsSZHm2YaHzY4ECNAB2VlBtYiajuX6l0KkBruHchghGGzZaSVa1EyFzX
 CfssgntjIWONw==
Date: Tue, 2 Mar 2021 12:09:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Yunlei He <heyunlei@hihonor.com>
Message-ID: <YD6bltna2vBFVlgV@sol.localdomain>
References: <20210302113850.17011-1-heyunlei@hihonor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302113850.17011-1-heyunlei@hihonor.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHBLJ-0005nT-BX
Subject: Re: [f2fs-dev] [PATCH] f2fs: fsverity: modify truncation for verity
 enable failed
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yunlei,

On Tue, Mar 02, 2021 at 07:38:50PM +0800, Yunlei He wrote:
> If file enable verity failed, should truncate anything wrote
> past i_size, including cache pages. Move the truncation to
> the end of function, in case of f2fs set xattr failed.
> 
> Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Yunlei He <heyunlei@hihonor.com>
> ---
>  fs/f2fs/verity.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 054ec852b5ea..610f2a9b4928 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -169,10 +169,6 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  			err = filemap_write_and_wait(inode->i_mapping);
>  	}
>  
> -	/* If we failed, truncate anything we wrote past i_size. */
> -	if (desc == NULL || err)
> -		f2fs_truncate(inode);
> -
>  	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
>  
>  	if (desc != NULL && !err) {
> @@ -185,6 +181,13 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  			f2fs_mark_inode_dirty_sync(inode, true);
>  		}
>  	}
> +
> +	/* If we failed, truncate anything we wrote past i_size. */
> +	if (desc == NULL || err) {
> +		truncate_inode_pages(inode->i_mapping, inode->i_size);
> +		f2fs_truncate(inode);
> +	}
> +
>  	return err;

This is better, but we really should properly separate the success path from the
error paths in this function; otherwise it's too hard to understand.  Also, the
same bugs need to be fixed in ext4 too, and the commit message could be better.
I went ahead and sent out a new patchset which addresses all this
(https://lkml.kernel.org/linux-f2fs-devel/20210302200420.137977-1-ebiggers@kernel.org/T/#u);
can you take a look at that instead?  Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
