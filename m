Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFE73AE70
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jun 2023 03:53:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCVz3-0007tN-0u;
	Fri, 23 Jun 2023 01:53:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qCVz1-0007tH-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 01:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ci3qgkyRD1ShWjYrV0/a8KKF5RneCgha6/yqryXgs0=; b=mNb4yPGybMkwESJdZmy8u1aTVR
 CVtI2RL5me/5dEViEXrNLmiEAUKeTlttAMCM/wn6Q0pkqpJVuqOJ1zKpdR7ichMko7c2b/XaU0YHL
 Z1mHvYUz2XhqZ78RXoSxpqc0RL0/2QMXj+D2K83p9nFnNub2nK5N8/5unoB423+/V+l4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Ci3qgkyRD1ShWjYrV0/a8KKF5RneCgha6/yqryXgs0=; b=TOXo4zRVQ3kTlhOKS/DSliSvXU
 pLlYFLSsJ8I9UtISbUmmYaFBtge5pcFuS5NYo66kHw8S+o/TIQEd6rKcfXMTsGMhu8cfUuycwGFsw
 SIVGXwsumsa9Nr6lmvTn3J1hUhWC0dlluqLS2G2Om/i6yRYzOm4EcU7aexcRI0BcXCDA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCVz1-00C0Di-Qz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 01:53:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 669416193C;
 Fri, 23 Jun 2023 01:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3D5C433C0;
 Fri, 23 Jun 2023 01:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687485181;
 bh=qnTC0oGJOKypAd9O6VjNwtM0oeBXkqwOD5qoDJyOzZY=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=q96YBBGwkMNgobws+BHA4IprLB5hCYBST0RmVtIezlRhLh17m3xnSaJ/tu/BDMU1W
 hgmH8QDBGFeL2c07/69eQNv14dF8C3OSmveejBlYRoDwseK1nC5YI8nZDZAMKjuZGw
 wcrDDDSfT9d9SG0+76nQafN0ckUppiVS4Fcz4Ilb3PkmVFmG92I4LgLLsNk7t94xVv
 8avmoC2rUZx40PBvWY7dWoC2W+DgYlnH2IKmRqzOA/VISfjqZC3auApPjQ/MvX1pUt
 ntPy98GdsYr1U8eIW/EaPVK8HPKDkvIEspG2hnpyEAL7qEX3+dKcJcQgZBg7QI7HOa
 qpPun2U23dpuA==
Message-ID: <5dade26f-9c0c-8022-ffdc-ec844ce87f32@kernel.org>
Date: Fri, 23 Jun 2023 09:52:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230524024204.13694-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230524024204.13694-1-guochunhai@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/24 10:42, Chunhai Guo wrote: > + if (!c.fix_on)
 { > err = -1; > break;
 > } One more comment. I guess we'd better skip find_fsync_inode()
 and continue fsck rather than exiting directly if c.fix_on is not set,
 thoughts?
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCVz1-00C0Di-Qz
Subject: Re: [f2fs-dev] [PATCH v8] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
Cc: linux-f2fs-devel@lists.sourceforge.net, frank.li@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/24 10:42, Chunhai Guo wrote:
> +		if (!c.fix_on) {
>   			err = -1;
>   			break;
>   		}

One more comment.

I guess we'd better skip find_fsync_inode() and continue fsck rather
than exiting directly if c.fix_on is not set, thoughts?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
