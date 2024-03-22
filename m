Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA4886B5A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 12:34:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rndAQ-0003y0-Mc;
	Fri, 22 Mar 2024 11:34:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hdanton@sina.com>) id 1rndAQ-0003xq-2b
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 11:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9B+ZGUSZ+2S6Q6yezY78Wg3Rs7d3EQ0T352gGNsEiY=; b=Sc7LnWM6uJsrjnKnVdSgykiwU7
 YNdltGm1VEfN2bGxfX59lERIanT84e2im293HthNsKNYjyQIJkyqiPniAnBy2x5ohCesSJHkmuBgm
 qK58DQhNoLe9397aiVcfYEQAQXm1SfRX1FTwhYTuxYlMx5qWSo5nllbY7tvo04wY/31A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9B+ZGUSZ+2S6Q6yezY78Wg3Rs7d3EQ0T352gGNsEiY=; b=OR4Q6N30c8JvBpPfiMkT99FPwc
 fb/keYrLmxL5dsdRK99leFwr2fxWSNL1LvtOfBAYYTfR19Vpsf9cGxKXN/y19bWiBJeoafkYep/hu
 Gyyp5eU8cWrcRsukLFOU2lHQrPsQXvlI7Auihztzb+X1ObvQEmSgpwUNoE0ES7T6zLlM=;
Received: from mail115-100.sinamail.sina.com.cn ([218.30.115.100])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rndAM-0005UU-Bz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 11:34:34 +0000
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.69.35])
 by sina.com (172.16.235.24) with ESMTP
 id 65FD6CAE000022C4; Fri, 22 Mar 2024 19:34:13 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 49593745089255
X-SMAIL-UIID: 836C24187C8B403DA6AFA1FE929A0CF9-20240322-193413-1
From: Hillf Danton <hdanton@sina.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 22 Mar 2024 19:33:57 +0800
Message-Id: <20240322113357.2599-1-hdanton@sina.com>
In-Reply-To: <ZfzQz5hwECOEGYVL@google.com>
References: <20240320001442.497813-1-jaegeuk@kernel.org>
 <20240321224233.2541-1-hdanton@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 21 Mar 2024 17:29:03 -0700 Jaegeuk Kim > > I posted
 this patch before Light reported. Yeah, his report's timestamp is 2024-03-20
 6:59, nearly 7 hours later, which shows that you constructed the deadlock
 with nothing to do with his report. > > And, in the report, I didn't get
 this: > > [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [218.30.115.100 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hdanton[at]sina.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rndAM-0005UU-Bz
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid the deadlock case when stopping
 discard thread
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
Cc: linux-kernel@vger.kernel.org,
 Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 21 Mar 2024 17:29:03 -0700 Jaegeuk Kim <jaegeuk@kernel.org>
> 
> I posted this patch before Light reported.

Yeah, his report's timestamp is 2024-03-20  6:59, nearly 7 hours later,
which shows that you constructed the deadlock with nothing to do with
his report.
> 
> And, in the report, I didn't get this:
> 
> f2fs_ioc_shutdown() --> freeze_bdev() --> freeze_super() --> sb_wait_write(sb, SB_FREEZE_FS) --> ... ->percpu_down_write().
> 
> because f2fs_ioc_shutdown() calls f2fs_stop_discard_thread() after thaw_bdev()
> like this order.
> 
>  -> freeze_bdev()
>  -> thaw_bdev()
>  -> f2fs_stop_discard_thread()
> 
> Am I missing something?

Light, could you specify to help Jaegeuk understand the deadlock you reported?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
