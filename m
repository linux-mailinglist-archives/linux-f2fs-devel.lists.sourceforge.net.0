Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD67550E6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 03:38:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o36NB-0001Xc-AG; Mon, 20 Jun 2022 01:38:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o36NA-0001XV-6y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 01:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jhlxyfc4+qP++6G+m0DlJIUYe2n7ca9aShxKhplKZdc=; b=d8FV3iQpbM2X0R2/xWoSCj/CUh
 5dgeoP3itrzW/ra0EQn7OKPl38BhqjxRfvkM7TEl4nywI3bn8smzYFVk7nAIqNC06oL1Xv2Z6I/sz
 XUTHp1MLJ8RYNQD3aGsZ3wjegIcmoh+nf/56eqK2U+/rt3U3g2sCadF/4yTccNHV/k10=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jhlxyfc4+qP++6G+m0DlJIUYe2n7ca9aShxKhplKZdc=; b=jWFJ7G3YjWvth/luYEtJlbFypi
 vKOCfpGVHKci/K8Ky/HWqk1QfO/i9N0ara2zzNK3MttWgoyAmgMLGICt8BkOijrMwOWx9pyucg+XP
 EHRtorWjSI+nvoJuwNrYYWoVUaSFx1bAFQuJubFapnHsqsG2o/st4nI6KClGGPixyGwc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o36N4-0005YB-O1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jun 2022 01:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB96E60EEA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jun 2022 01:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746E5C34114;
 Mon, 20 Jun 2022 01:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655689098;
 bh=Wvsg/h29Ldser22HC+DdQRkotWtxLzA2FR3BZ4r+Efs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VEG+d6Lbi7sGY3VkP9bBkcOZhWs5uydXwsYmDidB0MudBFcEqTHdBHxLB4hMt+DnC
 wDLMP6E0pHOWNyW0z61SUR3FpyioVAhO5y9wrwRaeqlhnfpcLaRjxCPKnS4PX+IVya
 odv3bcs06mZXBUkv/WKMnF8vtiHNPUyKPj5QWqc0G8VJtqSlmZyLCz56hnBXMwHlHx
 a9OMUtQ2r2L11ZZBDUki9WTIWHbfjrsGDdCExSFBoKxcuinAhq2NsdVD9xV+6svK0H
 llR1oeaQsylWNdii5Ol/0ZdPn4TlY3Rk54V02CZDhZZHx/xBfVGVn31FTvTKtB2EQr
 F3rC5A82ixgnA==
Message-ID: <4d1ee7de-15f7-7058-e40f-338155aa2f10@kernel.org>
Date: Mon, 20 Jun 2022 09:38:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20220615165610.1074259-1-jaegeuk@kernel.org>
 <20220615165610.1074259-2-jaegeuk@kernel.org> <Yq+dr6tzKkPuwck5@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Yq+dr6tzKkPuwck5@google.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/20 6:05, Jaegeuk Kim wrote: > This adds a write
 option having O_DIRECT | O_DSYNC. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o36N4-0005YB-O1
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs_io: add dsync option for write
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/20 6:05, Jaegeuk Kim wrote:
> This adds a write option having O_DIRECT | O_DSYNC.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
