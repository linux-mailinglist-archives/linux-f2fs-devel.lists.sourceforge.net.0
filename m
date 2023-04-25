Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A16EDA05
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 03:48:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pr7mw-0007hD-Si;
	Tue, 25 Apr 2023 01:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pr7mu-0007h7-RF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 01:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Z7L+FXKmOlMWCcQKUQV4KP6thkW8OqRqRDZCcg3aos=; b=WdaILjtAFyCwfIb4RpjG4z7RqZ
 iy8PSUtJLhInel9xjP2CFPHpUEZSirgFgS/yuPswiTcton4BaV5NDrRzU4uGmWmtq28o8CDt4QTzh
 WpCx3dsARDsK2XBltmXYAFn7uNZd43+xohNitfpMKS3UGh52kx4TOUZKPMccGdk+1lEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Z7L+FXKmOlMWCcQKUQV4KP6thkW8OqRqRDZCcg3aos=; b=myrosXptElIsI6QVNVhiRG5Wkf
 m8HJD0Q+OMkzfAfaq3ykKdYIbOPZ9ihNpdQTbQjD9cH91ibfPWHYaDEsoHbochCCQutHtl8fsxUM8
 wYvKfnx7zbLObCqGT3dtKI4i8cz1KuuESYUQh6BtNG7JWIdzR2r8wREtonbhZVCSh27w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pr7mt-0004jX-Ay for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 01:48:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD79B62AEF;
 Tue, 25 Apr 2023 01:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0D1C433EF;
 Tue, 25 Apr 2023 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682387282;
 bh=DKZbEmtrfdQINjSzkY0OkWadA9NpO9zn+NMylNjbZjA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TIEtd13fPP8t5nEnQl1tgVBDsy46tLlU1cETxwDa/XHBt5UrfIIjjEp2iKVJs/Bou
 1SyqT92wk1P4F3mN3MybTsT6x1yIHKJqMdseIUNrpBvMOrP6Fz2wAunaZZK3XY0Gwu
 YCOj6/4Onlg8QWnggzryaePR5j6nf0i0U+KFFTePCKNbhZ32MZwCOrbD6H/mQhMQsC
 tQ3IqBeuVLGJy5bAtVJDdUSZ1ijWQmS/9DTBMquNok6qx9svUHN9f1JWeciktPHFXg
 GSU4RZBmRU4Yb41aRqrDGDLjMFgUIqHmNusFBHrVfPg48psr8G505ELBXEHCsWRMl5
 FYST3g6DHWgvQ==
Message-ID: <94a02d4c-bbfa-5ef1-e606-42108cdc607c@kernel.org>
Date: Tue, 25 Apr 2023 09:48:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>, jaegeuk@kernel.org
References: <20230424234648.577673-1-lizetao1@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230424234648.577673-1-lizetao1@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/25 7:46,
 Li Zetao wrote: > After the commit "0a4ee518185", 
 this "goto" statement was redundant,
 > remote it for clean code. > > Signed-off-by:
 Li Zetao <lizetao1@huawei.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pr7mt-0004jX-Ay
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove redundant goto statement
 in f2fs_read_single_page()
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

On 2023/4/25 7:46, Li Zetao wrote:
> After the commit "0a4ee518185", this "goto" statement was redundant,
> remote it for clean code.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
