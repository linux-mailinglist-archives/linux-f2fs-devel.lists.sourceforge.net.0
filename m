Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8BE787D02
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 03:17:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZLSK-0006UB-G3;
	Fri, 25 Aug 2023 01:17:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qZLSJ-0006Tz-8L
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 01:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r9/8Tlrj+5eNfaLhGU+d1/BwwrpZEzh+vBtXNH1qr2I=; b=ibsisqP4ft/+t0HXPwQqF+Y3mk
 aYt7FEvfsVIFXaL43sAmAvgDbxCVYI6LMsuKmAE0Of4Qz6mgQ83fLaTXF3AzAzBY/U5S5qnLNEIxq
 GDoZHagFeO2DaY2dsoHbTcaBWoi2OdPPL7kPmA8K9Ijl9G0MMFi0ukEqtqJcULZ0EYcA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r9/8Tlrj+5eNfaLhGU+d1/BwwrpZEzh+vBtXNH1qr2I=; b=BIa91feYpoSUPOxJBXPXnT+byl
 eOnjxJBJMaH9GeStHefmRb4I0/E/HHgCl5FTolnFTkFpVIetzndsKtYL9Wpj5xC7ikRFbs0PhybOi
 ow7zXAc5fmtB12fDr312ieoK/3VBvO5FF3PzArpfsxKXvG2CiAEffja7l23zD7BcjnIc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZLSH-0005xa-FP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 01:17:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD9B36135A;
 Fri, 25 Aug 2023 01:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7177DC433C8;
 Fri, 25 Aug 2023 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692926254;
 bh=nuT02cuwXdR1JTfC+bASHl/oVTmJzV1HoyNaNG8w9iI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kzJOJuH94QFUSqcTMPA3NRH8Yw9IdvkV9YBpVp5O6fMcJEbo/7H3APF/BQpPrbPUj
 RIc5KI8SzF4HJ3YBLmimvKwENCaA3fnHDRjonZZ8JhnM5/NFx861gbM93ryI/rWgSa
 P6hhsFBxxyVLCPW7Peqw/iDj2z32dTFlc9VkyuOp7AsicWQu1iDDiwJzhqZ/pnZvFV
 8nrZvZaAXmPSn43SwEsJaoFxJqNWI3BVZJtpc507ytM+Y/Z24xjSTJ3kxDffhonN7e
 Z3pqJJCmzLEFOP1Dn1KULKZXCYh/XzWJt5n9/vinPTEY4RSDyL1SZ8uOTfQ62wzKZx
 fNItCgr68S9EQ==
Message-ID: <6712aa60-47e9-9806-bb5c-c1f642de31ca@kernel.org>
Date: Fri, 25 Aug 2023 09:17:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
 <20230824034304.37411-8-zhengqi.arch@bytedance.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230824034304.37411-8-zhengqi.arch@bytedance.com>
X-Spam-Score: -8.1 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/24 11:42,
 Qi Zheng wrote: > Use new APIs to dynamically
 allocate the f2fs-shrinker. > > Signed-off-by: Qi Zheng
 <zhengqi.arch@bytedance.com>
 > Reviewed-by: Muchun Song <songmuchun@bytedance. [...] 
 Content analysis details:   (-8.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZLSH-0005xa-FP
Subject: Re: [f2fs-dev] [PATCH v5 07/45] f2fs: dynamically allocate the
 f2fs-shrinker
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/24 11:42, Qi Zheng wrote:
> Use new APIs to dynamically allocate the f2fs-shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> CC: Jaegeuk Kim <jaegeuk@kernel.org>
> CC: Chao Yu <chao@kernel.org>
> CC: linux-f2fs-devel@lists.sourceforge.net

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
