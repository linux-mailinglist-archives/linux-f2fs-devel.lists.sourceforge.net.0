Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6311C4EB330
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Mar 2022 20:09:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nZGHv-0007cp-CH; Tue, 29 Mar 2022 18:09:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nZGHt-0007cb-TQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 18:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h2YnJL609FPEgpRkzhoG1HhXHB/pO8ZQqPB/p1BAO1w=; b=W1nEIsokgt4i2w+SH2rOYCbMPY
 6qZ2fk99UzcJbBIEdo96N7DqJJuFC3fNVoYEqH1KzDsLY+8oBPnpRiEjoHkPyoVPzokpRYFhxcmim
 svE+PrAsxauKAp8QAINMgpVZT9H66UdsIO8do/2rVHPv/505kRkP9WAfAAHaD1xmbwI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h2YnJL609FPEgpRkzhoG1HhXHB/pO8ZQqPB/p1BAO1w=; b=kwnPWJtMwK4GI7fJrC9EbXLIL7
 S8W08xgl9GHY4pIwJsby7zSzexj8M7fqxdusyR6k1jXYltzMrhNB50YIjBov3OAIqriJbeRauQRyb
 FzajxgaMJM1TodRd/XWG74wp0cR/cCNU4eGqp0ICqrYDsISLn4Gkr/qTB6y7NaXU3cl4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZGHr-00010f-U0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 18:09:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 712FB61599
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Mar 2022 18:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B40C340ED;
 Tue, 29 Mar 2022 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648577381;
 bh=/pZfUjwnCrvFojpuNSnniNhny5IfONJsKbqaSoUTGXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQkrLMTxowmVwtRXi8+jjcco1uue4Dlnjq97hDbkfpp0ny71FIETW7bxzZ62Qd+Am
 H+tm3tHIroup+XG7mmMnkG4p/bI8eZv1Qu1iBuBPunp5inSQoT4AfXC/2IXWet1B2l
 j6rvuGNPTzq/4m96oUHtdELA7dfDtQzL+ugtVtjSVC91vnl/t0RqtBZaawdmeQ6g1L
 QVSHStAn/90/5k7VEfB6CC2M9MU65AV+E6AIBC69iFZNepUJun6v4ObJpi0L0pqKT2
 ACKS03JR9X02unMsWlirs/0oUlQL70QyLPzdNRGLYKb1AzjO5AciSGsJ9ce6AACg/s
 wwbrjO2HtZbnQ==
Date: Tue, 29 Mar 2022 11:09:40 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YkNLZPRMDwmVml1w@google.com>
References: <20220321223315.3228326-1-jaegeuk@kernel.org>
 <YjkUvRKhyX8AUoTm@google.com> <YkJ5anzBIyQkiHfU@google.com>
 <101f4cb6-37bf-0ac3-3838-7aab7e648352@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <101f4cb6-37bf-0ac3-3838-7aab7e648352@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/29, Chao Yu wrote: > On 2022/3/29 11:13, Jaegeuk Kim
 wrote: > > This was used in Android for a long time. Let's upstream it. >
 > Could you please explain more about its usage? I found ioblame and ioshark
 in android are using it to understand app/file/IO traffic. Once we have this
 in AOSP, I'm thinking to change one by one. The android-mainline is also
 deprecating the custom [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nZGHr-00010f-U0
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: introduce data read/write showing
 path info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/29, Chao Yu wrote:
> On 2022/3/29 11:13, Jaegeuk Kim wrote:
> > This was used in Android for a long time. Let's upstream it.
> 
> Could you please explain more about its usage?

I found ioblame and ioshark in android are using it to understand app/file/IO
traffic. Once we have this in AOSP, I'm thinking to change one by one.
The android-mainline is also deprecating the custom tracepoints as well.

https://android-review.googlesource.com/c/kernel/common/+/2045529

> 
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> The code part looks clean.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
