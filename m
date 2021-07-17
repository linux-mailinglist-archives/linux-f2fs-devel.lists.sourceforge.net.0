Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAACD3CC20B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jul 2021 10:38:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4fq4-0007nV-3h; Sat, 17 Jul 2021 08:38:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m4fq1-0007nO-Vk
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 08:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I2zgSbepBKofMMNxkqWwuVLDAd+0LeG2+9SCNDTvGc0=; b=fOwf3SD+fhjheB4K1YxDQPkkZT
 fteaA3YnFhbmPLcuUGTpAdDVdh/VgZ6ruBQE9lu3oQJGD9su+gGsIPGoeUpFBtu719xLqLvr0NDyE
 GvzwAhifiN+cSLuU8uTiJEMeuBbblZmbGp+AJUE7Aju1BhZ81aQK8dAjjYC1YAcLF7s0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I2zgSbepBKofMMNxkqWwuVLDAd+0LeG2+9SCNDTvGc0=; b=BM8x+T+OKGeBT0C/4FNzFYcduc
 5X1b03ejtMJmJWWfgYTXMKZ2EzTNKmzY8uvLrhs9FsdXVysHESgwBRffdw/rztfoK5FQDYh2+L26r
 DDU7AsJQ4eeJ0mU2ttkVWFZS1ylDwn15Qk95qMCQzxRHpfIGj4+wnTYaEmSrIs/r+E88=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4fpx-00BRCs-28
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 08:38:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 253AE6023B;
 Sat, 17 Jul 2021 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626511091;
 bh=I2zgSbepBKofMMNxkqWwuVLDAd+0LeG2+9SCNDTvGc0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=QAsSm0xhGr2HW4ZQwK7p4wlmrJvkz/qAlHoMuEp5YWn8cIyt65rb8VFnvi/DVuDXy
 5RgDf0AkFt5TdDCBHiGHE8CpUC2tFAgsjSL6jgpoYi1Bft104abLAQ1/efwWpS8Nba
 yE2R8MY/dd9ItzvyMpPNj8Yr0vjR6j3GSPPdbBqEg3UNO++w6NKIZLuRPVBbovZ4P9
 4EPf/llt/jMb/iK8cPwk486oTNucDkrCH6KXfUh1dWur72I6HGrc6y88i5MD421v85
 cX+hcuBjE1oLBstasV57QS6MjVqbtyitR9SzVTvFAHvnE53yoDV+2Fecu1nwYGrKGE
 PhJKYab3vY7iQ==
To: Hayati Ayguen <h_ayguen@web.de>, linux-f2fs-devel@lists.sourceforge.net
References: <d1a34c8a-167f-1cf1-c272-026686ac2f22@web.de>
From: Chao Yu <chao@kernel.org>
Message-ID: <417b0758-8f51-a330-83f5-0abeb43fb675@kernel.org>
Date: Sat, 17 Jul 2021 16:38:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d1a34c8a-167f-1cf1-c272-026686ac2f22@web.de>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4fpx-00BRCs-28
Subject: Re: [f2fs-dev] tests on (and howto increase) lifetime?
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

Hello Hayati,

On 2021/7/14 20:44, Hayati Ayguen wrote:
> are there additional strategies to increase the life of sd-cards?

Maybe you can have a try with LFS mode of f2fs which will force filesystem
triggering sequential write IO only, you can enable this mode by specifying
"mode=lfs" mount option.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
