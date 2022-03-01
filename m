Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A74C8128
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 03:48:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOsZJ-0006aD-TE; Tue, 01 Mar 2022 02:48:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nOsZI-0006a7-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 02:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TFNn+6aEf5FXLFz300ee2VUkkF0ue1kTrf7HVkfQAkw=; b=AqwK2jHP9kqYwxjBWedeF5H8I6
 c6rVbD9SRk4ZbxRKj9gayS5gv2RYRsv/r5HQcnunhxq/6UC115wW+Yk0ZrB5GwkP/tv5H5WKIHRTC
 j3a32PfsvcxindE1oHFlb1LyH/PpFpWbbELPJJTXfCZu14fGVfV2KPJzV2kfCQGqXULk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TFNn+6aEf5FXLFz300ee2VUkkF0ue1kTrf7HVkfQAkw=; b=JJlhCYlvAezD10uATT3eHNmYva
 90RzKBidtpJmt33Ad3h+zm/qnHqgtB8kEDVkjB1bEHj3wik4Vk6sbR7jCkhDh7OKyzUIrVcRaKxRm
 tS6XBBAKCpSuXloyo40ZrYa//fXUykWBjfMJBx+duGpH5ypS1YXwHYwdLD4IryeYsqZQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOsZE-000k6y-HT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Mar 2022 02:48:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 597A761602;
 Tue,  1 Mar 2022 02:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8820C34100;
 Tue,  1 Mar 2022 02:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646102916;
 bh=G2d75bdlzRrheNLw7+a1JdKZGmhfjGIrrcOU2ZLlt64=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZP0VHhiZ6mI1LuF2JJbqQJcdj2lKsN2n7h+UA9P4yB3psb9IsRIVXUmNOaWZbBxkX
 nEE/H1m3ijo7ABJKlx7SCh/CXZKx2ck5zce2gaspIP1hj2ljHt9U12kS3Jiq3MWh/1
 UQ96GLAEC7nGJM/1I4/smtoQCiCZ7UOPzMXRh+9lbLeBUzBrMvVirFMKQS/j+op3oI
 ZT8zT6AzS5LQ+OQ9I0/BNyKCwipLLHPGz2QShRrzRA5qyXNJAPm9nns91uRafkc86t
 WXuMnFzSjS8Cgc2zwNuXmxSnE/9i3hFi6lvGLfoa060AVAj/0NSDuWo4d+wfodoaUy
 VhcQJYwUjgu6Q==
Message-ID: <32114417-fd17-9412-28da-10f0ff09530d@kernel.org>
Date: Tue, 1 Mar 2022 10:48:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220228124123.856027-1-hch@lst.de>
 <20220228124123.856027-2-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220228124123.856027-2-hch@lst.de>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/28 20:41, Christoph Hellwig wrote: > Set the bdev
 at bio allocation time by changing the f2fs_target_device > calling
 conventions, 
 so that no bio needs to be passed in. > > Signed-off-by: Ch [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nOsZE-000k6y-HT
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: don't pass a bio to
 f2fs_target_device
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/28 20:41, Christoph Hellwig wrote:
> Set the bdev at bio allocation time by changing the f2fs_target_device
> calling conventions, so that no bio needs to be passed in.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
