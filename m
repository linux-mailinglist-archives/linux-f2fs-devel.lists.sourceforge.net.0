Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B046800AE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 19:12:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMCAQ-00086T-Ew;
	Sun, 29 Jan 2023 18:12:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pMCAP-00086N-3c
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 18:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsoELTbFCmklBSWaL0mK24RW1Go+2MZtjWOyil9mCl4=; b=VOZkpWgcgN8stXXJ8rJHfW++RR
 kn8GRTelTVWaIcC5Rp5YKOQp4aJ2OkQ+5RtrSzpLfRWKXm7Iy/x0JnxnxUBOOJi2448pCNOv45z9H
 NfGirKOD/XU3r7llFvfb9M6GtDCzeoUaMX5Fkjd+p5gfzxk0sIP7xMRhGIXEqMOt6VNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lsoELTbFCmklBSWaL0mK24RW1Go+2MZtjWOyil9mCl4=; b=VCFtSY98WiG6KC/cvcH9oF4FVT
 Vh+6YkE93hTtQQKQ/5v6dmWl0xTv2xL7wAJ8FoyqQeWOoutppxwzewFuhCrI1B6SyW8lBiVx1B17f
 Y7ezslAcqzV02aeqyQmY6TtU5opg+lg5KSrIdXMlu/S5ULYkzJlhz6U5PCTbPUYb82PI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMCAM-002jaL-Fc for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 18:12:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 03A50B80D1A;
 Sun, 29 Jan 2023 18:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EF6C433D2;
 Sun, 29 Jan 2023 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675015943;
 bh=lsoELTbFCmklBSWaL0mK24RW1Go+2MZtjWOyil9mCl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mW3FZyu5ZH+cxC7WR6UuMMMAN3q1AbaQsSx9+l+gmffmuquuvjwGBpbQbMjCQbMnG
 bBqVljJBriCJWAzg+VTsXo/kAm182A9LbGsoj3Do4rOzxxeZaXishWjfmzTcYJkW+1
 l68VMJ9BML7ydFtm8c/2CmsCGpqnKUkyCo5Zr65yxjy2FCIbygyQjBF6c617viNNHT
 X25fqJkTBZtfHuAiRN1KglOXfg4Fo1n6M2/r0TqgWga7U25wNHwJLchnsp53JkfluP
 zP/l3WcpXkYNRjak1Aq7bYbg0B4XXpq35xFa1OfAhZop4J/MvBwRr/RT+ZIdVL8bCT
 7tltXjP+Aaw1g==
Date: Sun, 29 Jan 2023 10:12:21 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9a3BaVfBhvop4fp@sol.localdomain>
References: <20230124153346.74881-1-frank.li@vivo.com>
 <99e4e218-d9a4-93d1-c0d3-9ba01da21093@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99e4e218-d9a4-93d1-c0d3-9ba01da21093@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jan 29, 2023 at 06:21:17PM +0800, Chao Yu wrote: >
 On 2023/1/24 23:33,
 Yangtao Li wrote: > > f2fs supports lz4 compression algorithm
 and lz4hc compression algorithm, > > which the level parame [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMCAM-002jaL-Fc
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix to check lz4hc compression
 when CONFIG_F2FS_FS_LZ4HC is not enabled
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jan 29, 2023 at 06:21:17PM +0800, Chao Yu wrote:
> On 2023/1/24 23:33, Yangtao Li wrote:
> > f2fs supports lz4 compression algorithm and lz4hc compression algorithm,
> > which the level parameter needs to be passed in. When CONFIG_F2FS_FS_LZ4HC
> > is not enabled, even if there is no problem with the level parameter, add

lz4hc is not a different compression algorithm, but rather just a higher
compression level for lz4.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
