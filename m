Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD450626648
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Nov 2022 02:55:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otfk5-0007zz-KA;
	Sat, 12 Nov 2022 01:55:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1otfk3-0007zt-Us
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 01:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eh5Ng42syvlADdffipGk7XwcLxEWtTv5ZvFi/TadrD8=; b=YO0Pk3gpGJMSueaqCA7gnZcbtf
 Tg90AKv5hDTqLrQAwrr55VKQVJK8m/dTRBHiRPL3SLChyH3rX3sh808N5hglrIIvXswovUmLIJmTd
 ru1M0jq6SuNAxtbeUR/jUhDFrM0t7ZkTTCS2yhUTMjL/r+2sBsefn0e+cP5FwdMgsVR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eh5Ng42syvlADdffipGk7XwcLxEWtTv5ZvFi/TadrD8=; b=CREXl16PQ2BoCnaDguszO+hsCk
 ARmelVvxsWJBpeFigltnzyftgE3VTnSW/gjvKD/WFryR/4cML1plyx7KVEUXaXxa82prCjZXhSV09
 e+5G1eisowAYE2vdIK/L5iaRskX6rjrnVMpzHyV+HpcPWcfaW3cG1+HBi71bxjHFN6sA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otfk3-0003Ul-7Q for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 01:55:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B31FFB8287A;
 Sat, 12 Nov 2022 01:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D73C433D6;
 Sat, 12 Nov 2022 01:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668218120;
 bh=fgmYqNrujDVO3mYJp1YcFQWlrmMolvGD2bz9AIt6/r0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j2OALwu9R3vpVGygcSTecpj34reTKkU+wR4SQPGT1SezuSGLiCgi4eHo2m/AsYgr9
 z4XWlkTDsZaFbkYUefFz5H2Lt4ipKkJUTsanv1KwRconQuL0AIq5zrQjks24iiCFoU
 wo6rZpbsLv/yYT5BNi9sy02gvlTO38/Do88+u2UtqKXksyu69hUNwtAO0FALHBp7c2
 co+mv9SQXwHcbi7ggTro1VL+RPlgPh81DCOdibtrRthhSMGpS+l4EYNv1RQl7XJ3HR
 3F7q8Y0z9B5VGR9aphbvZNK9bg93/3MZobX34Ix2AVVPz5ki4t+OZAcNHkmQTnOEKx
 p0dZ+qxTq8sXw==
Date: Fri, 11 Nov 2022 17:55:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Terrell <terrelln@meta.com>
Message-ID: <Y279BqPNYAr+5OxC@sol.localdomain>
References: <0000000000006a83e705ecea7171@google.com>
 <E31B0CBC-F169-4C7D-9FE6-F928C0F802AF@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E31B0CBC-F169-4C7D-9FE6-F928C0F802AF@fb.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 12, 2022 at 12:15:08AM +0000, 'Nick Terrell' via
 syzkaller-bugs wrote: > > Not quite sure why I am CC'd here, I don't see
 anything related to zstd or compression in this stack. > Just want [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1otfk3-0003Ul-7Q
Subject: Re: [f2fs-dev] [syzbot] INFO: trying to register non-static key in
 f2fs_handle_error
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
Cc: syzbot <syzbot+40642be9b7e0bb28e0df@syzkaller.appspotmail.com>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 12, 2022 at 12:15:08AM +0000, 'Nick Terrell' via syzkaller-bugs wrote:
> 
> Not quite sure why I am CC'd here, I don't see anything related to zstd or compression in this stack.
> Just want to check that it is likely unrelated, and that I'm not missing something.
> 
> Best,
> Nick Terrell

It's because:

$ ./scripts/get_maintainer.pl fs/f2fs/super.c
Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
Nick Terrell <terrelln@fb.com> (maintainer:ZSTD)
linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
linux-kernel@vger.kernel.org (open list)

Do *not* use content regexes (K: zstd) in MAINTAINERS unless you are absolutely
sure you want to be notified about every file that contains your regex.

If you do want to use a content regex anyway, you might want to look into
changing get_maintainer.pl to make them only apply to patches that contain the
regex, as I think that might be what people are expecting it does.

- Eric



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
