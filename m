Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7588F505FDC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 00:43:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nga5r-00071d-2s; Mon, 18 Apr 2022 22:43:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tytso@mit.edu>) id 1nga5p-00071X-45
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 22:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cIXJ9sbkxjNSM/Cjw4E1f5IRC62birsuU9flUkEWY5Y=; b=OGAhlSUd03huYHyh4RNAP3iQbV
 bOpAAUaJDH3WrQy365ZCyO6Q0Zx6KclLvAQtUUE3l3iZu4HcUguoKoIG5EjtCyOY0tTX4vY/rVhaR
 mmF/d48ZY1NFJp8f3iZgL43bGBv7dhuiLUWqAe0OIr8p9idxoqhRamiCYmuQav4bke6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cIXJ9sbkxjNSM/Cjw4E1f5IRC62birsuU9flUkEWY5Y=; b=dY9OxJRRcMwjnosdaWQU1OY/CT
 JduMdP48UlcGTGuU1yNVOl9E8tvrt2zLNb0UR1e/9mXyvLfoEgvA0MZNlHkwuYAZKYjvddCeB0GoX
 tj/3+YDVG9jJWPm1Wpj0FKztVGLOE/VlAKKJqGHcSspZLsMjo6hseR0jhBJUCc0IKsKs=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nga5m-0007bm-8X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 22:43:36 +0000
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 23IMhFCS005193
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 18:43:16 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 5FBBF15C3EB8; Mon, 18 Apr 2022 18:43:15 -0400 (EDT)
Date: Mon, 18 Apr 2022 18:43:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Yl3pg33jbLIIig7G@mit.edu>
References: <20220418063312.63181-1-changfengnan@vivo.com>
 <20220418063312.63181-2-changfengnan@vivo.com>
 <Yl0RmUoZypbVmayj@sol.localdomain>
 <KL1PR0601MB400369725474F2A2DE647057BBF39@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <Yl3lxMnZ5teL+bkU@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yl3lxMnZ5teL+bkU@sol.localdomain>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 18, 2022 at 03:27:16PM -0700, Eric Biggers wrote:
 > > When I test fscrypt first, it make me confused. Not a real problem, just
 make this logical more reasonable. > > Do you think this need [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nga5m-0007bm-8X
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: notify when device not supprt
 inlinecrypt
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 18, 2022 at 03:27:16PM -0700, Eric Biggers wrote:
> > When I test fscrypt first, it make me confused. Not a real problem, just make this logical more reasonable.
> > Do you think this needs to be revised?
> 
> Well, I'm just not sure we should do this, or at least by itself, given that
> support for inline encryption is not an either-or thing, and the inlinecrypt
> mount option is already documented to apply only to files where inline
> encryption can be used.

Indeed; some encryption algorithms won't be available because they
weren't compiled into the kernel; others because block device for a
particular file system doesn't support inline crypto.

It seems to me that the test or the test runner should be able to
figure this out.  It should be able to explicitly try to set a
particular policy, and if that policy fails, it should give an
intelligent message, e.g., "Skipping this test config because
inline-crypto isn't supported."

Why can't we fix this in the test runner's scripts?

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
