Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA01508638
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 12:45:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh7px-0004vp-GH; Wed, 20 Apr 2022 10:45:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nh7pw-0004vj-Fo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9LmdZi45TVqs+MIlRuHVdk1ixT8xjscfUZ7chTwppqU=; b=CPWdy0gagne1kcadsYTfDreE6T
 g9ftivkgFO77QYPWgjy9x6S1SC+uQyKj5RrrRNds0UUI6haKmwc5xAdN9VzpJ6rkoEB0JEfrqDjGh
 VyurxsdaM/KZr++uPMpSc705b6LOPHsyUK5PntzQHVzdmS3f+Srf3O2eHCK77Bgh7c2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9LmdZi45TVqs+MIlRuHVdk1ixT8xjscfUZ7chTwppqU=; b=Bq/WpLZytOwF2oN6tSlSOZwv2U
 cv4sIG2UIJZVYIx1jrOi+AF8IXQUggHJDEOXu25SGvWBky8RhOBw3xsCJCTCrFEWBEV9AQpUYDukI
 gM6kHVbNENMfEvWoMzpfxB8ygIJzntMmQlnebUG9hhVIBiws++zP22lDbzYAuCA6ZBOg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh7pu-004bxH-BA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:45:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD2D261784;
 Wed, 20 Apr 2022 10:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7209CC385A0;
 Wed, 20 Apr 2022 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650451520;
 bh=F4iRQLYUOp0KM7vbDs9HIf+8WwsG0fO5ZEHyU/G2VLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dii27LsWCVIBumzLpw0W1zRUe3lQucndkcznhF/tuEBLqyKJ5AngdIyNfv7m7BBGQ
 a9sI5LEQ46Yw67GPVlcYDlDfdA1WXvudm1LBLesxToZFksJxC9plih44U7pJHtiTe2
 Clb0kzLGQHPNgx4Rc8pXHORyOAxGNfN40yk+/UQEWoT2fOHtlAV2uI5nt2fD1wdvdN
 pnRzxv/h67RZcfY/C0up1eH7z7/pKsWz8r8ho3783UbJD3HAOEAKdJo5kce8HXRTBS
 r3qgOlWEfbbkQKyq81OQD3NED4X6nbjk991TTt0GG6UNOINGVek+S1ftl5wbkee8Mg
 zYFzBVlP+X0Iw==
Message-ID: <8b1c2c4e-4769-67d1-42b9-42d2d1d0871d@kernel.org>
Date: Wed, 20 Apr 2022 18:45:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Pankaj Raghav <p.raghav@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CGME20220413122941eucas1p1ec05e8e8dfe2baf451fcb549d60fda35@eucas1p1.samsung.com>
 <20220413122940.133981-1-p.raghav@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220413122940.133981-1-p.raghav@samsung.com>
X-Spam-Score: -9.9 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/13 20:29,
 Pankaj Raghav wrote: > From: Luis Chamberlain
 <mcgrof@kernel.org> > > f2fs currently only work with zoned storage devices
 with a zone > size which is a power of 2 (PO2). So check i [...] 
 Content analysis details:   (-9.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nh7pu-004bxH-BA
Subject: Re: [f2fs-dev] [PATCH v2] libf2fs: don't allow mkfs / fsck on non
 power-of-2 zoned devices
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
Cc: javier.gonz@samsung.com, Damien.LeMoal@wdc.com, mcgrof@kernel.org,
 pankydev8@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/4/13 20:29, Pankaj Raghav wrote:
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> f2fs currently only work with zoned storage devices with a zone
> size which is a power of 2 (PO2). So check if a non-power of 2
> zoned device is found, and if so disallow its use. This prevents
> users from incorrectly using these devices.
> 
> This is a non-issue today given today's kernel does not allow NPO2
> zoned devices to exist as a block device. But NPO2 zoned devices do exist
> so proactively put a stop-gap measure in place to prevent it from being
> incorrectly used.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
