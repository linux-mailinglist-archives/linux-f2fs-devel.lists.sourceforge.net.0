Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0168FA7B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jun 2024 03:46:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEJFs-0008Mr-GF;
	Tue, 04 Jun 2024 01:46:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sEJFq-0008Mk-NI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 01:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9avz5OGZ8SSxZVP89mac4toP0cayMSWBo09zptzFzgI=; b=FC06/QmjzSLymzUB+fd/Wwq+Sl
 yreTI5Xjiyd0WY7UwXHSfibDc5o/tZlcmzjzH1o2G80WfSZ0joRqy5QsEvaKeKo2GgX/Cy/rgG89F
 9pdygDGtfLlK2M9hsZY1Q36XRJxkp15LVSbm+dorRA3Vb2jjHny694jvTTX43P3FZqTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9avz5OGZ8SSxZVP89mac4toP0cayMSWBo09zptzFzgI=; b=Kz7TV3dwCraP90uWcClEuwjvZI
 csYa4I5SfDU+cPxIIBqcBknRX0Z60BT8/5ttLhpiGzz5RSa4vvpx+d3YU3PhacbuDeSI7Z7muNFIY
 XiElSqBCcrMTJNez5xJV0heu1QcWfXkIw+KTHZCf2AOMuM6zpts6DyWdQVESEJkTS+zc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEJFs-00076J-3T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 01:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 020C7611B9;
 Tue,  4 Jun 2024 01:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3132EC2BD10;
 Tue,  4 Jun 2024 01:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717465581;
 bh=Kr64VTbx4fuENMluaNdpiqWjuGc1bcsbOj4ozALLLP4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uQxzwiTezo5rYVqKnfPuWeCcOZuf9H0P1W2Xp3HZSz91IlE1rt84UMYJLNF8/UMsx
 8Iz9/glKOiQnQAIBt0B9D4tHaf5KW7l/XGQVFCiCPzpCDnuPIY37MFbzANxeSVYssA
 KMifXL71STfa8xDqx352PDxrSokCMSMvP1UVsvPoTXidJ7OEu9kK6w8OwylUbzUdV0
 3cj4HgJrKaw9LeouXb/SCBP/4YZ4DQAb45salKr6f5w6mCKbC6DFsjhplmuHX02dQT
 WWi/CmBvofzL8zmLn1fyddH61vv3nKILax85Y0rm49yFyB1b9QN/jnclkY4rDVfbBR
 8okvWEfgqSOhw==
Message-ID: <04c4b93a-fcd7-4f42-a7cc-1cc3ed4019e1@kernel.org>
Date: Tue, 4 Jun 2024 09:46:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1717414526-19658-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1717414526-19658-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/3 19:35, Zhiguo Niu wrote: > IOPRIO_PRIO_DATA in
 the new kernel version includes level and hint, > So Macro IOPRIO_PRIO_LEVEL
 is more accurate to get ckpt thread > ioprio data/level, and it [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sEJFs-00076J-3T
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: use new ioprio Macro to get ckpt
 thread ioprio level
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/3 19:35, Zhiguo Niu wrote:
> IOPRIO_PRIO_DATA in the new kernel version includes level and hint,
> So Macro IOPRIO_PRIO_LEVEL is more accurate to get ckpt thread
> ioprio data/level, and it is also consisten with the way setting
> ckpt thread ioprio by IOPRIO_PRIO_VALUE(class, data/level).
> 
> Besides, change variable name from "data" to "level" for more readable.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
