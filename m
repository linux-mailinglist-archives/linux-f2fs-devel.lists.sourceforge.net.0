Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6AC992B4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPJ4B4WJ+q3X5mCWd7U5RsbrWRxLqLNXGwwv6yxV/mg=; b=WXoxa6jC3w2ZETZOow5Eifw6rz
	kko2+82Oy6V01Bp6JSTKWtK3QFpepoPvRP8a2zScIxrbRjI2A9EyJdDkMCxbfFH7b1iCTHmYut47I
	QjH7sgM+XxGX5Bj2Z7TXjFj2rs0GidE/d7nAu+QbOO8OEYWAHHJCuQcQmFG5lHBBZa1Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBOz-000479-Hp;
	Mon, 01 Dec 2025 21:25:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQBOy-000473-Hw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3eodx9W6/rzaSPZCE9QPRN018WgCLvm4tBhujQ3Nuv0=; b=fiURhaBhkpqxw1XIFQqZbXWu75
 RqnsnzMdje15gkidwkKtl7DxX0jl4lIn+mYBf3iolX67aP8wGcgLZH9DH8L2ShZUcQ1NWJASl8/Lz
 pmed11EguVxd4t4fKd6VGtMihU5UjsBKMG+WQZOVLW3PS2b6A7POgSFemS9PjghJ1bjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3eodx9W6/rzaSPZCE9QPRN018WgCLvm4tBhujQ3Nuv0=; b=JXTEWTceD4/rpecH/u4ox6p8+F
 XaEYjrb6A/ME2s/boG3epTSeiWN+xBhqQ/dw9U20QGBrEqKhYTpqgjElQSosdayRq0tQ1At1j69kj
 v8GKfvlQTRhrA/O+pLuBsZPwwYBZIxtKJlo3/uLd3xzDFr3w31GXYJJzrdI7Y3jsuTPo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBOy-0003B2-67 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D89A844159
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 21:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F936C4CEF1;
 Mon,  1 Dec 2025 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764624333;
 bh=zPMKmj67/zJipAvSmYUm0/ysW5zk+HtqunFLBVDymXo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bKcmKgyaHFxP3uc/kFbG8kgJiCBCD6T4FyEHpWNXQ0SwLShv8n71SbWBYKQLC0VWy
 Fw+I/iz8w4vBNOgSh43kUqpelZ/i2Da9HOjwyppnAEwqF0f+PYqcTHwvbvx0X6ffXp
 oUAFWEu7ZniHKCLdSg+7BJm9w3x8upCpKDkgfHQqjq0OP/S+oQD9bhBqjPEggmUF5C
 f0fyp0lytJxub5Wxtl9IcbU2zLOaSIpsIB1AyskoShiP7GZfRE5nhI4zg80GVDe/Me
 kgxJavMW8+USs9Rf2k6xDV5jG4mlm9+MnKB6GQiBcZQoiRhZCjc0Fs4d1PDUy9gg0g
 DhnNXkj6gJWKg==
Message-ID: <8c971afa-1a69-48c2-89a2-643c1fc0ce54@kernel.org>
Date: Mon, 1 Dec 2025 13:25:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20251201204620.905318-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251201204620.905318-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 04:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Let's measure the start time more precisely. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQBOy-0003B2-67
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs_io: measure the start time
 explicitly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/2 04:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Let's measure the start time more precisely.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
