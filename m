Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638B6AD715
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Mar 2023 07:02:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZQPQ-0000gU-0k;
	Tue, 07 Mar 2023 06:02:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pZQPN-0000gN-H3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 06:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZW7KTBsb8aoAHmH4t9Jx/2ehGOR8VAoCPeWeFXLUjU=; b=aF08WyE+0Wyx/zNWTSmcrtdnlK
 QtZvW6oOvYtuslRfP068uKQXeY13w2lOVQCbB+UzbblPZCIS4Uxj7NN9kS7NGwVZtrGDpgLJmxE7v
 MQ7CDHyMC1elwSFt2az2cXX5BXcaortjMYGfbrPG9baZxHKOVSumDDZdUWEX76wfk0nw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zZW7KTBsb8aoAHmH4t9Jx/2ehGOR8VAoCPeWeFXLUjU=; b=g27vjwOYHH/GipRqxhkKtSqN3b
 fymXcKF8r2UYip+1EypsU+bGRKT124PyjA/obXN/RWZO1SzoJo48iObtOV+kL8Jd0WYRGCJPbNhqq
 T4fnEokWsUwHwHWw62bZzWtX0DOttJlpZn+dH60kgb3XMN9ytsYRpuTvAQk1QKuAduXY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZQPL-0002Ze-6L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Mar 2023 06:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFC3DB8160F;
 Tue,  7 Mar 2023 06:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468A8C433EF;
 Tue,  7 Mar 2023 06:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678168956;
 bh=Ag+8oqLe4uB1DL7ahwFdt2BrLQT4vYH2/nnPW4BwT04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R2GWR/DFs/3Tm0DrIjWQYM9I8SIMD9LEU1vIwCkS1Q/XYFlKy0jgnwhEZnFm2jwEI
 /kkAqkGZoI5xC4lke1l0r2UxmikZdi1516+Y8Qn56W7v2/TW4Bdv23BuJA+Na1mRJv
 z1BfVLgM2jK55+GeN7Hz5oqQ7zIIroMRyxrMeTqUqrKz/fn3D1zDBPS/FbORGOTs7t
 rNoQeGbXQxShj6qnpO4P2YT7yo1vrFq4XidkVTUTz9orw0m+hTI/gR8l6xx3+Wzmhb
 m/PeUvB3TaKQmciUmF4Yw8DaJ2BQAZRtHfkZ4CrVzuAoZOsHhEZkHlst3rHFO7RYyD
 Cfk5QaRu4ltOQ==
Message-ID: <161435ee-aafe-250a-bd29-ba0cda186586@kernel.org>
Date: Tue, 7 Mar 2023 14:02:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>, jaegeuk@kernel.org
References: <20230223012513.1781735-1-lizetao1@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230223012513.1781735-1-lizetao1@huawei.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/23 9:25,
 Li Zetao wrote: > After commit 26b5a079197c
 ("f2fs: cleanup dirty pages if recover failed"), > f2fs_sync_inode_meta()
 is only used in checkpoint.c, so > f2fs_sync_inode_meta() shoul [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZQPL-0002Ze-6L
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: make f2fs_sync_inode_meta()
 static
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

On 2023/2/23 9:25, Li Zetao wrote:
> After commit 26b5a079197c ("f2fs: cleanup dirty pages if recover failed"),
> f2fs_sync_inode_meta() is only used in checkpoint.c, so
> f2fs_sync_inode_meta() should only be visible inside. Delete the
> declaration in the header file and change f2fs_sync_inode_meta()
> to static.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
