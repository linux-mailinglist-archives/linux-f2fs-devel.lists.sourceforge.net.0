Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD565B82A2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 10:09:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYNSZ-0001qy-TF;
	Wed, 14 Sep 2022 08:09:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phdm@macqel.be>) id 1oYNRy-0001eH-OH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 08:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zp/7JqwCzTOqGIdZh8R83bLDef94q2hon79O4kLNXpQ=; b=ChiCTUp40ioVIGSoep7Z+IN0gx
 kZgRGu+Vnn8yuC/JLQStWHdscB4y2GSxPYAagVte7ABzGVN00AXCc/y+x2HrcmZdUrBI9IkqLAo22
 VH78DFFAL/ieY931jtt3ibx/s3c9rdMAOr2uL9jglJhwYZaklCf3CS7Ax+bAeeLhjKOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zp/7JqwCzTOqGIdZh8R83bLDef94q2hon79O4kLNXpQ=; b=BQvDnGihqB6AGO/nF9hy2Rx/V7
 NV65gxrWrFcCsqS95Vvh48cGsvmfuiR2r3UnfKy6h0Fcw2BJqKMW4CNoHDXdXbhcCPXgEhdPEJjGj
 xzQfWOc1S74HrHP/u9v3vSWKc2IyfhCRVP1IirteqX+1UtpVB+Z0h2lTCIF/f8WFBRRU=;
Received: from smtp2.macqel.be ([109.135.2.61] helo=frolo.macqel.be)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1oYNRv-007lHo-2o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 08:08:50 +0000
Received: by frolo.macqel.be (Postfix, from userid 1000)
 id 364CEDF00AC; Wed, 14 Sep 2022 10:08:38 +0200 (CEST)
Date: Wed, 14 Sep 2022 10:08:39 +0200
From: Philippe De Muyter <phdm@macq.eu>
To: Wu Bo <bo.wu@vivo.com>
Message-ID: <20220914080839.GA19067@172.21.0.10>
References: <20220914040423.539-1-bo.wu@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220914040423.539-1-bo.wu@vivo.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Wu Bo, On Wed, Sep 14, 2022 at 12:04:23PM +0800, Wu
 Bo wrote: > As Philippe De Muyter reported: >
 https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
 > > The warning log showed t [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oYNRv-007lHo-2o
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix to check space of current
 segment journal
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

Hello Wu Bo,

On Wed, Sep 14, 2022 at 12:04:23PM +0800, Wu Bo wrote:
> As Philippe De Muyter reported:
> https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
> 
> The warning log showed that when finding a new space for nat the journal
> space turned out to be full. This because the journal_rwsem is not
> locked before the journal space checking. The journal space may become
> full just after we check it.
> 
> Reported-by: Philippe De Muyter <phdm@macq.eu>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>  fs/f2fs/node.c    |  6 +++---
>  fs/f2fs/segment.c | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Thank you for your patch.

Unfortunately it does not apply to my 4.1.15 or newer 4.1.y sources,
and I do not have the knowledge of f2fs internals to modify your
patch myself.  E.g. 4.1.y lacks the '.journal' field in the
'struct curseg_info'.

Could you make a version suitable for 4.1.y ?

Best regards

Philippe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
