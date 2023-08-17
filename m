Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C677F9D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Aug 2023 16:56:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qWeQT-0001Ao-M7;
	Thu, 17 Aug 2023 14:56:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qWeQS-0001AZ-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 14:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+Uu0nhBK16oWOuWs6i7ssuOGWXKs/ohZ3sarY4Pg+k=; b=mcaUdygI7Vykv+cYOJPfpzPwre
 aGtOAgqmqiHlkZd6iABDfHy2h8Nd3V7R14nObTdAi63dQexRGJcBMFQkGKP5t2DGOwguw1Pl6/TQQ
 RakHUgW8k5Vyuxosjn/Yx73oFeyfMZxaUujyd1Ea4l4kWypLiPw/VmaBM/oI9pS/ldjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A+Uu0nhBK16oWOuWs6i7ssuOGWXKs/ohZ3sarY4Pg+k=; b=QXHE1Fpe6TtLY9J5L23Ey80v3S
 SG1uje1uGSdG/GIJBroUoHltWE0DD6cwvB7KU9G5pZ7neUTJqPLvlx7QPMuA/Ye5C50DZmrVAJBu0
 QYvgzvOgr9bMaUX1KWDG5wI9XegO7QEDv0Rhhr+l+4KD3tiS/KfTZO2O1czUW+xxloOc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qWeQQ-00051T-EI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Aug 2023 14:56:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8337767399
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Aug 2023 14:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61259C433CA;
 Thu, 17 Aug 2023 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692284188;
 bh=Mm6wdmscV12Kh0bSm2JHEp90wxAUhc0ZCgvR4nvBq2g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=R5F2pLK/QxXLbDBIfPNK0iAxwd1ePAlDg9PXY5WreDaCvQlBb2akRk8m6MGvw26/g
 URkihv6z8DONQy+DAqB/6J+znieA/dgxXH+ShRsvTnmAi1RB9yN91Qc8VLlZxLym7n
 AvdpoJRDpirb0pPHM1L86nmlIPjXRR79fHW849YM2AmG5yOJkTIiSaOsmRHNJ/MhR4
 kWOfHrwWxNg3i+1p1oiMko/efz3LzZH1PyFEUBa/UOeNzCac3BQ8NJ6OHXw/FobcYs
 FFHYX5R/yaKbHO4qnNLZp4Nac3n6J2EQjBzYP6iIXIZ1r4BcjMnPCDOnAQzHFizKoq
 UdYZ590bKxkmw==
Message-ID: <296cdfc7-7aad-f510-d011-94ee67059311@kernel.org>
Date: Thu, 17 Aug 2023 22:56:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20230814205800.2244461-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230814205800.2244461-1-jaegeuk@kernel.org>
X-Spam-Score: -9.2 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/15 4:58, Jaegeuk Kim wrote: > This replaces the
 mmmap read flow to get the maximum performance. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-9.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -4.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qWeQQ-00051T-EI
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: f2fs_io: no memcpy for mmap read
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

On 2023/8/15 4:58, Jaegeuk Kim wrote:
> This replaces the mmmap read flow to get the maximum performance.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
