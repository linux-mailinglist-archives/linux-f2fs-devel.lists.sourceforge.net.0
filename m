Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D2705C7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 03:33:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz62r-0007iM-7q;
	Wed, 17 May 2023 01:33:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz62p-0007iG-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2a9w+APZePLVJr30yNIM056Gi3pKnPqfhcIFqRQ3wn8=; b=G7OELZGAJoSSpIdKlSXmwngKP+
 DgFGUiDG6lD1gLj2ihg7XJZOpmo6K0epUfMtgGHRJ3jiegxxLjDADHZO/df3JGZceM2fTdFMswfP/
 RuyumpSLlxA/9saJOzKM15FWE5ODGPkug2csbhMTHJUMXhC+0RlWBnXw0YZHDEogyOF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2a9w+APZePLVJr30yNIM056Gi3pKnPqfhcIFqRQ3wn8=; b=VN40S9t2ZOTuMV6De7PJOzUAqU
 8vyoFw5W7H86XoK02kqs0ujOh9NjlDuTWqwz72tf4OUbDTUsiaKYpBAqAh/BLzzxZdohFtpREq3d5
 Qy3YSJqXKb8ZgXAZr4XUdRux2jvP26sq0WeaMmP5lelOEhGOAo2c2hRHneMk3w+hyBTE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz62p-00ALe7-8A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:33:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA2D263B89
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 May 2023 01:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2385C433EF;
 Wed, 17 May 2023 01:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684287209;
 bh=PPVDkY+EvdxwSIQDM237KwILCUREYeT/1zTBXWjoW+k=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=dDvNUra3Ht/hxIlLFmW264o3r1hUlDeBI9dgvwjaYhdUZtrkDMXiDRhUtguALLVyf
 slUWT96k+kGwiAg5XU/6PJvyLafNLF/pGNEpup1xA85Mz36TBiVhY3wMfGJkyQy7Ax
 a5e1zR57Vs4yhbqHG9ezIflz1vtQ13UYtaYy4H0meuvTZ+B3ystekeIgVhGu/1JfYJ
 v87I1h6jwjCg82Dg4KkfObmtsjI4btdGstS9t4KGcwfWimtUQTQfrY7qP3dsh9ljt7
 A9FzPcG1FtvTt20TE+3KRgsZEz86my+e5Qv66RElBkVaKIzFH+2Au9WzB/UaOKofC8
 bVeCSrrolLD4g==
Message-ID: <57c32112-6457-f3f5-ef43-226a3ae2f75a@kernel.org>
Date: Wed, 17 May 2023 09:33:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230505191841.3185179-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230505191841.3185179-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/6 3:18, Jaegeuk Kim wrote: > Should use !in_task
 for irq context. > > Fixes: 1aa161e43106 ("f2fs: fix scheduling while atomic
 in decompression path") > Signed-off-by: Jaegeuk Kim <jaegeuk@ke [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz62p-00ALe7-8A
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the wrong condition to determine
 atomic context
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

On 2023/5/6 3:18, Jaegeuk Kim wrote:
> Should use !in_task for irq context.
> 
> Fixes: 1aa161e43106 ("f2fs: fix scheduling while atomic in decompression path")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
