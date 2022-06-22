Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A53E055534B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jun 2022 20:31:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o458e-00070O-20; Wed, 22 Jun 2022 18:31:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o458d-00070I-63
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 18:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+DDqttH4uFS5faWWoIWzWTJvGH1bxqk3YSBsilO3cA=; b=EqKmR7weVmXZz81lzhx2oZ7AMX
 2p55LGIencEQNI+tp7fr2vWIXJvJ31RP9+n3CsDMuRByzbuvVMhuLN/H4ruAf30tWOLNKVD3jDq+d
 5NpGG9+dmwgijYlAzs5F/x+0J1MSGhh6lEB4c4WPMspxo0qcuJRP2Do6lUvD573b+8a0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K+DDqttH4uFS5faWWoIWzWTJvGH1bxqk3YSBsilO3cA=; b=YEA2XKhODWFAM6FMr0vz/RVhNT
 OFvyRMyYQpcUTi38G/uDSiogeTnREzo9qD3RHvAQwJ3YtDwydN7YMdaeNVEFYSBbvtrsmDUKpVJx3
 LKzKKHBHjgb/xnDU7neBEfTS0jF7g5Il/wGYD32LyijZKDpBFFkeHi5tPcaRcHBofNag=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o458c-0007BS-Dc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 18:31:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1D0961CD5;
 Wed, 22 Jun 2022 18:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8979C3411D;
 Wed, 22 Jun 2022 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655922684;
 bh=pzH6hj8j/kFXqthSTB8eJImhhYfeX2wo3uou69fArlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rv6ljAbirYNV2k94rRc26evmnqJIAnJNJoycxA2L5Zlo6narzRjbeOpTv7A/X6xtm
 2uFz59QZjmIouAN8kTlT5RfGOJPj5fQc7W+ex6kezvH47KK0x1VCCUuxONAe1oX0TL
 n/VRBNrevI6g0knfHIHWLJG85wKFjpYNs03TEu/r8lNrH+GRb/BJt8UXiQe6OixWiv
 JHL4eFjKpgDlgyOTge3E6tgbkkS0pcaSQ4jpn9SO1XJCmrS4ibrZ0dBB7Ttm03iXwZ
 LpZqG5LGlsWQRAKro3Ci9c+Uk0KNeKSJ/vOGW1LqxQ/jaKRHHr0JLl6dsRAppxyZmy
 3xsg7mKkNAOdA==
Date: Wed, 22 Jun 2022 11:31:22 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YrNf+lVYFrlenL7L@google.com>
References: <5627a654-d605-6840-a133-e583c804aadd@kernel.org>
 <20220620115629.9169-1-qixiaoyu1@xiaomi.com>
 <20220620115629.9169-2-qixiaoyu1@xiaomi.com>
 <b4861302-a4bc-9022-c1b3-084f16d8ee87@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4861302-a4bc-9022-c1b3-084f16d8ee87@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, I combined two patches into one. On 06/22, Chao Yu
 wrote: > On 2022/6/20 19:56, qixiaoyu1 wrote: > > Signed-off-by: qixiaoyu1
 <qixiaoyu1@xiaomi.com> > > Reviewed-by: Chao Yu <chao@kernel.org> > > Thanks, 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o458c-0007BS-Dc
Subject: Re: [f2fs-dev] [PATCH v3 2/2] resize.f2fs: update man page for
 options -i, -s and -V
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, liuchao12@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, I combined two patches into one.

On 06/22, Chao Yu wrote:
> On 2022/6/20 19:56, qixiaoyu1 wrote:
> > Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
