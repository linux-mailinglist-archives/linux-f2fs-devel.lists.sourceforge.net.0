Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB53B65F0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jun 2021 17:42:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxtPI-0003sP-2W; Mon, 28 Jun 2021 15:42:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lxtPH-0003sH-5X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 15:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HCETJpEYoAE7rvWblnj4QT+BQgow5fS0Q+4hrMwNBng=; b=Gj4U9eai4QQhNsYm1bkqRTqD/a
 07U0VRuTi21varHsqIDonT3sSiKUH/2u9hA2/Xu1InjjU2hTVsHXyBv6bi5Tl6UbF6XHCF+HQPlF/
 lL7r+K9k3iJGnjbPxY4mNl8a8bBN7fg2hGtcN99FpYzTP1Wpa40Gkfaefsx7BfZL3UGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HCETJpEYoAE7rvWblnj4QT+BQgow5fS0Q+4hrMwNBng=; b=I6IjSOeyLImwHPVAiSZAHGC4aj
 owYyKitLFSTIw4PLdwgH5QHd3/1FytPp8qqm8DpTx3kiKvH4a6Aad9B9ib+RydykuXv5YMNQdNywo
 6hfiy5rzNqmaim4OsqF1NRMZAAde4xO3WWghzGJID4Ql0WtcGiiR+GgeKM0RW4SA7Q4I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lxtP5-00041L-Qk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 15:42:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CB6D61465;
 Mon, 28 Jun 2021 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624894948;
 bh=agu2aFVx83M/6lYwPR0cpmCBMPta7Q6L7ar27lECxvI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iFELAZj/sJ6lDMa+ON2D04Vp/xFVR4/QdCFz2ZywJO49sQSKEorcaAlqA1LcOiH3Y
 R/SaLuy3zLXwcXGHH6vaJmim2oJzx262JAyso1s5R5XqtEXXv3gPRXp9bhW5XKg18G
 0STngTvGd8Ny+vtSAaeMeupg38/SOvYOV0sIciM9JI1pUCgnaRkGaKodcJ48cfnkRD
 qXF0BRCttG+/aojqJ2YCMuAqzl2BzxPzYdhmjwvJbM1klE/BXgZcerzwUz8wmxEuEP
 j+S/DRAdbNkw/9fWDGrrU4btAmXRix+VW9kLrmUEJyd3GbBrZ5cVBBJKj0p77jyvY8
 /R5GBvznw8EbA==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210621024027.1511092-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <84fd594d-8079-caf6-090e-9ceb4cb0a86b@kernel.org>
Date: Mon, 28 Jun 2021 23:42:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621024027.1511092-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lxtP5-00041L-Qk
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable extent cache for compression
 files in read-only
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/21 10:40, Jaegeuk Kim wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Let's allow extent cache for RO partition.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
