Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62750715312
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 03:52:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3oXA-0000Gs-7v;
	Tue, 30 May 2023 01:52:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q3oX1-0000Gl-Ag
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 01:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9IJm7m6X9ySSRQAi8AMbc/xxUyxr7DaaKTK2WUovxo=; b=M8BIBgOnPlfD6OJY4Cx54NP7Zs
 gOFPfMmIBMZi2pAzRsP8GLBo1+X96/31Wd/bw+RaWDpz9aX48FVPfnZfRhoP5K9G+QkDqads309UJ
 n/EF60vLoTIllGiXYtwdtbqyf2OfA9hvpGtNHlW8wpEbr1a1U6w/3CGJ5l5kvaDt+1hg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N9IJm7m6X9ySSRQAi8AMbc/xxUyxr7DaaKTK2WUovxo=; b=C7vdRNGnpj5RiQQA/qbkCeQsdU
 4Z/1Ui7WrdENPOVAbKx3yfsshA/NTYeJ8p74arh2eT7cyl+LTTG2WrcT4duXktTOZlgujVuW/9UEK
 Ykz9nIPFzly3nXQ7P9eeXEwuW9nh57v5bTDAhdbEyQC6m5OcZYZC2do77asg4SUrPR/U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3oWw-0006SB-J7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 01:52:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 003CD62769;
 Tue, 30 May 2023 01:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2831CC433D2;
 Tue, 30 May 2023 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685411517;
 bh=ReN2zhudjKLiRnbxWFv3XyZ1DZM3aQ+PwJvVpX8b2bc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pahBLZL0lYOWj/oK2HjxKx2UVR0ssEdHSeXFLNHWp2qYBB1xaesKInwu0WIj03WMT
 XttlqJWfXVMvKnL6vIsAQhxRicFXVK3hzBbBG6XnQnzYG1LEsIQ/AxQVFeWngOZAdp
 cN/2ZGjosw93DaAc+mOUdznu8dScAXVU082wrcFKizetC00/TpKLscz7s02MGnIQSu
 8a1h3JZChJy+KeO8JQIdWMjrHhlA7lz7MXAQngrHf6fF+r5Yz+5x5uYHsz9Ejtdop5
 wlLiJNUOsI9BlVx/O3oplZz7OLmXR/eOEqjZIzaqhGMhtN80ebllNCdCZEH7FU1SXg
 X/PUdn/sFWSLg==
Message-ID: <9cd28186-4213-b900-23e7-24581e748479@kernel.org>
Date: Tue, 30 May 2023 09:51:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230530012118.74228-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230530012118.74228-1-bo.wu@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/30 9:21,
 Wu Bo wrote: > The NULL return of 'd_splice_alias'
 dosen't mean error. Thus the > successful case will also return NULL, which
 makes the tracepoint always > print 'err=-ENOENT'. > > [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3oWw-0006SB-J7
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/30 9:21, Wu Bo wrote:
> The NULL return of 'd_splice_alias' dosen't mean error. Thus the
> successful case will also return NULL, which makes the tracepoint always
> print 'err=-ENOENT'.
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
