Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F5589B7D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 14:13:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJZiu-00058L-M4; Thu, 04 Aug 2022 12:13:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oJZit-000588-BR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 12:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vXaLZczwP3cwMG1/fdvyz6OHOzsAFUMj+oZQ7o9yWEM=; b=nI4dyPMhogZndM7FuLKN8qE5D7
 6jxsuLGY6WOTiKDvsLY0iqvIP/dldZWLmi+NKuFsMIs6czzUhIlQEHcTfFqxzNU865HnZaZhPhWNW
 PVffZrvtWRn4BE15HGTDPny6u1LuUSP9vzTUCDoq1KxGI0LwaqnqLuQus1wt0Xp46wJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vXaLZczwP3cwMG1/fdvyz6OHOzsAFUMj+oZQ7o9yWEM=; b=WUYSBACuENDNxL3CHSmNFxzVRY
 8t/ljAGNyAJwBk7EBaMKdxbnvez7QCXAYMtXXYUreLx1HcDCLIXLQ0uhWFtLG+T9cr51DzFPIS3SB
 yXdzQP+G6djRzX8xCSFtLTzQAYRkQmXeM7vMbhRmUhm2JA2/RpNKkm6SiwNCeno3ROSM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJZie-0004IV-PX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 12:13:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 829F6B82449;
 Thu,  4 Aug 2022 12:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A125DC433C1;
 Thu,  4 Aug 2022 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659615165;
 bh=5j6l0nt318EKz9/7uCaut+EvSc5ptwxPnHwqudG8ZGI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YpTzvFuVCbkZYhFzZIxNe44dMshRX8zEFBf4GjrjO1Z3uDlT6viqsiQugtRjRxHQr
 TQ7aQcVTb5YVufbsFU0BK1ZN36mOQc3ACeWBoNvRdcz2ROpOEaws6I8uKMN3OFvTAI
 kXuFeJK1jYrAaR1leYy+kZdyLgLZvWsw2t1sDbjHfmqVkU/rX39+nVxBvqDV+rFQi3
 hK08/Rt9EIw7rAExVO9TMSu10C7v7KC5WiEVbKcA+PZtxwqy0CJsFg4d+8osWbs/27
 dI2MnvxlhFrY+qZTfKf3KZf4Jf6komPd0wEL+GjQJpsIZoX/V496CHtNw1PGn3LXeS
 3Uj9A27GDe9Aw==
Message-ID: <faa1560b-e25e-2a5a-1675-65a474c80cd8@kernel.org>
Date: Thu, 4 Aug 2022 20:12:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20220801170808.1692711-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220801170808.1692711-1-daeho43@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/2 1:08,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > F2FS_IOC_ABORT_VOLATILE_WRITE was used to abort a atomic write before.
 > However it was removed accidentally. So re [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJZie-0004IV-PX
Subject: Re: [f2fs-dev] [PATCH] f2fs: revive F2FS_IOC_ABORT_VOLATILE_WRITE
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/2 1:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> F2FS_IOC_ABORT_VOLATILE_WRITE was used to abort a atomic write before.
> However it was removed accidentally. So revive it by changing the name,
> since volatile write had gone.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Fiexes: 7bc155fec5b3("f2fs: kill volatile write support")

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
