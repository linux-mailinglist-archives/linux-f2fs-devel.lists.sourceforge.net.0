Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5372D6D1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 03:22:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8sjq-0003st-OX;
	Tue, 13 Jun 2023 01:22:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q8sjp-0003sm-0T
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5n5cPn70L2lMC5xbKdWjEMJfuOI3bNODckRIw4qMc0U=; b=cx+Rql72TAmOIIywMWNd9tJRMN
 /L4fVKdlTeyarVTGufZ/+ZChBh7+JoZYggqHECBFm4N+hphMQe/VA+3B9nPzn3lqezBDvP3VhESPU
 HH9xmgzLDCH0ayegzJoPXNrquss4ZYmO6pPDj9uS/6KJkmgC4LW3d9r0ArMp0VyrZhxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5n5cPn70L2lMC5xbKdWjEMJfuOI3bNODckRIw4qMc0U=; b=BoNsdHjJ1N4q4SCLqUjqYPH+rI
 r/qNtIl1deUzqPQ313nkTuIGCCG9ukxz/dl8fRwRGwmlbyhmn6t6KfQGjnhPmf02xXtI84sGY4ifM
 be2saQuglghrah1OFNhyPj7DfownrXtEZ2uJHv5dt2lBcY6ENOH/K33KeY4uOJqj/drY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8sjl-0007HJ-32 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 01:22:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A81A9617D1;
 Tue, 13 Jun 2023 01:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5958DC433D2;
 Tue, 13 Jun 2023 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686619335;
 bh=PTCQa7qLmhsnwtrjVgMeTp6OMAslZsDWTf7oxrwBWko=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=efnteJbeXMdfcndM7MScHCZhwSHssTS8yWvz7Cq98dyshU/3jFMy20/4EwyQQkj3f
 BnSzOs6HK0wfiuzn5YTacyfr+V11sHjiEb8KxLsr1c1d9xqrZ3C1Jwl3qp1AWpjhUH
 N9+o0l+8Z4zgaquhOzCr8oPdLI6ZRjbtD6JV5TwJDvFE3NxhT9gEuvHNM4+3VvUKo+
 RnPe0o/KhjRYH3JX9AsCpGAKsXv6eNLWfN6rHxC/XUdcTLHpyX5+49hhcqbZoJ/XRl
 F3WaS3Bxlh52bWj9aYArUGM6fSJ2kqis+XdFVfihJMshPaaaUbPmEHjIOOkTR8Clzg
 CMlO9ZdR1gTAg==
Message-ID: <22a1f057-8242-cb4d-b9aa-eb7b889c7f9f@kernel.org>
Date: Tue, 13 Jun 2023 09:22:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, jaegeuk@kernel.org
References: <20230612053711.585847-1-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230612053711.585847-1-hch@lst.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/12 13:37, Christoph Hellwig wrote: > Since commit
 a2ad63daa88b ("VFS: add FMODE_CAN_ODIRECT file flag") file > systems can
 just set the FMODE_CAN_ODIRECT flag at open time instead of > wirin [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8sjl-0007HJ-32
Subject: Re: [f2fs-dev] [PATCH] f2fs: set FMODE_CAN_ODIRECT instead of a
 dummy direct_IO method
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

On 2023/6/12 13:37, Christoph Hellwig wrote:
> Since commit a2ad63daa88b ("VFS: add FMODE_CAN_ODIRECT file flag") file
> systems can just set the FMODE_CAN_ODIRECT flag at open time instead of
> wiring up a dummy direct_IO method to indicate support for direct I/O.
> 
> Do that for f2fs so that noop_direct_IO can eventually be removed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
