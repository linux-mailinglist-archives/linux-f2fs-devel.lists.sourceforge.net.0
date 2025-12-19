Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE0CCE4E9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 04:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X0yqPLcsDUOwvlvtXfG2p+joWiL/p4GiED0LKCWrVI=; b=Y0V22YTDvOOkATIihiU57fFp/b
	DGFxAALcCghJUmrXSGMwler6Rps+9cw3dYNrPHHcX+5akcmb7HRWTWf9Gylv2TeZzp6415UPgc/V8
	vqyBKbuDBjDs/7PHkiUaSuxjkYTGN0LU83BWn3pytUBAI+ve4ROIxrkkWJqJBtn50dTE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWQkn-0003WT-P5;
	Fri, 19 Dec 2025 03:02:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vWQkm-0003WH-FT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/EQD+hccUSauJFJJdJRlnzlmzt3T3fxeAao3IqIEud8=; b=XOeGUfAc4Watl03qqBh9fOwQqB
 DvzsZ8pYqGUBq/BNNyWbaHtCGZwJhmmxN3kbeqsai1AfOLNTDs2CWyLW5gYBQMeOBQBiRhezKlEMI
 wYRWp2S7DgSiMIEaN671gtf8dy9nck5KUIfZr+Wz0ieRvLEAjptM88Q1DfhDqaPBZTUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/EQD+hccUSauJFJJdJRlnzlmzt3T3fxeAao3IqIEud8=; b=mEsK2/NKxchP2LyCbUOM2CnvAx
 Ae+Urqzrg1V4qhEn0vuG4vFEm12AhmlPAHtFw09ECotVzNoNG2Nq8QV4z3fMdodj6AcMGUkZDplnV
 sa4JcM/ILzPvIuuDDpUEMvCJlV1ehxC6MXYflWU17iBB4z+0W038r31BKNN25mm/7xi0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWQkm-00018H-LN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE12160008;
 Fri, 19 Dec 2025 03:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AFFC4CEFB;
 Fri, 19 Dec 2025 03:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766113318;
 bh=P3HTB97dOIB/wo/U7y7d5iqf0kKIfoha/N6sRkEIjRE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AILFH8BFwySMEPEtYbqETM4LovwHWuSnIuLbTFHRnA7oufiaD2XmMsD6j0WqBgASY
 gbj+48/0irdjtIfuhefTuRfU02ZJPT/hTDwa+uy58biAFcSYeWcIuCuQ7gEGDbWrRU
 Zwku0vKVXBBuBQw3/DCiwVMdS3tkgWiI79esGL9O0XjZr/79YsS358B4LPEk26wafR
 D8x+/n9NHFtDL7QmYVqPW9H1/75xm/3S5vS2POVGK1ITZ9bmpyUL5chNnGMK2TiJTo
 oc4xGdjJdntQmQxt8ivp6XDoFF5mq9ECwHbnf+TJ99idoYQ7jZhPrVmXPdtZS/cvN7
 lWg1LFDzAsCdQ==
Message-ID: <987ebef0-f7f6-4a2c-80a0-7bf1fd9b64b1@kernel.org>
Date: Fri, 19 Dec 2025 11:01:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1765957529-4285-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1765957529-4285-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/17/2025 3:45 PM, Zhiguo Niu wrote: > 1. qf_inum has
 been got and checked in its caller f2fs_enable_quotas > 2.
 f2fs_sb_has_quota_ino
 has bee checked in its all callers > 3. use sbi cleanup F2FS_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vWQkm-00018H-LN
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove some redundant codes in
 f2fs_quota_enable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/17/2025 3:45 PM, Zhiguo Niu wrote:
> 1. qf_inum has been got and checked in its caller f2fs_enable_quotas
> 2. f2fs_sb_has_quota_ino has bee checked in its all callers
> 3. use sbi cleanup F2FS_SB(sb)
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
