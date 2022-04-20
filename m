Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8107508F2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 20:12:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhEos-0008DR-VN; Wed, 20 Apr 2022 18:12:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nhEos-0008DH-8M
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 18:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y6gykvn/bJzggThBIJLejSliPC+W+Y8XCYIEvIRxKBc=; b=LkgYs+h9O/MhkRj+BfhFfc5xtw
 UJd8RRDILZXS0SXUwBJbkoa/e7litA4Jc3KNTCNBZvGxzbwp2NNWJ+HfRaOTgKNkvkFLDU5IeumYi
 wCUA/QtTNdfEIvaN5rjdWQ7ruiQReAG8eeXwq0/5v9a6DtyySpmntwh7ejX8ksBBAyv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y6gykvn/bJzggThBIJLejSliPC+W+Y8XCYIEvIRxKBc=; b=SEGGhskeD1bZGpTTQjBXeyW03k
 y3mxEWMywdrc+n1cNRnZBY1PcUcC5v/xD27530zFqtSdnxDcfYo4zoQN0iR+kblFqtVixsNh86r+f
 Gvc9w/mQAf7dSlf3wxNvKmUXxA2wx1vW2G2c3wRxu2CxsDfDMMxAJSq3B/K/raOxW8c8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nhEom-0006PF-3u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 18:12:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31174B8214A;
 Wed, 20 Apr 2022 18:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F04C385A1;
 Wed, 20 Apr 2022 18:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650478354;
 bh=rr65hluLQkUR/MNtYmrnC2DqzH4WEvlZJbNBwpD+FjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=er/l1gE61vsF7zpdMiPU6voyczuttZp3lSJUMNu1OjVj5+UDtlEs3aOqICir3b7m/
 mnF+oVFYG/+vjyzBb//uIQ3VqYyonTjV4Skcv2Mf4OgH5f6oFFAiQHGZqaWtSD9TgB
 ON2H8vU3IXD5AVQeT9xytl4rdsRsY3okwz1NYIamM6XGxwuGtLLwo/EuRaVEepkxEm
 U8wkfJ9FGt4s63WVj2sRl1vs1OP/RxAElljAH1b5ybGQm34DJ9qIpRNl/3JOPBMR9s
 p1jaoNVXx/Aj54G/8te2brnNn1UlxbSxjnQsN3XBWzixfnbrKZMihR0uVobRO4VmpC
 G01bIxcwRt4/g==
Date: Wed, 20 Apr 2022 11:12:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <YmBNEdDRJiGcruiT@google.com>
References: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
 <Yl86tKxvBN6lHoma@google.com>
 <CAB=NE6W3r_O5L30pPLJ9s12ahfBGvudFAKyLbO_1=JCf2bDTkg@mail.gmail.com>
 <Yl8/2cPCkSZ17hxN@google.com>
 <CAB=NE6U+KbnFPd+EYEhXxF7o4DSB58k-uGevC6y1h2SSE2sbtA@mail.gmail.com>
 <CAB=NE6X8e48pvKd+4Ms3c89gcUzh58Nd-n_xxyD5HRkEGbks3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB=NE6X8e48pvKd+4Ms3c89gcUzh58Nd-n_xxyD5HRkEGbks3A@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/19, Luis Chamberlain wrote: > On Tue, Apr 19, 2022 at
 4:26 PM Luis Chamberlain <mcgrof@kernel.org> wrote: > > Oh... so this is
 not upstream... I see.. ok hrm.. > > Any plans to try to upstream y [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nhEom-0006PF-3u
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
> On Tue, Apr 19, 2022 at 4:26 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > Oh... so this is not upstream...  I see.. ok hrm..
> 
> Any plans to try to upstream your delta?

Not for now. :)

> 
>   Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
