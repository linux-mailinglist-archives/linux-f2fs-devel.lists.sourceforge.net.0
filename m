Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2887900825
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 17:05:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFb9M-0002hi-1h;
	Fri, 07 Jun 2024 15:05:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1sFb9K-0002hY-JB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 15:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTJbenjVfHA1ltm0u80D23v5lEPXPg2FY+o7ukRMWbE=; b=B4HHVd+wAjnrySymATKBjBHePI
 GxNKX+ZeMsp5R+R87GcLIMZWTbAuTBS0WdHZ2SAKd32UVuoZIHb1t1gUsvG6nF6LdSrXpisVqKEZ8
 7+TIHOpZkK0/x3QwyLF7Vmuy0niw9aFm7YD3wOzqcGDp46gK/UN1jX4mdrPVyZcPkZ3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTJbenjVfHA1ltm0u80D23v5lEPXPg2FY+o7ukRMWbE=; b=h6SGcWvG7pFyZtcMxVXqVWGiNH
 MvU8jg3/BrTR6HeRftsL2Ga/qzZq8eO8lZqJvFtWSgYgrrbiyATXjRDtd6VcdG4cRux6YS588cbwT
 vsH6TnUQ2PIHcjo9EMr+8kyJccM1yIdM/Tv5Ql1ncQ89Wc04GQdz2q0tedR48hq4vX0E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFb9K-0004jZ-4n for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 15:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09B5C61142;
 Fri,  7 Jun 2024 15:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C87C2BBFC;
 Fri,  7 Jun 2024 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717772695;
 bh=xTJbenjVfHA1ltm0u80D23v5lEPXPg2FY+o7ukRMWbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ulvxuLa9I0Gau+gWQk9QEVo1+5TErBRMH4UkJLQMHjDeLAdpwhXi1lhYCjzRWts4w
 +Yaq1j0cYzrPm8DzVINcpMCPv3ypO9x0ET0/HMldBBvdi21VRdyu1YHVjMFtajj59Z
 13tsPIu++/frcJL0KO8L+6vA/mfDmcRQii4qwz7zgdnpNwaBsIBwtB25mOxggh/9iu
 nV/olNsgRtowZluYpcRt5OBln85cRgP6tmmrMKD0B2FhaQrC0hIQCBbkTRxbsYLSi5
 xVKdygb83XXNEJ+VXwE46JtCtEhOia9wSkPjimKcoJSD/JwSSI5EjcJpR8NiSOAnp7
 pwAKL4yvvg9Uw==
Date: Fri, 7 Jun 2024 17:04:49 +0200
From: Christian Brauner <brauner@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240607-skaten-geophysik-685b6532b78e@brauner>
References: <20240606073353.47130-1-eugen.hristev@collabora.com>
 <87v82livv5.fsf@mailhost.krisman.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v82livv5.fsf@mailhost.krisman.be>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > Christian, can you please take a look? Eric has also been
 involved in Thanks! Looks good to me. I've picked it up for testing in -next.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sFb9K-0004jZ-4n
Subject: Re: [f2fs-dev] [PATCH v18 0/7] Case insensitive cleanup for
 ext4/f2fs
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
Cc: kernel@collabora.com, tytso@mit.edu, ebiggers@google.com, jack@suse.cz,
 linux-kernel@vger.kernel.org, Eugen Hristev <eugen.hristev@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> Christian, can you please take a look? Eric has also been involved in

Thanks! Looks good to me. I've picked it up for testing in -next.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
