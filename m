Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86071ED375
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Nov 2019 14:20:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRFna-0000ve-7V; Sun, 03 Nov 2019 13:20:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iRFnY-0000vX-OM
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 03 Nov 2019 13:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yIy+VNpcey6HZppg95w5/6MAe/W+UIc5yaw5an+COwc=; b=iE5mqrJpBKY+FOjfTgW8yHTy8D
 TDnrkJOZHBT8WHEuQt30KX/v72NTqN5ST8aPwqtyzE3g/qRZnQ4f72JBu9jFyeDaZ2O71lgD2Q3WL
 ASXYwgcuFfCbpXOwUKAPKcc2omBsPcd62Ki4bf1vju0Yxo3cHojHD3gkMRQSSG/hPpPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yIy+VNpcey6HZppg95w5/6MAe/W+UIc5yaw5an+COwc=; b=H6l8iZUDmY12O1j3Y+de3zsLtn
 73sQyxWl3xmtfV8IVsdqeGQ8D0F7ttZofZwGi2agGVC3BqxzA9OpscBBypJc4huTpDAfaPZ42Bbbh
 BK8hdUG/EU14eKvJBeuaYw8IHfxPUW8ysbYdOGi0r3Zk+M+vY+QKPig5uW25MIJ9EH5o=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRFnW-00G4Gf-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 03 Nov 2019 13:20:04 +0000
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA3DJiKl031415
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 3 Nov 2019 08:19:45 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 8F331420311; Sun,  3 Nov 2019 08:19:44 -0500 (EST)
Date: Sun, 3 Nov 2019 08:19:44 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Guenter Roeck <groeck@google.com>
Message-ID: <20191103131944.GB20210@mit.edu>
References: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
 <20191030173758.GC693@sol.localdomain>
 <CAD=FV=Uzma+eSGG1S1Aq6s3QdMNh4J-c=g-5uhB=0XBtkAawcA@mail.gmail.com>
 <20191030190226.GD693@sol.localdomain>
 <20191030205745.GA216218@sol.localdomain>
 <CAD=FV=X6Q3QZaND-tfYr9mf-KYMeKFmJDca3ee-i9roWj+GHsQ@mail.gmail.com>
 <CAD=FV=URZX4t-TB2Ne8y5ZfeBGoyhsPZhcncQ0yPe3cRXi=1gw@mail.gmail.com>
 <20191101043620.GA703@sol.localdomain>
 <CABXOdTddU2Kn8hJyofAC9eofZHAA4ddBhjNXc8GwC5dm3beMZA@mail.gmail.com>
 <CABXOdTeu3KdT=arT+AKAOiPPM0U45krUfmDx6NH5nmDZ0pPa=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABXOdTeu3KdT=arT+AKAOiPPM0U45krUfmDx6NH5nmDZ0pPa=A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iRFnW-00G4Gf-Qi
Subject: Re: [f2fs-dev] [PATCH] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
Cc: Jonathan Corbet <corbet@lwn.net>, Gwendal Grignou <gwendal@chromium.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 Ryo Hashimoto <hashimoto@chromium.org>, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Doug Anderson <dianders@chromium.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Vadim Sukhomlinov <sukhomlinov@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Guenter Roeck <groeck@chromium.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrey Pronin <apronin@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 02, 2019 at 03:10:17PM -0700, Guenter Roeck wrote:
> 
> This change is now in our code base:
> 
> https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/5c5b06fded399013b9cce3d504c3d968ee84ab8b
> 
> If the revert has not made it upstream, I would suggest to hold it off
> for the time being. I'll do more testing next week, but as it looks
> like it may no longer be needed, at least not from a Chrome OS
> perspective.

Thanks, I'll hold off on requesting a pull request from Linus for this
change.

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
