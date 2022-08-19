Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598359A893
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 00:36:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPAba-00035V-LQ;
	Fri, 19 Aug 2022 22:36:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oPAbZ-00035P-L1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 22:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dxVRtig+EM4NPYxfPnemijrkgg65AT6bDiPOUJMwc9w=; b=FwCkQbgN/vXmqvUYJuTqvuw7tN
 jp+H2M+lPuldOtoqvaW3StOACAmuhLrLg3HsmA5OIVzaVNmjxGALiecUEJekQl/uENV8WbvwMEhy8
 TYKK2/HY2/Si2iC6EtOL0A41qSGDBBI0e9c6N5ZivANOM/T4v++aujOSOy411ANfyFm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dxVRtig+EM4NPYxfPnemijrkgg65AT6bDiPOUJMwc9w=; b=c0aOerOFhRp9OkLBME0tVFDvLF
 f9IMs/doWzj1FgRyJzjyQd5JnoUu7Uk5977SMsDhS4aR0i8oNBeEFm1gjo//g7iGL0+mPbHdLQ6Ci
 hTTxnWpY4Wo73cdI0C95+gKcAbyP79u5EucX9aeb9wIpoS41J5u45kvwJYmOe2A5LeaQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPAbY-00009I-Ui for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Aug 2022 22:36:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0524B82922;
 Fri, 19 Aug 2022 22:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E384C433C1;
 Fri, 19 Aug 2022 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660948593;
 bh=kpK5eC8bTRHQNDpZySZTMewfQlwFe4s77+Dm8dzizJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCx44mu5hKk00BK3uwf0FoDeHM87V/ahSAmRx8/yzU1OJqF6KaYGyfA9CGMseZzse
 5VPOUzUXq+kXd5uQWOEyYS8BJn6oaiQkWgPpKIKx4qCukbSHj2qZmkcTRoIiMxwX11
 yN0ycIWRBR/jnZOii6Sh+DVfp2Stsr597R9GIXbFZxCpxyiDGgimVV28rRG6kt2rFR
 DJGyv/3EqF3HVe5g0D8aciApXQvCNClUB/uYuQYMTdv6RIrfBO0VG3n4CDIJvLi8B0
 kKpULZTFTzv8I4rdVSQ268mlV121+/PXTjKKSs3vr3PuATdDsmvUJFmVKHKEqFhilP
 X3fwG42pnMZhA==
Date: Fri, 19 Aug 2022 15:36:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <YwAQb2GQ4GFl3mvz@sol.localdomain>
References: <20220818225450.84090-1-ebiggers@kernel.org>
 <4743896.GXAFRqVoOG@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4743896.GXAFRqVoOG@localhost.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 19, 2022 at 01:11:41PM +0200,
 Fabio M. De Francesco
 wrote: > > - src_addr = inline_data_addr(inode, ipage); > > - dst_addr =
 kmap_atomic(page); > > - memcpy(dst_addr, src_addr, MAX_INLINE_ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPAbY-00009I-Ui
Subject: Re: [f2fs-dev] [PATCH] f2fs: use memcpy_{to,
 from}_page() where possible
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 19, 2022 at 01:11:41PM +0200, Fabio M. De Francesco wrote:
> > -	src_addr = inline_data_addr(inode, ipage);
> > -	dst_addr = kmap_atomic(page);
> > -	memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> > +	memcpy_to_page(page, 0, inline_data_addr(inode, ipage),
> > +		       MAX_INLINE_DATA(inode));
> >  	flush_dcache_page(page);
> 
> flush_dcache_page() is redundant here. memcpy_to_page() takes care to call it.

Done in v2.

> > -		kaddr = kmap_atomic(page);
> > -		memcpy(kaddr + offset, data, tocopy);
> > -		kunmap_atomic(kaddr);
> > +		memcpy_to_page(page, offset, data, tocopy);
> >  		flush_dcache_page(page);
> 
> Same here.

Likewise.

> 
> It looks like you forgot a conversion from kmap_atomic() in fs/f2fs/inline.c 
> at line 266.

Also done in v2.  I think I had skipped that one intentionally, but I must not
have looked closely because it converts just fine.  Thanks!

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
