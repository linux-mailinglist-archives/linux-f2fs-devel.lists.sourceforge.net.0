Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A1BC73BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 04:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SjjMOZMnbTpeZ2SKJ/4+QdoyAB9sMkZCZYb9pRjfSU=; b=Ebj43UefLIPsaHSu/2AWh536DJ
	otJDpIYVlvnPFGorIozu5rAzjvi9QwZZi4DKdMUpGys9cVBQ/L91WtqE3C8Z9StFNDbV0zXq6yUFj
	ZtVToxVz0pMZlZ0qqNUpP111hUlgkyjOYx1FuDIoBtgd8sNTXxZZKR/IRuAFK73B/QGM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6gdt-0005gc-6d;
	Thu, 09 Oct 2025 02:44:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6gdr-0005gW-Um
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M8GRhlMxPbI8+Ivpxt4d+0OrdLjwnw49dR9z0XPHq9w=; b=l0ZJM94V4M8idpZoyYOeMd/iEE
 TXccNcSUPlH04uGYQlH5d4v2fTkLSHsumnML4JXLc3EFDODo6weI3LJTLSuKJf8ImyBbmUoO3eFP4
 Las1ZiSmI+ft5ENtlgB20pJ0isFtQdNWCyMEVuwDZBvXvz5BmdsSF67y+/dC22v3LRVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M8GRhlMxPbI8+Ivpxt4d+0OrdLjwnw49dR9z0XPHq9w=; b=gS7mSi8YcbMX3RI1yeBucF/+Gc
 yTW+Eg2WjhzIP5NRLA9xQgF6d3mBqZFvViCtu30tfHSltvxtyfGCFFhBiW6rALk/q5nCbgkqUWp/y
 Uf3e+A4gcnwU0+ta0ux3zo5uOzOjqIDYvwL2A2gyMHUpEKt56K93OthOrwthCbejMEPs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6gdr-0004Ju-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F02256215F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Oct 2025 02:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89E2C4CEE7;
 Thu,  9 Oct 2025 02:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759977860;
 bh=M8GRhlMxPbI8+Ivpxt4d+0OrdLjwnw49dR9z0XPHq9w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qwS9+UMSF0e/iCcw6oGoSZuvMZmSSixgnlCLBrebzL5IYh6B877V2HDHXxmGDV3Dj
 Wb90InCxU1Vq1G64yCYQdAQCxZvLCizPBigI0Rd2OCl4qBPZyhIqpYr1t0L7hChaae
 gFBZZVvL8Ng8K8tpYA50qTDRxjCKJsfvFjB3qHpPPWOVLpCPp+0EsaTKEoMsqZ8Lre
 WohPjyIiy177a0rRsCzhCPb5FUiLcd8LTb+XKzaljdSB+lBRWyjdpG6x8viCOXVCQp
 cw9/xJ7/pykLoCXa4H95unBw7JYDFedL7jQ+hTPMWFdQ68tsfOn4tgEq3DAwjA81AW
 AD58t4kbmHfxw==
Message-ID: <6b1025cb-e3ba-40f6-9ac0-21a8a7f8ebd9@kernel.org>
Date: Thu, 9 Oct 2025 10:44:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250930023704.3019074-1-jaegeuk@kernel.org>
 <20250930023704.3019074-5-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930023704.3019074-5-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/30/2025 10:37 AM,
 Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
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
X-Headers-End: 1v6gdr-0004Ju-Jb
Subject: Re: [f2fs-dev] [PATCH 5/5] f2fs_io: let's try to get contigous
 memory if possible
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
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
