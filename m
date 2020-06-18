Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470C1FFBDD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 21:35:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jm0Jv-0005Ua-CY; Thu, 18 Jun 2020 19:35:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jm0Ju-0005UU-S5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 19:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMMELEeEhdTTI2E0mWMuOefpye/AeVO+VP027XMPH08=; b=XxD+zt/eZsDo+lN7izEEIdoWea
 WnnNWyhU5IfMjvKLbew3S91z6w6/6u8nQo4ccqZVte8khtAAlfap6hUQAEODePx7RuABVlngoZwGU
 Zile5ecJUgOYryiMgzhAn7C43qp08K3LgwftAmsSAJLwTTZDvFa28IMLAmf/27e8Sxq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FMMELEeEhdTTI2E0mWMuOefpye/AeVO+VP027XMPH08=; b=F8SrGTb0dvaxRaonEl4UtW84KK
 FX66flszSeJYmYq26OwDlXDNIpdkQpuwdASLDbypSHl2lkDnTE9SfM2ZOJwVfPc09VXT1GXmyN7fR
 8Hqdb/3/Krln7HkVCdFFanX2XiT+UEMT/BLSvNyh73BE+V74016VPpIcopVZI/fHmG9A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jm0Jt-00B5MA-OD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 19:35:30 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28B3D2070A;
 Thu, 18 Jun 2020 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592508924;
 bh=M6NwrIk8NEqDFtZ1LIjdjdGZVm45nmjh1JS/p9T1PV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0s/GzQDavX3Bi6wq70IJY7QVFsGQxpHsC7VUkp4Wov3iEMW2eBO/5ufyuBA9CWcZZ
 VmDjkfo9bWPEAzSAtHWLCHRv8Xq8RykzeAMnLnHKU8xAhOqdzC9pgUEI3g8QwibjVq
 dCB5TpvrgaFTipvY1DbgwEnKKvu6QpnQf6CeBHmo=
Date: Thu, 18 Jun 2020 12:35:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200618193522.GD2957@sol.localdomain>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-4-satyat@google.com>
 <5e78e1be-f948-d54c-d28e-50f1f0a92ab3@huawei.com>
 <20200618181357.GC2957@sol.localdomain>
 <20200618192804.GA139436@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618192804.GA139436@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jm0Jt-00B5MA-OD
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: add inline encryption support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 18, 2020 at 12:28:04PM -0700, Jaegeuk Kim wrote:
> > 
> > It would be helpful if there was an f2fs mount option to auto-enable compression
> > on all files (similar to how test_dummy_encryption auto-enables encryption on
> > all files) so that it could be tested more easily.
> 
> Eric, you can use "-o compress_extension=*".
> 

Okay, great!  This isn't mentioned in the documentation:

compress_extension=%s  Support adding specified extension, so that f2fs can enable
                       compression on those corresponding files, e.g. if all files
                       with '.ext' has high compression rate, we can set the '.ext'
                       on compression extension list and enable compression on
                       these file by default rather than to enable it via ioctl.
                       For other files, we can still enable compression via ioctl.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
