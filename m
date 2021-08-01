Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8603DCA7B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Aug 2021 09:08:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mA5aY-0002ms-Sh; Sun, 01 Aug 2021 07:08:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mA5aV-0002ml-MF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Aug 2021 07:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Moy//J18SQTmFBcvJufsyHUuhYyWSiXtojXwunh5UwM=; b=efvxNeXrTVCAKeu7g8wpbVEUF8
 kztggCMlREvF+YxGgKi/MWz4ujUGSxxOQCCzL/h1BcrQ9+aYHE2280cyuJw/zHI7+HndTJbOsrvlV
 OYInrH1gI2JUBT7AcjkNcUldrVwkhwc/QvxGK3EjwiW2FcBdPwx/2ws0BpR4YyVrr5yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Moy//J18SQTmFBcvJufsyHUuhYyWSiXtojXwunh5UwM=; b=MSl3IhDyTAQw5JkkDuDwKOXOdG
 aulUxPY7DzpXrYvD4MY6lp7ZRVg7Fy5r0+lbmHgyEqTKb4+vlNuET5cgEqOFVuyuaVIPPufcLwIEd
 ude/ZmtWsuCrIkchnDUokRu94fqaXHYCCe4J1BeaAxp6Esu2gP0L8ZX77QAijoz/x0aw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mA5aU-0007P5-27
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Aug 2021 07:08:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11ECD60F5A;
 Sun,  1 Aug 2021 07:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627801716;
 bh=a2BVvaIo4YUvHttfzyc8MV40eAsHZlKShDSdKID1ydU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YX026eIUvWhaH2iAN/iqc0gk/s/9u3OryHTnldrJL98fGuKvctv+/W7cDMShDDEG4
 fJtrJiPv8694Z6jZ5qsEv4Mw85uMyIEKGGyRbaAgkpW2sLvqG7yR+hXJqCz3lZuTKe
 N5vcL9kah8lj8KUWspo8KbTmhXxUOSnjzu1v+TPVUXp3U0bL3QsNrlxievnkoq7WFn
 deRj2PvexCLeZjPMG5V2P1MbmkQqeIzJW347NtihYjdesyzKA+i8K1wAdCVU5iiVlF
 ky+XdAmnWOdIyY0EopNMxJKxS2eeDnal8av21C6s/RouOPSmr0l5dAdoynGJqZhlF8
 K8tI45bmNbz9Q==
To: Laibin Qiu <qiulaibin@huawei.com>, jaegeuk@kernel.org
References: <20210731032646.3184005-1-qiulaibin@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b3e8a1a7-7f99-da7a-cd31-bd2b2cafe037@kernel.org>
Date: Sun, 1 Aug 2021 15:08:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210731032646.3184005-1-qiulaibin@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mA5aU-0007P5-27
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix min_seq_blocks can not make
 sense in some scenes.
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

On 2021/7/31 11:26, Laibin Qiu wrote:
> F2FS have dirty page count control for batched sequential
> write in writepages, and get the value of min_seq_blocks by
> blocks_per_seg * segs_per_sec(segs_per_sec defaults to 1).
> But in some scenes we set a lager section size, Min_seq_blocks
> will become too large to achieve the expected effect(eg. 4thread
> sequential write, the number of merge requests will be reduced).

I guess we can fix this problem by configuring
/sys/fs/f2fs/<dev>/min_seq_blocks for your case.

But, IMO, it doesn't make sense that default min_seq_blocks configuration
should be related to section size.

> 
> Signed-off-by: Laibin Qiu <qiulaibin@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
