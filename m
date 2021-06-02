Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5283993F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 21:51:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loWtq-0001va-Nh; Wed, 02 Jun 2021 19:51:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1loWtp-0001vP-Mk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 19:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B5+c8r3qdc1DbPyWb/cBF+5F8DwXbsEki7gNYELC06A=; b=WXJv9CWQDdnuzO1zWwrtxYIW2Y
 R6T0/6LUB0Gg8NB4W+clF8I2y9dHqcI1rBV3jEsSwexL5HV+4B5TvlUC+9g0loYPzq7DBH65fnfM4
 Yf0fKGtkwtCOcaLLYKTmJMgoYyBhplG1LKWFgiY5ZI6G/j0Aeif9D1zrjDO7saqF4kd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B5+c8r3qdc1DbPyWb/cBF+5F8DwXbsEki7gNYELC06A=; b=D0nXPJNbY1SIU1zZr4dQpNgd35
 DybvQXYhrMH2rYrvPN0HWSoVveozihT4KRpM5q0Q1xAy0FnPJ09KRW/8nVEFU8wJ1sHR9LgyMUN7H
 MoY07h6pRWHTaWg366JXm+vwmxDUfEU+BMztWJBC5rf+oy5+jUkYxPJ3C8nVUI2W65A0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loWtn-007oZP-MB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 19:51:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20799613E9;
 Wed,  2 Jun 2021 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622663486;
 bh=WoUDHWRbujn0Iki89pXBJOyg67xP8j8eBWAryTISx14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkeskjhFXgCj3qznXkc6hBjg5T8VZdEt6t26XftS9IahPA1BnbTfA6XyD+EtvqJFt
 zGTM5ZKVyAavV6Gzw0uuQtbAD3N/8L/dqBtUoaANVqqAwAA+4V2N42HWcfWmOzDxeN
 Qchde7eZziwuwyo4wovfbL6CyjoLt9mXwOafdEBfh+ZFOdueuQCBrypm0G3IgBkIx2
 G6moGaN0lSckBmHU5CDeN3x5p9UZ3jCbEPGRY9q+jNXmNwM4G0fPhWMAZspuFOoelt
 ye4j/K32EIVC1mJp+y9S3/c5047UaWa5JYySABHfQFJ1ueIHg7gkXXEgPfsvw6t3gu
 j6paMNQ0eymHw==
Date: Wed, 2 Jun 2021 12:51:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <YLfhPBI0DmEfkC+B@sol.localdomain>
References: <20210602041539.123097-1-drosen@google.com>
 <20210602041539.123097-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602041539.123097-2-drosen@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loWtn-007oZP-MB
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Show casefolding support only when
 supported
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 02, 2021 at 04:15:38AM +0000, Daniel Rosenberg wrote:
> The casefolding feature is only supported when CONFIG_UNICODE is set.
> This modifies the feature list f2fs presents under sysfs accordingly.
> 
> Fixes: 5aba54302a46 ("f2fs: include charset encoding information in the superblock")
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Can you add a Cc stable tag?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
