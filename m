Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB856647223
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 15:46:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3IAc-0003Fv-Qu;
	Thu, 08 Dec 2022 14:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p3IAQ-0003Fp-VI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 14:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNO936IqKYtBBuZfTL2kj2sIC8KwWC93/c3gniBviHM=; b=Tqmn+3rw3raqt7bCd6MWdjFTJT
 tCm1TQFl/Ch707RTPyx1j6ohuRjuIByyB3XN86VAyi5fPNQrBVOCCpcocUm63rGA1tJFYBUVuoOW8
 +8UkuXjNNlLwHrcC+NH3KnQBmYcsXs4unPReq/2+bjBSephs8UDmrAdrTT65thQqnz6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNO936IqKYtBBuZfTL2kj2sIC8KwWC93/c3gniBviHM=; b=WplW1035aKJGbbJVTQna98h9mn
 V8Hl5Vy6acMPhcLWdwd1po3qqL2CzkQLejysGxP1ZCkQXnMVPxrswebRxGG4GntRBw0rQvfa/1oPA
 1zldYSqY9CxXtm6MdiSw5IE9qd64fLmjFp2cWhNIAVRIAd8/GgPp37EtymhkiKkxasFQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3IAQ-00AKnb-Ee for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 14:46:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1407D61D9A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Dec 2022 14:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6513C433D6;
 Thu,  8 Dec 2022 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670510784;
 bh=SQDouDcc+xCO7nvBwL6upRwe7Ke31Oyl2pa3FlKFdcc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=eX3kbkreiZ9ixIL8Wp4d+SdUay/ywx1wAypQTlBLwuuJ2ClrhaPDHwYXpueVbLeZy
 u0xZEIL1eVQInz+dEQORUL9Zw/ctccyMOKct2c8IFdnGxC03TtouczpU0hPaLkvVJa
 h0FpBf6A/CnP9eiwckh/tP6HlNxpq2qHLIv+a6+OEYc2vAnyWPifke1KhBOYk1AV/E
 bsCkqLNkC6axHkAzkPx5Yrn2B3XRIanmunIP4eT4LVQ+q6QzcCOSpr/f9DTp5HBjo2
 MjWRwJymjFikwGAcIYFCh5UwB8MMCgvv9d654+2fMMzV5r+c6f1vVGIDyBbdekYdr2
 nWKlqy7mXypbQ==
Message-ID: <bd4ad040-8a9c-5bfa-fad5-22ab5cc861d4@kernel.org>
Date: Thu, 8 Dec 2022 22:46:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20221205185433.3479699-1-jaegeuk@kernel.org>
 <20221205185433.3479699-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221205185433.3479699-2-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/6 2:54, Jaegeuk Kim wrote: > No functional change.
 > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3IAQ-00AKnb-Ee
Subject: Re: [f2fs-dev] [PATCH 2/6] f2fs: move internal functions into
 extent_cache.c
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

On 2022/12/6 2:54, Jaegeuk Kim wrote:
> No functional change.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
