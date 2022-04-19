Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4050766C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 19:22:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngrY8-0002Bl-PY; Tue, 19 Apr 2022 17:21:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@kernel.org>) id 1ngrY7-0002Bd-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqBMOWt6LzBdnrk3qAgnmcn/aJvMEV5v3ADU476VJYM=; b=hIsucavRrXpmPcKi9BVxClxLR6
 t+IEKkTvIo+DGpHnLB9KhtYMyNDxBzM0IY5BjyVLj14vcBPaNOjsho9gWQM/eFdsdBGCcxEyYx57T
 sqLvXqDiQFU4Q2z6CeodyoOU8V2cY9f6i8WpLsH2YV2dERjtYmfsV9D8zw/wgk1WbqsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lqBMOWt6LzBdnrk3qAgnmcn/aJvMEV5v3ADU476VJYM=; b=C
 F2UoAF8E+r3ATXNgJPxUAmNOrdYoG6DHiaRQHtAW3gaJVvAapTCLlFXChROFx976Q2ncNZ9A1PCoB
 Zax4cnrh9QGrX+cBWP8m0ibHxz61eWTDnppEa+aicfC8Kc88uF+d2kofeHLZ36lfvuQrmrSeRopis
 gEy44cTnTiVpSdFo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngrY1-0002x1-II
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 17:21:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75107B8191F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 17:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFC3C385A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650388901;
 bh=6XV4zrJbvkbGPNRgocZM4NnSrbDR9r1Wf2WFlMnh8aw=;
 h=From:Date:Subject:To:Cc:From;
 b=LQ9xzMbijBeF8qbm7ipYZsC85HaaR/UvAk7nGYvMafZkAO7aqGgZvjS9SMjeUl0F4
 9xtIByUMYslx/NV8Jb2rZCvSKlF+jAdmhkBEfYjzDPysklDvSOTyg1SInxlv6H+CvF
 jvEnw9XHzV8YMKcK8A6QNFIxZTvFThO0zaqTmDIG9lweYefNJQhAbbHZenMP5P0b0W
 2yIl0v+L1i4c9SvZU1lHi7fI25B4p+D/fhcEcD217wL2ja2y3c6lx0jfyDcRn5jVEv
 Oj67EZBjk8QFkAVNX88n4uv/kBnYSYRXF3UNPC6a5I78Vgvn0BDuR8enhHiK/Fkje9
 MWPetI/KNO+vQ==
Received: by mail-oi1-f173.google.com with SMTP id a10so1394785oif.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Apr 2022 10:21:41 -0700 (PDT)
X-Gm-Message-State: AOAM530bRvf0R45tCz8YlXTL8CIH8Y3E/aftIOw3iEkWuQLQDTyoenAz
 OqAU3fpPAeAd5Sz6cctdJNmj5F6OMVKX3usONvc=
X-Google-Smtp-Source: ABdhPJwWy0FMsUWbigeKnQDKmaXJI6s+THmg+RQGQqP4E4wZm0Tk0QNvFpno7AZibTfIpI675a8Ef+YG1VGjV9+htns=
X-Received: by 2002:a05:6808:1189:b0:322:3293:4b30 with SMTP id
 j9-20020a056808118900b0032232934b30mr7579173oil.277.1650388900409; Tue, 19
 Apr 2022 10:21:40 -0700 (PDT)
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Tue, 19 Apr 2022 10:21:28 -0700
X-Gmail-Original-Message-ID: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
Message-ID: <CAB=NE6U7AnJf3_eHG_ZmVA66YfjH4rT+7dYiHgEurArpQS489g@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I'm going to add automation support for f2fs within kdevops
 [0]. This should enable folks to test for regressions for f2fs from scratch
 with just a few commands. Before I go ahead and add that I was c [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngrY1-0002x1-II
Subject: [f2fs-dev] Baseline for f2fs
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

I'm going to add automation support for f2fs within kdevops [0]. This
should enable folks to test for regressions for f2fs from scratch with
just a few commands. Before I go ahead and add that I was curious if
folks have a known baseline of known failures from fstests for f2fs so
I can expunge the known issues for now. Is there a tracker where these
are kept as well?

Thanks!

  Luis

[0] https://github.com/mcgrof/kdevops


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
