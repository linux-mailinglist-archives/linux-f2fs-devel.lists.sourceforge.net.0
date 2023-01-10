Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 448266637BC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jan 2023 04:11:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pF52Z-0000Y2-6x;
	Tue, 10 Jan 2023 03:11:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pF52X-0000Xw-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 03:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FIMKHxBnUpPOk81KstCAWXdFMV/G6QqdEE6uFGoYOso=; b=DntdOFdSC8ByQ4QXsV8LLcr1ay
 RWAInYO1lMs5dQcyC8VNnutyIeJEkfSZq9+hE2NVh68uZtUAJ5RLZNP7hhUJFFvHD1opVfZ1lzKud
 ZIYWfp4jRCKm3NtF86hpC3Ei+6uPrBhidmOMyCqWTh0Xdmexu+pFOKYcvrDJMoWAdoeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FIMKHxBnUpPOk81KstCAWXdFMV/G6QqdEE6uFGoYOso=; b=Tqs3IB3V5BioEjjyDdFcoC/0ML
 qXI37h90BJWBrYLPDotfEXerGVbr6AdN1nsNOFQYybNWQEiqgWbi41iHcDuOrHnkDJ+WGc7o1ZwKV
 +DaUPs6X/PPH2E6rgGSVbXbohZ/cSwq+Mfeu/KFE1qO6SuhX32H9Pbc9jK+p/APGLyqA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pF52W-00CO8T-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 03:11:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97A98B810DE;
 Tue, 10 Jan 2023 03:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C58C433EF;
 Tue, 10 Jan 2023 03:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673320256;
 bh=5NobUZe3e86WKsQ4ysdFkOmOmqcIBSN1keo/Nf7bv98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ACfctoYBs5wi1feupJMe9VvOxeQIJMM5nrQwNmiCsToT47F8O1JSPDC53r7j98Hie
 ygskpNxEW8BTQT+iX61Eqd+KkTTpJ5sYjWcAimwT/+8yyQKIYG7srPe2mg1QuCJDXn
 qvssUtahGRb7IhvQCwFNdGgUs3nxR0Am1B7byOwQNUjMrPi1SO0eeW+rzMyRTEfnYp
 /ahZRGjcKFJJ09ckTVh4PPkcRe5gyBh3W1ZfAR2G8+FkYLgHtrDIE/Q5bOXRwt9dde
 DsKg9ToAo9oaTON9UdkOjX0B4UAgtK8OJ/xei+3gzSEIGadBLHsihDA+iYgEuhvId2
 Qox8Csj6RpLlA==
Date: Mon, 9 Jan 2023 19:10:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <Y7zXPoEQkmQs/Whw@sol.localdomain>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <Y7xRIZfla92yzK9N@sol.localdomain>
 <20230109193446.mpmbodoctaddovpv@aalbersh.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109193446.mpmbodoctaddovpv@aalbersh.remote.csb>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 09, 2023 at 08:34:46PM +0100, Andrey Albershteyn
 wrote: > On Mon, Jan 09, 2023 at 09:38:41AM -0800, Eric Biggers wrote: >
 > On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote: > [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pF52W-00CO8T-Mc
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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

On Mon, Jan 09, 2023 at 08:34:46PM +0100, Andrey Albershteyn wrote:
> On Mon, Jan 09, 2023 at 09:38:41AM -0800, Eric Biggers wrote:
> > On Fri, Dec 23, 2022 at 12:36:27PM -0800, Eric Biggers wrote:
> > > [This patchset applies to mainline + some fsverity cleanups I sent out
> > >  recently.  You can get everything from tag "fsverity-non4k-v2" of
> > >  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ]
> > 
> > I've applied this patchset for 6.3, but I'd still greatly appreciate reviews and
> > acks, especially on the last 4 patches, which touch files outside fs/verity/.
> > 
> > (I applied it to
> > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/?h=fsverity for now,
> > but there might be a new git repo soon, as is being discussed elsewhere.)
> > 
> > - Eric
> > 
> 
> The fs/verity patches look good to me, I've checked them but forgot
> to send RVB :( Haven't tested them yet though
> 
> Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
> 

Thanks Andrey!  I added your Reviewed-by to patches 1-7 only, since you said
"the fs/verity patches".  Let me know if I can add it to patches 8-11 too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
