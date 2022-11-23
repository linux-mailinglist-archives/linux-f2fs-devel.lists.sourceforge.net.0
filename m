Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82A6363E6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 16:37:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxroh-0002sx-6P;
	Wed, 23 Nov 2022 15:37:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oxrog-0002sj-81
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ituVRZdR28qjxfOrRtGlDJ5vcKKpRZ7Nx9SWFbnMWLs=; b=YEdnFWnRBmU/2Sif9JVQVQk5vz
 GGozXcLswXaBxW5n64ukyjVTIv8fuL/Bg7QnT6up5yBKYFz0dipIV8b524TwkzkzABLWibK32UdLx
 CwM8PsgADbw/WzfBPzpZcZEbKH5NJI1RfnRNKmYPZr4ayJFpsHnvlwFUweiDJUuTeatA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ituVRZdR28qjxfOrRtGlDJ5vcKKpRZ7Nx9SWFbnMWLs=; b=aOhc+vMINdB0g3UAFNqJSUoccY
 q7sURZTGrC7GPTFYz4x/eeNBwOR64G5XAXSaUMmExkeVi+C/TXvY/OONB6P+MqRkw2dcOU51NwJt4
 +Ov1RBnB1+JzsE4aUtXhSL95gmE5MzXvlA+BfjtMVdStX0yxTxNaED4pe5KZW/S5tPC4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxrof-00GCc2-Ne for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 15:37:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC05D61DAC;
 Wed, 23 Nov 2022 15:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE54C433D6;
 Wed, 23 Nov 2022 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669217848;
 bh=WtG/nCMmHFjaiF9yiTnMEGa5dsGUrNmb98PkLsNAl88=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dWGhMqwUJk+AbyPMelvRGJERNUWBRm/iwdfVlBMce2s9DpWnU6tK+1bEnQmxSX9WL
 wRDKKPlVTTBBbCh8y1fi4mJd+JXPhO2UrzWMAIwX+qzWnJJ1TSQ51kITPkvHmr7h31
 CgYkV0zo22JhPI47ogAgrqJVGpdR+YQOvbGE86WfEol3Fowc4Xlp/Npio1deb+hxn+
 jw+q4LA5y1SK7+sLUHOR1CP4ZbsU9ciwv0cXh/X1r2VBQZ5XlJinTRhRBps70V6yEP
 zx6kRNBq/37vsmWMADN7I2xiyF+Cu7NcLqPVogC8c+5UGSjLr6w1d+Dd9IAgHbR2fZ
 jYqiz8Lkic6BA==
Message-ID: <1bba50dd-99a3-76c8-3469-ab096bd23c38@kernel.org>
Date: Wed, 23 Nov 2022 23:37:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221118174028.63702-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221118174028.63702-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/19 1:40,
 Yangtao Li wrote: > Let's fix the inconsistency
 in the text description. > Default discard granularity is 16. For small
 devices, 
 > default value is 1. > > Signed-off-by: Yangtao Li [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxrof-00GCc2-Ne
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix description about
 discard_granularity node
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

On 2022/11/19 1:40, Yangtao Li wrote:
> Let's fix the inconsistency in the text description.
> Default discard granularity is 16. For small devices,
> default value is 1.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
