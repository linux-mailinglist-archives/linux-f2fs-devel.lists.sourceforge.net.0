Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DA6955F4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 02:29:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRk7q-0004p7-JD;
	Tue, 14 Feb 2023 01:28:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRk7m-0004p0-LR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u1IHMZJ+82A6x7QtnY3IKv66utx1Iog28uv/jaxsZFU=; b=hBfM0zW9y0A19zwNQ8avR2W3wO
 Qp7rI4tb5AKjCMCM1B7mC1+13iOG3BArtLZWtgHCYeZ81PUsMuxJIqzuYe67T2nZnlAi6LWMnvcMp
 az7TFf8IzZIFFSr2u8N6YnnXld9Kqr2uHc+zc2PnesgC9iMr7bowMgot2mURvIMBMh/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u1IHMZJ+82A6x7QtnY3IKv66utx1Iog28uv/jaxsZFU=; b=jxfzkoknxH9aGqyqtFTrmKxqGc
 2k0Z9u6UOKdzI2zxfcY+pPSLTLOFoaWyQv9enc3jjWsb7kEEtgeZ6ch3JiJTHWgOogUhwqoy6vtX1
 RAw6y5ZZXCUsa1DWg3uwwveA2r1v6ZGJ/PbviBOhauifu7WE+txlJ4sX8xNQzQ7IjAo4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRk7j-003mxp-Vu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:28:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94B1F61321;
 Tue, 14 Feb 2023 01:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0794FC433EF;
 Tue, 14 Feb 2023 01:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676338122;
 bh=jm9YyOWT4bqZelfFgkVGCaz0lc5SMubRRyouq/SgH58=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uXSy/FtW7WIassgQj2aKleR3goACFpS/HdCZJ/ghRbvYLkYmVKTLrVF/LJBynxeHt
 HTEihAF5mgin6CbKBb6hRM2pTa75BkZMs53HaniK2RPHwarxWcSzpVKNCRZo2bU3bv
 kz6HiuNA8lpcjyDylytK1J37btCPrv8JSp4sk8vju5fBbw0MJpA81cawGx6EPAuZC1
 DhZDIRQY60ShTV1hHS5wsYo0Gd0TFo5jYFAFhx7dN2NF9emEsukE5QsYNeob1SIOXs
 fFcUK8erUTqj7+V3MQ6voajo5Q+yJ6enk01zhuU1jKSE6KeP2f3452z/AlVnpftYPX
 RZDRd4VOYM96A==
Message-ID: <089f35d1-4516-a47d-222d-fc7b86330272@kernel.org>
Date: Tue, 14 Feb 2023 09:28:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230213141825.22858-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230213141825.22858-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/13 22:18, Yangtao Li wrote: > Export ipu_policy
 as a string in debugfs for better readability and > it can help us better
 understand some strategies of the file system. > > Signed-off-by: Ya [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRk7j-003mxp-Vu
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: export ipu policy in debugfs
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/13 22:18, Yangtao Li wrote:
> Export ipu_policy as a string in debugfs for better readability and
> it can help us better understand some strategies of the file system.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
