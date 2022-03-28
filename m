Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F054E8CA0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 05:33:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYg03-0003jV-JG; Mon, 28 Mar 2022 03:33:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=hZwO=UH=oppo.com=chao.yu@kernel.org>)
 id 1nYg02-0003jP-6K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 03:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eBgWig2V90jBPkdfTarJ2L6xVtNJbfP4zfey+8nZ3So=; b=jLbgIjyJQqJ2zxDP8uBjoL3DF+
 y53z7xpUBiF6qyrwnnkIYVmiQsze6M91UnHnj45bnGeOGIa/gZHg2P7wi23eFfeh1VauOKEoN0ZOq
 zYwDhimT+2ZYfGtftgWWBMS8B2ITkFdkFQLIXDt3rVGhqvLcwtDJFbEoQ4ckFxsKUlyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eBgWig2V90jBPkdfTarJ2L6xVtNJbfP4zfey+8nZ3So=; b=Oaw2m2In9Zqr9l0I0fKkSl73zY
 yiRMV31cYjKTdx6mCxdccmWdzvpgo8nWkWQy9LHoDH2k2XYx5lv9xJ9kweLYS2FBDu2S19qmhI5SE
 tm3DQcHhdYKdDgIK3ttb9wC7cf6cbPHxfO7fbCuLXc8T4+qrIQuNUbtd1/vr85JOLb5c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYg7x-0008Or-1g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 03:33:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 861DBB80DAC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Mar 2022 03:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C81C340EE;
 Mon, 28 Mar 2022 03:32:52 +0000 (UTC)
Message-ID: <002fa32d-430b-549b-461d-f57be4648cf3@oppo.com>
Date: Mon, 28 Mar 2022 11:32:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20220323022846.1318136-1-jaegeuk@kernel.org>
In-Reply-To: <20220323022846.1318136-1-jaegeuk@kernel.org>
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/23 10:28,
 Jaegeuk Kim wrote: > This gives an information
 of "-g android". > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nYg7x-0008Or-1g
Subject: Re: [f2fs-dev] [PATCH] man: update mkfs.f2fs to give the default
 android option
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao.yu@oppo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/23 10:28, Jaegeuk Kim wrote:
> This gives an information of "-g android".
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
