Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B71686C0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 19:34:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5D8T-0007Z0-9d; Fri, 21 Feb 2020 18:34:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5D8R-0007Yt-Ub
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 18:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dCUuVoqNQjd5NJmm/hHmkRe9F4vsP+f95HiLsrWoQ9Y=; b=AJ/Y3XIvwSamezQ8ZK2ItThVv3
 obdiutWHkuLnZ2sGl73BzG2yXPp85aJSsFHo61KW6kRodNNn1JV2SUsHjzUGWPsDs3sCN/34KHI8f
 d6IyX4Wa/b4Q1MVWY0Cx1sgyaBIRvl37DKAJxhTir5FZjq6fKDVCxHMErbnZkGDQ9Hdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dCUuVoqNQjd5NJmm/hHmkRe9F4vsP+f95HiLsrWoQ9Y=; b=dc0ZxMNwiBfiA+DVVKr9LsrdI8
 zxyvdFPhM8gtid4NwV8g3+jui2cT0SMuv0Cp5xkFFAY2zu+8bGS2mjg8FtIGh85PnXVSlg5sxYHeJ
 u2TpXnBxV60I06nJhFPIbqiN+VhUA7excwaR7zhlkP9saVqgceobpc08cZGMu2kXhvjI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5D8Q-00Cx3F-Le
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 18:34:47 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A5A7206E2;
 Fri, 21 Feb 2020 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582310079;
 bh=AwjpQ9bU1S2PO28VwY0r/NJG8mG+uZ8wB0q2OyWZklI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XaZHrOsm4cKVGzTCJY6bfly9OlJApRJV01unB788BikFgj7nIXYnCUmRTcAAYB5Lk
 niWLuT62tt+H6Iz1PEcuGjjCzamgspIlE4BfnGw93Mvp/jtCANModDTSBO7mEresJ5
 Jxh+dq6sU2WasMLiA+ukMwijngpv7Ww26sVXImW0=
Date: Fri, 21 Feb 2020 10:34:37 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200221183437.GC925@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-4-satyat@google.com>
 <20200221173539.GA6525@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221173539.GA6525@infradead.org>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5D8Q-00Cx3F-Le
Subject: Re: [f2fs-dev] [PATCH v7 3/9] block: blk-crypto-fallback for Inline
 Encryption
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
Cc: linux-ext4@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 09:35:39AM -0800, Christoph Hellwig wrote:
> High-level question:  Does the whole keyslot manager concept even make
> sense for the fallback?  With the work-queue we have item that exectutes
> at a time per cpu.  So just allocatea per-cpu crypto_skcipher for
> each encryption mode and there should never be a slot limitation.  Or
> do I miss something?

It does make sense because if blk-crypto-fallback didn't use a keyslot manager,
it would have to call crypto_skcipher_setkey() on the I/O path for every bio to
ensure that the CPU's crypto_skcipher has the correct key.  That's undesirable,
because setting a new key can be expensive with some encryption algorithms, and
also it can require a memory allocation which can fail.  For example, with the
Adiantum algorithm, setting a key requires encrypting ~1100 bytes of data in
order to generate subkeys.  It's better to set a key once and use it many times.

Making blk-crypto-fallback use the keyslot manager also allows the keyslot
manager to be tested by routine filesystem regression testing, e.g.
'gce-xfstests -c ext4/encrypt -g auto -m inlinecrypt'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
