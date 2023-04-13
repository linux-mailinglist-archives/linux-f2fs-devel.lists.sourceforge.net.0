Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A06E0F4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 15:55:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmxQD-00059m-6G;
	Thu, 13 Apr 2023 13:55:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pmxQB-00059b-OR
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 13:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bFFo7zdlei8Go2b0vIT1cj2Qw6kNJ8CodbCNe239kqw=; b=BRWhXnYb6xCxEA8+H9Bzocl0Kz
 bdJqUJrYtAG8Q5g28dIm9teuunerHt8cbIb9nb4uRnb6D6DKMcvKiQyMKBL381P50TyuLa9ChTKLD
 DsAfh4tDh7Th+HMecph5KQpvGfzuWsZQqgXJthqvUvyzt3YtCTRchBQvz9RBNgzSgR5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bFFo7zdlei8Go2b0vIT1cj2Qw6kNJ8CodbCNe239kqw=; b=BY7TmM6YH+/hITWrzGNCpX1EMZ
 vFxN9b5SIsRbI9T9354yIunowmcwhfvrlsdc8JbN6V9MQJ7u9n11SKsPEyodmM7DbgiJuZycZz7VF
 1/TtdbSK3uScJa/TJOWvh2gP5QDVmelfkO07zrRtkSYGqPxhRmYfD2hcV7cbqgogyI6w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmxQB-006aQi-Gq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 13:55:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A77A61C01;
 Thu, 13 Apr 2023 13:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38AFC433EF;
 Thu, 13 Apr 2023 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681394125;
 bh=naa7Lbz+p/8f/Q64NAOFFGM6peXufOjK9iuICoD9zsM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FdTBB15nEVQZb6SkhJLeepu6fVmCMkMKPvG2XOoNAGdFarrPUDoi91u+2RgRE38rk
 LGRsisp9ThuhgJUyGQaZbMC8o77CYIBD2Jp/ZXJDFSJBL94i8dmBLWwo0xGrlVxBnA
 9FsyVZH3kQsqLUi3QpEa/XJqAorfj3ylgYr/CZwb+teQ/Oqs2CAjyAexTzLcRmCXRM
 eLoF55HeMTHqcuG/kAXEtl8PdSJRUNJpyUgEORs6VdKP+xIoUDTnenNjwS1G3P3Rnd
 dmbd0Ir+TsL0HHXgSKY9MwgDHh5QpP4KNsQ74G2fdfGwMlSG/dCsZIyFr++5CKHZmA
 WrpkbEQ8WQbVg==
Message-ID: <2bd9d237-34fb-5e90-b43c-44778e20dbe5@kernel.org>
Date: Thu, 13 Apr 2023 21:55:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230404143832.18234-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230404143832.18234-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 22:38, Yangtao Li wrote: > It's deprecated since
 commit 377224c47118 ("f2fs: don't split checkpoint > in fstrim"). > >
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> Reviewed-by: Chao Yu <chao@kernel.org> 
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
X-Headers-End: 1pmxQB-006aQi-Gq
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove batched_trim_sections node
 description
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

On 2023/4/4 22:38, Yangtao Li wrote:
> It's deprecated since commit 377224c47118 ("f2fs: don't split checkpoint
> in fstrim").
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
