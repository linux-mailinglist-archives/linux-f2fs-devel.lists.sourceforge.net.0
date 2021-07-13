Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B13C7A47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jul 2021 01:45:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3S5E-0003Op-Kv; Tue, 13 Jul 2021 23:45:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m3S5C-0003Oi-LV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 23:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uiBX0RjXZJebGpM5ntsU1l99GVTwVhL86Gn7u/V3aOU=; b=FfHjrdZ08zU++GDwFbS2amSjUj
 YP8IFY1UfoGPBQi0qM76uvZ9IgZh8+ckePsNsVJvKVrCkN7qI5OjETkePzwq0xpxc0ne/Yo3G9O4d
 Meeo7ifacH4RlOhZ+qIEM3aOy0xQyynn1YuO9/hWDREzFLaZZ48xCbt0fCKCJA56shx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uiBX0RjXZJebGpM5ntsU1l99GVTwVhL86Gn7u/V3aOU=; b=HnYvqAzVE8rqWbuJBBUKTA4qab
 1TKUZWIEba7jSVXDKN6M+xXRV08gXVwx+U3Sd8HV4kVCoQ/WSs7rrAIptumBJZ8byKOEggcRir/Di
 MuvbdKvae0iECamYgk7qixieE/Iv3epce+V62XQlHUYd1YMER+VAxcXQQMrjl2R3iMfc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3S54-0002lr-St
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 23:44:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ACA2611AC;
 Tue, 13 Jul 2021 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626219880;
 bh=AMYbCZgVGjVDjgAwIbxo4i9kw7wOkMMjWAO/lrYzU/U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7P6v73QKIiI9gNzQ9wRtx+0lHVsvXSZCbPq0AHjjDpXJRkwtl42MayWmXiCSqCYT
 qoabGd8IjMoj4jSHJb3ltJY+Dk4WY11/kuSkxUmRcUq2LWfdDR7pakRTXA+IJ4EcSa
 u7DIqilLoDxJrkAtHYf9ImE2uwrLOWBuU3L6ad6EMVb8ErXBM2ka413Tdkn+nwoCjZ
 ihlLssKgXWkVILeCWZ3TXV/YO/QZTq4N5Y/OaoBY+eBaap7LuMi5lrkeQh4xpmkQ03
 c0hTxYSbEXrFHJZBiTz7wqfzMW/TKsUS7SGT2IijluNryEFq+SzOERsJCT+0TnOukz
 vjufEoVJgNfhA==
Date: Tue, 13 Jul 2021 16:44:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YO4lZxIH772ms1wB@google.com>
References: <20210622115059.24860-1-changfengnan@vivo.com>
 <7e7d1dec-d245-8451-7a08-20c0c937c21b@vivo.com>
 <73528afe-8331-85af-48c1-f9d733ed8e39@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73528afe-8331-85af-48c1-f9d733ed8e39@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3S54-0002lr-St
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/13, Chao Yu wrote:
> On 2021/7/13 10:35, Fengnan Chang wrote:
> > Hi Jaegeuk:
> > 	Any comments about this version?
> > 
> > On 2021/6/22 19:50, Fengnan Chang wrote:
> > > when we overwrite the whole page in cluster, we don't need read original
> > > data before write, because after write_end(), writepages() can help to
> > > load left data in that cluster.
> 
> Jaegeuk,
> 
> Let's queue this in dev-test for testing?

A bit worry about unknown corner cases tho, Chao, could you please test
as well?

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
