Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0E8688EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 07:26:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reqv5-0003fG-Ae;
	Tue, 27 Feb 2024 06:26:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reqv3-0003f1-V7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 06:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/LV/efoGwqQPg7bolF7N1LFSN6VdpdY5hvCxzM70KzA=; b=KI/c1Xoy6QZs3LoovoxNnHwKUG
 zXsDdiCwnPTUgceAaJ2UWnq6LKVQxLtrVO8Lcjmwo1JAQhh61j/5dZaaP7LunIrueHD+oeOxJKvGL
 zWaAl/zuBgwOw/EzoKi4X323TWv1EA1FzWj5ZrmwrMcK8TbwPFc+kZRZfYvr6H8dM/n0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/LV/efoGwqQPg7bolF7N1LFSN6VdpdY5hvCxzM70KzA=; b=RnlC8Js1gIyu/pTJGfWx0trNkj
 u/lYXaU+oIFOir798/pPsWcF4JgIshVCqhZOpfb2LFscs4t9RsNWxiQdujGP9agwVcM3DZzRnkNy+
 lIM84NWxy/L8NXxplCcUpoIxIRL/JC9pQXtiMe8PmBV9GHhrQ6uAHO4w4rVUuJxNqJVs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reqv3-0004NQ-G4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 06:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB8C36147F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 06:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFF4C433F1;
 Tue, 27 Feb 2024 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709015178;
 bh=dh9eafsR8lA/6L1du13qLNwxxQgJJ9ECt3Bfw1mY4J4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Hir1cSvGcnKbzskr7azVr/MYk6CDr5FvcV/tcPvWKSOr/K2fwFlc4b7KjPos9+89O
 k+m4z/K11YgN0r1cYiI4VTm3kFjczoSkJqeoI8tFlEjZKDUBjbEJWIpLsZwE/UG0go
 Z5SEBsmZGunqTmwh6894670SLiDwkQMkCxE4qV9W6RHdM9EnC53nslHC2LZKxqbFWP
 T7Cv18HgHUBx7dZNr6UHB1b6BwFcWEh+2kcrkbb497L6Qq0mEdUFPuAG+9Kk/gTpYN
 eKKzM736H1xKxks5ON7C7wCIFUnlL4wZl3DRxtDB0mS7ij1YftPIQJnQWcsOaxBV4T
 s+xyPM+nDl8fg==
Message-ID: <4beb8c78-cd8a-407a-aee5-58d8d2c8d4f5@kernel.org>
Date: Tue, 27 Feb 2024 14:26:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-3-jaegeuk@kernel.org> <Zd0WLOe89pByO7yX@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Zd0WLOe89pByO7yX@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/27 6:52, Jaegeuk Kim wrote: > No functional change,
 but add some more logs. > > Reviewed-by: Chao Yu <chao@kernel.org> v2 looks
 fine to me. Thanks, 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reqv3-0004NQ-G4
Subject: Re: [f2fs-dev] [PATCH 3/5 v2] f2fs: print zone status in string and
 some log
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/27 6:52, Jaegeuk Kim wrote:
> No functional change, but add some more logs.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

v2 looks fine to me.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
