Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6B61085C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 04:43:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooFLc-0005MF-1t;
	Fri, 28 Oct 2022 02:43:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooFLH-0005Lx-MM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 02:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KVh1Zntdi4ZfCeNSvLBO6/RfssnPAS15X+tjyRsZ6vg=; b=mPtYvkwrdyIU0oQV1n+ikzKYpl
 Mud2dneHoanFSlhdzBglRIKr1Nyll0kQelEhNIJohFIMAplnOBZk9+/GQWzpxeDBwua/j/SoCiwWX
 Suy/+cYPUohEczTsEIi2g6C32pVmFuZNiuPpFIZvq603xPniqeF0hAuuhDzgpAgGZqqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KVh1Zntdi4ZfCeNSvLBO6/RfssnPAS15X+tjyRsZ6vg=; b=MY0FsyLTIVzDERStQKFqPWWAbZ
 zqX97AY8+i/RZLtcK4Ke9pMt1W64zbi2hwr2odPKHQGW/wTywfMudvmZNN3XkvwPL6w7eFhAA5sXw
 iF2dz1qQ/HWykm3w8I9ar5U057dYG7os4tutlD5P6ldm2e5Kd/pR8Gk6PUbCuS4CoPSU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooFLA-002w6X-6Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 02:43:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C099F625F4;
 Fri, 28 Oct 2022 02:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC9BC433D7;
 Fri, 28 Oct 2022 02:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666924998;
 bh=yP9Mp7mnc/566BWrPMyhrgwrKWfXYoU3X9h4DV4JM5U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TlN8lYNcQG70MpuVcJc9DXLflVqSysjT3LfAS4QfhsURfSziohSws/k07QWudIVpm
 yloqZt0crw8+9uAemWBocU3JcJL28rj4A/h9fx95jyCFGnjNev4W8UQDMayLherkP2
 uFSte6ai7qMFwHCpPHDN4Q3Wyld5hMJftTxHTveaQvy7eFEA6U81R6fBSUkHOkjKJr
 4dCVpEcdYuSM7FFP3CmhZZ8Vsw32yPJTLOfNS+8sUlIUlSKwxYW4M5iZSG8uhaaEJa
 gU2gHHLJpX8eZYUn+oMssw04ZznDeNg4TdYtUQCsQgenGg/H4wJEZt/KAxXFryHZO9
 mHK8PR/WHLerQ==
Message-ID: <85b6be9b-5c5b-ace0-8084-4bd52ef64996@kernel.org>
Date: Fri, 28 Oct 2022 10:43:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <ab2f3576-bedd-8c27-5549-f9ff5462aee3@kernel.org>
 <20221028023303.28020-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221028023303.28020-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/28 10:33, Yangtao Li wrote: >> It won't pollute
 global namespace since it's a static function just be used in f2fs/super.c...
 > > emm, I think it would be nice to see the f2fs_record_error_ [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooFLA-002w6X-6Q
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to f2fs_handle_critical_error
 when errors=remount-ro
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

On 2022/10/28 10:33, Yangtao Li wrote:
>> It won't pollute global namespace since it's a static function just be used in f2fs/super.c...
> 
> emm, I think it would be nice to see the f2fs_record_error_work symbol
> in the stack, it can be explicitly a function of f2fs. personal opinion for reference only.

Oh, yes, let me update in original patch as well.

> 
>> Do you mind letting me merge these two patches into original patch?
>> since original patch is still in dev branch, rather than mainline.
> 
> Glad to see, if resend.

Thanks, :)

> 
>> I guess it needs to stop ckpt thread as well...
> 
> agree, :)
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
