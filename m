Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20208465C02
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 03:05:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msbTa-0005OQ-Fe; Thu, 02 Dec 2021 02:05:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1msbTZ-0005OJ-3H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 02:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PwH6ECMWR0GTINwFHLwsRjW6F2+ve6hvzVQ2oR7SEm8=; b=SOTGDua659kkWDz3GZbp93wNHN
 Y6UeDsAxz/Lq9IZ8U3g69PTTaUy7YNYxnrt+w/7A2laKvp1g1EQo6xZKfSC+IPLIwlvcI0e2e6fT2
 kosqtX3QJT7AiNzC6qMnbp9DVi+wJtfzGMwWLLcpEdgnXPgkoQErudMQaDWNF2GyYkw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PwH6ECMWR0GTINwFHLwsRjW6F2+ve6hvzVQ2oR7SEm8=; b=hFiFqXhHJIZlczv2ipIWb4q+cO
 TSRfZg0OGfhG/WGL0rt4FUcU29cQR9YoVkuNA4lAYUx5dVyqmvhsLvNu5HlhEFfYDDjKCP3eTTrDi
 mEyFG9/pwVvu64OWktZl715DRjh3cbAnJig6mrb2qiSOyS/NO2NvnFjmpkbqqcjAc9wU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msbTZ-0002en-IC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 02:05:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54AC4B821BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 02:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D69C00446;
 Thu,  2 Dec 2021 02:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638410726;
 bh=Zqyn1HxcMbaKd/c5Q44hpfPvEint8HyN5m96Kf4PoIA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mNsaV/nirFNJmCmm+sUO8fJfLBiQOku/BZ75Kvy9bTURrQvaxrA6uO6bI8rDr1eTu
 JBIfQ8d6Rv9A5DA+CwVRqtaWWAsazlTyN87wXH2r/SccpmTVG0emfz100zVRom2iWG
 xWMZqgGXphECIXEA/sXJ3F7fNATWSevSdIsiAgJz4DjzclTOhX7MUYyDOkGjpDWLIJ
 AAgBpSRA14ZP/YQLMilECADgqVTSKwTngp+CVtb+PUQzSQlh2g5HUeDz1MjmtM7pxB
 NxFgkXiA0uk/UI0d6OQQNtCymxdRToEeoILMlPov+VMeE/QTQfkbhL407mn3+Zcc6/
 0RtZGL0ts1iQQ==
Message-ID: <4e23a185-3c0d-37ce-1c56-18db8218120b@kernel.org>
Date: Thu, 2 Dec 2021 10:05:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211129190039.598115-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211129190039.598115-1-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/30 3:00, Jaegeuk Kim wrote: > This information
 can be used to check how much time we need to give to issue > all the discard
 commands. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by:
 Chao Yu <chao@kernel.org> 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1msbTZ-0002en-IC
Subject: Re: [f2fs-dev] [PATCH] f2fs: show number of pending discard commands
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

On 2021/11/30 3:00, Jaegeuk Kim wrote:
> This information can be used to check how much time we need to give to issue
> all the discard commands.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
