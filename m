Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0F507CAC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 00:42:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngwXz-0001j7-9U; Tue, 19 Apr 2022 22:42:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ngwXx-0001ix-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 22:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CFrI4TDJOKZpeJNISsqB6ALPZ9MHIjeoAOoPTG/7V4g=; b=Ztax+wouub3z9mmV8URPp9Hbnm
 rsQ00d8Cxk5jYykP1Lxiczo6W4nEzyHPrYNaD3WD8xjMDj3rWLKkGvRbYkxM4IPrwNyxk2P/2ks/Z
 ZyrscPBUkCpDUxfdtPeaQGxyoBF74l+FGq+rtE0ERUO3ne5gVaGsbFEhGBYcPZfpZXD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CFrI4TDJOKZpeJNISsqB6ALPZ9MHIjeoAOoPTG/7V4g=; b=QNulSQ6OD4+OamreVfcA7eOyQc
 uRDpjatmd/OnP5bFUlnj6AKA3iqcLO3CRc7BxNQH6aaJoGOscActq4k0U01yHX7rj3UKEeFsCt36h
 sDCO4vjCrYhSDaoRuwAKTJS+wSzc1WKxj95Kmbf5W5+TtMjO9KN+fpJRAfGAKNHAV1Sw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngwXs-004Ehq-7M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 22:42:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8574C617E1;
 Tue, 19 Apr 2022 22:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4072C385A5;
 Tue, 19 Apr 2022 22:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650408118;
 bh=2T3VacmzBWuaTXxaIk5oIDThRONmBw0yUVWxZ6VzWUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fctcDo2wH6Qjx4tKqhZSYj4ybZEzLN+FKY2E5c6rtJKQWMUovopeqcyWLIFtexme4
 cgkzZvKnLf9BS882g6W1pY6xwtxDfnhTqytIsgpnxelta2kE2q/IISZicoGc0uKHYU
 +4ArhDz4l27zDq/qOK4YapCTjMf82d0jA7j0f0wS2aBSXRXrbYWoaGecgeHfbjlW4f
 oIPHjw54WiHKIF+6541s2yVV9MfsM3n7mNk7lPI6SssiWaJOM0tyzrIjKZ+MW7tRIn
 lv2LhGokst11Uk/TxZLbb6qszI6G2iiTMKnlJGsFDkyvMwZhks8n+0tUBDYcIN6iQP
 rBaViM5ifz83A==
Date: Tue, 19 Apr 2022 15:41:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <Yl86tKxvBN6lHoma@google.com>
References: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/19,
 Luis Chamberlain wrote: > I'm going to add automation
 support for f2fs within kdevops [0]. This > should enable folks to test for
 regressions for f2fs from scratch with > just a few commands [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngwXs-004Ehq-7M
Subject: Re: [f2fs-dev] Baseline for f2fs
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
Cc: Pankaj Raghav <pankydev8@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/19, Luis Chamberlain wrote:
> I'm going to add automation support for f2fs within kdevops [0]. This
> should enable folks to test for regressions for f2fs from scratch with
> just a few commands. Before I go ahead and add that I was curious if
> folks have a known baseline of known failures from fstests for f2fs so
> I can expunge the known issues for now. Is there a tracker where these
> are kept as well?

Well, I'm not sure what fstests will run. Is that based on xfstests?

> 
> Thanks!
> 
>   Luis
> 
> [0] https://github.com/mcgrof/kdevops


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
