Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42720BC73A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 04:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZKFX614JbXlvdztJjb6jhncnH9w5gRb5ennz4MVYwc=; b=Wb19+Ej0fG1p1gXRwf8TZpGJqZ
	GQ9K/7pOEhgUBWd2q1gPNjD0aAKqeG9xtb3lh2Q2oQ/XNmB2iLqNV006KNQKpU/VJjj5/IGDHjyAF
	4GlhYR5FeqtGX4lmdoWzSTRjTkqSC23DXVcpPvruUKAsCSVxyb1spc3Pg1L/ScTql9TQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6gaJ-00058P-Jd;
	Thu, 09 Oct 2025 02:40:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6gaH-00058G-Ct
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PrB49Ad3X5BdSQ56Pza3rC+Hadq/YXen4EhRpyq9hWE=; b=Vg5O2o7GxNpBOMFjuZQK9RvUCp
 MXn7IeyuajyWzUPw/Whw0Qui3o07KutuydumdC2vZOegSaAR77V3onsIGwBs51u9oe/qFxixvQ6lf
 muYlAwzvd+PN7S+CLH9sV9De3y1AMMABs0iAF2SNaAfO+gB/Xe+tntQ83B8euyOZ77Dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PrB49Ad3X5BdSQ56Pza3rC+Hadq/YXen4EhRpyq9hWE=; b=Qdn7VG60GkFdcRBowsJM/LoNrF
 VR2JyJwcEtuVOgRKov0LOMmR9HoyTuEkMUcF9kAXISNyRU3Wazqif8DAoaqfF76K+gpTvhLb+uElK
 zYtE3+0vTtf1xHn+YqehUwMMULusysGi5eA8dSgvvDAfPfZoP4gRNCaQkob01OHRtZPg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6gaH-00047b-1z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ADA0E40684
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 02:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2E1C4CEE7;
 Thu,  9 Oct 2025 02:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759977638;
 bh=dlrnO/EFAIz8gUUmc63m5J380N+5F7T2UXmAfION3uE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rep2yZy5UhePHsgLap6se7iMCb1ZE75UL6KTe9nXGNk9JKh7fINyo1tyQq+44K7DY
 ibjc1MJN0N1iPZ64xBSgXbElIpt6GPiVNDaz1Koj8gfzDNUedUhS3kCIAUhEFAuW2O
 rkNpKCFneHt9g8gcgKx1OsfwFINgMVAaUR1x7toZFSPWTfy8I3yrgHGlXPY8SNADLt
 oWyY005EMmr0vmoUm4kCyeFB4eyGTjiFvCKc1tI5SmhCtrwotuv59My7VJ97SqBjqu
 4YbCLJ1g9m2xfl8izMMxQaAZZphlvgBFwuWiW443okBmrkE4fSUCOyT34gLtgnPEej
 4Q1GG3CTPFPBQ==
Message-ID: <06a0959b-2c06-4189-b3a8-0ee603c9724d@kernel.org>
Date: Thu, 9 Oct 2025 10:40:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
 <20250930023704.3019074-3-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930023704.3019074-3-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/30/2025 10:37 AM,
 Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Add missing mmap mode in man page. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6gaH-00047b-1z
Subject: Re: [f2fs-dev] [PATCH 3/5] f2fs_io: add mlock to measure the read
 speed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/30/2025 10:37 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Add missing mmap mode in man page.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
