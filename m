Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195497481C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 04:12:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soCqh-0000pe-5t;
	Wed, 11 Sep 2024 02:12:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soCqf-0000pQ-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DQFZ4DGg2f27ASEhLCR22rrZmaJl3sq6SdLkHY5mPvs=; b=QFQbMBsoD4+z/3L7QQtKASjvt1
 03Ovqk3UmD9ZHNedz9kekxE3FWlbRu9vh+pB8TGthtjYKBxLbvr7WzwwaGIIhVDt02Na88aw+6G++
 9uVLtDG2+CquoKBf4BxfzwxJ1EdhQch+BT6CMUteekXp4cOYqnzShafJiWC7Y4AqZ8zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DQFZ4DGg2f27ASEhLCR22rrZmaJl3sq6SdLkHY5mPvs=; b=Jfx4mgHrCDwSZbt9f+I+nZpgQG
 b4lo4+9qDJV2Gk18tnvUha6C1OxRAVXvb7J4Syn6T5iwFGtHvJKWp/PpOtp9ICXSRjzV6WB2BrDlK
 HaFo/onDmKwY0kjtW2MengNOIqScTvY/m80k/UGlcYGsbo8bVBmGmylO0RCFihU/lGJM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soCqf-0004tK-9P for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 667835C01CE;
 Wed, 11 Sep 2024 02:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F689C4CEC3;
 Wed, 11 Sep 2024 02:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726020758;
 bh=CtBBddZQklo7l2lh8QWTDib+aAxIxnkJFfbW73WItUU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FHviIXG6px3qm9J1gZchBLo5XP5DZ1s3Br8XTvg/9fIDG0kVc4OgSjG72dd4dBkn/
 5CJzTOz9LIBAxEAtofAwEprHwWlM15ff2oFZlGRDZfdVl0F6Rj7XNCTgoWsrupH2gE
 8UqJaJM+EhNWCjvQL8199DVL1u3LCHG2Kgegrg02Q2TvT6XChp3Iqf7UBrAhc468+z
 RTal+IkS6T9hnDu3kMuOR/nIboywfdo9Xb2CTrwGHU5U3akT35i5lj4bFOpPeJTDvf
 XMkMayyneLXemvfI+Pf0Zz3qrjLxoRwfmBRzoXfqVgzLptjH18mRGf67tDYtDM8LAw
 zdnufUP6VTYGQ==
Message-ID: <92a5282f-aa06-4c4d-aa34-fe43bdd93d5b@kernel.org>
Date: Wed, 11 Sep 2024 10:12:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240909221946.2004046-1-daeho43@gmail.com>
 <20240909221946.2004046-5-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240909221946.2004046-5-daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/10 6:19, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Under low free section count, we need to use FG_GC
 instead of BG_GC to > recover free sections. > > Signed-off-by: [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soCqf-0004tK-9P
Subject: Re: [f2fs-dev] [PATCH v2 5/7] f2fs: do FG_GC when GC boosting is
 required for zoned devices
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/10 6:19, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Under low free section count, we need to use FG_GC instead of BG_GC to
> recover free sections.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
