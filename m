Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B29556875AE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 07:15:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNSsl-0001eO-TN;
	Thu, 02 Feb 2023 06:15:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nathan@kernel.org>) id 1pNSsk-0001eI-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 06:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDNgg6m2xkES0BL9aO63SNY0dbitzKPAa/b1BtCrrr4=; b=Fe4LYG/NwCSSs68p8oSWdo3Vrr
 8K7v+WWw7i9SWA2HfLQr1Fkjx3m5wqhFIzGYC69C72aRCCHiTR83mSbB23zqhRAf6aXFGIIOTuzBS
 yujy54MjIV1anW1vr94fOmz+VqvKZXMATVNkoexHIChVwWNTjNb5eauHaC7iBNqSouPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hDNgg6m2xkES0BL9aO63SNY0dbitzKPAa/b1BtCrrr4=; b=GuhNodD8Nmeh23t25cWQwWz49E
 R40IkP6DjeCKUfTsL5cCCIYUlOu0bf7rJ3PAd0IoOBAEDf7mJvkjATqANMVL8pNI91KnhFWY88SYk
 dd6ltDs83FgL71r+ZuNi+8n3XfbaBhFcRKcNml7JhMhcLPTABUvKjx/EGz9DajGCKUtg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNSsi-008AVi-CJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 06:15:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2B97B824DA;
 Thu,  2 Feb 2023 06:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F054AC433EF;
 Thu,  2 Feb 2023 06:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675318525;
 bh=ezi/tsRwvbIGmfLvyvnkgMf52A4ZxQwliiJ7g6rQbHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d2kFqZXqLdNq3C9BL4FdBB4OSoW+nGNQjlVY/Awdx2cs3s2n+856r+ioKjht5q/oQ
 E3TKCm2qiJreclhOcBosZMv1BVKV+aK7h0xh6JBm7CO5/if7tX6QVzFDlZGpFZAEe6
 YWF/Xp/hGv36xvwv4aKpaEZOD0U4j6vkBfwz4azT50KSQTJoetesDYSQR5E8yPW9f7
 8oG+3/jUur6+Yf1nCQI6Ht9yxvML7qh8UDV/EXF0j4U79GetPPbsZ7i+9SRD8N4wzG
 S7+UPY6Vt/shIuExluBGeIpm+l9q/+3yJIX/rSsNWJSPyiIbFFmnDoTgv48qmY44dD
 9QakSYXdyLsEw==
Date: Wed, 1 Feb 2023 23:15:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9tU+woHY23zHpmv@dev-arch.thelio-3990X>
References: <20230201-f2fs-fix-single-length-bitfields-v1-1-e386f7916b94@kernel.org>
 <64d1f9d3-12d8-cc7a-501e-5c0286b0cfa1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64d1f9d3-12d8-cc7a-501e-5c0286b0cfa1@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 02, 2023 at 02:13:18PM +0800, Chao Yu wrote: >
 On 2023/2/2 0:40,
 Nathan Chancellor wrote: > > Clang warns: > > > > ../fs/f2fs/data.c:995:17:
 error: implicit truncation from 'int' to a one- [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNSsi-008AVi-CJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix type of single bit bitfield in
 f2fs_io_info
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
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, patches@lists.linux.dev,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 02, 2023 at 02:13:18PM +0800, Chao Yu wrote:
> On 2023/2/2 0:40, Nathan Chancellor wrote:
> > Clang warns:
> > 
> >    ../fs/f2fs/data.c:995:17: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
> >            fio->submitted = 1;
> >                           ^ ~
> >    ../fs/f2fs/data.c:1011:15: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
> >                            fio->retry = 1;
> >                                       ^ ~
> > 
> >    ../fs/f2fs/segment.c:3320:16: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
> >                    fio->in_list = 1;
> >                                 ^ ~
> > 
> > There is not a bug here because the value of these fields is never
> > explicitly compared against (just whether it is zero or non-zero) but
> > it is easy to silence the warning by using an unsigned type to allow
> > an assignment of 0 or 1 without implicit conversion.
> 
> Nathan, thanks a lot for catching this, do you mind letting I merge this fix
> into original patch? as the original patch has not been upstreamed yet.

No worries, do whatever you need to! I just care that the problem gets
resolved one way or another :)

Cheers,
Nathan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
