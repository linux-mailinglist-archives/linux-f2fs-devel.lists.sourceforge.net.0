Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123E63A54D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:44:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozagz-0000iX-LC;
	Mon, 28 Nov 2022 09:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozagH-0000g9-Kt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7JMM33bX5xKOhYZSwjiC4I6zG06a4RDzO2CVYFFLlU=; b=ZMD+P3HMMTP0PZOX7Q3KvEr6+e
 wNs8Y5Rc6bozyiIlNGT0vqpw4W45LkvUTHknRRL42NFcimltPywrwhV9hzdJuftM3uwR4RcJEz9KJ
 Ma7bHlCa5WnZ1wU0eyE+6rGDvQ2iFaxsuQvvcYvRJcltr5L0UjYmNNhRTgCN1kaTW6vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H7JMM33bX5xKOhYZSwjiC4I6zG06a4RDzO2CVYFFLlU=; b=e
 mbtTnEA3MA8FKarr0yIrN62TzM7PpWvT6MFpsNi7PAT3OiRUivBz+y7F1JA2F2Bm8+3V56Stms8Fx
 7i4cd3U2JNeXXpwBrf77DB7e6ft4dkRfd08qAD//In1QStp/qLQPsS/P4tO9ULusKO6RZtsFcFC3T
 MGoR/FAxOzeliUOY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozag6-0007oU-Q1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=H7JMM33bX5xKOhYZSwjiC4I6zG06a4RDzO2CVYFFLlU=; b=UI3TZ6JkgD2+/I0E0wWmpct7mR
 tM1ujsPjkDnp3ousU9+Uz/m72F2AzW0dTWEPVdRamIb1TSVpHBL7qegcIkoz2SL65tPed1nim6aVk
 FmJwircwGQuYo3GToZ0vEgQPfNGCEg3YAR4rGW7/iW6tjDs1iL8wy418qrWHDoi/dCXirCAUJGbSY
 MmaoZDOEZuR+UX2B6bfh9xc+cTHNJ+Kw47BbPoKX44SHiefaIZppsbFVehLj7QY/O93apCxIB0wf7
 4p+Jx/j4nw/S5iEapvk/WYE0sIksrfUgBlDZKZzIySkbz8LtpYRkE3tfB6LwZP7sv1w9dY+Hbms6+
 Hu2XHfpw==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozag0-000mAa-TE; Mon, 28 Nov 2022 09:43:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:43:43 +0100
Message-Id: <20221128094346.1256688-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk and Chao,
 this series cleans up the segment allocation
 code a bit. Diffstat segment.c | 71 ++++++++++++++++++++++++++ segment.h
 | 6 ----- 2 files changed, 30 insertions(+), 47 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozag6-0007oU-Q1
Subject: [f2fs-dev] segment allocation cleanups
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

Hi Jaegeuk and Chao,

this series cleans up the segment allocation code a bit.

Diffstat
 segment.c |   71 ++++++++++++++++++++++++++------------------------------------
 segment.h |    6 -----
 2 files changed, 30 insertions(+), 47 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
