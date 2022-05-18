Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F371152C2CD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 20:55:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrOpE-0006WB-Mw; Wed, 18 May 2022 18:55:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrOpC-0006W0-BG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 18:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1f9NONQVC4hZb8ch99DNgkKkiP5yITBqMSU3+vGgG9o=; b=XIN6Hk2rqDijvawSHYiKN8Rb8E
 cz/qX5JIOihJaXYZcxlkaCvUOf2y1E83i6H0KyI8KFv/EJJ6rPJu11LBoKbJN36l+FWKQUBYZU86P
 ksH917IvP+fRGiplNPdtVl6KExQTd8xNY0VlrOYBaJmH1rRviNGbsVIPOkUOuKYUJle4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1f9NONQVC4hZb8ch99DNgkKkiP5yITBqMSU3+vGgG9o=; b=BOk0hPXGNAu4FalIXB1XsZgJhB
 7Noe6sYbQt8RmbrIonhkBlkeT1M9Rv/+2+eUFiYFoCTKLHKzciScfajB1AU20uxG9TNqxTyHHoAh3
 OWjc/wuMCHJImdc69nIEZ0brrUY1mEcqSCR2sRK/rDFEQMNgVjmlEC7LufszqscaFNRE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrOpA-0007it-41
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 18:55:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBBDA6189A;
 Wed, 18 May 2022 18:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADF0C385A5;
 Wed, 18 May 2022 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652900097;
 bh=J3dNW04lYjjvOpzQnYthNV5C2F15++WqsQgH3KLr2Us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=svFFFeBOUWogVA2WjX3w1zfeYB4IA+UuMQRmwW5dJP6Dw0IjrEa4a3+vd9e3MXCRR
 80j8IZ2/hgLUoUiwx5BQfCoRW22GYtyvL1Zimc2f07sGqXJX7kS2HSNdCpbgkQDC3S
 W9mwc4FcfJQaphpNAr/W2yxfk5DZJusdZfqWckgVO10x3qFUUXgSfB1pDrirc42rT9
 3PVkEcaGiVlY0cqoutm4wNcZ+CRQBoWZnICWr3oXLL+vVGEkNZLvaa8Ttn7BBArcX+
 tKxP8p1FExMnMJsjY0f4qeA77kd+S0cTvm78t995VEU/vC29qjTiZCyMZmrSl9n4v+
 xtS5olu7XYnAg==
Date: Wed, 18 May 2022 11:54:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoVA/2sKDRAR5985@sol.localdomain>
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-3-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518172320.333617-3-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 01:23:14PM -0400, Gabriel Krisman
 Bertazi wrote: > Keeping it as qstr avoids the unnecessary conversion in
 f2fs_match
 > > Signed-off-by: Gabriel Krisman Bertazi <krisman@collab [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrOpA-0007it-41
Subject: Re: [f2fs-dev] [PATCH v5 2/8] f2fs: Simplify the handling of cached
 insensitive names
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 18, 2022 at 01:23:14PM -0400, Gabriel Krisman Bertazi wrote:
> Keeping it as qstr avoids the unnecessary conversion in f2fs_match
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
