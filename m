Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F0052AC11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 21:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nr31P-0001Dl-M3; Tue, 17 May 2022 19:38:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tytso@mit.edu>) id 1nr31N-0001De-Tr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 19:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gjF3UmMC4ZyoJnTzFcqn/F3r7v+E//TAc0+qhfAKPdA=; b=P9VYX5CI14gzFXswJ5SdjsZWsK
 7nOhJVtGiRf6nT+sQvfqbQrmRk1Y04bhzP88FnIKgjTrWnR4T1I95ZmHZr2cveWBusVFrYSKQ06e+
 0pF5VCwzT3w5K6YM1rBdjmOQQV5hfjtFT868P6LecyUSQoqCThX5lsZB//KmmbaQ+KB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gjF3UmMC4ZyoJnTzFcqn/F3r7v+E//TAc0+qhfAKPdA=; b=Sk/GDTuCiLZhxEz8HCXpn8dptl
 t47gesVk0MSL80ArpQjBe4V9os2RXtTD3XpVZEuhz5AO42lp2xeckSPVFt0/PGJF6Tp9rPeVF8BO2
 cJq5VBDWZvgJvsv1yONUIxc2aRGq6cObP/FazJVOpxUeRT6jpWoHulIU1WLmzV4PR0WI=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nr31I-004ilW-6U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 19:38:18 +0000
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24HJbmKM032272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 15:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652816271; bh=gjF3UmMC4ZyoJnTzFcqn/F3r7v+E//TAc0+qhfAKPdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=YWZ6i/3IdBGwr4SyraXxcIhbLRAbOxr0dvLm3I5n7e241sNy6Ch6v2KncDvUDSpbR
 Lmro19q8OiJ7hQ1ll443cFRi1fn/I/p+bBFI890xz/sexmaPab50F9RXxg64+H8J47
 uS3Zr0VojaZnDQOW8Whwh64YGpaxbrgNZnTzb+qzbu0BQ9DUb03W9832yvasiOZCzD
 M6fEzqU1r6+viwSH+VTMnMShnFWGl7Ms9Z/CsxocpvZ2L3HWgmRMSzk0MLXa+JoqXf
 +QiW2Mmw4aa5SomGy3ojp3XS90hFpxQlHepDewrXiflqfjJZB8/hY46Ath5vzgbNTr
 C07Yz1RX0YpIQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 651DE15C3EC0; Tue, 17 May 2022 15:37:48 -0400 (EDT)
Date: Tue, 17 May 2022 15:37:48 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoP5jH5axe9ltX2Y@mit.edu>
References: <20220511193146.27526-1-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-1-krisman@collabora.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:36PM -0400, Gabriel Krisman
 Bertazi wrote: > The case-insensitive implementations in f2fs and ext4 have
 quite a bit > of duplicated code. This series simplifies the ext4 [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1nr31I-004ilW-6U
Subject: Re: [f2fs-dev] [PATCH v4 00/10] Clean up the case-insensitive
 lookup path
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 03:31:36PM -0400, Gabriel Krisman Bertazi wrote:
> The case-insensitive implementations in f2fs and ext4 have quite a bit
> of duplicated code.  This series simplifies the ext4 version, with the
> goal of extracting ext4_ci_compare into a helper library that can be
> used by both filesystems.  It also reduces the clutter from many
> codeguards for CONFIG_UNICODE; as requested by Linus, they are part of
> the codeflow now.
> 
> While there, I noticed we can leverage the utf8 functions to detect
> encoded names that are corrupted in the filesystem. Therefore, it also
> adds an ext4 error on that scenario, to mark the filesystem as
> corrupted.

Gabriel, are you planning on doing another version of this patch series?

It looks like the first two patches for ext4 are not controversial, so
I could take those, while some of the other patches have questions
which Eric has raised.

Thanks,

						- Ted



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
