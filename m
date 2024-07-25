Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FA93BB2C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 05:22:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWp3N-0004bH-8v;
	Thu, 25 Jul 2024 03:22:04 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sWp3L-0004bB-HM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YqxFvKZzdAJGzYxioSUzGvkOsk79o0ZofKFq1u5KnqA=; b=OnL6/Q/I72DX9PlxfITYGJ3/Sc
 eB/zOHL8M68IeFhN3wIhmBlSblOGJ059r1281t7s4tzWqTwB+C1ZGYgWPJ+CQDlIhnFmMdCJgpz+E
 tTcZdjG9ojsJBc3MQ7iL1EbkMxoRBNzD861S+dlowhUucUkvxWC4C0VybYvr+uGkIOAE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YqxFvKZzdAJGzYxioSUzGvkOsk79o0ZofKFq1u5KnqA=; b=Mn6xiRa9x7dHy4vwif7I9VEfM5
 XRS//5cbJ1O/n/1sQZrxLc42TAgCh3dXEhkvUpoGUAQhSGE9Pt5Ja8Av2QlY6/PDVHLFwGru/2hd3
 wiA9vFbIXl3HueZwBd90N4O2kjGjWTb8sDijmQpeM+MgrZmvcdsC7UShappUKALqoehM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWp3K-0005WB-2M for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 530CCCE12D3;
 Thu, 25 Jul 2024 03:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319DDC32781;
 Thu, 25 Jul 2024 03:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721877714;
 bh=g74e3WBgbVSeQta0CVKZFBOP7VtQ2Ll8vRhMwBAW99I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UgMH+8RYjRyIV+kmXBFgw7xHESnHJ/iQdYfQzdW7wcpH1Ame+7ixb0hmuWdPdU/gv
 h5dgB6AX+VcqrMF+QKLBl8FdJmBHw4HZF6GF+DSNorG+0ry6psiG7FfCSJEI2RAcF4
 tNQ+GRHKnzSIaRQQJV3tWBIM8az5y+cMDuXbL0hewtxSISYOLay2sk0hqq5dpWSL+T
 ljGL47L+AqziR4gSw0gTv7Fkf6v7Kv5uH1/K8Cv6xXAIZnRgooBc+tdLumH3rVJwz5
 /wZXjmp/ZCkKOAXq0tGCZjrohuVX/FjVWq10JnJhQ/iGfJMTCPB5dx9FXp/vx9AUir
 Gp8deLmfFBF7Q==
Message-ID: <3446a775-99b7-43c3-a35c-1a0f72688e97@kernel.org>
Date: Thu, 25 Jul 2024 11:21:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240724170544.11372-1-n.zhandarovich@fintech.ru>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240724170544.11372-1-n.zhandarovich@fintech.ru>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/25 1:05, Nikita Zhandarovich wrote: > The result
 of multiplication between values derived from functions > dir_buckets() and
 bucket_blocks() *could* technically reach > 2^30 * 2^2 = 2^32. > [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWp3K-0005WB-2M
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent possible int overflow in
 dir_block_index()
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/25 1:05, Nikita Zhandarovich wrote:
> The result of multiplication between values derived from functions
> dir_buckets() and bucket_blocks() *could* technically reach
> 2^30 * 2^2 = 2^32.
> 
> While unlikely to happen, it is prudent to ensure that it will not
> lead to integer overflow. Thus, use mul_u32_u32() as it's more
> appropriate to mitigate the issue.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 3843154598a0 ("f2fs: introduce large directory support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
