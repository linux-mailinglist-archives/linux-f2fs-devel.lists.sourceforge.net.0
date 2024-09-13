Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A4977687
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Sep 2024 03:50:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sovSB-0006qo-KE;
	Fri, 13 Sep 2024 01:50:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sovSA-0006qf-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 01:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IHAWK7DdMGtem7jd7lLkwdJZbNC6WU7dMsTozhcofJA=; b=EuMR5ZzmGKFk55pDRgcbxyqKE2
 hF7FXrAKZcUFHiIRfzFIkIIOT3zZLCtNNuad4dnNj4E05AwN0kLQ0RJxGPAHjpCqfoqkLVRolYL+a
 H6/ChY9UPiYCd7TaRonMvtxq91/611D2cLWg/WwkfwircDtc9RytFAsIrf5zyOfIYTXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IHAWK7DdMGtem7jd7lLkwdJZbNC6WU7dMsTozhcofJA=; b=LwLNM9wMyyfo2RiA/NDUY0bS2g
 tl1yuGDqV1kQsi1tQMpjc0ZzCmtgeiXsTPXIHqOgTToALbB8pKw3XH9YmgGTG3L2Yxde1nH9pTi8Y
 y8nPWfYn1CLcbErJt5VozIW3zU48VUr9y4Bwu/RRyqspWYZ0L3WCn2Owx0IgQZxeqzXI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sovSA-0007VQ-Fp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Sep 2024 01:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AAAF5C43A4;
 Fri, 13 Sep 2024 01:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74093C4CEC3;
 Fri, 13 Sep 2024 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726192219;
 bh=HgzJPitcmNSo3TO5D0K1yFbTLYRnejMdLnksGZ3n1zI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gQ/rdY2ji0uinK9jnzpe/2UebLxey5glnmYyVZiYQZsbXEbSiBAC5jjvzmP8OdP5Q
 uC4UnGwMmey8Rlz9loGXD36Pf7pGLCg8T+AsK4nvn5mT/casPU+/jPtmHlxotvCtvy
 k4FJSAawCDxSuaegON5eWR3P5v1/pY91ryOkIM00eK4PsmBvEr4esJaxT38hMs9Iwk
 hpMHJPuKWtJYnm7PLD5+1EbKb0dXq5NkG4uKw0sfXMBObkUyZEnHyLeRf+73S4Oo+O
 32la3qwr5Td0qzMWY1640Zqm1Vaz25VNj5U8VDmDKqW8Qnx2ECNKp17JE9ciNVbq81
 Pc28nF/R9C/jQ==
Message-ID: <500c3c3a-5332-4c86-ba7c-dacb3061e17b@kernel.org>
Date: Fri, 13 Sep 2024 09:50:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240912165958.386947-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240912165958.386947-1-daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/13 0:59, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We need to migrate data blocks even though it
 is full to secure space > for zoned device file pinning. > > Signed- [...]
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sovSA-0007VQ-Fp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: forcibly migrate to secure space
 for zoned device file pinning
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/13 0:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We need to migrate data blocks even though it is full to secure space
> for zoned device file pinning.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
