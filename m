Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8043FC09A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Aug 2021 03:57:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mKt1c-0004EA-Dw; Tue, 31 Aug 2021 01:57:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mKt1a-0004E3-LJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 01:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dZh6bkBKbU2Kvb4d8ci9ZyJ1fdFEZqsKDhqy4LNfiUE=; b=ckCbB8wqKdwB4iRxFyqd4iTxhE
 RDqTgnFRGushzY689o+3Y58RVfkkn5Wj5VtT9WnpySKeBhIUJeZEduEQ44SVwb+UwhRAQTksJyX8u
 fAABQC7U716wG1bFv5tepvEBEyKfzMbuzmFik+8wPL4y+Mw1N2NlcaCJVha+DOXb1Hq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dZh6bkBKbU2Kvb4d8ci9ZyJ1fdFEZqsKDhqy4LNfiUE=; b=Bev0yfVgOnkDsEJNFb1uvfDLZy
 YZWG9nmkxnwK5BK/KEaohiQHqZRdZycUanZRYzvT5rAyFPYeqJCB7YiVBFPeQqFyEFqduSGtkhYaB
 2KMie21J5O0cp34iV6HiJxOMGOtfEHAzTaHn3jbGl9plg+0VRcptt7nDQa7HEVwI7AtU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mKt1Z-0006Bz-6A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 01:57:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F1CD6101C;
 Tue, 31 Aug 2021 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630375026;
 bh=F+z5UHuWDdV+ffpMysnS1XGdtsy8b9i8pwL3eUp8Y/Y=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XkQ21EPBzspO8UnY4PdnPN/P5iO5aqRfgY/egkyCMWg2eLOpT1ag6BEIcI2Y6w+0b
 rt4eWnILpvYj1TOhBiMx0h5wtpRG2sqeCb+AZ57LpfjsHSrCU2QOTAm7+hFtImzycv
 Nc43yb3AZ3NI/JU8RFe3I3EV1ahBbxPbfbVPRCmWcx0QnMUwLX8RD/PNjN38yvWs7J
 Ro3qWoob8Q2ge8qVwL7KFc3blISIgwaV13E08VWM8Ysxppr067Vp5xnu3atSPmqnRS
 bGuhaZZDp0ulipvoM7R9rKH9B5V87mbu5z2BPOn3yrIo8Jk6H2T8k3g93Mu9dGegl8
 AfwELM5tUCYWg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210831005346.118701-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <d7268523-aa56-323a-d5a8-bef7fc69f126@kernel.org>
Date: Tue, 31 Aug 2021 09:57:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831005346.118701-1-jaegeuk@kernel.org>
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
X-Headers-End: 1mKt1Z-0006Bz-6A
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: deallocate compressed pages when
 error happens
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
> In f2fs_write_multi_pages(), f2fs_compress_pages() allocates pages for
> compression work in cc->cpages[]. Then, f2fs_write_compressed_pages() initiates
> bio submission. But, if there's any error before submitting the IOs like early
> f2fs_cp_error(), previously it didn't free cpages by f2fs_compress_free_page().
> Let's fix memory leak by putting that just before deallocating cc->cpages.
> 

Fixes: 4c8ff7095bef ("f2fs: support data compression")

> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
