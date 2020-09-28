Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B027B74E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Sep 2020 23:49:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kN11q-0002kA-QL; Mon, 28 Sep 2020 21:49:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kN11o-0002jq-GV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 21:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HRV2Oq4hpU85lgphSsJBKNdO3Rqtu8nge7l+oMKnVv0=; b=DJfG0hkahet0ombVTANP8fqfON
 /MxnJKbQVazojVFcOAU93FSX0tB0o+gcuwGaSuvPczq/k3CHo9pZWA7ydlQ6go+hoR3zp/FQ0WJl1
 4Zk2zyv79SYMYFBY++rRKDX7VinNKHSNiOQwaa1464h9QrDdUsrs71oL6D6lCx4LKik8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HRV2Oq4hpU85lgphSsJBKNdO3Rqtu8nge7l+oMKnVv0=; b=IUPIF65ls2+hyEUCNuU/Plf1c1
 rSaL/xffYkEQNus9HhBZzwGUQiYEDFtwji12Q2W/TCtdWPjTRfMDTZg3DR5HjOR600mDeB/hULT7f
 4/8Mz6nNZ9jO93Pm8V1WcboYFj1hbhl6T013wU7oIIpk7nY0uv2ikhLX/6FSckcvfOPg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kN11d-00C5jX-5l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Sep 2020 21:49:48 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B9EF207F7;
 Mon, 28 Sep 2020 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601329768;
 bh=jnDF4UHlxQoCvPVJnbDA/TG60C4qyLgWp/wbtLXGwEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BbsRqdDGqXYX5Y4oP3LAjd7J6XF2TOj/cDIcCDrxxkHP/dS8eh0ax2zGyoN2g1FPJ
 hSaUc7xsneh+qQEeALopJZfPSbYEnc4tLQjVLFjCsoLwKxSbp2R69bk7ZWhxIILaa6
 bZgvrIwr+ChLLQQ7C4Y3vgOdrLKtioq98VbaKO0M=
Date: Mon, 28 Sep 2020 14:49:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200928214926.GB1340@sol.localdomain>
References: <20200925233819.5359-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925233819.5359-1-chao@kernel.org>
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
X-Headers-End: 1kN11d-00C5jX-5l
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix uninit-value in f2fs_lookup
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Sep 26, 2020 at 07:38:19AM +0800, Chao Yu wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> As syzbot reported:

Please include the Reported-by line that the syzbot report said to include.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
