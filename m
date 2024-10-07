Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 178AE993390
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Oct 2024 18:38:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sxqkl-0001Aw-Qi;
	Mon, 07 Oct 2024 16:38:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sxqkk-0001Aj-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Oct 2024 16:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dly1imls5Xl6kRx5ShLQJjuFM/44rS/DiTVBkG/or/w=; b=Q4x4RQfjzBOtLg0DSKzeKxR5Vq
 lPN5pEa5nESI5KqvM+kJ9InvhaQ82DYo8X1hcZxCBQa5zeAHyFcO+r2qEwSF147hFu7jMj2CiXMFg
 +oERfQGgVJvZLVx6E50/cpFjkQdBBuxTOY1HnWM7MGmT3gKzuU2e9/16ES1GdOh2kaAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dly1imls5Xl6kRx5ShLQJjuFM/44rS/DiTVBkG/or/w=; b=b6CAwGWj6zJFXZ7Fe5ioPuscFk
 wo+Rmz9nFVCNRoQByw2npJBjCDm2uBPPyLpumv3BmO7nbuzYfwzA9iPab618IyMX/DRGt9QwYA9HQ
 hiyt/Km8Lj0r/b/tqSqH8V3ddJtVac/Sbf/JCBQp+5ziV4qkdXZjZ/B1rZxZS5BV2CQw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sxqkj-0007sI-5z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Oct 2024 16:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FA185C5B11;
 Mon,  7 Oct 2024 16:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B5FC4CEC7;
 Mon,  7 Oct 2024 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728319102;
 bh=UvgzAgL0iDGjIoiwQ8sIG8TLW16AS5GRPQ6AtLOmQY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTmvLHOA8nD6DS7azjwd5MnPYJItCz6w3IGuwj6cYx5g8IbumubzuUcZTDLcrsgML
 3SL6QrQJzZ3vPJUMbWtfqJMfEXz+XxXFP+EqU0vn18iDiC64spAbRV5cg1fRR8PmwV
 9ojEy1KLTVK3aqG+FDl0JEZq55EbKhZYkq3Gw/AfyaHmFf5ZixrUskU3IhzamA9bU1
 ADObiCr9fM+m5zwaxAGkN5ntpTM/C1jdMh9OaWpqzLud4cHc1dQOjkNbJ4Nr7jH66M
 syilMp8YX3rIGCEP71mloBPpJawPsFy2tNtoq4pQUtfhFojV6NXJMB+QFbDKbS6rSZ
 2O+6xkCKcxqZw==
Date: Mon, 7 Oct 2024 16:38:20 +0000
To: Ryan Roberts <ryan.roberts@arm.com>
Message-ID: <ZwQOfGaybpdC6_HW@google.com>
References: <671e8774-acaf-4c59-b06a-bf1511de022a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <671e8774-acaf-4c59-b06a-bf1511de022a@arm.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Ryan, On 10/02, Ryan Roberts wrote: > Hi Jaegeuk Kim, Chao
 Yu, > > I heard (via Matthew Wilcox) that you may be in the process of forming
 plans to > add large folio support to f2fs? If so, I wonder if you c [...]
 Content analysis details:   (-5.4 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sxqkj-0007sI-5z
Subject: Re: [f2fs-dev] Plans for F2FS Supporting Large Folios
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Ian Rickards <ian.rickards@arm.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ryan,

On 10/02, Ryan Roberts wrote:
> Hi Jaegeuk Kim, Chao Yu,
> 
> I heard (via Matthew Wilcox) that you may be in the process of forming plans to
> add large folio support to f2fs? If so, I wonder if you could let me know how
> those plans are progressing? I saw your v6.12-rc1 pull request did a lot of
> conversion from struct page to struct folio (of the small variety for now) but
> wondered if this is intended as pre-work for enabling large folios?
> 
> I've been doing a lot of work on the anonymous memory side to support large
> folios ("mTHP") and hook that up to arm64's contpte pgtable support. This
> improves performance nicely.
> 
> Additionally I have experimented (on XFS) with ensuring that text mappings are
> contpte mapped where possible and this reduces pressure in the iTLB to improve
> performance further. But it all relies on the file system supporting large
> folios. I'd very much like to realize these performance gains on Android, but
> that requires the file systems that Android uses to support large folios.
> 
> It would be great to understand your plans, if any, and figure out if/where Arm
> may be able to help accelerate activities in this area. I'm not (yet!) an fs
> expert, but I see that f2fs is already using iomap, so perhaps now that you are
> supporting small folios, switching up to large folios is not too big of a step?

Thanks for sharing the background. By any chance, have you talked larg folio
with Android kernel team? If indeed there's a fair benefit from Android side,
I'd like to circle back supporting it in f2fs seriously.

> 
> Thanks,
> Ryan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
