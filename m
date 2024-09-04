Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411E96C053
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2024 16:26:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slqxd-0000jD-OS;
	Wed, 04 Sep 2024 14:26:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1slqxc-0000j7-Ah
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5IOpjj+sschLbRUt9ymvkr5h8bRXxFzr965JH00psl4=; b=jlnlzAjkdPYyS32SqcEnS7Hn6n
 jg4gTdimEMNfhWYiGIbsa8IorSNDAYYhyOGgGlzCTogtA6vbuZv8NGnxX6O1WgTB0K7XI9vyyVxQA
 9gbiD0CuuCq/PKqzQZ1SpaQGXCtUpkw2aL+GyVpSFq6kdsUxiATrSccYFCHCOd/8zzJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5IOpjj+sschLbRUt9ymvkr5h8bRXxFzr965JH00psl4=; b=UCJNIvSQFxf6i+8SrZA1ohmnv+
 1IgCXKcwg4AZI5z9jxMrL7XEqIvi//jvJ+lDHb8KHx89byely52FvEHgcTasCtIjAxZhfcVf6Msw4
 MqsBIO9fLCvayx21AgiAkqFsj86iWc4j2y0g5K3cHryoAla2O1XNYOUx2ZPhCcJTdRJI=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slqxb-00067g-LQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Sep 2024 14:26:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BBEA7A443F9;
 Wed,  4 Sep 2024 14:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293ADC4CEC2;
 Wed,  4 Sep 2024 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725459969;
 bh=rrhYaamXW46ZA8J1vfl8UZPveYwzIsw/ibTYbzfoa4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBVJG8buCkTtJGLpLYQk7e4EXklcg3IjAoJ0WMUG8cAYnVNqIi4Fi+D0D4xiX0aVQ
 RyUXe1ApNkWoOar0Q+HV5cE4g0cJ3nfjWkTfLbXpiJA1WSaiUiELBa98qRrXVB3AMY
 QeOqd3eDbx65bIGS4yRcpRnJDNGkQi/H/n3mOUvc=
Date: Wed, 4 Sep 2024 16:26:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shivani Agarwal <shivani.agarwal@broadcom.com>
Message-ID: <2024090457-frosted-snowdrift-5483@gregkh>
References: <20240902092616.5249-1-shivani.agarwal@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902092616.5249-1-shivani.agarwal@broadcom.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 02, 2024 at 02:26:16AM -0700, Shivani Agarwal
 wrote: > From: Chao Yu <chao@kernel.org> > > [ Upstream commit
 298b1e4182d657c3e388adcc29477904e9600ed5
 ] Now qeued up, thanks. greg k-h 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slqxb-00067g-LQ
Subject: Re: [f2fs-dev] [PATCH v6.1] f2fs: fix to truncate preallocated
 blocks in f2fs_file_open()
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
Cc: Sasha Levin <sashal@kernel.org>, ajay.kaher@broadcom.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, vasavi.sirnapalli@broadcom.com,
 chenyuwen <yuwen.chen@xjmz.com>, jaegeuk@kernel.org,
 alexey.makhalov@broadcom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 02, 2024 at 02:26:16AM -0700, Shivani Agarwal wrote:
> From: Chao Yu <chao@kernel.org>
> 
> [ Upstream commit 298b1e4182d657c3e388adcc29477904e9600ed5 ]

Now qeued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
