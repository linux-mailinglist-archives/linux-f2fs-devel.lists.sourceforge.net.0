Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D196E851
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 05:37:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smPmm-0007sW-LL;
	Fri, 06 Sep 2024 03:37:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1smPml-0007sO-Nh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 03:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ENCla0xZiRglQpuCNByvho22DtcDPoXBLglS6O4f+aE=; b=BJP7t+8WQXnqhpN4ZrUkWdMJQS
 8qonrWPOUdgZ+zR/qcgIfFEEFZbQfwTfP15ebJPmR+cikmUx80w6KwpCGtRv0523jozZIUnH5rIW4
 5iLRH741DHLwICEmgaBNIV/AqtaTpkPfTUEv1af+hjkQ1j92Bimwd/zln8McO7Xxmx18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ENCla0xZiRglQpuCNByvho22DtcDPoXBLglS6O4f+aE=; b=WjWqmTZIoZURmvn8wN297rqTfD
 peZ0JnZHhpHpMQP5zhJRADuSHEuJTLqijxYFpXsTFhZ+sP+4/9N86o+dIid1ZVMI/lOvObLLxI80r
 aTEcPTHg4sF3/mD1F4da+ITxhFyVrCEi6CowQ8f+vsV1zxxBwXxw1SA7e5WgWPFPi4EE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smPml-0008Q9-4a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 03:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 282B4A4456C;
 Fri,  6 Sep 2024 03:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1E0C4CEC3;
 Fri,  6 Sep 2024 03:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725593832;
 bh=YVvENx5aaiAOK9H4ZpnX6vvObtIp41pjxWyGqQWNolw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gr3CC3qi9+fpPZ74NnEIEnRSAeD6b1LdeIXsDBhTv5zvTks7S1lrz1XFXqwyvRlRJ
 EbyB5oYlZCpxgiHSenMQ0Y8vQW2lIWVMQlkOyRQhn5XXeK/dglT5LLJPwQ2kMcpc3q
 KfPkJBH62o26JEWJfU6GNPcUBg36eaaJei9vmNhndxuNjtOvpb0mQkNjHJTaeL4Bba
 CKtGwwnb9Y1l7L4XokXWRKgdgSItxRd1SDg2YEHwHWSd8vcQT40Ni/kCb30le5UrFC
 cdKguSOaxxxP71dkFYSy5ijv/d1dJNfZAGuRSurNdNc8qTAIv1WE1AafDMHVsPx1eM
 8sMoGxoXkiXDA==
Message-ID: <61f40fb5-13e0-4866-809b-d7bfd73a6ee9@kernel.org>
Date: Fri, 6 Sep 2024 11:37:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-4-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240829215242.3641502-4-daeho43@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/30 5:52, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Need bigger BG GC migration granularity when free
 section is running > low. > > Signed-off-by: Daeho Jeong <daehoj [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1smPml-0008Q9-4a
Subject: Re: [f2fs-dev] [PATCH 4/7] f2fs: increase BG GC migration
 granularity when boosted for zoned devices
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
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/30 5:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Need bigger BG GC migration granularity when free section is running
> low.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
