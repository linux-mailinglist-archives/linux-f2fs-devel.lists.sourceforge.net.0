Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ED567FE3A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 11:34:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM51A-0006W7-5M;
	Sun, 29 Jan 2023 10:34:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM517-0006Vl-UR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L9xwNh+7C9zeIhcjuRhXBKu5KA1dRkiDmXEq3lc9vO0=; b=Wd1ngW0m1zXQsOksS4l413CDP9
 cJc4yn/ZrSPm2Fq/9cTDuNAn/rEA5VHieFjaLqA6Zr8SaXcRUj1nYEyrCGH1LLkBgCvTBJokn2LbU
 mPQKrH2Ji8vfGCPqvaYCgUU4/C5mMCu+g6VFC6s8yfd0Bk/F0h8zdyX/wcGaQI40BXLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L9xwNh+7C9zeIhcjuRhXBKu5KA1dRkiDmXEq3lc9vO0=; b=AxAZ1c00oNO50JXKxITw/5mN7+
 XyEs/jo4AplDuNtBZqPPWPwnveExhwe++L/tiMAoCo6szydFX++w/EGrrCo38EhYwmvnktmii5Pqi
 yEnmhlJRP48zK7/nzAenuzY30N59+uXBhmY3Sj1MO6dDorqod67rGAmns1ev1Ad684AA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM516-002Oca-ID for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2697160C81;
 Sun, 29 Jan 2023 10:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78148C433EF;
 Sun, 29 Jan 2023 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674988466;
 bh=Obvp8P54sB1ruQQ085xI0bhxAeCOK5GvrvZ4CO6N7uo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cwC9aHv3jc/g4UN1rMl27Uu1VnWkZPKd2ZCrL4d3/qj62sDFClWAt4mTztGc2D9v0
 RK2ZZM11dFFGdyMe/DOgQzHxwbjwfMW9mnTTaogslG2cLQStTaJT849sJda3RvIO+X
 eNi/mLOLwuhR3D5mvUjoYgTtyB+AQdnoR1Gt2EYg2FIws2ULXZ55vCvKKxh5qHTm2A
 QqEBb4lHr9h5opmSv5DHCvIPpt/LFwS7fH3hx2CuI2bJZNYF4Hn1KQ4io0hz3OeaKD
 mqpqklSvw0HS9ygUVk/rd6kw/whU8ti082udKKxctiyi0Lgx3E1pr3BfOzkJGWNpAl
 H8cYEzLjPZQ4w==
Message-ID: <2c64c207-9554-c0c8-2d6d-90e4ba5697c8@kernel.org>
Date: Sun, 29 Jan 2023 18:34:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230119063625.466485-1-hch@lst.de>
 <20230119063625.466485-4-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230119063625.466485-4-hch@lst.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/19 14:36, Christoph Hellwig wrote: > Add a helper
 to return the valid blocks on log and SSR segments, and > replace the last
 two uses of curseg_blkoff with it. > > Signed-off-by: Christoph H [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM516-002Oca-ID
Subject: Re: [f2fs-dev] [PATCH 3/8] f2fs: add a f2fs_curseg_valid_blocks
 helper
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/19 14:36, Christoph Hellwig wrote:
> Add a helper to return the valid blocks on log and SSR segments, and
> replace the last two uses of curseg_blkoff with it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
