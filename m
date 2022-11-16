Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C062B088
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Nov 2022 02:27:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ov7Cs-0003J4-MJ;
	Wed, 16 Nov 2022 01:27:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ov7Cr-0003Iy-AI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 01:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQL7VIbyV9BTueh4+YUPczl2wI+33Lzjwk1YU3i3YZk=; b=HOhuG7zMhhh67S9tQiGwgALUDX
 fALJeqGJNWz06eMgR27UFHK+pBMdZyRdCq3qqiVui15rv5pz49R9yrbcNHEjaf5L636wL9hBp4WuE
 aLCdE/e0q5jN7gfd1zGEkqXkn28UqWjJGgeKPdWc7raRdefF8Kyjj8I+r8irY2uu5fKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQL7VIbyV9BTueh4+YUPczl2wI+33Lzjwk1YU3i3YZk=; b=QezgfGcYpYc4BKSb+QwrJvKk0t
 XFRCrYEr4CylZtFqcF7us2JE44+NyMm+mmCdXnVcGmcfn3PVkiCHohQqx9F6DdjMDsaGR0CsIeZLN
 lZBUwmAS0N0qIoJVhGxzwtcDbt8RlUnnJYHcUkoxo+itWXxVUl6WdhCmndT8R11Ed4eo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ov7Co-0004oe-4F for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 01:27:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA71EB81B7B;
 Wed, 16 Nov 2022 01:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68951C433C1;
 Wed, 16 Nov 2022 01:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668562022;
 bh=Y3uxS6iMsv3XE43b4DvFFElMclDXzniG3rvb2AlsUYU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dnnbEARC5arfUp13mQbauvQRDw+dQy8zu7W74a0kMJ+VTiVAY0B1X12SNpjwwp1S6
 Kn6kgVLEGavkkA7L6nru/FmfGfe841E4xCUw6AxcffcikNGb3jgIcg9M5NUJ0DOgp9
 9RnhlTHdbMeqsexJRxlyHDbTjxO8ybNhjPG2gF4Zjh+s8hj6sX0aLxBcu3EGRRZfve
 svRVhqh/KpnDsccVowTe1uZay+YoHZCLxmsYgaEc+3ws2of8GDbGSNUtc5Gm8XuYQ2
 RmZh8Hk/xiTSsSL2ahdZ/jBWp7KHZINfmqqJfzkBIAACMiHqJWrNhkjIoU/YPkKwrF
 EHXuT+GDCHr+w==
Message-ID: <9736c882-b2b2-3479-270b-bb8f49a75b61@kernel.org>
Date: Wed, 16 Nov 2022 09:26:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
 <20221115063537.59023-3-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221115063537.59023-3-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/15 14:35, Yuwei Guan wrote: > A cleanup patch for
 'f2fs_tuning_parameters' function. > > Signed-off-by: Yuwei Guan
 <Yuwei.Guan@zeekrlife.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ov7Co-0004oe-4F
Subject: Re: [f2fs-dev] [PATCH v2 2/3] f2fs: cleanup for
 'f2fs_tuning_parameters' function
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/15 14:35, Yuwei Guan wrote:
> A cleanup patch for 'f2fs_tuning_parameters' function.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
