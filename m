Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF4665BEB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 13:59:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFahT-0007fg-GQ;
	Wed, 11 Jan 2023 12:59:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFahK-0007fU-Kc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 12:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MuyzvleTBNx16PGmqaHjvVjhMcY6/kmcYsXV54EGoT4=; b=RB+2jNRV/MQat4vIGXuvyzdev0
 9rv76eCy/qtJklc6ohehY95QhJhdHN69kq/IWhTvjcHZ79QYNcsu2LFaqQeqsFZbxd3aei69n0rg3
 fETS+lueS9z9pLKNfEesRbuYV19zKMZJrR+yXmNB1iu93CadaptZRnrC2mRFnkQx4Eeg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MuyzvleTBNx16PGmqaHjvVjhMcY6/kmcYsXV54EGoT4=; b=SEwfVFdLFuf04z0dOSA0SfmUI8
 24dWk9G4bO/g9/DP/b9CoHOeA4Oqc4b/S8zV5YfsEjWT94GZa86FzeHixk8esG4B2LF94l3EWZHLr
 xUQ1CZgrJxQcm0kzT0D5PqC47RKVv9ZrVYut9HQrCu8m+7RN7RVDLyQay+qmeOH3IunA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFahH-00DsrI-W4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 12:59:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 016D361CCE;
 Wed, 11 Jan 2023 12:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26C1C433EF;
 Wed, 11 Jan 2023 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673441948;
 bh=OAonq7L5C7h3Xoo6q19gjPkLzGp0g1x2P9DhUt1v8hI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GV3BX3Is8fihkER4CBDTPRxoH1npx49IA5MwgoZNJ/pTM2WVicgW13s5H60VOXhss
 jO5Tu+CrP2EblZBd/nNmX0XdgIHEhn6NcArebCVLqTEzd/vdfIr4J4A+d1A9s1gc1e
 AramKK0FpWGHVWVry5CngLVJOm1z6oj4aFQLgv1K1O+JJBLDr5GChu3F8RGtQX64Vy
 /W4VEz/me4m5/g7OxN3SsX828F7jgWJaGJRHiLMXgXfAVUoC4mht8SZmnt1Lhz0muo
 Hx6bUmsGdbyZg8IC+4Egeq4MPhBmYWEromzjcM70SgMg2ktJdMuTac+g/E3vpzbAgi
 yxBNgRK5r1gwg==
Message-ID: <25f7845d-5bf6-7948-d063-747186ff0d74@kernel.org>
Date: Wed, 11 Jan 2023 20:59:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221216024506.77048-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221216024506.77048-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/16 10:45, Yangtao Li wrote: > From now on, f2fs
 also has its own patchwork link, thanks to Jaegeuk > for starting this tool!
 > > Let's update it to f2fs entry. > > Signed-off-by: Yangtao Li [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFahH-00DsrI-W4
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: Add f2fs's patchwork
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/16 10:45, Yangtao Li wrote:
>  From now on, f2fs also has its own patchwork link, thanks to Jaegeuk
> for starting this tool!
> 
> Let's update it to f2fs entry.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
