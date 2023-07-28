Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D276664F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 10:05:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPITE-0002K1-Bf;
	Fri, 28 Jul 2023 08:05:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qPITC-0002JX-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 08:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nLljaAEO7Ry7mUuAOrxQY3HFOUMvAf5rTdMrMu9ZgWQ=; b=W/DdxY/qkYimZ1jBh1kkiTJLyJ
 H/c7stydP6bylW/2FdXzYLO+GIMfnY9Q5HGgvgkhbENneJU3TrhOKYfo2lmVfnOtzsPs1G1o6yoJm
 Bgyk4/big5hzYR4OhLAJWaYxIJxqcmRpHwao4VCpJ4v6miHLvcok2Xw2dqluWeiPXiGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nLljaAEO7Ry7mUuAOrxQY3HFOUMvAf5rTdMrMu9ZgWQ=; b=gsRE7WdIn8n0u5ZwlSRp5EX8O1
 nfXI4Nhwgzh9jLP/fpkeITh6ASbOKyjRdOrUaMxDmj05pKdx7rPZzgHtjPGX7FH+Gb4AXtsRJFXg3
 ioD+r0PizU0GFdE+gzMZN6GWBp9Ts8ETRS5FXq3IbtSgzkLSB5wc+s43KHLklDRnWFhU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPIT8-005JxB-LM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 08:05:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74ED962033;
 Fri, 28 Jul 2023 07:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3DBC433C7;
 Fri, 28 Jul 2023 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690530310;
 bh=nLljaAEO7Ry7mUuAOrxQY3HFOUMvAf5rTdMrMu9ZgWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLNU76rfd4+NtkOReb2y1UM2W+NV1srTOumrSK5jLOsHRqyIYAP/H7WXcTeLC6nvx
 3ed1wQP2044cO5klybmLtL6iIzytXmuTLIlbooAiJkdeZsIdiMaGlAyCeYToiddjaF
 alePvLa3D3XBiRrquDqzmDhoI31efc5GyuW0Wi7RkrNgJMbMBM/irW3Zhwaqx0wEWG
 nOcUToZZijhNZVLFbsdHhVO9Wtvm7RI87PR3DlMLpQ/6terZqM/mdL287AVIRUFc13
 MYoCSUSq+53tVSdGtGZ3Y2A1JOqAPtm/KIlWYcse5yxDT0JIIRCxVvobnh7JyDJlBw
 UZVdv/RuJL2AA==
Date: Fri, 28 Jul 2023 09:45:06 +0200
From: Christian Brauner <brauner@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20230728-ersetzbar-implantat-9143619b982f@brauner>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727181339.GH30264@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727181339.GH30264@mit.edu>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > since it has vfs, ext4, and f2fs changes (and the bulk of
 the changes > are in the vfs), perhaps it should go through the vfs tree?
 I've just waited for Eric to finish his review. I'll take a look later and
 will get it into -next for long soaking. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPIT8-005JxB-LM
Subject: Re: [f2fs-dev] [PATCH v4 0/7] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> since it has vfs, ext4, and f2fs changes (and the bulk of the changes
> are in the vfs), perhaps it should go through the vfs tree?

I've just waited for Eric to finish his review. I'll take a look later
and will get it into -next for long soaking.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
