Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F8A62B08A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Nov 2022 02:27:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ov7DM-00066x-Jt;
	Wed, 16 Nov 2022 01:27:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ov7DL-00066q-F9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 01:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o0zd3sOQ1svBtMtcmjTBf49YngZ+hY0SgPh9k2HO8Wc=; b=XSnGSNJzTiQp0vhVb1iGyWtgTH
 d8Aq+HmMIr5JL46bids6WR5pXdhMS5n/kdt6jDbaXJBlHwySxmXQTfRt/XmmxodMYDuCvBmLs3s/f
 9ZuMqQxrgUYKaInByfhIiTtqfmhqNqGU2c3dAfIcBvqZgSp1o1ouHLK97zwu0sFQOr+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o0zd3sOQ1svBtMtcmjTBf49YngZ+hY0SgPh9k2HO8Wc=; b=YqFNk2cjkym8qrovL6VS/uC++Y
 VDV3C7a2QKGk1imoK1SdEHV0giozRC2yPrNAVVBmBhxD2Z6aMvZ8wGih9goBwZQMLHjmy25CFT++S
 kbHocw0i35kdKNEtfCX5grNDx9uDX3bcSjSU8LtimOJHBkEijG+9UAyYy/wYeIGMasPg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ov7DK-0004qE-To for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 01:27:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87B686183D;
 Wed, 16 Nov 2022 01:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1403C433B5;
 Wed, 16 Nov 2022 01:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668562056;
 bh=Ekbcnkxdb4B7+mE9GZIS2Cxv9nmRXw98wHjM6WoI6kk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hdL2lXuXu5rToZr/nj65BKvOPSRnCC8LwVsEmw4cmuSCplRb1ymDsHviEIzGMgmK7
 dOGNkjGDFKhB6+Dc/ws5nqB26f6lOw2RsWVdh7gqhJ83fESWV8sTkgVcF8f7XIde69
 91nfcqE4VmH0qJsetnJnkRbWJpxodUglknd+Bl30XdJm/V0KaVCCqVqc+JPujptTHk
 EmDnDPfEEI/6Rf59A1AMtzio7mjtH5cE2H2/PaHrr//96tX2cbgXOP6VHgIzA67wd8
 EW9VaiZZ1R0EZYlmCQvDUukaB2O0/SayJWAalwF+INg/m9IMaWHkwf+tB6m6p4GU6b
 Q1KfQtRtBMw2Q==
Message-ID: <538bd5c2-d287-8df1-1061-bca2d801b64d@kernel.org>
Date: Wed, 16 Nov 2022 09:27:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
 <20221115063537.59023-4-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221115063537.59023-4-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/15 14:35, Yuwei Guan wrote: > Before this patch, 
 the varibale 'readdir_ra' takes effect if it's equal > to '1' or not, so
 we can change type for it from 'int' to 'bool'. > > Signed-off-by: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ov7DK-0004qE-To
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: change type for
 'sbi->readdir_ra'
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

On 2022/11/15 14:35, Yuwei Guan wrote:
> Before this patch, the varibale 'readdir_ra' takes effect if it's equal
> to '1' or not, so we can change type for it from 'int' to 'bool'.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
