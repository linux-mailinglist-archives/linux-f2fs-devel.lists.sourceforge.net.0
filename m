Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FE43D6D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 00:42:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfrck-0001pr-EZ; Wed, 27 Oct 2021 22:42:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mfrcj-0001lh-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 22:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWF/YNor2JSMnupn32Wk/02g21ycx7A3oYTrbqnUVdY=; b=ffGdmKXv3aYQZpaqudqEoQbrRk
 WHqECRLmpiLVDSAIV7OIAPvfQNqBLmW433Fg15i9JOKvFqu14dsUxBRZtpE9sHydecNQXmVpWlHzs
 KcuLr3PijO2ccdLWAWBv2YeFWZhxY20cXSWCod1eJOxpUntfh25cNUkF9obQ/rEU3mYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iWF/YNor2JSMnupn32Wk/02g21ycx7A3oYTrbqnUVdY=; b=TczlTXTlU/KEaFIpkYjMJiQNwW
 FeTiA37G5ENkkj0MJwOjQjC2k85xcA1UH/WCjtH1qDWVxi6gHPKTjbATXNH+wanE4G5H+tSgnvu/s
 v2LrXxn+5wPXBjlmXfghtZJm0cQ4mVNJxsvHBygLToMANImNmnuqlN5GuIK0oo/NrE/k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfrcc-002GoI-KN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 22:42:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4A7060EBD;
 Wed, 27 Oct 2021 22:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635374061;
 bh=4SqiEoUxJz4vtG++4/zpHHHXF6cTsG3IDqC+tBAV7BE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d1nbimgnUwu6ytcWSdSaArsq65+JkZFDoLif7EkFAQ8WHU3MX54WUEux3Av50svpQ
 wf4w1OqedzwetZ8vWSbmM1EduhPPR0TATul/CtZEV660GawZFZ46RkApwjRxwDrG96
 ihV7BTLZt6eEaHegdcKQbZsuajei28HAsHsdWD4/cWz8ZrX63wlw06lknPPRqsgXNn
 H23kwiDxVpRGt+sFIFXbxVLC8VIrEykXvp9ocBS/vH3OQMikto3PBcVBWe91gImCWi
 ChgBlLlCx1zo9my4ngeFNFoEjVBO8dVeS1lwwbDmPuU66fW/Xz8lCw7rOlpQoRhhe3
 GxciBF6wlzCNQ==
Date: Wed, 27 Oct 2021 15:34:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YXnT7BcopqAG8Fe6@google.com>
References: <20210922152705.720071-1-chao@kernel.org>
 <20210924095021.GA16651@duo.ucw.cz>
 <4897a06a-9f9e-27ce-91d3-58721bee42ac@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4897a06a-9f9e-27ce-91d3-58721bee42ac@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Could you post the patch again? I don't see this in my box.
 On 10/27, Chao Yu wrote: > Jaegeuk, > > Missed to apply this patch? > > Thanks,
 > > On 2021/9/24 17:50, Pavel Machek wrote: > > Hi! > > > > > This code looks
 quite confused: part of function returns 1 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfrcc-002GoI-KN
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix incorrect return value in
 f2fs_sanity_check_ckpt()
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
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Could you post the patch again? I don't see this in my box.

On 10/27, Chao Yu wrote:
> Jaegeuk,
> 
> Missed to apply this patch?
> 
> Thanks,
> 
> On 2021/9/24 17:50, Pavel Machek wrote:
> > Hi!
> > 
> > > This code looks quite confused: part of function returns 1 on
> > > corruption, part returns -errno. The problem is not stable-specific.
> > > 
> > > [1] https://lkml.org/lkml/2021/9/19/207
> > > 
> > > Let's fix to make 'insane cp_payload case' to return 1 rater than
> > > EFSCORRUPTED, so that return value can be kept consistent for all
> > > error cases, it can avoid confusion of code logic.
> > > 
> > > Fixes: 65ddf6564843 ("f2fs: fix to do sanity check for sb/cp fields correctly")
> > > Reported-by: Pavel Machek <pavel@denx.de>
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > 
> > Reviewed-by: Pavel Machek <pavel@denx.de>
> > 
> > (This is good minimal fix, but eventually I believe the function
> > should switch to 0/-errno... for consistency with rest of kernel).
> > 
> > Thank you,
> > 								Pavel
> > 								
> > > +++ b/fs/f2fs/super.c
> > > @@ -3487,7 +3487,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
> > >   		NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >= blocks_per_seg)) {
> > >   		f2fs_warn(sbi, "Insane cp_payload: %u, nat_bits_blocks: %u)",
> > >   			  cp_payload, nat_bits_blocks);
> > > -		return -EFSCORRUPTED;
> > > +		return 1;
> > >   	}
> > >   	if (unlikely(f2fs_cp_error(sbi))) {
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
