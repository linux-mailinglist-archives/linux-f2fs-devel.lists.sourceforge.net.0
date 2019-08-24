Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180E9BCD8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Aug 2019 11:48:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i1Seo-0007ac-Qq; Sat, 24 Aug 2019 09:48:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i1Sen-0007aQ-Ps
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Aug 2019 09:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NQb4pGNM4fz+2itiLcFwTHQkGz/GJXB8lhTlj/PaQNQ=; b=NYaVluMHgpJBCKFRKKHcRZDtJ7
 KUC/otwpodLT/LEi8ps8nQOmRCtvCPv9P9ng1E8rwjlGUNecFDgRITlF7yoUZz+FFefI9jUaCzKDF
 k2lMkZtLHTn7MZjbNP7ZScCW1CxG8l6U8zT1rj3ujS3ShHBJIdazsPqB0T8BKXYolVp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQb4pGNM4fz+2itiLcFwTHQkGz/GJXB8lhTlj/PaQNQ=; b=CVrB2BaoI4KOdyzQ2eILrmBeJb
 k64CAi7lAkzVtfUpSCiJbcppt/vs8RqoS5nlAF2CSOjMij2HulNCOejvVUxW1V8lTxaOgeeXv/zCw
 vYme0aLXTCKRqIFqEYeXHn7yPePm7GCSrvB7oP5gSuOn/bNswiYiJaZyUd/Q4Cp/QZu8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i1Sem-00EHS6-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Aug 2019 09:48:25 +0000
Received: from [192.168.0.101] (unknown [180.111.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E0A120850;
 Sat, 24 Aug 2019 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566640097;
 bh=yi2I6auH1HLsjQ6cqgwn0hMEcuVW9lNvthFFhWO96ew=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hMRcJYBuTmLyDaquWTbH9JMK0G1mmQPndhlu7D6YCyyeTHQnyoU4aBZvIAOZB288/
 x/u2Alz32O6jTlk3I/qVJ4iK9l0Aa99EI0EatBRll7jG5/kLSH/TEBns+sxc0MH1+4
 59P7uN5jfehIps24fu0cgxSVTnfGXu2Ng9iZHwOA=
To: Surbhi Palande <f2fsnewbie@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190823224045.26377-1-csurbhi@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <3fdb292d-5eb7-5cb0-c9dd-ac1e98212efd@kernel.org>
Date: Sat, 24 Aug 2019 17:48:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190823224045.26377-1-csurbhi@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i1Sem-00EHS6-Ff
Subject: Re: [f2fs-dev] [PATCH] Check all the data segments against all node
 ones.
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-8-24 6:40, Surbhi Palande wrote:
> As a part of the sanity checking while mounting, distinct segment number
> assignment to data and node segments is verified. Fixing a small bug in
> this verification between node and data segments. We need to check all
> the data segments with all the node segments.
> 

Fixes: 042be0f849e5f ("f2fs: fix to do sanity check with current segment number")

> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
