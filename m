Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A5DAADD5D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 13:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsbTsQnjepl2aBct97E2By7lgsK5DKun/vMTS9FL1hQ=; b=CHCQ8v9lOTVp/pf1nOy81IqAEm
	Cg5rrj8KdJJTxAIOjEUMhS3HDlRtkdv0G5zez5S+XFCqY/g5erB52LGdOS3z8hqlvIDbF41GpKUpz
	GNYLR0UVkwiyC47CSEeMmiEG5cQdzvA1cWE7T/aLYBdT3oqu2e+cNJd22egpfWGVPqn4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCcyb-00061l-CG;
	Wed, 07 May 2025 11:30:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCcyY-00061O-Ln
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 11:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ntp36WpxyCHsvg6MtxI/+pNbW+VYT+2n+x4rUkZGRGY=; b=Z1gbdqBY33FRXg9/YN4vK+yoNy
 XwfkTR2H7D3GWhNeCl8l3lznsqMejIvlk+Y8qlJcXcYUEtv0oQYbw+dyMDBcbaJ2Bw9hTzONxIqad
 DyfTPZSLOlZf/xQJDqtpH/WTHAS/yMmSDvTUk/C7d2PVxUM1g6qisqEqIeXQshfmPzn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ntp36WpxyCHsvg6MtxI/+pNbW+VYT+2n+x4rUkZGRGY=; b=iAFLp63mHX7pvea9DV6THBqA5i
 DUmq0YzwP9g19D1HrDCkMFLDxxjxhUH58ujihWzB1s0ix6dZsmeFTtgiph3/vCyCkGYomxylO5zrz
 k4lz1ebC0ibjQn4A+5i5iFBeta2J+xyAkdtMhJjWJEJr2Y2vxw6lxkM0KK/ezA0ff6gA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCcyJ-0002R2-4z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 11:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 653DAA4D84D;
 Wed,  7 May 2025 11:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBAAC4CEE7;
 Wed,  7 May 2025 11:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746617384;
 bh=hd3YBt2U7rpyOamT0WSsBI9rtKQBxwZOpRZOvt/klVk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kdC+68GnJ8aaziIhuIT1CghT5fSFXxHTkSZi44ox5tqUJG2RPJTsf+TgQ7iRajQb+
 pCbTcwUpxySP79enM8CxvxC+UgD80fkHGt9yYPG8TKttvCkEAPNyS9hJUBQWqz9Det
 6ds/qSbe9bS/LR5rw8nVXGGPLMC1zzsuNgAsemnfctt9zjzOn+v+TbbxXm7RgaHlwU
 RAqhm4xg/v7/isrgZak8i8COpuwTdZCniV4Inul76Um0ZNRrGxLQCmw+89PMerm6YS
 71LiDQOow+/yIM9XU9IId62K6y986O1tTrEm826T/q7jh2FChoBxNUnoNkFGMatDgc
 QyYADnx7XufPg==
Message-ID: <ebebfbfa-8322-4bdb-91a6-095bb7d7a9a4@kernel.org>
Date: Wed, 7 May 2025 19:29:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250420154647.1233033-1-sandeen@redhat.com>
 <20250420154647.1233033-4-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250420154647.1233033-4-sandeen@redhat.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/20/25 23:25,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > At the parsing phase of the new mount api, sbi will not be > available.
 So here allows sbi to be NULL in f2fs log he [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCcyJ-0002R2-4z
Subject: Re: [f2fs-dev] [PATCH 3/7] f2fs: Allow sbi to be NULL in f2fs_printk
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/20/25 23:25, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> At the parsing phase of the new mount api, sbi will not be
> available. So here allows sbi to be NULL in f2fs log helpers
> and use that in handle_mount_opt().
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
