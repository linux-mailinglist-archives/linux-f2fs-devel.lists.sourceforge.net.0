Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78A2D1A9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 21:37:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmNG7-0000Cm-Oa; Mon, 07 Dec 2020 20:37:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kmNG6-0000CY-D5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 20:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0ho6F75cwkHeuWeY13hJc4OOnbZnjP8yYh92U1O3hI=; b=Xl+so3fvTNSYcQ+fp0fV7Ic1iN
 /cjvZxg/j4n9dSeKaDz3G0OPoGBCaNpg3slhHGOinnPYqEotPOeMZ/vawXfc4DKQzwkEHILIpYrCf
 KFFWo+/htjqyUrfDO+wwaA4bzuEo+gn9mJDHgzAShLN4mrXWpUo3cEXBtc2fkKXu1xcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c0ho6F75cwkHeuWeY13hJc4OOnbZnjP8yYh92U1O3hI=; b=BmTJ7KMugHgFc+ycUTdJwERYtC
 7V+CQ3azN1+eE72pCVGeoPt8+3TC7YQ6kypW3tBbooWe9V3Z3076n9s14kFkv3CXEc4XNDk3JkpdZ
 hpqZs3JS017rzVkukxxK3uMX9hOlUw8xalInchyul4mo0dQ11M0ynbPLWqPqW6gv897Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmNG2-002UNl-AF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 20:37:22 +0000
Date: Mon, 7 Dec 2020 12:37:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607373425;
 bh=0D2ooDXaNUKeLHALauHhhHNJgFgomBWbSNKb8afQF9Y=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=GHWaYwIdIq/2b1iiexqNp0nTo6SXKpcxAPzqgOFZi9HcabPKpSqHTjZCOeDNVFuxu
 WEwMAsLHSPmv48f8Ev6/vV91rsLTrMAZQVwL4N3La/Vgt8vYrwI0cIkvdN9CKivntm
 1PDs+mICJYJXQzzAVJW1H4zZD9aPNP1MliCB8jcRl/fTehGnUAbiXkIoLP0ps+grn9
 z+ilu2jMfrWIxlzAiV81gXXC/0VpXQUOAhzLxGql/ccrd1Thof74vT7f0o5Ed6dBb0
 9cOWZh7j1zSvct+E7yEESm8X/WcU7pKNqBH8LOrA+SfTNi7N4ypcJ2POhdX+cYMsIg
 RLyrF745SUlGg==
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X86Sb2pvD53MzO5+@gmail.com>
References: <20201126103209.67985-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126103209.67985-1-yuchao0@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmNG2-002UNl-AF
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: support chksum
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

On Thu, Nov 26, 2020 at 06:32:09PM +0800, Chao Yu wrote:
> +	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {

This really could use some parentheses.  People shouldn't have to look up a
C operator precedence table to understand the code.

> +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
> +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
> +
> +		if (provided != calculated) {
> +			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
> +				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
> +				printk_ratelimited(
> +					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
> +					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
> +					provided, calculated);
> +			}
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			WARN_ON_ONCE(1);

WARN, WARN_ON_ONCE, BUG, BUG_ON, etc. are only for kernel bugs, not for invalid
inputs from disk or userspace.

There is already a log message printed just above, so it seems this WARN_ON_ONCE
should just be removed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
