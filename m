Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F0E82F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 09:08:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tXL9KTMhg+BubQSiRiTQwR/yHNr5o0Qm12XZzR/X1E4=; b=GeINS+cBlx6yFOUcuWrzxpAkrk
	2nPlfiLaYQM1InvDf4SoUx/N0nMxWebVnNkWl2LPWqpYjyywWCYhUa8/SXAuoGTEntIsaUo1+HZbU
	Cmg3xXl6K14OTha7hlGx3uCaAZdoZNxMHIxOU5eOeTIQM2RAawl4uLlbgZAO9Uw3F8jw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPMYc-0000bl-6F; Tue, 29 Oct 2019 08:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3e-63XQgKACwZWJQVPacOWWOTM.KWU@flex--robinhsu.bounces.google.com>)
 id 1iPMYa-0000a9-OV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=coTE+MJajFctVQLNyVBBx0dRF4V5QAJNpm9Z15UXxk4=; b=gigWFdMGsks9sH3ydpOqSKwA6Z
 o/MTU18eJiloon5zB/Vnmsr9fxpc9VeO4qqSb5mhQ5izymbik3HsKr8aiETNkULpLdUqsNaWhjjW9
 6yhb9S001FYs8AHMY+viXjGzz6ivfsDt5QCNXmGqXUWkZY6nR9K3kxRHIXwaQMnAjfWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=coTE+MJajFctVQLNyVBBx0dRF4V5QAJNpm9Z15UXxk4=; b=X
 xgTLi4fstI7hOuWj+1NU5Qi6bPfW8IxJ8ajBEoRiLRqBk3svuiIkbphDeVV9XeFoWOQjjWiY+JYZy
 UNxL527HqZFVJQFCmRP3mzb/Hh48wh/wPrn5sYQItNoZjmrgHAWk+KrWwMVlrIjbGXIpS5cC+EmUl
 z8ey9f1+vu2FZAYs=;
Received: from mail-qt1-f202.google.com ([209.85.160.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPMYY-00886W-SU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:08:48 +0000
Received: by mail-qt1-f202.google.com with SMTP id v92so13558991qtd.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2019 01:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=coTE+MJajFctVQLNyVBBx0dRF4V5QAJNpm9Z15UXxk4=;
 b=J3Pd9Wcsnx0fAFx+SuaJ/2ISyWHr/iOR+MyAqpulWQSKfN/L5GWFqWQ36Xk0my72EP
 aoHhIkRhqf1zoyv3Ivb3FJDRimdgkDZkn63ulG6N6Kx4yzc+QMNSxz5xS7KaUzOvSmya
 5RBkAhgPy0ZBcHerSvW6id1YOnmRaDWly0RVgYKfPK6bD/1+C+Z7f84BdGdLjZ4Tqyfi
 a09ZEnH3ORvmN/v/g0gXmsSvAcpeb++Toqc9tvQwN1hxSCibDEZn/Ew29O8LArDVHNF6
 Z3QwrVT08LPjudalRd1OTD2AkJzB4aT26ZfA9qJF8K8gnpDFeuFblPPhK9AlAS9PzSy7
 3rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=coTE+MJajFctVQLNyVBBx0dRF4V5QAJNpm9Z15UXxk4=;
 b=OqnFj+fypK0YR7YCp0cMtng5EfdOfLAwvCROJPsm/g3u7XY/l6CKklmKHB5bNOIOpv
 A/owcBdT8Hqz1J5eKyUJW3IXj7Y4wRBT5BwpdHjJSSVd1hEXJSbHjLwdMQwFC9/Bgpd5
 gPbuKrMTK0KlDQDbsThur0Ubb70/4XxwFOl3voI6fG8rTn1C6ZVjahvY11b1zVS4+REB
 RH4JteKBcZgeW1Phg2d2R+YgY4/IUVqAOa8eY0XuAS3CCfL12oaXlcgYWD+QYb2BgE9y
 PLGROc8LI98x0BXJUuXotfPbcG4K/f5+vHcSIO2X8F8fatsUhId/kviks7cjmnt6CduH
 3Hqg==
X-Gm-Message-State: APjAAAX1yF/T1gXjtC4J48wCW5TbLPKHeGjcMjZJdTWspn2XoldZIoBI
 QmIKtpvKp4nWiHBI/g3w6UC7d2F+Voptaw==
X-Google-Smtp-Source: APXvYqxAx77Hh7nRevnvS8GpEcqHxWVZ3ZyQfkshEcYxuX+dw7rCCqEojhxQf1zbnDr1L8+5sm0iDYY7D+Pedw==
X-Received: by 2002:ac8:2ccc:: with SMTP id 12mr2844193qtx.49.1572335227156;
 Tue, 29 Oct 2019 00:47:07 -0700 (PDT)
Date: Tue, 29 Oct 2019 15:46:59 +0800
Message-Id: <20191029074659.165884-1-robinhsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1iPMYY-00886W-SU
Subject: [f2fs-dev] [PATCH 0/2] f2fs-tools: Introduce cache to speed up fsck
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
From: Robin Hsu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Robin Hsu <robinhsu@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Implemented cache and related command line options.

Robin Hsu (2):
  libf2fs_io: Add user-space cache
  fsck.f2fs: Enable user-space cache

 fsck/main.c       |  27 +++-
 include/f2fs_fs.h |  20 +++
 lib/libf2fs_io.c  | 317 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 362 insertions(+), 2 deletions(-)

-- 
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
