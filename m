Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA940DC5F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 16:07:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQs2Q-0001gK-Sv; Thu, 16 Sep 2021 14:06:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mQs2P-0001g7-Uh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 14:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kuxcpA8S3q9ykbi2+xBsJrqnD3SE1scIiSCr/qpaSfE=; b=VUyFy4iOc7fm1OA3mdRkf78VzM
 vocV+6Vh+gPQBQNaL0jVrX7G+YeWiO8YsWMIoCJY9ceGVvbdza1rG+sK8/OpB+Sc4zENTOzSzdes9
 s8SSih3ezi8aX8OJ6fZZ/bViRejufALlwNljeaNWZKWNVpc1xt2akUByNLRjiWjjUuKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kuxcpA8S3q9ykbi2+xBsJrqnD3SE1scIiSCr/qpaSfE=; b=X+3uy3oUaZHOGMdVFkESk2e8pS
 CEtmfnFhuum6LxaZIqcJlo5O0lULsB5awJ6ObTctC2M1GAHE5AvgvLZ9egcCVqCzH5NCsIWu/4CXY
 6gOrO6s81S97+t2y92+DzSSdl31LJ8pLMhoebHqeF2oHAf/Pxf39FBDiCtWOx7UMYmac=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQs2P-00Cpbf-El
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 14:06:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B1B060238;
 Thu, 16 Sep 2021 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631801205;
 bh=JdkAm+o+bFathyCWpUUPm0oUpU2tV/07Lu6/E/J0SqQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QslSkK+DWsmffoVCXR9f3NTsSqADgY3jyF6g8V4d4UydbRmybtyPpYoXagnRdJxTW
 YNVwBTdR+aK04iFTKl6PRLMOgLfTkUmS/KLgvjhUmVQEsmziky/84RqLkaSXdgzpZY
 UaGNpLdmram6IE3O7dyoxG+mrybWc4a405IydA3lk72U4IJmJFflTSuftdkWREoCO6
 zV7IVhOImAmolkVZBYXbJqYbafG0fwYzVKOM5BwZHdWdGIEXvdW/gpMwjRcb9MwxIT
 Pk3EZUMWht8hHkU1YhU9EtSIa/gd9d5I+BJqGs25wz8TVlPGCXu2Q6mHncHN6f3rXN
 toGkWRwW32knw==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20210916125520.118196-1-changfengnan@vivo.com>
 <20210916125520.118196-2-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <0b6c58ed-bc4a-eaac-9c41-6fa726b305ca@kernel.org>
Date: Thu, 16 Sep 2021 22:06:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210916125520.118196-2-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/16 20:55, Fengnan Chang wrote: > For now, overwrite
 file with direct io use inplace policy, but > not counted, fix it. And use
 stat_add_inplace_blocks(sbi, 1, ) > instead of stat_inc_inplace [...] 
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mQs2P-00Cpbf-El
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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

On 2021/9/16 20:55, Fengnan Chang wrote:
> For now, overwrite file with direct io use inplace policy, but
> not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, )
> instead of stat_inc_inplace_blocks(sb, ).
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
