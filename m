Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE3654571
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Dec 2022 18:04:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8OzI-00035Y-Fq;
	Thu, 22 Dec 2022 17:04:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1p8OzG-00035S-Ah
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 17:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8VQE476fItcQEyvNi8YKNC8SHTVYFOvKq/RWJ11ZYc4=; b=Tc4uq/GD3pbdDqtFdZcmDE3ZwS
 R1+etG47iBkHds+7jTwbkoXz02RZa3YU3Xhg5YkMAqO59REIMAVdLquLz9g9pO39yzPA+OJqmEYAv
 ru2EmqtcqjzJjwg0K22XYP1ZYODD2CYzBI6haualrLT/Spka2+vCpUFmBUuquYRMPjoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8VQE476fItcQEyvNi8YKNC8SHTVYFOvKq/RWJ11ZYc4=; b=NBms+EN/tBeEc7yXGmEtqASXYj
 1ShObKm56r8Q8t1qinXcKuYYd4Sde/2B2c6HRH4zYMkW57qX0KQ1Mnjsb9dPuxkSujrRaglHfnAaR
 m5WD5mEkHum8zhqB4ay/llLtkMyJlTsiTTylY8wQ4q84MqlQXKQanzoL1rJGTZNeLkBI=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8OzE-000885-PE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 17:04:06 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BMGpOt9009971
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 11:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1671727886; bh=8VQE476fItcQEyvNi8YKNC8SHTVYFOvKq/RWJ11ZYc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Y1HUp4TlkjWs/IvOpsjLbqbpZe+niMvbTyQFgq18Rn7JlP6ObL6lD9ZL5Xnb/S0ue
 7iHqTFmahQYKRygUKPKZDG8lqTJ8ZzzJIfFiovx5n6ShIphokTD5AF1yJhNOU8A8O2
 hyU19A5xaWaML2UA+BXAGFCY3f51984ew9C5fSNV8mrd9gB2NefJn6U/o338pQKl16
 bWZ/t/Sf4bjjkjzOCuuRpEy4IFbCPX2c+X/kAQAFZW9JzTBbaQhIiLnUcUTH6208gg
 7unZOMQnyuw8bTiHMGjyn04+lWpvvkSCvQzOVH/QpmmM3Q4olO1oAhAP6SHieRES+t
 JdB6A/aagyooQ==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id C831615C39F2; Thu, 22 Dec 2022 11:51:23 -0500 (EST)
Date: Thu, 22 Dec 2022 11:51:23 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y6SLC9DG1s/4NhPL@mit.edu>
References: <Y5jRbLEJh3S46Jer@sol.localdomain>
 <Y6ObULdVm2UN5kw1@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6ObULdVm2UN5kw1@sol.localdomain>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 21, 2022 at 03:48:32PM -0800, Eric Biggers wrote:
 > > What would people say about having a separate mailing list, git repo,
 and > > patchwork project for fsverity? So the fsverity entry wo [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1p8OzE-000885-PE
Subject: Re: [f2fs-dev] Separate mailing list (and git and patchwork) for
 fsverity?
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 21, 2022 at 03:48:32PM -0800, Eric Biggers wrote:
> > What would people say about having a separate mailing list, git repo, and
> > patchwork project for fsverity?  So the fsverity entry would look like:
> > 
> > FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PROTECTION
> > [...]
> > L:      linux-fsverity@vger.kernel.org
> > Q:      https://patchwork.kernel.org/project/linux-fsverity/list/
> > T:      git git://git.kernel.org/pub/scm/fs/fsverity/fsverity.git
> > [...]

This makes sense to me.  I wonder if we should use the new
https://lists.linux.dev mailing list hosting service with a mailing
list name fsverity@lsts.linux.dev?

The thinking was that we would eventually migrate lists from vger to
the new list infrastructure, so it might make sense to just use it for
a new list.  All mailing lists lists.linux.dev are archived on
lore.kernel.org, so other than the e-mail address and using something
a bit more modern than Majordomo for list management, it's mostly the
same.

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
