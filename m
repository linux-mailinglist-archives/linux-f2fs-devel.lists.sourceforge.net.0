Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318BB1D3E3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 10:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olbsox4JfM+RWfgVEh4oDuK9D1WoejAsTEv9+ad4W9I=; b=TNGdHv5SsrhnKH8BEy8460ofp+
	VZ2GDedfwNRBZ0dk7d+M5kZH7I+b9kraAAzUmL5gWE+7BAKFWbokrZ2qbilbXs60MyBW6QBVkN0FF
	cTiSL97T3RascdWAnrXdu3cNFp2nnZggB0OtpP/3u94pruKIfp1Qeoh/boPkQ95fu0jQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujvXr-0004ZR-4G;
	Thu, 07 Aug 2025 08:00:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujvXp-0004ZL-Mc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 08:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZzJUO9cOAqZyMFe398kBMyHIjcGKI1Pl6R7ybCPJjn8=; b=JXe0dsXAUvX+R26/CR7eYe6CO+
 VCEoX7Fe84qdvIYdQZV1WwNATXw33EvEOGdHWgQ47dQRTELvR2eC+JRVNlN3a1C6w6W1wusGWgA1N
 XCRIAr5NB0XYNfXhPkE0G3j6/6GFXA9dnz1tWa7ZDWTxn5njX2VWEmLAP7Arr5znrtW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZzJUO9cOAqZyMFe398kBMyHIjcGKI1Pl6R7ybCPJjn8=; b=jktMCIHlXzZrxutxDQn6g8YBbf
 9JLlZ/6DziL0NVMuzfdhybNFVE4mieHiqyfAr8sxLsOHMoepN8cs51A+TGGhpPtfknMHfuziyQ4MX
 ED/hva1Zf5j0eAGQtdbdR6J9CvIdIlDARi/IoEqpjmy2rolOXI9cQ4geeMf+PhOCBmEw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujvXp-00042V-BC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 08:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00F305C129C;
 Thu,  7 Aug 2025 08:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C576FC4CEEB;
 Thu,  7 Aug 2025 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754553607;
 bh=ZzJUO9cOAqZyMFe398kBMyHIjcGKI1Pl6R7ybCPJjn8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d7tUTPxeLvlsHKtQdRtliMDHefObfLfrCDya8QgPiklg1R8RJ/howdWA2dETAW1Ja
 FqD4mPTyhAaFdkzpGyVyXbJHRS3m9ywBULtJwxd6Xr8miBgmVipEN1Hv0M1TzNTlO8
 BfyHn98P/gXD9spdpJRU+OQpbyRwHX/2AN9yuX9AZPimu1TQwW9Gv7obgLBcRAcGyU
 D4frQE5XEKxC08YkN4BQ2KCJAUlM/4lFmVcydiqz3BPr3DnEStNxdbS9XZ6jH0vrO1
 1jtk6ZG5UrnAVIWLZyek9x63si2gTXnKAXkQca5adbOi5jWOGbJ5sXFgbQX3tWmjpE
 fN4bH7+kCHmXg==
Message-ID: <fccf8df6-658e-487d-9b52-0038e0a0939e@kernel.org>
Date: Thu, 7 Aug 2025 16:00:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cherniaev Andrei <dungeonlords789@naver.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250806095356.2536689-1-dungeonlords789@naver.com>
Content-Language: en-US
In-Reply-To: <20250806095356.2536689-1-dungeonlords789@naver.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/6/25 17:53, Cherniaev Andrei wrote: > Signed-off-by:
 Cherniaev Andrei <dungeonlords789@naver.com> Reviewed-by: Chao Yu
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
X-Headers-End: 1ujvXp-00042V-BC
Subject: Re: [f2fs-dev] [PATCH 1/1] README: fix build instruction
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/6/25 17:53, Cherniaev Andrei wrote:
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
