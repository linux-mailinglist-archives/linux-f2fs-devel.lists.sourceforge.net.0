Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B9486AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jan 2022 20:48:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5Ykn-000885-D5; Thu, 06 Jan 2022 19:48:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n5Ykl-00087y-8R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 19:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3eqLjFvaCVrpgEXeFmi+fDVo6JqiOvTnJif2GiowScw=; b=KP5j77bSnYfqUZvnBFEgmAmlbO
 qfZW9qt/9TkLKVuZT0OQmjn0aV3Z8BOj6W/ni8Qtq2YjtXAWf77zT4ZtPiJ4sglK7T1f34PVGtwVt
 dec6EHSvh17iXho2k+JffTQyg9arxhb7W0bWVzYwrORpXU0xmdEvjnaAdRKe73MnnPIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3eqLjFvaCVrpgEXeFmi+fDVo6JqiOvTnJif2GiowScw=; b=dt1qvYghv1hTu9Px36Ciz0fsKR
 o6bg39ZM2lyZJJf6jJBi2oey7YexZwcuT5rPpuNkZZtqG7YEmzPQzNaA5IVf1sjKP/6NGi2Te1jfs
 jgl1UKMPVKSfoKEzvTCGysm2mfKco7Mcus3uwJ7AjajT2ukWTvhQGOqlHVAGdECCACYQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5Yki-0000VO-T4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 19:48:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E027B82391;
 Thu,  6 Jan 2022 19:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8581C36AEB;
 Thu,  6 Jan 2022 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641498519;
 bh=OWgKesJESDeCLBepbjotAwWUnmxc9g+0RbpAtSapazE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3QlTIe8LySsfA58Vr5JhPkP0Qe8EuMRP5mBRHcjxCZrIj8bYeDCDgjvNakkK6d52
 xbd3KHv+rMHQJJdictw6CWCi6i5p39H/tXV8IFMBkLGCc2TQmwicSYsXUZZpivi8+m
 z4FSHiteSQS+35Q9D05fweZ8hYKs/C0DzR6W3yCS0Uair/hZ6JRD8HEYKObBBD9FJf
 nZlE26X11DPJvaMbJqI0MWXpfbWf9gA9Zgyu5B3OpE2RtdVAMX1QfLbSRQ1RuzkCJu
 CpfO1Li4ULynfGyu7BFUcsORSiSWvtrLrhMASl6Ajp2gmLYe56r1CsWXUu27yXRmo/
 QRWY+HZuP4pCw==
Date: Thu, 6 Jan 2022 11:48:38 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YddHlrYFwudXfh8e@google.com>
References: <a6ee8d0b-1d67-0bcb-ba8c-06b0d691bb17@kernel.org>
 <20211230002942.298407-1-antoine@lesviallon.fr>
 <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
 <085f5193dc533d787545456dfadcbe55@lesviallon.fr>
 <c22ac22e-f545-1c2b-0479-34d32b3c960a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c22ac22e-f545-1c2b-0479-34d32b3c960a@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Antonie, I actually took a look at the patch yesterday
 and tested a bit to avoid too many messages. Could you please check this out?
 https://github.com/jaegeuk/f2fs-tools/commit/45b3c75ac3c07d444180a3598f0d48c80abe9934
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n5Yki-0000VO-T4
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
Cc: Antoine Viallon via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Antonie,

I actually took a look at the patch yesterday and tested a bit to avoid too many
messages. Could you please check this out?

https://github.com/jaegeuk/f2fs-tools/commit/45b3c75ac3c07d444180a3598f0d48c80abe9934

On 01/06, Chao Yu wrote:
> On 2022/1/6 23:33, Antoine Viallon wrote:
> > Thank you for your reply.
> > 
> > > How about showing this message in debug mode? may be under level one?
> > 
> > > Thanks,
> > 
> > 
> > The debug output is extremely verbose, even at level one (I measured hundreds of messages per SECOND on a SATA SSD).
> > If we print the progress in this output, it would be completely drawn in the other messages, therefore making it useless.
> 
> Yup, :-p
> 
> > 
> > Thus, we should either decrease the debug 1 verbosity (hard), or add a new, independent flag (or way) to control it.
> 
> Maybe -v?
> 
> Thanks,
> 
> > 
> > What do you think?
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
