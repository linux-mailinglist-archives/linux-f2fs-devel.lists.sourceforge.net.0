Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA0386685F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 03:54:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reR8S-0005Zq-SA;
	Mon, 26 Feb 2024 02:54:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reR8R-0005Zj-J0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=91UYZNq68bKVPQU3mWdffPFmae43TG/VNSczlgvVe0s=; b=gZyqk/YQdHVio0yZ4o+JCATgtU
 27PKbIbl7KgfocPnmKNoK9EBoXnbvARfo8TcxsPnJ6bqlngcQkKOsuSXfiJW4GwbtML2FXWHLx0f7
 51ZqmkPBqx3FBJpKJKFu1DwtH2DvF+JuE8EvHD7zRiXaX/bZydOaVEAIk+SqP1O9Hlh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=91UYZNq68bKVPQU3mWdffPFmae43TG/VNSczlgvVe0s=; b=PXD9PulDEnvttny8RKGKhuGeCc
 LDxECwsnphC4fePfu/fnxXdduwPMjsfzlYjbNbsCLwnZThMiO91lH1BNPJbFCoL0IYfWlR/kbP0eA
 oyLGohCj2LeyZeNB2aZyfKffTRXV80GRM5hdnGp4ghbso8O3Dzs4kbfenvsROKihdy7c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reR8N-0002Rs-5U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:54:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B892360AFF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 02:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC24C433F1;
 Mon, 26 Feb 2024 02:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708916056;
 bh=uqxcv1Va4WIgsQzro43LND6LxWGMhmPZeu341iNFOa8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=sXc6TFABNucSw/Z7hyjlv9b2IW8lHpHGUYE7FLEayjRnwNVUq+IW1duME9NxJvHMA
 KZ+sKpwWGQAAoM8GsnacYQ4gIwafG8fBV4OeAUlV1yrN/w9h7KEwoxyktQYxqD+1SQ
 U084J6xfi5yyLeeyOqt5cSc3BK0eP9hxMxhoQ4a6Jiuyz/2PGq/OoaIEs6rw6quGiV
 8h1w+K2cc/wetOP7+g3mJCWIyzRL+vaRX1CzETF96u8gBLPAfMG1rshcGwsaZPEg86
 G2EBsvfZZpvgp8aa02AtIk9/GkdklPokmcGApLWsCOdk0Ilt2yllcJnpT80Vc1Rjug
 SGn/Za+d8AMlQ==
Message-ID: <eb212e35-af60-44de-b843-748ad5fa8dac@kernel.org>
Date: Mon, 26 Feb 2024 10:54:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-3-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240223205535.307307-3-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/24 4:55, Jaegeuk Kim wrote: > No functional change,
 but add some more logs. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reR8N-0002Rs-5U
Subject: Re: [f2fs-dev] [PATCH 3/5] f2fs: print zone status in string and
 some log
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

On 2024/2/24 4:55, Jaegeuk Kim wrote:
> No functional change, but add some more logs.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
