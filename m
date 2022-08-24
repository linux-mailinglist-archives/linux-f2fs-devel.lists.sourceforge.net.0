Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD15A02D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Aug 2022 22:34:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQx5P-0004up-B4;
	Wed, 24 Aug 2022 20:34:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oQx5N-0004uj-IZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 20:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=apjkUCrNsmVb+GX4eNE8IX+hs6OzUpdKyR/tIO41PEo=; b=Dkp8UpdiUD4MVbj6KHT3buG/ES
 gROnTs2hTLL/5sHrKqptc0FuHQ1Fdu4piSj1HQUuw972NgBh317eC+D13qXgYIkU1wNmHHnxEoZtr
 lYgNoosxNGbqqClZlByRkyO7NhixT/VnjCKDR6bLgG0ToaCheAu84OlTNLwnNl0qQ/j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=apjkUCrNsmVb+GX4eNE8IX+hs6OzUpdKyR/tIO41PEo=; b=nJ43+bC7QQPCX3p4f0lh+Iu9Jd
 AY+wx3eefOY+7diilJUKq9h43Qa6eT1Sy5/F7HkRhcmBfu6MEGPB4RrzbVOG64hq1+kpPGod1TzH0
 ZEhMNkT/3DGQvVxtdc2Y8UqvhVA9CJevHIpVpyvqQ3FjYjj+EqsQTOBL5MMdzcQ2EmpM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQx5L-0008JK-LB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Aug 2022 20:34:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61A66B82691;
 Wed, 24 Aug 2022 20:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1EEC433C1;
 Wed, 24 Aug 2022 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661373280;
 bh=A7+ByZNMa6DnyJRTcZMTr3aA+ctoZnK6Vxa7t1dNiP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MkeJ2LGKIQd+ll2nJ4kLoUQ816luFEdAeOQssy7xKPUtpjoiik7LnY2bRWQikorg6
 29saPLrvORJSagg6NJ7HgP1WQRqgPyqIBNxR1nROAMySYybtfcBO7jV8khzPkv/gm8
 bw9h4w6WzdGCPFAmd/CaGtziCf2Q3sAwX7pIK6+4oo0l8Gh9S5nAncxB+XL0yz+LWp
 0pMqQ00H+D+udr5+9yBEJ4z0bKfBcukfrKUKRDGYJiRaii5QpyghzIxHV5UwfSKN5p
 rqY3WkKOQBLKhGnlnhhJjz4uvrciogEgEfgdVJ6+acELqKufiWATYOgMWf5orkG+uc
 WzhYBtTXlkI5w==
Date: Wed, 24 Aug 2022 13:34:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YwaLXhN7+4q07VtJ@google.com>
References: <20220623181208.3596448-1-bvanassche@acm.org>
 <18f89be5-5283-9801-7d8b-5a08aa0d8928@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18f89be5-5283-9801-7d8b-5a08aa0d8928@acm.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/24, Bart Van Assche wrote: > On 6/23/22 11:12, Bart
 Van Assche wrote: > > This patch series fixes one issue reported by Peter
 Collingbourne and a few > > issues I discovered by reading the zoned [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQx5L-0008JK-LB
Subject: Re: [f2fs-dev] [PATCH v2 0/5] PAGE_SIZE and zoned storage related
 improvements
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/24, Bart Van Assche wrote:
> On 6/23/22 11:12, Bart Van Assche wrote:
> > This patch series fixes one issue reported by Peter Collingbourne and a few
> > issues I discovered by reading the zoned block device source code. Please
> > consider these patches for inclusion in the official f2fs-tools repository.
> 
> Hi Jaegeuk,
> 
> Please let me know if you want me to resend this patch series.

Could you please check this branch?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/log/?h=dev

> 
> Thanks,
> 
> Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
