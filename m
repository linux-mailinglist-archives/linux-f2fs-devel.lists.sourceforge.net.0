Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CE376068
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 May 2021 08:33:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leu3Y-0001iO-2Y; Fri, 07 May 2021 06:33:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1leu3W-0001iA-Kd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 06:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhgio/eBb2HNtTdxqYR2YXXTVe7upvPzsVWjxcm3SOA=; b=UCySDZUKQyrfPQBH5sg5a+eqwT
 hHjlmjQV63SNa6/wi0PlvFH7wPov1czB5pOqSI9whd1nTXIwxdCEwazQWAViXCHcCUZdkZyKI64sq
 xE185Jv63lelUXUXfxUOEbDQzhtUTE4jMBr6ePUWpGBvLkx8Wxdfs4bpH9LPCXpup/YM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yhgio/eBb2HNtTdxqYR2YXXTVe7upvPzsVWjxcm3SOA=; b=H1zg+9PBQJCtRyOlmsYzu8G2fk
 wXXCqNAbUcprzoAbYMhOgwsu6/8BH+ZKrahHyzsX+3JMupJ3v1ZGDW1qAffbZyqsCorJZMTOm30Gt
 T/IG8k0YaORlue2kSpWwuwE584YlmsppXn+L0nS995bVXWL23YAlV9qOpKVFpK0vtFU8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1leu3N-008mkS-TW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 06:33:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B98C6112F;
 Fri,  7 May 2021 06:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620369207;
 bh=BpAPmiejLFpAyTHujOzMNbWbBmKEXC5DKEs1SQmHxIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ca3dThI7CoAz/6b6jxiTn3EDabPzD3RPFff82F5AJAVgQdK+S9HWXEDWFgdF4R0yE
 e4FUDEpNcWPsqSd9OBXNPV9BWHNMIoVzGY3WO29tfL1zTS1GFiVL+JGxVoJqJTx+yv
 qk16Hoc9sRgy5CtFKbmPo7yElKP9Bs52lGanr17GfkSur7LQ6R3VaoMjhLxFLHcCdF
 yzuei+YcuyYw3R/VSgtq47qeHQ/CKczYCvvAgfTxuWUb2C5XiQggDH3ciGP3WOCwvH
 2BbwKygdZm2D2nEQZl8QuuxLBiCaH+w+PZzW4WGdHY4g3q3ZRIxB2MdrDHkxApxbxo
 SfjZ270CPe95A==
Date: Thu, 6 May 2021 23:33:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJTfNeYeDT65GslB@sol.localdomain>
References: <20210425011053.44436-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210425011053.44436-1-yuchao0@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1leu3N-008mkS-TW
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reduce expensive checkpoint trigger
 frequency
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Apr 25, 2021 at 09:10:53AM +0800, Chao Yu wrote:
> +	if (!error && S_ISDIR(inode->i_mode) && f2fs_encrypted_file(inode) &&
> +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
> +		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);

This will never be true, since S_ISDIR() and f2fs_encrypted_file() are logically
contradictory (as f2fs_encrypted_file() only returns true when S_ISREG()).

How did you test this change?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
