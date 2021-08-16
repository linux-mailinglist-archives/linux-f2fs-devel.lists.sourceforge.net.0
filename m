Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5A3ECF9B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 09:43:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFXHh-0008Tc-0u; Mon, 16 Aug 2021 07:43:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mFXHf-0008TR-1E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 07:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s+63QJ05dtCVukhGva5F/UPrKhdv+C6Z4TSULz1aydM=; b=NKdGDHr2mBxMyMlXtUOmW3tf8g
 HOtU5uT3sd2m29MlKDbN9PGuBVGISknJhut15hni6RmyZnCnIHpKG1SE8rECGbbq86Y3WXXaGJrPK
 rVf5lUrxBau1uTv/AYDdtau6WJfxJcl4H27T2/s42Mc5Nis9qprqt7GSU2C7Fa0/IeoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s+63QJ05dtCVukhGva5F/UPrKhdv+C6Z4TSULz1aydM=; b=JDp5cHFMtWC9j6Yu/IyKyLYjml
 t+9Uf6bA6C5q6QmneOCqZy39vK67SJ4wU6+/1mk3I61iksLW+93b04up3c9CF6/UK69f2MT0dRXPQ
 NFNW3fyiSHrOuD+42P+IAFHSrZdNbqGQjmjnhK3hmtgecoVRR7PcqIOh/4XeAbsIJaZA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFXHd-0003A8-7A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 07:43:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA1C761ACF;
 Mon, 16 Aug 2021 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629099819;
 bh=U/7WQDfo/Qzy9+DjcIIAqHhrpYiE7FohGVxSzIJvDVo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h8CnmTOXZnIpGStqbefpN8NqUfXS02jg7aHR4K+eppyHbzr+9JN/t2BYf/EykzQQe
 zvQr0wbG/MTqFl3mXTzk5Z4ofW7x010aZFcYRoOfJvWWztgAm6e5Z2gAhoDOInhA/6
 8SF6A9eA5QMGMs3QBPWL+MeRocZu4bX6UOR62fx/EUK/zvEa/MiXHa0rL3xUPzM+Nm
 o4419Beq4E4sVz7YDZ0CpAE4o0Y/OaD3Ij0Yf7ByapyFK3KkjjTFZDcST9skepALrR
 yc1T3dhg8CMVanxf/smyUOMzTMvD77u40/gK8mCQBKf7w64AfOwDT/0KsgwoFzHrLK
 2KP3sM1FUyK+g==
To: Daeho Jeong <daeho43@gmail.com>
References: <20210809185449.2565768-1-daeho43@gmail.com>
 <425daf77-8020-26ce-dc9f-019d9a881b78@kernel.org>
 <CACOAw_xTh_HZizaVzDNjnVswu_OQwOjzEWRNxouGtM9E5qj6Pg@mail.gmail.com>
 <071534dd-cf10-38d3-b83b-c833f9c0a70a@kernel.org>
 <CACOAw_ye4y-njHbewXsvVr3gTT4URsw7VH4HM_D_g=zntwjtdA@mail.gmail.com>
 <dc21e445-126d-ef74-3d09-c5a71782ed2a@kernel.org>
 <CACOAw_x1F6Uu3p9RA8S7XBXnEYsnjPFY0JSG_VqBLrUjqAGeCA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <50bfbeee-e165-5bcf-1c47-a45ef8b36ebf@kernel.org>
Date: Mon, 16 Aug 2021 15:43:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_x1F6Uu3p9RA8S7XBXnEYsnjPFY0JSG_VqBLrUjqAGeCA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 1.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFXHd-0003A8-7A
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce blk_alloc_mode mount
 option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/16 15:11, Daeho Jeong wrote:
> I agree with you. But still I think "fragment" mode should work even
> in low free space conditions.
> Otherwise, it will be seeking the free blocks again and again like a busy loop.
> Or we can change the block allocation way into adaptive mode under low
> free space even staying in "fragment" mode.

I think fallbacking to adaptive mode sounds good to me, so the condition
of fallback may be there is no more free segments?

Thanks,

> 
> If we can handle this, we might use "fragment" mode for both
> simulating after fragmentation and making the filesystem fragmented.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
