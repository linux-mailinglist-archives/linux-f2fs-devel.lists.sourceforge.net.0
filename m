Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA293FC0AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Aug 2021 04:04:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mKt8d-0001iM-LP; Tue, 31 Aug 2021 02:04:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mKt8b-0001iG-Ts
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 02:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pWz+ELnsmrRFOJr0WkCr9nNG/O8zzC77ngGgyVaPQFs=; b=CEDdQrUqen92mCh468vAadR+qi
 M7NnBRdMqbobCf1viTzzMWTSb9/bqVXztnqBPr3k/LrPsqoNx7jSqXDNqa/8hukuyvjUAVIRa60q2
 XKk9dpHPz7ltm2BEVvaJNpqYMK51HYbADfJ7oLXIuHulYkxn0MOH97EYhYtdqVpKT6Oo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pWz+ELnsmrRFOJr0WkCr9nNG/O8zzC77ngGgyVaPQFs=; b=QBdBn7ZmRNpXLuJIxYz90t5may
 OSmOYQ0oTQKqNWIHcSVOeWs3etvvXXZEbPiTqraqpQ/oV0n4AT9ZrZoPXrJozmC6lm8/sG7o89IGK
 8//HRtu1AVBe9cwwvQWEurnyRD2pzz2OWSO3XQ9FWslXz7qhoXmEw+Yon7+1w7jshly0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mKt8a-0006P6-Aj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 02:04:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21343600AA;
 Tue, 31 Aug 2021 02:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630375466;
 bh=tLp4LG+o8dZOpplbm9O+XCZS+ucavCtGk1I1yTmjv1Y=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=qwtrb9H/Ahn+PQZ9nIO7SGw7b07RIau5V+8u5rN47So/2Ti9SBHM+6myyLfYj8xII
 2F0Yr2Naq8nfb9wt3WFeOLcLefCs4PEXEb/ngk1HtqbC7Yfl2h0Aw9IpjcgCdTr8or
 bpBgakK/LcIBpr4a1PnePNU2kbc96E4m/2zAzo1XaN616Nx2qqiV1Mmd4vfpBueui9
 fTHaqu+c0u+LxNCYwbMQ+pi2vyngT1KiSRb4BBzNwJWgWgFwK3gvjb3zuhuGf7BW4v
 CFRdtaR4O5qKjBYpMXzsV8JQ/INzeEyVUvO7cTVegOSynMJdeqMCGO3xG1L0CTeB/F
 zGTjB6h4lNAyw==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210831005346.118701-1-jaegeuk@kernel.org>
 <20210831005346.118701-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <f4ef1181-87e9-d76a-9084-29808aeef7b4@kernel.org>
Date: Tue, 31 Aug 2021 10:04:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831005346.118701-2-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mKt8a-0006P6-Aj
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: should put a page beyond EOF when
 preparing a write
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/31 8:53, Jaegeuk Kim wrote:
> The prepare_compress_overwrite() gets/locks a page to prepare a read, and calls
> f2fs_read_multi_pages() which checks EOF first. If there's any page beyond EOF,
> we unlock the page and set cc->rpages[i] = NULL, which we can't put the page
> anymore. This makes page leak, so let's fix by putting that page.
> 

Fixes: a949dc5f2c5c ("f2fs: compress: fix race condition of overwrite vs truncate")

> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
