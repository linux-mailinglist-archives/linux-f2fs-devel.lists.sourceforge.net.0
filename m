Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5B68D6DD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 13:35:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPNCR-0001b9-5G;
	Tue, 07 Feb 2023 12:35:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pPNCQ-0001b3-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 12:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YE207Sec1d4yCbP5BjYXsW6iiMnnc59UBow+cyB5BHQ=; b=eNbAhT9wLBfmkxEGfDmBPPFn0U
 ewDfnWqFTVjiyhQxbvRk9VBo3GVjH7JzwB19d9JpeZD8n9VDr/ItlgwSnJ0YoQhB4/UBEIVrAmcLJ
 pf9lsL9zcdzH3L3d/aZ5XQ+tfzsAWjaeSLp64HHKFS6xjaS9Lbu+Q/im92YfSYE8lgJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YE207Sec1d4yCbP5BjYXsW6iiMnnc59UBow+cyB5BHQ=; b=duovB9HtEMzyA5KRu/vEC2ZazT
 nuS7qpOEog8krbcddkeVu9IF8915VxsfZeIR4Y7XUCIF3yS8EPmQYdq/2tVRmiU5JlxEFpHApnRPe
 pW+ur0Vswj5N1Hzd/EKmLBNQI4nQKYvFzjqOWYltnkg1UucJi9TQMc0WtvMiBpag04D0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPNCP-00Ddj2-4v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 12:35:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A2A361358
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Feb 2023 12:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AC2C433EF;
 Tue,  7 Feb 2023 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675773340;
 bh=B1yqYk/6A/aeLnbi8ZCAvrU/n2HsoZIBq+L0c92QQzA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bv0QIeWKfpn3ZDkjnvuntP2gV7vEJE1EysC1w4rnGp2rmhe26XRim/hzHFFvx42Td
 6amqQ4CjhE+afT1aRClBO3ndLxrMi2Aeh3XMTBS0LvLIEMvwG9fNp8AIqGNTL9tZMV
 mYrwocbvB18T9TOq2F0TKr59Rh3YUGPxyES+z/qPy7O7MJNPKpIgTLwU0KghexeofH
 JovGmKtq9Aa6btDAav1oYCMCMkvYFaRh25ZgNJ3EQUnuBS12fJT80OYCsJzJLeiZVw
 Iq0LgFWReVStAEDUpId322L3JTDjnj+FMlg1sl2QmLcg42r0lt79VIbyrAffaebpCA
 ldZrHQ/BpcNwA==
Message-ID: <97b16883-64ec-ba32-ddf2-656ff7a5fc80@kernel.org>
Date: Tue, 7 Feb 2023 20:35:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230206034344.724593-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230206034344.724593-1-jaegeuk@kernel.org>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/6 11:43, Jaegeuk Kim wrote: > We should return when
 io->bio is null before doing anything. Otherwise, panic. > > BUG: kernel
 NULL pointer dereference, address: 0000000000000010 > RIP: 0010:_ [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
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
 valid -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPNCP-00Ddj2-4v
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix kernel crash due to null io->bio
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/6 11:43, Jaegeuk Kim wrote:
> We should return when io->bio is null before doing anything. Otherwise, panic.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> RIP: 0010:__submit_merged_write_cond+0x164/0x240 [f2fs]
> Call Trace:
>   <TASK>
>   f2fs_submit_merged_write+0x1d/0x30 [f2fs]
>   commit_checkpoint+0x110/0x1e0 [f2fs]
>   f2fs_write_checkpoint+0x9f7/0xf00 [f2fs]
>   ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
>   __checkpoint_and_complete_reqs+0x84/0x190 [f2fs]
>   ? preempt_count_add+0x82/0xc0
>   ? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
>   issue_checkpoint_thread+0x4c/0xf0 [f2fs]
>   ? __pfx_autoremove_wake_function+0x10/0x10
>   kthread+0xff/0x130
>   ? __pfx_kthread+0x10/0x10
>   ret_from_fork+0x2c/0x50
>   </TASK>
> 
> Cc: stable@vger.kernel.org # v5.18+
> Fixes: 64bf0eef0171 ("f2fs: pass the bio operation to bio_alloc_bioset")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
