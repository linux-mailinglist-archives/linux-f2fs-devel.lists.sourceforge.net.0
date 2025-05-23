Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65397AC19F7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 04:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVBwghkJwxT98jW8fU8rcmyJB+TtH+23Dbo4QzRBMns=; b=E0ZNC3w8VJyBvpUVV9UlujeByH
	TwpCEgHTtQ0PxCD7hEsYInHu2Ttt1t75l3E12XZ1dkvtMgeq3akFp/x2Ntw+NN5olDRQn0LIZ4iIZ
	6Yjfz6Flg9j1M50Uuc2ANR4e459nnnaBiBpf2eb5XfyBY6543ukmoC6tCbLjXz7BWVfY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIHrh-0004bN-Sn;
	Fri, 23 May 2025 02:10:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uIHrX-0004b2-0C
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 02:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JfUvQLfCZ2rqtIUDazxEynn2BCHgUzZOTKN4kVY4TXI=; b=CB2fPtgs6LlgQ33JLIpl28ElvC
 sK+FNCCASPjAygqKy4ilJn7jTVNPtY37WFrcEF9DD6OHp5c2Zmp565xHTP0Ek4Jq11JtcC0AOkT7L
 yldltV3cSjqn9Elhdu6ZZXS4dO2q4Z4J3uCtaRltpzqIrDUJC6cEavoejF1HfUdRzqaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JfUvQLfCZ2rqtIUDazxEynn2BCHgUzZOTKN4kVY4TXI=; b=As2mvAF4n3A2qtmqMFsDNYPsEN
 5qO09GLG+gHeL3dAIUx9ocuEIEH1NGjJB40HpxH05oWZM24badVwJKOisYVcnF8qG+2ws5HzqUvma
 j6vbx+ruYPj39TFr0VvqQv3a4g9u619kl0R5DfzS9nQBvWvYPDsA5G47JgqwCtG72KNA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uIHrW-0002M6-C9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 02:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 014584A8CA;
 Fri, 23 May 2025 02:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6113CC4CEEF;
 Fri, 23 May 2025 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747966207;
 bh=3o3gXIXqgb2ZSDnot6DFESn7N0TnBdXPrFPagY2C53k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FMqwDiIjzsRU+iqv99pjfEW5Haz+lAtwPGAMIVEU3wceTrHPXOEywivfH0eCYzIg3
 5noOe8AwJBDwCouGiQbKgVpD8KxR+XYA/+5rdht2kPLQpCxeEiiOLi79zj3HTCO1K5
 EqGYQV8rauEhimfOif5HOi9CkXrZnFpsedCF2ctejuOnURZ0uy+xv+/QZI6MN0XO+d
 RSTOVJ1JejNXZjEhvy3yanoCkK7v49+nHH/bCMYUirkLzXd8DN0iw7nNHLRecNKZK7
 DSa4P5ySRLkm1xM4VqQzx374xAkhTKj229orELKeld5qvqMej5W/OfqmkCPpvGshos
 otEcQQTWYuLTA==
Message-ID: <83b07b9f-031e-402e-9736-986651d870c2@kernel.org>
Date: Fri, 23 May 2025 10:10:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/14/25 16:45, Zhiguo Niu wrote: > no logic changes. >
 > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uIHrW-0002M6-C9
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use d_inode(dentry) cleanup
 dentry->d_inode
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/14/25 16:45, Zhiguo Niu wrote:
> no logic changes.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
